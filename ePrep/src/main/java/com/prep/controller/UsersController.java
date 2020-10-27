package com.prep.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prep.dao.EquipmentRepository;
import com.prep.dao.HeadsRepository;
import com.prep.dao.PhoneBookRepository;
import com.prep.dao.WorkRepository;
import com.prep.service.UsersService;
import com.prep.utils.DataValidation;
import com.prep.utils.States;
import com.prep.utils.WebUtils;

import com.prep.model.*;

@Controller
@SessionAttributes({"loggedInUser","permissions"})
public class UsersController {
	
	@Autowired
	private UsersService Userservice;
	//private UserRepository userRepository;
	
	@Autowired
	private WebUtils webUtils;
	
	@Autowired
	private DataValidation dataValidation;
	
	@Autowired
	private WorkRepository workRepository;
	
	@Autowired
	private PhoneBookRepository phoneBookRepository;
	
	
	@Autowired
	EquipmentRepository equipmentRepository;

	@Autowired 
	HeadsRepository heads;
	
	@PostMapping("register")
	@Transactional
	public String register(@ModelAttribute("users") Users user, Model model, BindingResult result, RedirectAttributes red) {	
		
		dataValidation.validate(user, result);
		if (result.hasErrors()) {
		model.addAttribute("profile", "active");
		return "register";
		}
			
		    Userservice.saveAccount(user);
		    user.setRole("USER");			
			model.addAttribute("msg","Profile");
			model.addAttribute("user", user);
			model.addAttribute("loggedInUser", user.getEmail());
			//List<String> roles=user.getRoles().stream().map(x-> x.getRole()).distinct().collect(Collectors.toList());
			model.addAttribute("permissions", user.getPermissions().stream().map(x-> x.getPermissions()).distinct().collect(Collectors.toList()));
		
	    return "profile";
	}
	
	@GetMapping("profile") 
	  String profile(@SessionAttribute(required = false) String loggedInUser, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
		        @RequestParam(value = "size", defaultValue = "10", required = false) Integer size, Model model) {
		
		
	     try {
	    	
	    	 //if user is not in session return login page expired session
			if(loggedInUser ==null || loggedInUser.isEmpty()) {
			 model.addAttribute("error", "Expired session, please Login");
			 return "login"; 
			 }
			//populate user details from database 
			 Userservice.findByEmail(loggedInUser).ifPresent(a->{
			 model.addAttribute("user", a);				 
			 if(a.getAddress()!=null) {
			    model.addAttribute("address", a.getAddress());	 
			 }
			 model.addAttribute("users", "active");

 	    	Page<Users> findAllPagable = Userservice.findAll(PageRequest.of(page, size, Sort.by("fname")));				
				model.addAttribute("list", findAllPagable);
			Page<Work> findAllWorkPagable = workRepository.findAll(PageRequest.of(page, size));
				model.addAttribute("works",findAllWorkPagable);
			Page<Equipment> findAllEquip = equipmentRepository.findAll(PageRequest.of(page, size));
				model.addAttribute("equip", findAllEquip);
			 });
			 
			 model.addAttribute("page", "Profile");
			
			
	     } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	  return "profile";
	 }
	
	@PostMapping("login")
	String login(RedirectAttributes redirect, Model model, @RequestParam String email, @RequestParam String password){
	  // login user
	  Optional<Users> user= Userservice.login(email, password);
	 //add user email and role in session
	  if(user.isPresent()) {
		  model.addAttribute("loggedInUser", email);
		  model.addAttribute("permissions", user.get().getPermissions().stream().map(x-> x.getPermissions()).distinct().collect(Collectors.toList()));

		  
	  }else {
		  redirect.addFlashAttribute("error", "Sorry Invalid Credentials");
		  return "redirect:/login";
	  }
	  
	return "redirect:/profile";
		
	}

	@GetMapping("logout")
	String logout(Model model, SessionStatus status, HttpSession session){
		//status.setComplete();
		session.invalidate();
		model.addAttribute("loggedInUser", "");
		model.addAttribute("role", "");
		model.addAttribute("msg", "You have been Logged out");
	
	return "login";
		
	}

	@GetMapping("expired")
	String expire(Model model, HttpSession session){
		session.invalidate();
		model.addAttribute("loggedInUser", "");
		model.addAttribute("role", "");
		model.addAttribute("error", "You have been logged out due to inactivity");	
		
	return "login";
		
	}
	
	
	@GetMapping("deleteUser")
	public String delete(@RequestParam Long id, RedirectAttributes red) {
		
		try {
			Userservice.deleteUsers(id);
			red.addFlashAttribute("success", "Delete Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:admin";
	}
	
	@GetMapping("deleteByemail")
	public String dleteByemail(@RequestParam String email, RedirectAttributes red) {
				
		try {
			//Userservice.delete(Userservice.findByEmail(email).get());
			red.addFlashAttribute("success", "user deleted");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			red.addFlashAttribute("error", " Sorry unexpected error delete fail");
		}
		
		return "redirect:admin";
	}
	
	
	/*
	 * @GetMapping("getEmployees") public String users(Model
	 * model, @RequestParam(value = "page", defaultValue = "0", required = false)
	 * Integer page,
	 * 
	 * @RequestParam(value = "size", defaultValue = "10", required = false) Integer
	 * size,RedirectAttributes red) {
	 * 
	 * try {
	 * 
	 * model.addAttribute("users", "active"); Page<Users> findAllPagable =
	 * Userservice.findAll(PageRequest.of(page, size, Sort.by("fname")));
	 * model.addAttribute("list", findAllPagable);
	 * model.addAttribute("msg"," Users found"); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }
	 * 
	 * return "redirect:profile#employees";
	 * 
	 * }
	 */
	
	@PostMapping("updateUsers")
	public String update(@ModelAttribute Users user, Model model, RedirectAttributes red) {	
		
		try {
			
			  Userservice.findById(user.getId()).ifPresent(a->{
			  a.setFname(user.getFname()); a.setLname(user.getLname());
			  a.setRole(user.getRole()); 
			  Userservice.saveAccount(a);
			  
			  });
			 
			 
			 //userRepository.save(user);
			 red.addFlashAttribute("success", "User Updated"); 
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		//red.addFlashAttribute("error", "User Exists");
			
		
	  return "redirect:profile";
	}
	
	@PostMapping("/addimages")
	public String add(@RequestParam("file") MultipartFile file, 
			@RequestParam Long id, RedirectAttributes model) {
    	    
		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg|pdf|mp4))$)");
		try {
			
			  if(file != null && file.isEmpty()){
				  model.addFlashAttribute("error", "Error No file Selected "); 
			      return "redirect:profile"; 
			      } 
			  if(file.getSize()>1073741824){
				  model.addAttribute("error","File size "+file.getSize()+"KB excceds max allowed, try another photo ");
				  return "redirect:profile"; 
			      } 
			  Matcher mtch = ext.matcher(file.getOriginalFilename());
			  
			  if (!mtch.matches()) {
				  model.addFlashAttribute("error", "Invalid Image type "); 
			      return "redirect:profile";			  
			  }
			
			   webUtils.addProfilePhoto(file, id, "users");
				
			model.addFlashAttribute("msg", "Upload success "+ file.getSize()+" KB");
			
		} catch (Exception e) {
			//e.printStackTrace);
		}

		return "redirect:profile";
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
	
	@PostMapping("search")
	public String search(Model model, @RequestParam String keyword) {
		
		Page<Users> Users=Userservice.search(keyword, PageRequest.of(0, 4, Sort.by("id")));
		model.addAttribute("list", Users);
		model.addAttribute("msg"," Users found");
		
		return "admin";
	}

	
	@PostMapping("editpermissions")
	public String editPermissions(Model model, @RequestParam String permissions, @RequestParam Long id) {
		
		Userservice.editPermissions(permissions, id);
		
		return "redirect:profile#employees";
	}
	@PostMapping("editrole")
	public String editRole(Model model, @RequestParam String roles, @RequestParam Long id) {
		
		Userservice.editRoles(roles, id);
		
		return "redirect:profile#employees";
	}
	
	@PostMapping("seachByemailOrlastname")
	public String seachByemailOrlastname(Model model, @RequestParam String lname, @RequestParam String email) {
		
		Page<Users> Users=Userservice.customeseacher(lname, email, PageRequest.of(0, 4, Sort.by("id")));
		model.addAttribute("list", Users);
		model.addAttribute("msg"," Users found");
		
		return "admin";
	}
	
	@PostMapping("updatecontact")
	String update(@ModelAttribute Addressess address, Model model) {
	
		try {
			address.setCreatedon(new Date());
			Users user=Userservice.findById(address.getId()).get();
			user.setFname(address.getUser().getFname());
			user.setLname(address.getUser().getLname());

			user.setAddress(address);
			Userservice.saveAccount(user);	
			model.addAttribute("msg", "Update success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile#edit-profile";
	}
	

	
	@PostMapping("addphone")
	String addphone(@RequestParam Long id, @RequestParam String type, 
					@RequestParam String tel, RedirectAttributes red) {
	
		try {
			PhoneBook book = new PhoneBook();
			Users user=Userservice.findById(id).get();	
			book.setUser(user);
			book.setTel(tel);
			book.setType(type);
			phoneBookRepository.save(book);
			red.addFlashAttribute("msg", "Phone Added");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile";	
		
	}
	
	@GetMapping("deletetel")
	public String deletetel(@RequestParam Long id, RedirectAttributes red) {
		
		try {
			phoneBookRepository.deleteById(id);
			red.addFlashAttribute("success", "Phone Deleted");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile";
	}
	
	
	@PostMapping("changepassword")	
	String register(@ModelAttribute Users user, RedirectAttributes mod) {
		String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";
		
		    Userservice.findById(user.getId()).ifPresent(a->{			
			
			if(!a.getPassword().equals(user.getPassword())) {
				mod.addFlashAttribute("error", "Password is different from current one");
			}
			
			if(!user.getPassword2().matches(passwordRegex)) { 				
				mod.addFlashAttribute("error", "Password should be at least 8 characters, lower case, upper case and a special character."); 
			}
			
			if(a.getPassword().equals(user.getPassword()) && user.getPassword2().matches(passwordRegex)) {
				a.setPassword(user.getPassword2());
				Userservice.saveAccount(a);
				mod.addFlashAttribute("msg", "Password reset success");
			}
			
		});
		
		return "redirect:profile";
		
	}
	
	
	@PostMapping("addwork")
	public String addWork(@ModelAttribute Work work, Model model, BindingResult result) {
		
		try{
			
			workRepository.save(work);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:profile#dashboard";
		}
		
		return "redirect:profile#dashboard";
	}
	
	@ModelAttribute("work")
	Work work() {
		return new Work();
	}
	
	@PostMapping("addhead")
	public String addhead(@ModelAttribute Heads head, Model model, BindingResult result) {
		dataValidation.headValidate(head, result);
		if (result.hasErrors()) {
		model.addAttribute("statusmsg", "Head Already Exists!");
		return "redirect:profile#equipment";
		}
		heads.save(head);
		model.addAttribute("statusmsg", "Head Added Successfully!");		
		return "redirect:profile#equipment";
	}
	@ModelAttribute("head")
	Heads head(){
		return new Heads();
	}
	
	@ModelAttribute("sizes")
	public List<String> size() {
		List<String> size = new ArrayList<String>();
		size.add("S");
		size.add("M");		
		size.add("L");
		size.add("XL");
		size.add("2X");
		size.add("3X");		
		size.add("FREE SIZE");
		return size;
	}

	@ModelAttribute("cols")
	public List<String> colour() {
		List<String> col = new ArrayList<String>();
		col.add("Blue");
		col.add("Brown");
		col.add("Black");
		col.add("White");
		col.add("Green");
		col.add("Gray");
		col.add("Red");
		col.add("Yellow");
		col.add("Pink");
		col.add("Tan");
		col.add("Purple");
		col.add("Maroon");
		col.add("Gold");
		col.add("Silver");
		return col;
	}


	@ModelAttribute("states")
    public List<States> populateStates(){    	
        return Arrays.asList(States.values());
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
