package com.prep.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Work;


@Repository
public interface WorkRepository extends JpaRepository<Work,Long> {

}
