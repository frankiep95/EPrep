package com.prep.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.model.Joysticks;


@Repository
public interface JoysticksRepository extends JpaRepository<Joysticks,Long>{
	Optional<Joysticks>findByJoystickName(String joystickName);

}
