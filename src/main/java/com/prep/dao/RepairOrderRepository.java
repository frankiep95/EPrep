package com.prep.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.RepairOrder;


@Repository
public interface RepairOrderRepository extends JpaRepository<RepairOrder, Long> {

}
