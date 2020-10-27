package com.prep.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="equipment")
public class Equipment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;


	
	@OneToMany(mappedBy="equipment", cascade=CascadeType.ALL)
	private List<RepairOrder> repairOrder;

	@Column(name="equipType")
	private String equipType;

	@Column(name="equipName")
	private String equipName;
	
	
	
	public String getEquipName() {
		return equipName;
	}

	public void setEquipName(String equipName) {
		this.equipName = equipName;
	}

	public String getEquipType() {
		return equipType;
	}

	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<RepairOrder> getRepairOrder() {
		return repairOrder;
	}

	public void setRepairOrder(List<RepairOrder> repairOrder) {
		this.repairOrder = repairOrder;
	}

	@Override
	public String toString() {
		return "Equipment [id=" + id + ", repairOrder=" + repairOrder + "]";
	}
	
	
	

}
