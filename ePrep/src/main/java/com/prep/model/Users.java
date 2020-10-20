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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="users")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "users_id")
	private Long id;
	private String fname;
	private String lname;

	private String image;
	
	private String email;
	private String username;
	private String role;
	private String password;
	@Transient
	private String password2;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private Set<PhoneBook> PhoneBook;
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Addressess address;

	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name="user_work",joinColumns=
	@JoinColumn(name="user_id"),
	inverseJoinColumns= @JoinColumn(name="work_id"))
	private Set<Work> work=new HashSet<Work>();

	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name="user_role",joinColumns=
	@JoinColumn(name="user_id"),
	inverseJoinColumns= @JoinColumn(name="role_id"))
	private Set<Role> roles=new HashSet<Role>();
	
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name="user_job",joinColumns=
	@JoinColumn(name="user_id"),
	inverseJoinColumns= @JoinColumn(name="job_id"))
	private Set<Jobs> job=new HashSet<Jobs>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public Addressess getAddress() {
		return address;
	}

	public void setAddress(Addressess address) {
		this.address = address;
	}

	public Set<Work> getWork() {
		return work;
	}

	public void setWork(Set<Work> work) {
		this.work = work;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Jobs> getJob() {
		return job;
	}

	public void setJob(Set<Jobs> job) {
		this.job = job;
	}

	
	
	public Set<PhoneBook> getPhoneBook() {
		return PhoneBook;
	}

	public void setPhoneBook(Set<PhoneBook> phoneBook) {
		PhoneBook = phoneBook;
	}

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", fname=" + fname + ", lname=" + lname + ", image=" + image + ", email=" + email
				+ ", username=" + username + ", role=" + role + ", password=" + password + ", password2=" + password2
				+ ", PhoneBook=" + PhoneBook + ", address=" + address + ", work=" + work + ", roles=" + roles + ", job="
				+ job + "]";
	}



	
}
