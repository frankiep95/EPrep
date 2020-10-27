package com.prep.dao;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Permissions;




@Repository
public interface PermissionsRepository extends JpaRepository<Permissions, Long> {

	Permissions findByPermissions(String permissions);
}
