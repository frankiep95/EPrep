package com.prep.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Pinouts;


@Repository
public interface PinoutRepository extends JpaRepository<Pinouts, Long>{
	


}
