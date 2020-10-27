package com.prep.controller;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.prep.dao.GVRepository;
import com.prep.dao.HeadsRepository;
import com.prep.dao.JoysticksRepository;

import com.prep.dao.PinoutRepository;
import com.prep.dao.TrailerRepository;
import com.prep.dao.WorkRepository;
import com.prep.model.Addressess;
import com.prep.model.GVs;
import com.prep.model.Heads;

import com.prep.model.Joysticks;
import com.prep.model.Trailers;
import com.prep.model.Users;
import com.prep.model.Work;

import com.prep.utils.DataValidation;



@Controller
@SessionAttributes({"loggedInUser","permissions"})
public class EquipmentController {

	@Autowired 
	HeadsRepository heads;
	
	@Autowired
	TrailerRepository trailers;
	
	@Autowired
	JoysticksRepository joysticks;
	
	@Autowired
	GVRepository gvs;


	
	@Autowired
	private DataValidation dataValidation;
	

	@Autowired
	private WorkRepository workRepository;
	

	
	
	@Autowired 
	PinoutRepository pinouts;
	

	


	@PostMapping("addtrailer")
	public String addTrailer(@ModelAttribute Trailers trailer, Model model, BindingResult result) {
		trailers.save(trailer);
		return "profile#equipment";
	}

	@PostMapping("addjoystick")
	public String addJoystick(@ModelAttribute Joysticks joystick, Model model,BindingResult result) {
		joysticks.save(joystick);
		return "profile#equipment";
	}
	
	@PostMapping("addGV")
	public String addGV(@ModelAttribute GVs GV, Model model, BindingResult result) {
		gvs.save(GV);
		return "profile#equipment";
	}
	

	

	
	@ModelAttribute("Trailer")
	Trailers trailer() {
		return new Trailers();
	}
	
	@ModelAttribute("Joystick")
	Joysticks joysticks() {
		return new Joysticks();
	}
	
	@ModelAttribute("GV")
	GVs gv() {
		return new GVs();
	}
	@ModelAttribute("address")
	Addressess address() {
	return new Addressess();		
	}
	
	@ModelAttribute("user")
	Users user() {		
		return new Users();
		
	}
}
