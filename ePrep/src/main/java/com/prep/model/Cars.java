package com.prep.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cars")
public class Cars {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
}
