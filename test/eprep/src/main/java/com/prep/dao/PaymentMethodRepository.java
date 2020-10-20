package com.prep.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prep.model.PaymentMethod;



public interface PaymentMethodRepository extends JpaRepository<PaymentMethod,Long> {

}
