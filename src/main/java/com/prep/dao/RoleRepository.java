package com.prep.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Role;



@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

	Role findByRole(String role);
}
