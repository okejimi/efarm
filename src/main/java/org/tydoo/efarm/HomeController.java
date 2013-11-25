package org.tydoo.efarm;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/*", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) throws Exception {
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		final String requestPath = uri.substring(context.length());
		String path = requestPath.equals("/")
				|| requestPath.equals(null) ? "index" : requestPath.toLowerCase();
		model.addAttribute("news",parseNews());
		return path;
	}
	
	private List<String> parseNews() throws Exception {
		
		URL url = new URL("http://www.theafricareport.com/index.php?option=com_obrss&task=feed&id=10?option=com_obrss&task=feed&id=10");
        HttpURLConnection httpcon = (HttpURLConnection)url.openConnection();
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
	}
	

}
