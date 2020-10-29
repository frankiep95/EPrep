package com.prep.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;




@Entity
@Table(name= "repairOrders")
public class RepairOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "repair_id")
	private Long id;
	
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="work_id")
	private Work work;
	
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="equipment_id")
	private Equipment equipment;
	
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="users_id")
	private Users initiator; //who wrote up issue
	
	private Long role;   //what was their positon on this job
	private String problemDescription; // what is the problem
	private String solutionDescription; // what was the solution
	private Long repairedBy; //who repaired it
	private String repairedDate; //when was it repaired
	private String issueDate; //when was the order written
	private Long hoursWorked; //how many hours to fix
	private Long status; // is it repaired, being worked on, or waiting for parts
	private String partsUsed;
	
	@OneToMany(mappedBy = "stockId", cascade = CascadeType.REMOVE)	
	private List<ImageFiles> ifiles;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Work getWork() {
		return work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}


	public Users getInitiator() {
		return initiator;
	}

	public void setInitiator(Users initiator) {
		this.initiator = initiator;
	}

	public Long getRole() {
		return role;
	}

	public void setRole(Long role) {
		this.role = role;
	}

	public String getProblemDescription() {
		return problemDescription;
	}

	public void setProblemDescription(String problemDescription) {
		this.problemDescription = problemDescription;
	}

	public String getSolutionDescription() {
		return solutionDescription;
	}

	public void setSolutionDescription(String solutionDescription) {
		this.solutionDescription = solutionDescription;
	}

	public Long getRepairedBy() {
		return repairedBy;
	}

	public void setRepairedBy(Long repairedBy) {
		this.repairedBy = repairedBy;
	}

	public String getRepairedDate() {
		return repairedDate;
	}

	public void setRepairedDate(String repairedDate) {
		this.repairedDate = repairedDate;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public Long getHoursWorked() {
		return hoursWorked;
	}

	public void setHoursWorked(Long hoursWorked) {
		this.hoursWorked = hoursWorked;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public String getPartsUsed() {
		return partsUsed;
	}

	public void setPartsUsed(String partsUsed) {
		this.partsUsed = partsUsed;
	}

	public List<ImageFiles> getIfiles() {
		return ifiles;
	}

	public void setIfiles(List<ImageFiles> ifiles) {
		this.ifiles = ifiles;
	}

	@Override
	public String toString() {
		return "RepairOrder [id=" + id + ", work=" + work + ", equipment=" + equipment + ", initiator=" + initiator
				+ ", role=" + role + ", problemDescription=" + problemDescription + ", solutionDescription="
				+ solutionDescription + ", repairedBy=" + repairedBy + ", repairedDate=" + repairedDate + ", issueDate="
				+ issueDate + ", hoursWorked=" + hoursWorked + ", status=" + status + ", partsUsed=" + partsUsed
				+ ", ifiles=" + ifiles + "]";
	}


	

	
	
}
