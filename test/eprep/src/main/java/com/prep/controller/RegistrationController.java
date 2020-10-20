package com.prep.controller;

import java.util.Arrays;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import com.prep.dao.UsersRepository;
import com.prep.model.Users;
import com.prep.utils.DataValidation;

@Controller
public class RegistrationController {
	
	@Autowired
	UsersRepository usersRepository;
	
	@Autowired
	DataValidation dataValidation;
	
	@PostMapping("register")
	public 	String register(@ModelAttribute Users user, BindingResult result, Model model) {

		dataValidation.validate(user, result);
			if (result.hasErrors()) {
			model.addAttribute("page", "Register");
			return "signup";
		}	
		
		// save users and put the in session/login
		user.setRole("USER");
		//user.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole("USER"))));
		usersRepository.save(user);
		model.addAttribute("user", user);		
		model.addAttribute("msg","Hi "+ user.getFname()+ " welcome");
		model.addAttribute("page", "Profile");
	    model.addAttribute("loggedInUser", user.getEmail());
	    model.addAttribute("role", "USER");
		
		return "profile";
		
	}

}