package com.prep.dao;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Addressess;


@Repository
public interface AddressRepository extends JpaRepository<Addressess,Long> {
	Optional<Addressess> findByEmail(String email);
}
