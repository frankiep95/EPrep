package com.example.eprep.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.eprep.model.Users;

public interface UserRepository extends JpaRepository<Users, Long> {
	
	String search="SELECT u FROM Users u WHERE u.email=:email AND "+" u.fname LIKE (CONCAT('%',:name,'%')) OR u.lname=:name";
	
	Optional<Users> findByEmail(String email);

	@Query("FROM Users WHERE email=?1 OR fname=?1 OR lname=?1")
	List<Users>searchUser(String keyword);

	
    @Query("SELECT u FROM Users u WHERE u.email=:email AND u.lname=:lname")
	List<Users>customSearchUser(@Param("lname") String lname, @Param("email")String email);
    
    @Query("SELECT u FROM Users u WHERE u.email=:email AND u.password=:password")
    Optional<Users>login(@Param("email") String email,@Param("password") String password);
}
