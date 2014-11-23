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
package org.tydoo.efarm;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.cache.ehcache.EhCacheRegionFactory;
import org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory;
import org.hibernate.dialect.MySQL5Dialect;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * Common infrastructure configuration class to setup a Spring container and infrastructure components like a
 * {@link DataSource}, a {@link EntityManagerFactory} and a {@link PlatformTransactionManager}. Will be used by the
 * configuration activating the plain JPA based repository configuration (see {@link PlainJpaConfig}) as well as the
 * Spring Data JPA based one (see {@link ApplicationConfig}).
 * 
 * @author Oliver Gierke
 */
@Configuration
@EnableTransactionManagement
public class InfrastructureConfig {

	/**
	 * Bootstraps an in-memory HSQL database.
	 * 
	 * @return
	 * @see http 
	 *      ://static.springsource.org/spring/docs/3.1.x/spring-framework-reference/html/jdbc.html#jdbc-embedded-database
	 *      -support
	 */
	@Bean
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/efarm");
		dataSource.setUsername("root");
		dataSource.setPassword("password");
		dataSource.setValidationQuery("select 1");
		
		return dataSource;
	}

	/**
	 * Sets up a {@link LocalContainerEntityManagerFactoryBean} to use Hibernate. Activates picking up entities from the
	 * project's base package.
	 * 
	 * @return
	 */
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {

		HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		vendorAdapter.setDatabase(Database.MYSQL);
		vendorAdapter.setGenerateDdl(true);

		LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
		factory.setJpaVendorAdapter(vendorAdapter);
		//factory.setPackagesToScan(getClass().getPackage().getName());
		factory.setDataSource(dataSource());
		factory.setJpaPropertyMap(jpaProperties());
		

		return factory;
	}
	
	@Bean
	public Map<String, Object> jpaProperties() {
	
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("hibernate.dialect", MySQL5Dialect.class.getName());
		props.put("hibernate.cache.provider_class", SingletonEhCacheRegionFactory.class.getName());
		props.put("hibernate.cache.region.factory_class", EhCacheRegionFactory.class.getName());
		props.put("hibernate.cache.use_second_level_cache", Boolean.valueOf(true));
		props.put("hibernate.cache.use_query_cache", Boolean.valueOf(true));
		props.put("hibernate.hbm2ddl.auto", "update");
		//props.put("hibernate.search.default.directory_provider", "ram");
		props.put("hibernate.search.default.directory_provider", "filesystem");
		props.put("hibernate.search.default.indexBase", "/scratch/jenkins/workspace/efarm/index");
		
		return props;
	}
	
	@Bean
	public PlatformTransactionManager transactionManager() {

		JpaTransactionManager txManager = new JpaTransactionManager();
		txManager.setEntityManagerFactory(entityManagerFactory().getObject());
		return txManager;
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(100000000);
		
		return multipartResolver;
	}
}
