package com.prep.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

@Entity
@Table(name = "trailers")
@SecondaryTable(name="equipment")
public class Trailers {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(updatable= false, nullable = false)
	private Long id;
	
	@Column(table = "equipment")
	private String equipType = "trailer";

	
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name="equipment_status",joinColumns=
	@JoinColumn(name="equipment_id"),
	inverseJoinColumns= @JoinColumn(name="status_id"))
	private Set<Status> status = new HashSet<Status>();
	
	private String trailerName;
	private String lastService;
	private Long miles;
	private String plateNumber;
	
	@Column(table = "equipment")
	private String equipName = trailerName;
	
	@OneToOne(mappedBy = "trailer", cascade = CascadeType.ALL)
	private Generator generator;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEquipType() {
		return equipType;
	}

	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}

	public Set<Status> getStatus() {
		return status;
	}

	public void setStatus(Set<Status> status) {
		this.status = status;
	}

	public String getTrailerName() {
		return trailerName;
	}

	public void setTrailerName(String trailerName) {
		this.trailerName = trailerName;
	}

	public String getLastService() {
		return lastService;
	}

	public String getEquipName() {
		return equipName;
	}

	public void setEquipName(String equipName) {
		this.equipName = equipName;
	}

	public void setLastService(String lastService) {
		this.lastService = lastService;
	}

	public Long getMiles() {
		return miles;
	}

	public void setMiles(Long miles) {
		this.miles = miles;
	}

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public Generator getGenerator() {
		return generator;
	}

	public void setGenerator(Generator generator) {
		this.generator = generator;
	}

	@Override
	public String toString() {
		return "Trailers [id=" + id + ", equipType=" + equipType + ", status=" + status + ", trailerName=" + trailerName
				+ ", lastService=" + lastService + ", miles=" + miles + ", plateNumber=" + plateNumber + ", generator="
				+ generator + "]";
	}
	
	

}
