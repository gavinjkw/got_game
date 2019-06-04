package com.gavinwilson.gameproject.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gavinwilson.gameproject.models.CharacterModel;


@Repository
public interface CharacterModelRepository extends CrudRepository<CharacterModel, Long>{

	
	List<CharacterModel> findAll();
	
	
}

