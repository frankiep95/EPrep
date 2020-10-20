package com.prep.dao;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Status;

@Repository
public interface StatusRepository extends JpaRepository<Status, Long>{

}
