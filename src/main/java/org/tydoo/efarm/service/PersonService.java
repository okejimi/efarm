package org.tydoo.efarm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.tydoo.efarm.model.Person;
import org.tydoo.efarm.repository.PersonRepository;

@Service
@Transactional
public class PersonService {
	
	@Autowired
	PersonRepository personRepository;
	
	public void createPerson(Person person) {
		personRepository.save(person);
	}
	
	public Person findPersonByEmail(final String email) {
		return personRepository.getPersonByEmail(email);
	}
	
	

}
