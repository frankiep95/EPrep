package com.prep.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Trailers;

@Repository
public interface TrailerRepository extends JpaRepository<Trailers,Long> {
	Optional<Trailers>findByTrailerName(String trailerName);
}
