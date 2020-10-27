package com.prep.model;

import javax.persistence.*;


@Entity
@Table(name="roles")
public class Roles {
	
	public Roles() {
		super();
	}
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "role_id")
    private Long id;
    @Column(name = "roles")
    private String roles;
    
    
    
    
	public Roles(Long id, String roles) {
		super();
		this.id = id;
		this.roles = roles;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRoles() {
		return roles;
	}
	public void setRole(String roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "Roles [id=" + id + ", roles=" + roles + "]";
	}
    
    
}
