package com.gavinwilson.gameproject.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gavinwilson.gameproject.models.CharacterModel;
import com.gavinwilson.gameproject.models.Status;
import com.gavinwilson.gameproject.repositories.CharacterModelRepository;
import com.gavinwilson.gameproject.repositories.StatusRepository;

@Service
public class StatusService {

	@Autowired
	private StatusRepository statusRepository;
	
	public Status createStatus(Status s) {
		return statusRepository.save(s);	}
	
	public List<Status> getAllStatus() {
		return statusRepository.findAll();
	}
	
	public Status findStatusById(Long id) {
		Optional<Status> optionalStatus = statusRepository.findById(id);
		 if(optionalStatus.isPresent()) {
		        return optionalStatus.get();
		    } else {
		        return null;
		    }
		}
}