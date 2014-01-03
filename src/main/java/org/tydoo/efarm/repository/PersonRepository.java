package org.tydoo.efarm.repository;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.tydoo.efarm.model.EmailAddress;
import org.tydoo.efarm.model.Person;

@Repository
public class PersonRepository extends BaseRepository<Person> {
	
	public Person getPersonByEmail(String email) {
		Query query = entityManager.createQuery("select p from Person p where p.email = :email");
		query.setParameter("email", new EmailAddress(email));
		
		return (Person) query.getSingleResult();
	}

}
