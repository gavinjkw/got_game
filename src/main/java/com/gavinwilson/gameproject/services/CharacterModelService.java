package com.gavinwilson.gameproject.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gavinwilson.gameproject.models.CharacterModel;
import com.gavinwilson.gameproject.models.Status;
import com.gavinwilson.gameproject.repositories.CharacterModelRepository;



@Service
public class CharacterModelService {

	@Autowired
	private CharacterModelRepository characterModelRepository;
	
	public CharacterModel createCharacterModel(CharacterModel c) {
		return characterModelRepository.save(c);	}
	
	public List<CharacterModel> getAllCharacters() {
		return characterModelRepository.findAll();
	}
	
	public CharacterModel findCharacterById(Long id) {
    	Optional<CharacterModel> u = characterModelRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
	
	public CharacterModel updateCharacter(Long characterId, Status status){
		Optional<CharacterModel> optionalCharacter  = characterModelRepository.findById(characterId);
	    if(optionalCharacter.isPresent()) {
	        System.out.println("Making it here");
	    	CharacterModel charModel = optionalCharacter.get();
	        charModel.setStatus(status);
	        characterModelRepository.save(charModel);
	   	 	return charModel;
	    } else {
	        return null;	
	    }
	}
	
}
