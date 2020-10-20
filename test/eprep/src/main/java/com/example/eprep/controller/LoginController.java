package com.example.eprep.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.eprep.dao.AddressRepository;
import com.example.eprep.dao.UserRepository;
import com.example.eprep.model.Users;
import com.example.eprep.utils.States;
import com.example.eprep.utils.WebUtils;
;

@Controller
@SessionAttributes({"loggedInUser","role"})
public class LoginController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private WebUtils webUtils;

	@PostMapping("login")
	public String login(RedirectAttributes redirect, Model model, @RequestParam String email, @RequestParam String password) {
		Optional<Users> user= userRepository.login(email, password);
		
		if(user.isPresent()) {
			model.addAttribute("loggedInUser", email);
			model.addAttribute("role", user.get().getRole());
		}else {
			redirect.addFlashAttribute("error","Invalid Credentials");
			return "redirect:/login";
		}
		return"redirect:/profile";
	}
	
	//map request to update profile
	@PostMapping("updatemyinfo")
	public String updateMyInfo(@ModelAttribute Users user,RedirectAttributes red) {
		userRepository.findById(user.getId()).ifPresent(u->{
			u.setFname(user.getFname());
			u.setLname(user.getLname());
			userRepository.save(u);
			red.addFlashAttribute("success","Update Success Thank you!");
			
		});
		return "redirect:/profile";
	}
	

	@GetMapping("logout")
	public String logout(Model model, SessionStatus status, HttpSession session) {
		status.setComplete();
		session.invalidate();
		model.addAttribute("loggedInUser", "");
		model.addAttribute("role", "");
		Users user=new Users();
		model.addAttribute("user", user);
		model.addAttribute("msg","You have Been logged Out");
		
		return "login";
	}
	
	@PostMapping("/addimages")
	public String add(@RequestParam("file") MultipartFile file, 
			@RequestParam Long id, RedirectAttributes model) {
    	    
		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg))$)");
		try {
			
			  if(file != null && file.isEmpty()){
				  model.addFlashAttribute("error", "Error No file Selected "); 
			      return "redirect:/profile"; 
			      } 
			  if(file.getSize()>1073741824){
				  model.addAttribute("error","File size "+file.getSize()+"KB excceds max allowed, try another photo ");
				  return "redirect:/profile"; 
			      } 
			  Matcher mtch = ext.matcher(file.getOriginalFilename());
			  
			  if (!mtch.matches()) {
				  model.addFlashAttribute("error", "Invalid Image type "); 
			      return "redirect:/profile";			  
			  }
			
			   webUtils.addProfilePhoto(file, id, "users");
			
				
			model.addFlashAttribute("msg", "Upload success "+ file.getSize()+" KB");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/profile";
	}
	
	@PostMapping("sendemail")
	String sendemail(@RequestParam String email, 
					 @RequestParam String name,
					 @RequestParam String subject,
					 @RequestParam String message, RedirectAttributes red) {
		
			try {
				webUtils.sendMail(email, message+" From "+ name, subject);
				red.addFlashAttribute("success", "Your message has been sent. Thank you! "+ name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				red.addFlashAttribute("error", "Email fail! ");
			}
		
	 
	return "redirect:contact";		
	}
	

	

	
	
	@ModelAttribute("states")
    public List<States> populateStates(){    	
        return Arrays.asList(States.values());
    }
}
