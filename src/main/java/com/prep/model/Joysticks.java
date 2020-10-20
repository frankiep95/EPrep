package com.prep.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "joystick")
@SecondaryTable(name="equipment")
public class Joysticks {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(table = "equipment")
	private String equipType = "joystick";
	
	@JsonIgnore
	@OneToOne
	@MapsId
	private Heads head;
	
	private String joystickName;
	
	private Long hoursWorked;
	private Boolean lagInstalledPan;
	private Boolean lagInstalledTilt;
	private Boolean fastLevelSwitch;
	private Boolean panCounter;
	private String panCounterType;
	private String wheelsScale;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Heads getHead() {
		return head;
	}
	public void setHead(Heads head) {
		this.head = head;
	}
	public String getJoystickName() {
		return joystickName;
	}
	public void setJoystickName(String joystickName) {
		this.joystickName = joystickName;
	}
	public Long getHoursWorked() {
		return hoursWorked;
	}
	public void setHoursWorked(Long hoursWorked) {
		this.hoursWorked = hoursWorked;
	}
	public Boolean getLagInstalledPan() {
		return lagInstalledPan;
	}
	public void setLagInstalledPan(Boolean lagInstalledPan) {
		this.lagInstalledPan = lagInstalledPan;
	}
	public Boolean getLagInstalledTilt() {
		return lagInstalledTilt;
	}
	public void setLagInstalledTilt(Boolean lagInstalledTilt) {
		this.lagInstalledTilt = lagInstalledTilt;
	}
	public Boolean getFastLevelSwitch() {
		return fastLevelSwitch;
	}
	public void setFastLevelSwitch(Boolean fastLevelSwitch) {
		this.fastLevelSwitch = fastLevelSwitch;
	}
	public Boolean getPanCounter() {
		return panCounter;
	}
	public void setPanCounter(Boolean panCounter) {
		this.panCounter = panCounter;
	}
	public String getPanCounterType() {
		return panCounterType;
	}
	public void setPanCounterType(String panCounterType) {
		this.panCounterType = panCounterType;
	}
	public String getWheelsScale() {
		return wheelsScale;
	}
	public void setWheelsScale(String wheelsScale) {
		this.wheelsScale = wheelsScale;
	}
	public String getEquipType() {
		return equipType;
	}
	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}
	@Override
	public String toString() {
		return "Joysticks [id=" + id + ", equipType=" + equipType + ", head=" + head + ", joystickName=" + joystickName
				+ ", hoursWorked=" + hoursWorked + ", lagInstalledPan=" + lagInstalledPan + ", lagInstalledTilt="
				+ lagInstalledTilt + ", fastLevelSwitch=" + fastLevelSwitch + ", panCounter=" + panCounter
				+ ", panCounterType=" + panCounterType + ", wheelsScale=" + wheelsScale + "]";
	}

	

	
}
