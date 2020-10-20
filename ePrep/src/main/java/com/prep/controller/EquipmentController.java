package com.prep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.prep.dao.GVRepository;
import com.prep.dao.HeadsRepository;
import com.prep.dao.JoysticksRepository;
import com.prep.dao.PinoutRepository;
import com.prep.dao.TrailerRepository;
import com.prep.model.GVs;
import com.prep.model.Heads;
import com.prep.model.Joysticks;
import com.prep.model.Trailers;
import com.prep.utils.DataValidation;


@Controller
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
	PinoutRepository pinouts;
	
	@PostMapping("addhead")
	public String addhead(@ModelAttribute Heads head, Model model, BindingResult result) {
		dataValidation.headValidate(head, result);
		if (result.hasErrors()) {
		model.addAttribute("statusmsg", "Head Already Exists!");
		return "profile";
		}
		
		
		heads.save(head);
		model.addAttribute("statusmsg", "Head Added Successfully!");		
		return "profile";
	}
	

	@PostMapping("addtrailer")
	public String addTrailer(@ModelAttribute Trailers trailer, Model model, BindingResult result) {
		trailers.save(trailer);
		return "preps";
	}

	@PostMapping("addjoystick")
	public String addJoystick(@ModelAttribute Joysticks joystick, Model model,BindingResult result) {
		joysticks.save(joystick);
		return "preps";
	}
	
	@PostMapping("addGV")
	public String addGV(@ModelAttribute GVs GV, Model model, BindingResult result) {
		gvs.save(GV);
		return "preps";
	}
	
	
	
	@ModelAttribute("head")
	Heads head(){
		return new Heads();
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

}
