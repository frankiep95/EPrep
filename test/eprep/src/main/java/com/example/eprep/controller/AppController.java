package com.example.eprep.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.eprep.model.Users;


@Controller

public class AppController {

	@GetMapping({"/","home"})
	//@ResponseBody
	 public String index(Model model) {
		model.addAttribute("msg","Welcome to spring MVC");
		return "home";
	}

	@GetMapping({"about"})
	public String about(Model model) {
		model.addAttribute("msg","about us");
		return "about";
	}
	
	@GetMapping({"contact"})
	public String contact(Model model) {
		model.addAttribute("msg","Contact Us");
		return "contact";
	}
	
	@GetMapping({"login"})
	public String login(Model model) {
		model.addAttribute("msg","Login");
		return "login"; 
	}
	
	@GetMapping({"register"})
	public String signUp(Model model){	
		model.addAttribute("msg", "Register");
		model.addAttribute("users", new Users());	
	return "signup";
	}  

	 
	@GetMapping("name-{fname}-{lname}")
	public String name(Model model,@PathVariable String lname, @PathVariable String fname) {
		model.addAttribute("msg","<h3> You Entered " + fname +" "+ lname+"</h3>");
		return "home";
	}
	
}
