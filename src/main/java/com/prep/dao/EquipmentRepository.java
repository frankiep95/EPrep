package com.prep.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Equipment;

@Repository
public interface EquipmentRepository  extends JpaRepository<Equipment, Long>{

}
