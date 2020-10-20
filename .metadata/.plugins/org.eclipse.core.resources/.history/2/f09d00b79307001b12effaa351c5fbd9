package com.example.eprep.dao;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.eprep.model.Addressess;




@Repository
public interface AddressRepository extends JpaRepository<Addressess, Long> {
	Optional<Addressess> findByEmail(String email);
}
