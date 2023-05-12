package com.entity;

public class Course {

	private int id;
	private String courseName;
	private String teacherName;
	private String specialist;
	private String email;
	private String mobNo;
	private String courseCode;

	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Course(String courseName, String teacherName, String specialist, String email, String mobNo, String courseCode) {
		super();
		this.courseName = courseName;
		this.teacherName = teacherName;
		this.specialist = specialist;
		this.email = email;
		this.mobNo = mobNo;
		this.courseCode=courseCode;
	}

	public Course(int id, String courseName, String teacherName,String specialist, String email,String mobNo, String courseCode) {
		super();
		this.id = id;
		this.courseName = courseName;
		this.teacherName = teacherName;
		this.specialist = specialist;
		this.email = email;
		this.mobNo = mobNo;
		this.courseCode=courseCode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}


	public String getSpecialist() {
		return specialist;
	}

	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	
	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

}

