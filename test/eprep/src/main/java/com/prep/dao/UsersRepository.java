package com.prep.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.prep.model.Users;

public interface UsersRepository extends JpaRepository<Users,Long>{
	Optional<Users>findByEmail(String email);
	
    @Query("SELECT u FROM Users u WHERE u.email=:email AND u.password=:password")
    Optional<Users>login(@Param("email") String email,@Param("password") String password);
    
	@Query("FROM Users WHERE email=?1 OR fname=?1 OR lname=?1")
	List<Users>searchUser(String keyword);

	
    @Query("SELECT u FROM Users u WHERE u.email=:email AND u.lname=:lname")
	List<Users>customSearchUser(@Param("lname") String lname, @Param("email")String email);
}
