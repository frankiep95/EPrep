package com.course;


public class Course {
	
	private String courseName;
	private String professor;
	private WeekDay[] occurences;
	private int time;
	private int room;
	private String startDate;
	
	
	
	public Course() {
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public WeekDay[] getOccurences() {
		return occurences;
	}
	public void setOccurences(WeekDay[] occurences) {
		this.occurences = occurences;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	
}
