package com.student;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;


public class Student {

	private static  String path = ".";
	private String firstName;
	private String lastName;
	private String email;
	private int age;
	private double gpa;
	private String address;
	
	public void saveToFile() {
		String fileName = path + email + ".txt";
		try {
		BufferedWriter bw = new BufferedWriter(new FileWriter(fileName));
		bw.write(formatData());
		bw.close();
		
		}catch(IOException e) {
			System.out.println("Error saving to new file");
		}
	}
	

	
	public String formatData() {
		return firstName+ ","+lastName+","+email+","+age+","+gpa;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getGpa() {
		return gpa;
	}
	public void setGpa(double gpa) {
		this.gpa = gpa;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public static String getPath() {
		return path;
	}
	
	
}
