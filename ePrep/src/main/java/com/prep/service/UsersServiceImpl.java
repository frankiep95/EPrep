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

import com.prep.dao.PermissionsRepository;
import com.prep.dao.RolesRepository;
import com.prep.dao.UsersRepository;
import com.prep.model.Addressess;

import com.prep.model.Users;
import com.prep.model.Permissions;
import com.prep.model.Roles;


@Service
@Transactional
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersRepository userRepository;
	
	@Autowired 
	PermissionsRepository permissionsRepository;
	
	@Autowired
	RolesRepository rolesRepository;

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
	public void editPermissions(String permissions, Long id) {		
		//userRepository.findById(id).get().setRole(role);
		userRepository.findById(id).
		ifPresent(a->{
			if(permissions.equals("ADMIN")) {
				a.setPermissions(new HashSet<Permissions>(permissionsRepository.findAll()));
			}
			else {
				a.setPermissions(new HashSet<Permissions>(Arrays.asList(permissionsRepository.findByPermissions(permissions))));
			}				
		});

		
	}
	
	@Override
	public void editRoles(String roles, Long id) {
		userRepository.findById(id).ifPresent(a->{
			a.setRoles(new HashSet<Roles>(Arrays.asList(rolesRepository.findByRoles(roles))));
			
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
