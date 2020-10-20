package com.prep.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.prep.model.Addressess;
import com.prep.model.Users;




public interface UsersService {
	
	void saveAccount(Users Users);
	
	void deleteUsers(Long id);
	
    Optional<Users> findByEmail(String email);	
	
	Optional<Users> login(String email, String password);	
	
	List<Users> findByName(String name);	
	
	Page<Users> search(String name, Pageable pageable);	
	
	List<Users> findByName(String lname, String email);		
	
	Page<Users> customeseacher(String name, String email, Pageable pageable);
	
	Page<Users> findAll(Pageable pageable);
	
	Optional<Users> findById(Long id);
	
	void editRoles(String role, Long id);
	
	void updatecontact(Addressess addressess);

}
