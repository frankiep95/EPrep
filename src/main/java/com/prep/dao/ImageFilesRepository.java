package com.prep.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.ImageFiles;

@Repository
public interface ImageFilesRepository extends JpaRepository<ImageFiles,Long> {

}
