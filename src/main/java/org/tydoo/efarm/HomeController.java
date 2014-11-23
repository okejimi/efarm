package org.tydoo.efarm;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.lang3.StringUtils;
import org.apache.lucene.queryParser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.tydoo.efarm.model.Category;
import org.tydoo.efarm.model.Person;
import org.tydoo.efarm.model.Product;
import org.tydoo.efarm.service.PersonService;
import org.tydoo.efarm.service.ProductService;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import com.twilio.sdk.verbs.TwiMLException;
import com.twilio.sdk.verbs.TwiMLResponse;
import com.twilio.sdk.verbs.Verb;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private PersonService personService;

	@Autowired
	private ProductService productService;

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/*", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request)
			throws Exception {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		final String requestPath = uri.substring(context.length());
		String path = requestPath.equals("/") || requestPath.equals(null) ? "index"
				: requestPath.toLowerCase();
		model.addAttribute("news", parseNews());
		model.addAttribute("productCategory", Category.values());
		return path;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String newUser(@ModelAttribute Person person, Model model,
			@RequestParam("file") MultipartFile file, BindingResult result)
			throws SQLException, IOException, PersistenceException {

		if (!file.isEmpty()) {
			Blob photo = new SerialBlob(file.getBytes());
			person.setPhoto(photo);
		}
		logger.error(person.toString());
		logger.error("city " + person.getAddress().get(0));
		logger.error("uploaded file {}", file.getOriginalFilename());
		try {
		personService.createPerson(person);
		} catch(PersistenceException e) {
			model.addAttribute("message", "user already registered");
			return "register";
		}
		// logger.error("type "+ person.getPersonType().get(0));
		return "redirect:login";
	}

	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute Product product,
			@RequestParam("file") MultipartFile file, BindingResult result)
			throws SQLException, IOException {

		if (!file.isEmpty()) {
			Blob photo = new SerialBlob(file.getBytes());
			product.setPhoto(photo);
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = "";
		if(auth != null) {
			name = auth.getName();
		}
	      
		logger.error("logged in user is {}", name);
		product.setPerson(personService.findPersonByEmail(name));
		productService.save(product);
		// logger.error("type "+ person.getPersonType().get(0));
		return "redirect:marketplace";
	}

	@RequestMapping(value = "buy", method = RequestMethod.GET)
	public String buy(Model model) throws ParseException {
		model.addAttribute("products", productService.findAll());
		model.addAttribute("sort", "created");
		return "/buy";
	}
	
	@RequestMapping(value = "smsPost", method = RequestMethod.POST)
	public void smsPost(Model model, HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		logger.error("send sms with payload {}", request);
		TwiMLResponse twiml = new TwiMLResponse();
        Verb message = new Verb("sms", "Mobile Monkey");
        try {
            twiml.append(message);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
 
        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
		//return "/smsPost";
	}
	
	@RequestMapping(value = "smsPost", method = RequestMethod.GET)
	public void smsGet(Model model, HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		logger.error("send sms with payload {}", request);
		TwiMLResponse twiml = new TwiMLResponse();
        Verb message = new Verb("sms", "Mobile Monkey");
        try {
            twiml.append(message);
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
 
        response.setContentType("application/xml");
        response.getWriter().print(twiml.toXML());
		//return "/smsPost";
	}

	@RequestMapping(value = "buy", method = RequestMethod.POST)
	public String buySearch(
			Model model,
			@RequestParam(value = "search", defaultValue = "") String search,
			@ModelAttribute Product product, @RequestParam(value="sort", defaultValue="relevance") String sort)
			throws ParseException {
		
		String nameFilters = "";
		String locationFilters = "";
		
		if(!StringUtils.isBlank(product.getName())) {
			nameFilters += "name:"+product.getName();
			model.addAttribute("nameFilters", StringUtils.split(product.getName()));
		}
		
		if(!StringUtils.isBlank(product.getLocation())) {
			locationFilters += "location:"+product.getLocation();
			model.addAttribute("locationFilters", StringUtils.split(product.getLocation(), ","));
		}
		
		
		model.addAttribute("products", productService.search(search, sort, nameFilters.toString(), locationFilters.toString()));
		model.addAttribute("search", search);
		model.addAttribute("sort", sort);
		
		return "/buy";
	}

	private List<String> parseNews() {
		try {
			URL url = new URL(
					"http://www.theafricareport.com/index.php?option=com_obrss&task=feed&id=10?option=com_obrss&task=feed&id=10");
			HttpURLConnection httpcon = (HttpURLConnection) url
					.openConnection();
			httpcon.addRequestProperty("User-Agent", "Mozilla/4.76");
			// Reading the feed

			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(httpcon));
			List<?> entries = feed.getEntries();
			Iterator<?> itEntries = entries.iterator();
			List<String> syndEntries = new ArrayList<String>();

			while (itEntries.hasNext()) {
				SyndEntry entry = (SyndEntry) itEntries.next();
				syndEntries.add(entry.getTitle());
			}

			Collections.shuffle(syndEntries, new Random(System.nanoTime()));

			return syndEntries;
		} catch (Exception e) {
			return Collections.emptyList();
		}
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setAutoGrowNestedPaths(false);
	}

}
