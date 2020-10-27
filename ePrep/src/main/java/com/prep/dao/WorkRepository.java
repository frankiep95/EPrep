package com.prep.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.prep.model.Work;


@Repository
public interface WorkRepository extends JpaRepository<Work,Long> {
	

	
Optional<Work> findByJobname(String jobname);

}
