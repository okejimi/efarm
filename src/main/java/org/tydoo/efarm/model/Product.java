/*
 * Copyright 2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.tydoo.efarm.model;

import java.math.BigDecimal;
import java.sql.Blob;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.solr.analysis.LowerCaseFilterFactory;
import org.apache.solr.analysis.SnowballPorterFilterFactory;
import org.apache.solr.analysis.StandardTokenizerFactory;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.AnalyzerDef;
import org.hibernate.search.annotations.DateBridge;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Fields;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Parameter;
import org.hibernate.search.annotations.Resolution;
import org.hibernate.search.annotations.TokenFilterDef;
import org.hibernate.search.annotations.TokenizerDef;
import org.springframework.util.Assert;

/**
 * A product.
 * 
 * @author Oliver Gierke
 */
@Entity
@Indexed
@AnalyzerDef(name = "customanalyzer", tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class), filters = {
		@TokenFilterDef(factory = LowerCaseFilterFactory.class),
		@TokenFilterDef(factory = SnowballPorterFilterFactory.class, params = { @Parameter(name = "language", value = "English") }) })
public class Product extends AbstractDomainObject {

	@Fields({ @Field(name = "name"),
		@Field(name = "name_facet", analyze = Analyze.NO) })
	private String name;

	@Field
	@Analyzer(definition = "customanalyzer")
	private String description;

	@Fields({ @Field(name = "location"),
			@Field(name = "location_facet", analyze = Analyze.NO) })
	private String location;
	
	@Fields({ @Field(name = "category"),
		@Field(name = "category_facet", analyze = Analyze.NO) })
	private Category category;

	private String quantity;
	private Blob photo;
	
	@Fields({ @Field(name = "date"),
		@Field(name = "date_facet", analyze = Analyze.NO) })
    @DateBridge(resolution = Resolution.MILLISECOND)
	private Date created = new Date();

	@Field(index = Index.YES, analyze = Analyze.YES)
	private BigDecimal price;
	@ElementCollection(targetClass = String.class)
	private Map<String, String> attributes = new HashMap<String, String>();
	
	@ManyToOne
	private Person person;

	public Product() {

	}

	/**
	 * Creates a new {@link Product} with the given name.
	 * 
	 * @param name
	 *            must not be {@literal null} or empty.
	 * @param price
	 *            must not be {@literal null} or less than or equal to zero.
	 */
	public Product(String name, BigDecimal price) {
		this(name, price, null, null, null, null, null);
	}

	/**
	 * Creates a new {@link Product} from the given name and description.
	 * 
	 * @param name
	 *            must not be {@literal null} or empty.
	 * @param price
	 *            must not be {@literal null} or less than or equal to zero.
	 * @param description
	 */
	public Product(String name, BigDecimal price, String description,
			String location, String quantity, Blob photo, final Category category) {

		Assert.hasText(name, "Name must not be null or empty!");
		Assert.isTrue(BigDecimal.ZERO.compareTo(price) < 0,
				"Price must be greater than zero!");

		this.name = name;
		this.price = price;
		this.description = description;
		this.location = location;
		this.quantity = quantity;
		this.photo = photo;
		this.category = category;
	}

	/**
	 * Sets the attribute with the given name to the given value.
	 * 
	 * @param name
	 *            must not be {@literal null} or empty.
	 * @param value
	 */
	public void setAttribute(String name, String value) {

		Assert.hasText(name);

		if (value == null) {
			this.attributes.remove(value);
		} else {
			this.attributes.put(name, value);
		}
	}

	/**
	 * Returns the {@link Product}'s name.
	 * 
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * Returns the {@link Product}'s description.
	 * 
	 * @return
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Returns all the custom attributes of the {@link Product}.
	 * 
	 * @return
	 */
	public Map<String, String> getAttributes() {
		return Collections.unmodifiableMap(attributes);
	}

	/**
	 * Returns the price of the {@link Product}.
	 * 
	 * @return
	 */
	public BigDecimal getPrice() {
		return price;
	}

	public String getLocation() {
		return location;
	}

	public String getQuantity() {
		return quantity;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
