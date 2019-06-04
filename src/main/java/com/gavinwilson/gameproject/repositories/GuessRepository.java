package com.gavinwilson.gameproject.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gavinwilson.gameproject.models.Guess;
import com.gavinwilson.gameproject.models.User;

@Repository
public interface GuessRepository extends CrudRepository<Guess, Long>{

	List<Guess> getGuessByUserId(Long userId);
	
	@Query("SELECT g, c FROM Guess g JOIN g.character c WHERE user_id = ?1")
	List<Object[]> getGuessesAndCharacters(String userId);
	
	
	
	
	 //@Modifying
	  //  @Query("delete Guess g WHERE g.user_id = ?1")
	  //  int deleteGuesses(Long id);
	
	@Modifying
	  @Query("delete from Guess g where g.user = ?1")
	  void deleteInBulkByUserId(User user);
	
}

