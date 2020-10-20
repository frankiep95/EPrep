package com.prep.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "accessories")
public class Accessories {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
}
