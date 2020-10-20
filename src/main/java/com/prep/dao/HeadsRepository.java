package com.prep.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Heads;

@Repository
public interface HeadsRepository extends JpaRepository<Heads,Long>{
	Optional<Heads>findByHeadname(String headname);
}
