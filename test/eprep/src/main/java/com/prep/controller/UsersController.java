package com.prep.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.prep.dao.AddressRepository;
import com.prep.dao.PaymentMethodRepository;
import com.prep.dao.UsersRepository;
import com.prep.model.Addressess;
import com.prep.model.PaymentMethod;
import com.prep.model.Users;
import com.prep.utils.States;

@Controller
public class UsersController {

	@Autowired
	private AddressRepository addressRepository;

	@Autowired
	private UsersRepository usersRepository;

	@Autowired
	private PaymentMethodRepository paymentMethodRepository;

	@PostMapping("updatecontact")
	String update(@ModelAttribute Addressess addressess, Model model) {

		try {
			Users user = usersRepository.findById(addressess.getId()).get();
			addressess.setUser(user);
			addressRepository.save(addressess);
			model.addAttribute("msg", "Update success");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:profile";

	}

	@GetMapping("profile")
	String profile(@SessionAttribute(required = false) String loggedInUser, Model model) {
		try {
			model.addAttribute("pagel", "Profile");
			// if user is not in session return login page expired session
			if (loggedInUser.isEmpty() || loggedInUser == null) {
				model.addAttribute("error", "Expired session, please Login");
				return "login";
			}
			// populate user details from database
			usersRepository.findByEmail(loggedInUser).ifPresent(a -> {
				model.addAttribute("user", a);
				// model.addAttribute("image", Base64.getEncoder().encodeToString(a.getData()));
				if (a.getAddress() != null) {
					model.addAttribute("address", a.getAddress());
				}
			});

		} catch (Exception e) {
			// TODO Auto-generated catch block
			 e.printStackTrace();
		}
		return "profile";
	}
	
	@GetMapping("preps")
	String preps(@SessionAttribute(required = false) String loggedInUser, Model model) {
		try {
			model.addAttribute("page","Preps");
			if(loggedInUser.isEmpty() || loggedInUser == null) {
				model.addAttribute("error", "Please Log in to Enter this page");
				return "login";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "preps";
	}

	@PostMapping("addcard")
	String addcard(@ModelAttribute PaymentMethod payment, Model model) {

		try {
			Users user = usersRepository.findById(payment.getId()).get();
			payment.setUser(user);
			paymentMethodRepository.save(payment);
			model.addAttribute("msg", "Card Added");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:profile";

	}

	@GetMapping("deletecard")
	String deletecard(@RequestParam Long id, Model model) {
		try {
			paymentMethodRepository.deleteById(id);
			model.addAttribute("msg", "Card Removed");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:profile";
	}

	@GetMapping("expired")
	String expire(Model model, HttpSession session) {
		session.invalidate();
		model.addAttribute("loggedInuser", "");
		model.addAttribute("role", "");
		model.addAttribute("error", "You have logged out due to inactivity");

		return "login";

	}

	@ModelAttribute("user")
	Users user() {
		return new Users();
	}

	@ModelAttribute("address")
	Addressess address() {
		return new Addressess();
	}

	@ModelAttribute("states")
	public List<States> populateStates() {
		return Arrays.asList(States.values());
	}

	@ModelAttribute("card")
	PaymentMethod pay() {
		return new PaymentMethod();
	}

}