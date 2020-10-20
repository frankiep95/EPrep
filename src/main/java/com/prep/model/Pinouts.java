package com.prep.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="pinouts")
public class Pinouts {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "pinout_id")
	private Long id;
	
	@JsonIgnore
	@OneToOne
	@MapsId
	private Heads head;
	
	private String joystickpinout;
	private String Wheelspinout;
	private String gyroinput;
	private String power;
	private String gv;
	private String motor;
	private String signals;
	
	
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
	public String getSignals() {
		return signals;
	}
	public void setSignals(String signals) {
		this.signals = signals;
	}
	public String getJoystickpinout() {
		return joystickpinout;
	}
	public void setJoystickpinout(String joystickpinout) {
		this.joystickpinout = joystickpinout;
	}
	public String getWheelspinout() {
		return Wheelspinout;
	}
	public void setWheelspinout(String wheelspinout) {
		Wheelspinout = wheelspinout;
	}
	public String getGyroinput() {
		return gyroinput;
	}
	public void setGyroinput(String gyroinput) {
		this.gyroinput = gyroinput;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getGv() {
		return gv;
	}
	public void setGv(String gv) {
		this.gv = gv;
	}
	public String getMotor() {
		return motor;
	}
	public void setMotor(String motor) {
		this.motor = motor;
	}
	public String getSignal() {
		return signals;
	}
	public void setSignal(String signals) {
		this.signals = signals;
	}
	@Override
	public String toString() {
		return "Pinouts [id=" + id + ", joystickpinout=" + joystickpinout + ", Wheelspinout=" + Wheelspinout
				+ ", gyroinput=" + gyroinput + ", power=" + power + ", gv=" + gv + ", motor=" + motor + ", signal="
				+ signals + "]";
	}
	
	
	
	
}
