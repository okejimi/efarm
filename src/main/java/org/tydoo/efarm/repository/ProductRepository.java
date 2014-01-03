package org.tydoo.efarm.repository;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.util.Version;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.hibernate.search.query.engine.spi.FacetManager;
import org.hibernate.search.query.facet.Facet;
import org.hibernate.search.query.facet.FacetSortOrder;
import org.hibernate.search.query.facet.FacetingRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.tydoo.efarm.model.Product;

@Repository
public class ProductRepository extends BaseRepository<Product> {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductRepository.class);

	public Map<String, Object> findAll() throws ParseException {
		/*
		 * return (List<Product>) entityManager.createQuery(
		 * "select p from Product p").getResultList();
		 */
		FullTextEntityManager fullTextEntityManager = org.hibernate.search.jpa.Search
				.getFullTextEntityManager(entityManager);

		QueryBuilder b = getQueryBuilder(fullTextEntityManager);

		org.apache.lucene.queryParser.MultiFieldQueryParser parser = new MultiFieldQueryParser(
				Version.LUCENE_33, new String[] { "name", "location",
						"description" }, fullTextEntityManager
						.getSearchFactory().getAnalyzer(Product.class));
		parser.setAllowLeadingWildcard(true);
		org.apache.lucene.search.Query luceneQuery = parser.parse("*");

		org.hibernate.search.jpa.FullTextQuery fullTextQuery = fullTextEntityManager
				.createFullTextQuery(luceneQuery, Product.class);

		org.apache.lucene.search.Sort sort = new Sort(new SortField("date",
				SortField.LONG, true));

		List result = fullTextQuery.setSort(sort).getResultList(); // return a list of managed
														// objects
		FacetManager facetManager = fullTextQuery.getFacetManager();
		facetManager.enableFaceting(createFacetRequest(b, "name"));
		List<Facet> facets = facetManager.getFacets("name");

		facetManager.enableFaceting(createFacetRequest(b, "location"));
		List<Facet> locationFacets = facetManager.getFacets("location");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("products", result);
		resultMap.put("productsFacets", facets);
		resultMap.put("locationFacets", locationFacets);
		return resultMap;
	}

	public Map<String, Object> search(String searchTerm, String sort, String... filters)
			throws ParseException {
		FullTextEntityManager fullTextEntityManager = org.hibernate.search.jpa.Search
				.getFullTextEntityManager(entityManager);

		QueryBuilder b = getQueryBuilder(fullTextEntityManager);

		org.apache.lucene.queryParser.MultiFieldQueryParser parser = new MultiFieldQueryParser(
				Version.LUCENE_33, new String[] { "name", "location",
						"description" }, fullTextEntityManager
						.getSearchFactory().getAnalyzer(Product.class));
		parser.setAllowLeadingWildcard(true);

		String strFilter = "";
		if (!Arrays.asList(filters).isEmpty()) {
			for (String str : filters) {
				if (!StringUtils.isBlank(str)) {
					strFilter = strFilter + str + " AND ";
				}
			}
		}
		org.apache.lucene.search.Query luceneQuery = parser.parse(searchTerm
				+ "* AND " + strFilter + "*");

		org.hibernate.search.jpa.FullTextQuery fullTextQuery = fullTextEntityManager
				.createFullTextQuery(luceneQuery, Product.class);
		
		if(sort.equals("created")){
			org.apache.lucene.search.Sort sortOrder = new Sort(new SortField("date",
				SortField.LONG, true));
			fullTextQuery.setSort(sortOrder);
		}

		List result = fullTextQuery.getResultList(); // return a list of managed
														// objects
		FacetManager facetManager = fullTextQuery.getFacetManager();
		facetManager.enableFaceting(createFacetRequest(b, "name"));
		List<Facet> facets = facetManager.getFacets("name");

		facetManager.enableFaceting(createFacetRequest(b, "location"));
		List<Facet> locationFacets = facetManager.getFacets("location");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("products", result);
		resultMap.put("productsFacets", facets);
		resultMap.put("locationFacets", locationFacets);

		return resultMap;
	}

	private QueryBuilder getQueryBuilder(
			FullTextEntityManager fullTextEntityManager) {
		QueryBuilder b = fullTextEntityManager.getSearchFactory()
				.buildQueryBuilder().forEntity(Product.class).get();
		return b;
	}

	public FacetingRequest createFacetRequest(QueryBuilder builder, String field) {
		return builder.facet().name(field).onField(field).discrete()
				.orderedBy(FacetSortOrder.COUNT_DESC).includeZeroCounts(false)
				.maxFacetCount(3).createFacetingRequest();

	}
}
