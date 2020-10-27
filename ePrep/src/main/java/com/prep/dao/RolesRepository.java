package com.prep.dao;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.prep.model.Roles;

@Repository
public interface RolesRepository extends JpaRepository<Roles,Long> {
	Roles findByRoles(String roles);
}
