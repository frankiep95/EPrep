package com.prep.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.prep.model.Users;



@Controller
public class AppController {
	
	@GetMapping({"home","/"})
	//@ResponseBody
	public String index(Model model) {
		model.addAttribute("msg", "Welcome from controller");
		model.addAttribute("msg2", "message 2");
	return "home";
	}
	
	@GetMapping("about")
	String about(Model model) {
		model.addAttribute("msg", "this about us page");
		return "about";
	}
	
	@GetMapping("contact")
	public String contactus(Model model) {
		model.addAttribute("msg", "this is contact page");
		return "contact";
	}
	
	@GetMapping("login")
	public String login(Model model) {
		model.addAttribute("msg", "Login");
		return "login";
	}
	
	@PostMapping("sign-in")
	public String signin(Model model, @RequestParam String email, @RequestParam String password) {
		
		model.addAttribute("msg", "<span class='text-success'>"+email+" "+password+"</span>");
		
		return "login";
	}
	
	@GetMapping("register")
	public String signup(Model model) {
		model.addAttribute("msg", "Sign Up");
		model.addAttribute("users", new Users());
		return "signup";
	}
	@GetMapping("preps")
	public String prep(Model model) {
		return "preps";
	}
	
	
	@GetMapping("myname")
	public String timen(Model model, @RequestParam String name, @RequestParam String address) {
		
		model.addAttribute("msg", "Hi "+name+ " From "+ address+" time now is " +new Date());
		
		return "home";
	}
	
	@GetMapping("name-{name}-{address}")
	public String name(Model model, @PathVariable String name, @PathVariable String address) {
		
		model.addAttribute("msg", "Hi "+name+ " From "+ address+" time now is " +new Date());
		
		return "home";
	}
	
}
