package org.tydoo.efarm.model;

import java.sql.Blob;
import java.util.Collections;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.solr.analysis.LowerCaseFilterFactory;
import org.apache.solr.analysis.SnowballPorterFilterFactory;
import org.apache.solr.analysis.StandardTokenizerFactory;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.AnalyzerDef;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Fields;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Parameter;
import org.hibernate.search.annotations.TokenFilterDef;
import org.hibernate.search.annotations.TokenizerDef;
import org.springframework.util.AutoPopulatingList;

@Entity
@Indexed
@AnalyzerDef(name = "customPersonanalyzer",
tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class),
filters = {
  @TokenFilterDef(factory = LowerCaseFilterFactory.class),
  @TokenFilterDef(factory = SnowballPorterFilterFactory.class, params = {
    @Parameter(name = "language", value = "English")
  })
})
@Table(name = "person", uniqueConstraints = @UniqueConstraint(columnNames = { "email" }))
public class Person extends AbstractDomainObject {
	
	@Fields({ @Field(name = "name"),
		@Field(name = "name_facet", analyze = Analyze.NO) })
	private String name;
	
	//@Field(index=Index.NO, analyze=Analyze.NO)
	@Column(name = "email")
	@Embedded
	private EmailAddress email;
	
	@Field(index=Index.YES, analyze=Analyze.YES)
	private String phone;
	@OneToMany(cascade = CascadeType.ALL)
	private List<Address> address = new AutoPopulatingList<Address>(
			Address.class);
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<Product> product = new AutoPopulatingList<Product>(
			Product.class);
	
	@ElementCollection(fetch = FetchType.LAZY)
	@CollectionTable(joinColumns = @JoinColumn(name = "person_type_id"), name = "person_type")
	private List<PersonType> personType = new AutoPopulatingList<PersonType>(
			PersonType.class);
	
	@Column(name = "photo")
	private java.sql.Blob photo;
	
	private String password;
	private String role = "user";

	public Person() {

	}

	public Person(String name, EmailAddress email, String phone,
			List<Address> address, Blob photo, String password, String role, List<Product> product) {
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address.addAll(address);
		this.photo = photo;
		this.password = password;
		this.role=role;
		this.product = product;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public EmailAddress getEmail() {
		return email;
	}

	public void setEmail(EmailAddress email) {
		this.email = email;
	}

	public List<Address> getAddress() {
		return Collections.unmodifiableList(address);
	}

	public void addAddress(Address address) {
		this.address.add(address);
	}

	public String getPhone() {
		return phone;
	}

	public List<PersonType> getPersonType() {
		return personType;
	}

	public void setPersonType(List<PersonType> personType) {
		this.personType = personType;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	public enum PersonType {
		FARMER, BUYER, SUPPLIER
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
