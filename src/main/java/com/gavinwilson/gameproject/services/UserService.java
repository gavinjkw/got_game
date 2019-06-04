package com.gavinwilson.gameproject.services;


import java.util.List;
import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gavinwilson.gameproject.models.CharacterModel;
import com.gavinwilson.gameproject.models.Guess;
import com.gavinwilson.gameproject.models.User;
import com.gavinwilson.gameproject.repositories.UserRepository;


@Service
public class UserService {
    
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
	private StatusService statusService;
    
    // register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepository.save(user);
    }
    
    // find user by email
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepository.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
        	// if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
       }
    }
    
    public List<User> getAllUsers() {
		return userRepository.findAll();
	}
    
    public List<User> getUsersByScore() {
		return userRepository.getUsersByScore();
	}
	
    
    public void updateUserScore (List<Object[]> listObj, User user) {
    	user.setScore(0);
    	
		for (Object[] item : listObj) {
			if (((Guess) item[0]).getStatus().equals(((CharacterModel) item[1]).getStatus())) {
				user.setScore(user.getScore() + 1);
    		}
			if (((Guess) item[0]).getStatus().equals(statusService.findStatusById((long)3))) {
				if (((CharacterModel) item[1]).getStatus().equals(statusService.findStatusById((long)3))) {
				System.out.println("Guess is Wight");
				user.setScore(user.getScore() + 1);
				}
				else {
				user.setScore(user.getScore() - 1);	
				}
			}
    	}
		userRepository.save(user);
    }
    
    public void updateUserAttempts (User user) {
				user.setAttempts(0);
				userRepository.save(user);
    	}
    
    public void deleteUser (User user) {

		userRepository.delete(user);
}
    
    
    
}
