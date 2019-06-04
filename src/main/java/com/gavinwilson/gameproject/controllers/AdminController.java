package com.gavinwilson.gameproject.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gavinwilson.gameproject.models.CharacterModel;
import com.gavinwilson.gameproject.models.Status;
import com.gavinwilson.gameproject.models.User;
import com.gavinwilson.gameproject.services.CharacterModelService;
import com.gavinwilson.gameproject.services.GuessService;
import com.gavinwilson.gameproject.services.StatusService;
import com.gavinwilson.gameproject.services.UserService;
import com.gavinwilson.gameproject.validator.UserValidator;



@Controller
public class AdminController {
	
	@Autowired 
	private UserService userService;
	
	@Autowired 
	private StatusService statusService;
	
	@Autowired 
	private GuessService guessService;
	
	@Autowired 
	private CharacterModelService characterModelService;
	
	@Autowired 
	private UserValidator userValidator;
	
	@RequestMapping("/admin")
    public String registerForm(@Valid @ModelAttribute("user") User user, BindingResult result) {
        return "AdminLogin.jsp";
    }

    
    @PostMapping(value="/loginadmin")
    public String loginUser(@ModelAttribute("user") User user, @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
    	User userOne  = userService.findByEmail(email);
    	
    	boolean isAuthenticated = userService.authenticateUser(email, password);
    	if (isAuthenticated){
    		 
    		if (userOne.getAccessLevel() != 3) {
        		model.addAttribute("authLevel", "You are not an admin");
        		return "AdminLogin.jsp";
        	}
    		else {
    		 session.setAttribute("adminState", "1");
	    	 session.setAttribute("userId", userOne.getId());
	         return "redirect:/admin/home";
    		}
    	
    	} else {
	    	 model.addAttribute("error", "Invalid credentials. Please try again.");
	    	 return "AdminLogin.jsp";
	     }
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
    @RequestMapping("/admin/home")
    public String home(HttpSession session, Model model, @Valid @ModelAttribute("characterObj") CharacterModel character, BindingResult result) {
    	long userId = (long) session.getAttribute("userId");	
    	User user = userService.findUserById(userId);
    	model.addAttribute("allCharacters", characterModelService.getAllCharacters());
    	model.addAttribute(user);
    	model.addAttribute("statusItems", statusService.getAllStatus());
    	model.addAttribute("users", userService.getAllUsers());
    	System.out.println(userService.getAllUsers());
        return "AdminHome.jsp";
    }
    
    @PostMapping("/admin/addcharacter")
    public String addEvent(HttpSession session, Model model, @Valid @ModelAttribute("characterObj") CharacterModel character, BindingResult result) {
		long userId = (long) session.getAttribute("userId");	
    	User user = userService.findUserById(userId);
    	model.addAttribute("allCharacters", characterModelService.getAllCharacters());
    	model.addAttribute(user);
    	model.addAttribute("statusItems", statusService.getAllStatus());
    	
    	
    	if (result.hasErrors()) {
			return "AdminHome.jsp";
	     } else {
	         characterModelService.createCharacterModel(character);
	         //characterModelService.addStatus()
	         return "redirect:/admin/home";
	     }
	 }
    
    @PostMapping("/update/{characterId}/{statusId}")
    public String addEvent(HttpSession session, Model model, @PathVariable("characterId") Long characterId, @PathVariable("statusId") Long statusId) {
    	CharacterModel characterModel = characterModelService.findCharacterById(characterId);
    	Status statusObj = statusService.findStatusById(statusId);
    	characterModelService.updateCharacter(characterId, statusObj);
    	return "redirect:/admin/home";
    	
	 }
    
    
    @RequestMapping(value="/characters")
    public String adminState1(HttpSession session,  Model model) {
		session.setAttribute("adminState", "1");
		return "redirect:/admin/home";
        }
    
    @RequestMapping(value="/users")
    public String adminState2(HttpSession session,  Model model) {
		session.setAttribute("adminState", "2");
		return "redirect:/admin/home";
        }
    
  
    
    @DeleteMapping(value="/deleteUserAndGuesses/{userId}")
    public String showUser(HttpSession session,  Model model, @PathVariable("userId") Long userId) {
    	User user = userService.findUserById(userId);
    	guessService.deleteGuesses(user);
    	userService.deleteUser(user);
    	model.addAttribute(user);
    	return "redirect:/admin/home";
        }
    
}