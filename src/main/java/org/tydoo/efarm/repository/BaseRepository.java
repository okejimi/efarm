package org.tydoo.efarm.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class BaseRepository<T> {
	
	@PersistenceContext
	EntityManager entityManager;
	
	public void save(T t){
		entityManager.persist(t);
		/*FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
		try {
			fullTextEntityManager.createIndexer().startAndWait();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	

}
