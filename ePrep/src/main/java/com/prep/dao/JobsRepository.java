package com.prep.dao;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Jobs;

@Repository
public interface JobsRepository extends JpaRepository<Jobs,Long> {
	Jobs findByJob(String job);
}
