package com.student;

public class Application {

	public static void main(String[] args) {
		
		Student s = new Student();
		s.setAge(12);
		s.setFirstName("Frankie");
		s.setLastName("Pereira");
		s.setEmail("fper@hotmail.com");
		s.setGpa(2.1);
		
		s.saveToFile();
	}
}
