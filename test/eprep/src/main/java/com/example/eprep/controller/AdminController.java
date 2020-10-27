package com.example.eprep.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.eprep.dao.RoleRepository;
import com.example.eprep.dao.UserRepository;
import com.example.eprep.model.Products;
import com.example.eprep.model.Role;
import com.example.eprep.model.Users;

@Controller
public class AdminController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@PostMapping("editrole")
	public String editrole(@RequestParam Long id, @RequestParam String role, RedirectAttributes redirect) {
		try {
			userRepository.findById(id).ifPresent(
					a->{
						a.setRole(role);
						if(role.equals("ADMIN")) {
							a.setRoles(new HashSet<Role>(roleRepository.findAll()));
							userRepository.save(a);
						}
						else {
							a.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole(role))));
							userRepository.save(a);
						}
					});
			redirect.addFlashAttribute("success", role + " Role Granted");
		}catch(Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("success", "Operation Fail");
		}
		return "redirect:/admin";
			
			}

		//Query database and drop a list in admin page this will render users details
	@GetMapping("admin")
	public String users(Model model, @RequestParam(value = "page",defaultValue = "0", required = false) Integer page,
			@RequestParam(value = "size", defaultValue = "4", required = false) Integer size) {
		try {
			model.addAttribute("users","active");
			Page<Users> findAllPagable = userRepository.findAll(PageRequest.of(page, size, Sort.by("fname")));
			model.addAttribute("list",findAllPagable);
			model.addAttribute("msg", "Users found");
			
		}catch(Exception e) {
			e.printStackTrace();
		}


		return "admin";
	}
	
	//add mapping to delete user in the controller
	@GetMapping({"removeuser"})
	public String deleteUser(Model model,@RequestParam Long id,RedirectAttributes redirect) {
		try {
			userRepository.deleteById(id);
			redirect.addFlashAttribute("success","Delete success");
			redirect.addFlashAttribute("list",userRepository.findAll());
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Delete Fail");
		}
		return "redirect:admin";
		}
	
	@PostMapping("customsearch")
	public String customSearch(@RequestParam String email, @RequestParam String lname, Model model) {
		//model.addAttribute("page", "Admin");
		model.addAttribute("list",userRepository.customSearchUser(lname, email));

		return "admin";
		}
	
	@PostMapping("updateUsers")
	public String update(@ModelAttribute Users user, Model model , RedirectAttributes red) {
		try {
			userRepository.findById(user.getId()).ifPresent(a->{
				a.setFname(user.getFname());
				a.setLname(user.getLname());
				a.setRole(user.getRole());
				userRepository.save(a);
			});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:admin";
	}

	@ModelAttribute("user")
	public Users user() {
		return new Users();
	}
	
	@ModelAttribute("product")
	Products prod() {
		return new Products();
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
}