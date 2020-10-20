package com.prep.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.prep.model.Users;

@Repository
public interface UsersRepository extends JpaRepository<Users,Long>{
	String search="SELECT u FROM Users u WHERE u.email =:email AND " +
	  		  "u.fname LIKE (CONCAT('%',:name, '%')) OR u.lname =:name";
	
	String searchusers="SELECT u FROM Users u WHERE u.email =:name OR " +
	  		  "u.fname LIKE (CONCAT('%',:name, '%')) OR u.lname LIKE (CONCAT('%',:name, '%'))";
	
	Optional<Users> findByEmail(String email);
	
	@Query("FROM Users u WHERE u.email=?1 AND u.password=?2")
	Optional<Users> login(String email, String password);
	
	@Query("FROM Users WHERE lname=?1 OR fname=?1 OR email=?1")
	List<Users> findByName(String name);
	
	@Query(searchusers)
	Page<Users> search(@Param("name") String name, Pageable pageable);
	
	@Query("FROM Users WHERE lname=?1 AND email=?2")
	List<Users> findByName(String lname, String email);
		
	@Query(search)
	Page<Users> customeseacher(@Param("name") String name, @Param("email") String email, Pageable pageable);
}
