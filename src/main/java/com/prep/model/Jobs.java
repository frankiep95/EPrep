package com.prep.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="jobs")
public class Jobs {

	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "job_id")
    private Long id;
    @Column(name = "job")
    private String job;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "Jobs [id=" + id + ", job=" + job + "]";
	}
    
    
    

}
