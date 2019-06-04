package com.gavinwilson.gameproject.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gavinwilson.gameproject.models.CharacterModel;
import com.gavinwilson.gameproject.models.Guess;
import com.gavinwilson.gameproject.models.Status;
import com.gavinwilson.gameproject.models.User;
import com.gavinwilson.gameproject.repositories.GuessRepository;



@Service 
public class GuessService {

	
	@Autowired
	private GuessRepository guessRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StatusService statusService;
	
	@Autowired
	private CharacterModelService charService;
	
	public Guess  createGuess(Long userId, Long statusId, Long CharacterId) {
			
			User user = userService.findUserById(userId);
			Status status = statusService.findStatusById(statusId);
			CharacterModel charModel = charService.findCharacterById(CharacterId);
			
            Guess guessOne = new Guess();
            guessOne.setUser(user);
            guessOne.setStatus(status);
            guessOne.setCharacter(charModel);
            Guess newGuess = guessRepository.save(guessOne);
            return newGuess;
       }
	
	public List<Object[]> getGuessesAndCharacters(String userId) {
		return guessRepository.getGuessesAndCharacters(userId);
	}
	
	public List<Guess> getGuessesByUserId(Long userId) {
		return guessRepository.getGuessByUserId(userId);
	}
	
	@Transactional
	public void deleteGuesses(User user) {
		guessRepository.deleteInBulkByUserId(user);
	}
	
	
}
