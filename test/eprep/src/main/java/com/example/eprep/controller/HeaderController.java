package com.example.eprep.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.eprep.dao.UserRepository;
import com.example.eprep.model.Users;

@Controller
public class HeaderController {

	private UserRepository userRepository;
	
	
	@PostMapping({"search"})
	public String search(@RequestParam String keyword, Model model,RedirectAttributes red) {
		model.addAttribute("page","Admin");
		List<Users> users=userRepository.searchUser(keyword);
		if(users.isEmpty()) {
			model.addAttribute("msg","No match found");
			
		}else {
			red.addFlashAttribute("list",users);
			model.addAttribute("msg",users.size()+ " found");
		}
		return "redirect:searchresults";
		}
}
