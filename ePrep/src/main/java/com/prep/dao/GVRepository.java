package com.prep.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.GVs;


@Repository
public interface GVRepository extends JpaRepository<GVs,Long>{

}
