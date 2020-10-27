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
@Table(name = "heads")
@SecondaryTable(name="equipment")
public class Heads {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(updatable = false, nullable = false)
	private Long id;

	@Column(table="equipment")
	private String equipType = "head";
	
	
	

	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name="equipment_status",joinColumns=
	@JoinColumn(name="equipment_id"),
	inverseJoinColumns= @JoinColumn(name="status_id"))
	private Set<Status> status= new HashSet<Status>();
	
	private String headname;
	
	private Boolean driftstopper;
	private Long hoursworked;
	private Long jobsuccess;
	private Long jobincidents;
	private Long jobfails;
	private Long weightcap;
	private Long volumecap;
	private Long numofpanmotors;
	private Long numofdutchmotors;
	private Long numoftiltmotors;
	private Long numofpanamp;
	private Long numofdutchamp;
	private Long numoftiltamp;
	private String pangearbox;
	private String dutchgearbox;
	private String tiltgearbox;
	private String controlboardversion;
	private Long inputvoltage;
	private Boolean pancounter;
	private String pancountertype;
	private String panencoder;
	private String tiltencoder;
	private String dimensions; //picture
	
	@Column(table =" equipment")
	private String equipName = this.getHeadname();
	
	@OneToOne(mappedBy = "head", cascade = CascadeType.ALL)
	private Joysticks joystick;
	
	@OneToOne(mappedBy = "head", cascade = CascadeType.ALL)
	private GVs gv;

	public Long getId() {
		return id;
	}

	public String getEquipName() {
		return equipName;
	}

	public void setEquipName(String equipName) {
		this.equipName = equipName;
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

	public String getHeadname() {
		return headname;
	}

	public void setHeadname(String headname) {
		this.headname = headname;
	}

	public Boolean getDriftstopper() {
		return driftstopper;
	}

	public void setDriftstopper(Boolean driftstopper) {
		this.driftstopper = driftstopper;
	}

	public Long getHoursworked() {
		return hoursworked;
	}

	public void setHoursworked(Long hoursworked) {
		this.hoursworked = hoursworked;
	}

	public Long getJobsuccess() {
		return jobsuccess;
	}

	public void setJobsuccess(Long jobsuccess) {
		this.jobsuccess = jobsuccess;
	}

	public Long getJobincidents() {
		return jobincidents;
	}

	public void setJobincidents(Long jobincidents) {
		this.jobincidents = jobincidents;
	}

	public Long getJobfails() {
		return jobfails;
	}

	public void setJobfails(Long jobfails) {
		this.jobfails = jobfails;
	}

	public Long getWeightcap() {
		return weightcap;
	}

	public void setWeightcap(Long weightcap) {
		this.weightcap = weightcap;
	}

	public Long getVolumecap() {
		return volumecap;
	}

	public void setVolumecap(Long volumecap) {
		this.volumecap = volumecap;
	}

	public Long getNumofpanmotors() {
		return numofpanmotors;
	}

	public void setNumofpanmotors(Long numofpanmotors) {
		this.numofpanmotors = numofpanmotors;
	}

	public Long getNumofdutchmotors() {
		return numofdutchmotors;
	}

	public void setNumofdutchmotors(Long numofdutchmotors) {
		this.numofdutchmotors = numofdutchmotors;
	}

	public Long getNumoftiltmotors() {
		return numoftiltmotors;
	}

	public void setNumoftiltmotors(Long numoftiltmotors) {
		this.numoftiltmotors = numoftiltmotors;
	}

	public Long getNumofpanamp() {
		return numofpanamp;
	}

	public void setNumofpanamp(Long numofpanamp) {
		this.numofpanamp = numofpanamp;
	}

	public Long getNumofdutchamp() {
		return numofdutchamp;
	}

	public void setNumofdutchamp(Long numofdutchamp) {
		this.numofdutchamp = numofdutchamp;
	}

	public Long getNumoftiltamp() {
		return numoftiltamp;
	}

	public void setNumoftiltamp(Long numoftiltamp) {
		this.numoftiltamp = numoftiltamp;
	}

	public String getPangearbox() {
		return pangearbox;
	}

	public void setPangearbox(String pangearbox) {
		this.pangearbox = pangearbox;
	}

	public String getDutchgearbox() {
		return dutchgearbox;
	}

	public void setDutchgearbox(String dutchgearbox) {
		this.dutchgearbox = dutchgearbox;
	}

	public String getTiltgearbox() {
		return tiltgearbox;
	}

	public void setTiltgearbox(String tiltgearbox) {
		this.tiltgearbox = tiltgearbox;
	}

	public String getControlboardversion() {
		return controlboardversion;
	}

	public void setControlboardversion(String controlboardversion) {
		this.controlboardversion = controlboardversion;
	}

	public Long getInputvoltage() {
		return inputvoltage;
	}

	public void setInputvoltage(Long inputvoltage) {
		this.inputvoltage = inputvoltage;
	}

	public Boolean getPancounter() {
		return pancounter;
	}

	public void setPancounter(Boolean pancounter) {
		this.pancounter = pancounter;
	}

	public String getPancountertype() {
		return pancountertype;
	}

	public void setPancountertype(String pancountertype) {
		this.pancountertype = pancountertype;
	}

	public String getPanencoder() {
		return panencoder;
	}

	public void setPanencoder(String panencoder) {
		this.panencoder = panencoder;
	}

	public String getTiltencoder() {
		return tiltencoder;
	}

	public void setTiltencoder(String tiltencoder) {
		this.tiltencoder = tiltencoder;
	}

	public String getDimensions() {
		return dimensions;
	}

	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}

	public Joysticks getJoystick() {
		return joystick;
	}

	public void setJoystick(Joysticks joystick) {
		this.joystick = joystick;
	}

	public GVs getGv() {
		return gv;
	}

	public void setGv(GVs gv) {
		this.gv = gv;
	}

	@Override
	public String toString() {
		return "Heads [id=" + id + ", equipType=" + equipType + ", status=" + status + ", headname=" + headname
				+ ", driftstopper=" + driftstopper + ", hoursworked=" + hoursworked + ", jobsuccess=" + jobsuccess
				+ ", jobincidents=" + jobincidents + ", jobfails=" + jobfails + ", weightcap=" + weightcap
				+ ", volumecap=" + volumecap + ", numofpanmotors=" + numofpanmotors + ", numofdutchmotors="
				+ numofdutchmotors + ", numoftiltmotors=" + numoftiltmotors + ", numofpanamp=" + numofpanamp
				+ ", numofdutchamp=" + numofdutchamp + ", numoftiltamp=" + numoftiltamp + ", pangearbox=" + pangearbox
				+ ", dutchgearbox=" + dutchgearbox + ", tiltgearbox=" + tiltgearbox + ", controlboardversion="
				+ controlboardversion + ", inputvoltage=" + inputvoltage + ", pancounter=" + pancounter
				+ ", pancountertype=" + pancountertype + ", panencoder=" + panencoder + ", tiltencoder=" + tiltencoder
				+ ", dimensions=" + dimensions + ", joystick=" + joystick + ", gv=" + gv + ", getId()=" + getId()
				+ ", getEquipType()=" + getEquipType() + ", getStatus()=" + getStatus() + ", getHeadname()="
				+ getHeadname() + ", getDriftstopper()=" + getDriftstopper() + ", getHoursworked()=" + getHoursworked()
				+ ", getJobsuccess()=" + getJobsuccess() + ", getJobincidents()=" + getJobincidents()
				+ ", getJobfails()=" + getJobfails() + ", getWeightcap()=" + getWeightcap() + ", getVolumecap()="
				+ getVolumecap() + ", getNumofpanmotors()=" + getNumofpanmotors() + ", getNumofdutchmotors()="
				+ getNumofdutchmotors() + ", getNumoftiltmotors()=" + getNumoftiltmotors() + ", getNumofpanamp()="
				+ getNumofpanamp() + ", getNumofdutchamp()=" + getNumofdutchamp() + ", getNumoftiltamp()="
				+ getNumoftiltamp() + ", getPangearbox()=" + getPangearbox() + ", getDutchgearbox()="
				+ getDutchgearbox() + ", getTiltgearbox()=" + getTiltgearbox() + ", getControlboardversion()="
				+ getControlboardversion() + ", getInputvoltage()=" + getInputvoltage() + ", getPancounter()="
				+ getPancounter() + ", getPancountertype()=" + getPancountertype() + ", getPanencoder()="
				+ getPanencoder() + ", getTiltencoder()=" + getTiltencoder() + ", getDimensions()=" + getDimensions()
				+ ", getJoystick()=" + getJoystick() + ", getGv()=" + getGv() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}