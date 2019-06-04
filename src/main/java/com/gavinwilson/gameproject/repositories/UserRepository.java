package com.gavinwilson.gameproject.repositories;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.gavinwilson.gameproject.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	
	User findByEmail(String email);
	
	List<User> findAll();
	
	@Query("SELECT u FROM User u ORDER BY u.score DESC")
	List<User> getUsersByScore();
	
}
