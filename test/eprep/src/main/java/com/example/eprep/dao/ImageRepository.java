package com.example.eprep.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.eprep.model.ImageFiles;

public interface ImageRepository extends JpaRepository<ImageFiles,Long>{

}
