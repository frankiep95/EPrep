package com.example.eprep.controller;

import java.util.Arrays;
import java.util.HashSet;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.eprep.dao.RoleRepository;
import com.example.eprep.dao.UserRepository;
import com.example.eprep.model.Role;
import com.example.eprep.model.Users;
import com.example.eprep.utils.DataValidation;

@Controller
public class RegistrationController {

	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private DataValidation dataValidation;
	@Autowired
	private RoleRepository roleRepository;
	
	@PostMapping("register")
	String register(@ModelAttribute Users user, BindingResult result, Model model) {

		dataValidation.validate(user, result);
			if (result.hasErrors()) {
			model.addAttribute("page", "Register");
			return "signup";
		}	
		
		// save users and put the in session/login
		user.setRole("USER");
		user.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole("USER"))));
		userRepository.save(user);
		model.addAttribute("user", user);		
		model.addAttribute("msg","Hi "+ user.getFname()+ " welcome");
		model.addAttribute("page", "Profile");
	    model.addAttribute("loggedInUser", user.getEmail());
	    model.addAttribute("role", user.getRoles().stream().map(x-> x.getRole()).distinct().collect(Collectors.toList()));
		
		return "profile";
		
	}

	

}
