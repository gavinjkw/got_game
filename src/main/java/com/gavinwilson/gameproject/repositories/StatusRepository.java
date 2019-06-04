package com.gavinwilson.gameproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gavinwilson.gameproject.models.Status;

@Repository
public interface StatusRepository extends CrudRepository<Status, Long> {
	
	List<Status> findAll();
	
}
