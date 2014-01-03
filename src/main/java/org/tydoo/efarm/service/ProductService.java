package org.tydoo.efarm.service;

import java.util.List;
import java.util.Map;

import org.apache.lucene.queryParser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.tydoo.efarm.model.Product;
import org.tydoo.efarm.repository.ProductRepository;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	public void save(Product product) {
		productRepository.save(product);
	}
	
	public Map<String,Object> findAll() throws ParseException {
		return productRepository.findAll();
	}
	
	public Map<String,Object> search(final String searchTerm, String sort, String ...filters) throws ParseException {
		return productRepository.search(searchTerm, sort, filters);
	}
}
