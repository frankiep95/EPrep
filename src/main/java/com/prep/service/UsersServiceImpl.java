package com.prep.service;

import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.prep.dao.RoleRepository;
import com.prep.dao.UsersRepository;
import com.prep.model.Addressess;
import com.prep.model.Role;
import com.prep.model.Users;



@Service
@Transactional
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersRepository userRepository;
	
	@Autowired 
	RoleRepository roleRepository;

	@Override
	public Optional<Users> findByEmail(String email) {		
		return userRepository.findByEmail(email);
	}

	@Override
	public Optional<Users> login(String email, String password) {		
		return userRepository.login(email, password);
	}

	@Override
	public List<Users> findByName(String name) {
		return userRepository.findByName(name);
	}

	@Override
	public Page<Users> search(String name, Pageable pageable) {
		return userRepository.search(name, pageable);
	}

	@Override
	public List<Users> findByName(String lname, String email) {
		return userRepository.findByName(lname, email);
	}

	@Override
	public Page<Users> customeseacher(String name, String email, Pageable pageable) {
		return userRepository.customeseacher(name, email, pageable);
	}

	@Override
	public void saveAccount(Users Users) {
		userRepository.save(Users);
	}

	@Override
	public void deleteUsers(Long id) {
		userRepository.deleteById(id);
	}

	@Override
	public Page<Users> findAll(Pageable pageable) {		
		return userRepository.findAll(pageable);
	}

	@Override
	public Optional<Users> findById(Long id) {
		return userRepository.findById(id);
	}
	

	@Override
	public void editRoles(String role, Long id) {		
		//userRepository.findById(id).get().setRole(role);
		userRepository.findById(id).
		ifPresent(a->{
			if(role.equals("ADMIN")) {
				a.setRoles(new HashSet<Role>(roleRepository.findAll()));
			}
			else {
				a.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole(role))));
			}				
		});

		
	}

	@Override
	public void updatecontact(Addressess addressess) {
		
		addressess.setCreatedon(new Date());
		Users user=findById(addressess.getId()).get();
		user.setFname(addressess.getUser().getFname());
		user.setLname(addressess.getUser().getLname());
		user.setAddress(addressess);
	}

	

}
