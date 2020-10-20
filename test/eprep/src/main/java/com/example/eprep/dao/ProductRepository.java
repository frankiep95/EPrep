package com.example.eprep.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.eprep.model.Products;

public interface ProductRepository extends JpaRepository<Products,Long> {

}
