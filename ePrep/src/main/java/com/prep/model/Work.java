package com.prep.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Id;








@Entity
@Table(name = "work")
public class Work {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "work_id")
	private Long Id;
	private Date startdate;
	private Date enddate;
	private String jobname;
	private String productioncompany;

	private String calltime;
	private String wraptime;
	private String hoursworked;
	@OneToMany(mappedBy="work", cascade=CascadeType.ALL)
	private List<RepairOrder> repairOrder;
	private String jobDescription; // description of what the job is
	private String jobNotes; //section to add notes
	private Long packageDriver;
	private Long precisionDriver;
	private Long craneOperator;
	private Long technician;
	
	
	
	
	
	
	public Work() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Work(Long id, Date startdate, Date enddate, String jobname, String productioncompany, String calltime,
			String wraptime, String hoursworked, List<RepairOrder> repairOrder, String jobDescription, String jobNotes,
			Long packageDriver, Long precisionDriver, Long craneOperator, Long technician) {
		super();
		Id = id;
		this.startdate = startdate;
		this.enddate = enddate;
		this.jobname = jobname;
		this.productioncompany = productioncompany;
		this.calltime = calltime;
		this.wraptime = wraptime;
		this.hoursworked = hoursworked;
		this.repairOrder = repairOrder;
		this.jobDescription = jobDescription;
		this.jobNotes = jobNotes;
		this.packageDriver = packageDriver;
		this.precisionDriver = precisionDriver;
		this.craneOperator = craneOperator;
		this.technician = technician;
	}
	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getProductioncompany() {
		return productioncompany;
	}
	public void setProductioncompany(String productioncompany) {
		this.productioncompany = productioncompany;
	}
	public String getCalltime() {
		return calltime;
	}
	public void setCalltime(String calltime) {
		this.calltime = calltime;
	}
	public String getWraptime() {
		return wraptime;
	}
	public void setWraptime(String wraptime) {
		this.wraptime = wraptime;
	}
	public String getHoursworked() {
		return hoursworked;
	}
	public void setHoursworked(String hoursworked) {
		this.hoursworked = hoursworked;
	}
	public List<RepairOrder> getRepairOrder() {
		return repairOrder;
	}
	public void setRepairOrder(List<RepairOrder> repairOrder) {
		this.repairOrder = repairOrder;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public String getJobNotes() {
		return jobNotes;
	}
	public void setJobNotes(String jobNotes) {
		this.jobNotes = jobNotes;
	}
	public Long getPackageDriver() {
		return packageDriver;
	}
	public void setPackageDriver(Long packageDriver) {
		this.packageDriver = packageDriver;
	}
	public Long getPrecisionDriver() {
		return precisionDriver;
	}
	public void setPrecisionDriver(Long precisionDriver) {
		this.precisionDriver = precisionDriver;
	}
	public Long getCraneOperator() {
		return craneOperator;
	}
	public void setCraneOperator(Long craneOperator) {
		this.craneOperator = craneOperator;
	}
	public Long getTechnician() {
		return technician;
	}
	public void setTechnician(Long technician) {
		this.technician = technician;
	}
	@Override
	public String toString() {
		return "Work [Id=" + Id + ", startdate=" + startdate + ", enddate=" + enddate + ", jobname=" + jobname
				+ ", productioncompany=" + productioncompany + ", calltime=" + calltime + ", wraptime=" + wraptime
				+ ", hoursworked=" + hoursworked + ", repairOrder=" + repairOrder + ", jobDescription=" + jobDescription
				+ ", jobNotes=" + jobNotes + ", packageDriver=" + packageDriver + ", precisionDriver=" + precisionDriver
				+ ", craneOperator=" + craneOperator + ", technician=" + technician + "]";
	}
	
	
	
	

	
	
}
