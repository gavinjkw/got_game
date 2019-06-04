package com.gavinwilson.gameproject.controllers;



import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gavinwilson.gameproject.models.User;
import com.gavinwilson.gameproject.services.CharacterModelService;
import com.gavinwilson.gameproject.services.GuessService;
import com.gavinwilson.gameproject.services.StatusService;
import com.gavinwilson.gameproject.services.UserService;
import com.gavinwilson.gameproject.validator.UserValidator;




@Controller
public class HomeController {
	
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
	
	@RequestMapping("/")
    public String index(Model model, @Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		model.addAttribute("allCharacters", characterModelService.getAllCharacters());
		
		if (session.getAttribute("landingState") == null) {
			session.setAttribute("landingState", "1");
		}
		
		List<User> users = userService.getAllUsers();
		for (User userItem : users) {
			String userIdString = Long.toString(userItem.getId());

			List<Object[]> charsAndGuesses = guessService.getGuessesAndCharacters(userIdString);
			userService.updateUserScore(charsAndGuesses, userItem);
		}
		
		model.addAttribute("rank", 0);
		model.addAttribute("allUsers", userService.getUsersByScore());
		return "Index.jsp";
    }
	
	@RequestMapping(value="/register")
    public String register(HttpSession session,  Model model) {
		session.setAttribute("landingState", "2");
		return "redirect:/";
        }
	
	@RequestMapping(value="/login")
    public String login(HttpSession session,  Model model) {
		session.setAttribute("landingState", "3");
		return "redirect:/";
        }
	
	@RequestMapping(value="/home")
    public String home(HttpSession session,  Model model) {
		session.setAttribute("landingState", "1");
		return "redirect:/";
        }
  
	
	@PostMapping(value="/register")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session,  Model model, @RequestParam("email") String email) {
		model.addAttribute("allCharacters", characterModelService.getAllCharacters());
		userValidator.validate(user, result);
    	if (email == "") {
			model.addAttribute("noEmail", "Please provide an email");
			return "Index.jsp";
    	}
    	if(result.hasErrors()) {
        	return "Index.jsp";
        } else {
	        User u = userService.registerUser(user);
	        session.setAttribute("userId", u.getId());
	        return "redirect:/account";
        }
    }
    
    @PostMapping(value="/login")
    public String loginUser(@ModelAttribute("user") User user, @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {

    	boolean isAuthenticated = userService.authenticateUser(email, password);
    	if (isAuthenticated){
    		 User userOne  = userService.findByEmail(email);
	    	 session.setAttribute("userId", userOne.getId());
	         return "redirect:/account";
	     } else {
	    	 model.addAttribute("error", "Invalid credentials. Please try again.");
	    	 model.addAttribute("allCharacters", characterModelService.getAllCharacters());
	    	 return "Index.jsp";
	     }
    }
    
    @RequestMapping(value="/account")
    public String addEvent(HttpSession session, Model model) {
		long userId = (long) session.getAttribute("userId");	
    	User user = userService.findUserById(userId);
    	model.addAttribute("allCharacters", characterModelService.getAllCharacters());
    	model.addAttribute(user);
    	model.addAttribute("attemptsStatus", user.getAttempts());
    	model.addAttribute("allGuesses", guessService.getGuessesByUserId(userId));
    	return "UserHome.jsp";
	     }
	 
    
    @PostMapping(value="/submit/{userId}")
     public String submit(Model model, HttpSession session, @PathVariable("userId") Long userId, @RequestParam("jonSnow") Long jonSnow, @RequestParam("sansaStark") Long sansaStark, @RequestParam("aryaStark") Long aryaStark, @RequestParam("branStark") Long branStark, @RequestParam("cerseiLannister") Long cerseiLannister, @RequestParam("jaimeLannister") Long jaimeLannister, @RequestParam("tyrionLannister") Long tyrionLannister, @RequestParam("daenerysTargaryen") Long daenerysTargaryen, @RequestParam("yaraGreyjoy") Long yaraGreyjoy, @RequestParam("theonGreyjoy") Long theonGreyjoy, @RequestParam("melisandre") Long melisandre, @RequestParam("jorahMormont") Long jorahMormont, @RequestParam("theHound") Long theHound, @RequestParam("theMountain") Long theMountain, @RequestParam("samwellTarley") Long samwellTarley, @RequestParam("gilly") Long gilly, @RequestParam("samChild") Long samChild, @RequestParam("lordVarys") Long lordVarys, @RequestParam("brienneOfTarth") Long brienneOfTarth, @RequestParam("davosSeaworth") Long davosSeaworth, @RequestParam("bronn") Long bronn, @RequestParam("podrickPayne") Long podrickPayne, @RequestParam("tormundGiantsbane") Long tormundGiantsbane, @RequestParam("qyburn") Long qyburn, @RequestParam("greyWorm") Long greyWorm, @RequestParam("gendry") Long gendry, @RequestParam("bericDondarrion") Long bericDondarrion, @RequestParam("euronGreyjoy") Long euronGreyjoy, @RequestParam("daario") Long daario, @RequestParam("dolorousEdd") Long dolorousEdd, @RequestParam("missandei") Long missandei, @RequestParam("ghost") Long ghost,@RequestParam("nymeria") Long nymeria) {
    	
    	guessService.createGuess(userId, jonSnow, (long) 7);
    	guessService.createGuess(userId, sansaStark, (long) 8);
    	guessService.createGuess(userId, aryaStark, (long) 9);
    	guessService.createGuess(userId, branStark, (long) 10);
    	guessService.createGuess(userId, cerseiLannister, (long) 11);
    	guessService.createGuess(userId, jaimeLannister, (long) 12);
    	guessService.createGuess(userId, tyrionLannister, (long) 13);
    	guessService.createGuess(userId, daenerysTargaryen, (long) 14);
    	guessService.createGuess(userId, yaraGreyjoy, (long) 15);
    	guessService.createGuess(userId, theonGreyjoy, (long) 16);
    	guessService.createGuess(userId, melisandre, (long) 17);
    	guessService.createGuess(userId, jorahMormont, (long) 18);
    	guessService.createGuess(userId, theHound, (long) 19);
    	guessService.createGuess(userId, theMountain, (long) 20);
    	guessService.createGuess(userId, samwellTarley, (long) 21);
    	guessService.createGuess(userId, gilly, (long) 22);
    	guessService.createGuess(userId, samChild, (long) 23);
    	guessService.createGuess(userId, lordVarys, (long) 24);
    	guessService.createGuess(userId, brienneOfTarth, (long) 25);
    	guessService.createGuess(userId, davosSeaworth, (long) 26);
    	guessService.createGuess(userId, bronn, (long) 27);
    	guessService.createGuess(userId, podrickPayne, (long) 28);
    	guessService.createGuess(userId, tormundGiantsbane, (long) 29);
    	guessService.createGuess(userId, qyburn, (long) 30);
    	guessService.createGuess(userId, greyWorm, (long) 31);
    	guessService.createGuess(userId, gendry, (long) 32);
    	guessService.createGuess(userId, bericDondarrion, (long) 33);
    	guessService.createGuess(userId, euronGreyjoy, (long) 34);
    	guessService.createGuess(userId, daario, (long) 35);
    	guessService.createGuess(userId, dolorousEdd, (long) 36);
    	guessService.createGuess(userId, missandei, (long) 37);
    	guessService.createGuess(userId, ghost, (long) 38);
    	guessService.createGuess(userId, nymeria, (long) 39);
    	
    	User user = userService.findUserById(userId);
    	userService.updateUserAttempts(user);
    	
    	List<User> users = userService.getAllUsers();
		for (User userItem : users) {
			String userIdString = Long.toString(userItem.getId());

			List<Object[]> charsAndGuesses = guessService.getGuessesAndCharacters(userIdString);
			userService.updateUserScore(charsAndGuesses, userItem);
		}
    	
    	return "redirect:/account";
    	}
    
    @RequestMapping(value="/showuser/{userId}")
    public String showUser(HttpSession session,  Model model, @PathVariable("userId") Long userId) {
    	User user = userService.findUserById(userId);
    	model.addAttribute(user);
		return "ShowUser.jsp";
        }
    
}
