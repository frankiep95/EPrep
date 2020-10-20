package com.example.eprep.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "accounts")
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String fname;
	private String lname;
	private String password;
	@Transient
	private String password2;
	private String email;
	private String role;
	private String image;
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Addressess address;

	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private List<PaymentMethod> paymentMethod;

	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name="user_role",joinColumns=
	@JoinColumn(name="user_id"),
	inverseJoinColumns= @JoinColumn(name="role_id"))
	private Set<Role> roles=new HashSet<Role>();
	
	@OneToMany(mappedBy="users_id",cascade=CascadeType.ALL)
	private List<Products>products;

	@Column(name="stockId")
	private Long stockId;


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



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public Addressess getAddress() {
		return address;
	}



	public void setAddress(Addressess address) {
		this.address = address;
	}



	public List<PaymentMethod> getPaymentMethod() {
		return paymentMethod;
	}



	public void setPaymentMethod(List<PaymentMethod> paymentMethod) {
		this.paymentMethod = paymentMethod;
	}



	public Set<Role> getRoles() {
		return roles;
	}



	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}



	public List<Products> getProducts() {
		return products;
	}



	public void setProducts(List<Products> products) {
		this.products = products;
	}



	public Long getStockId() {
		return stockId;
	}



	public void setStockId(Long stockId) {
		this.stockId = stockId;
	}



	@Override
	public String toString() {
		return "Users [id=" + id + ", fname=" + fname + ", lname=" + lname + ", password=" + password + ", email="
				+ email + ", role=" + role + ", image=" + image + ", address=" + address + ", paymentMethod="
				+ paymentMethod + "]";
	}




}
