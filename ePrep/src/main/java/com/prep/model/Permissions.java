package com.prep.model;

import javax.persistence.*;

@Entity
@Table(name = "permissions")
public class Permissions {
	
	 
    public Permissions() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "permission_id")
    private long id;
    @Column(name = "permissions")
    private String permissions;   

	public Permissions(long id, String permissions) {
		super();
		this.id = id;
		this.permissions = permissions;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPermissions() {
		return permissions;
	}

	public void setRole(String permissions) {
		this.permissions = permissions;
	}

	@Override
	public String toString() {
		return "Permissions [id=" + id + ", permissions=" + permissions + "]";
	}







}
