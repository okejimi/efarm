package org.tydoo.efarm.service;

import javax.persistence.PersistenceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.tydoo.efarm.model.Person;
import org.tydoo.efarm.repository.PersonRepository;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

@Service
@Transactional
public class PersonService {

	@Autowired
	PersonRepository personRepository;

	public void createPerson(Person person) throws PersistenceException {
		try {
			personRepository.save(person);
		} catch (PersistenceException e) {
			throw new PersistenceException(e);
		}
	}

	public Person findPersonByEmail(final String email) {
		return personRepository.getPersonByEmail(email);
	}

}
