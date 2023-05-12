
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Course;
import com.entity.Doctor;


public class CourseDao {
	private Connection conn;

	public CourseDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerCourse(Course c) {
		boolean f = false;

		try {
			String sql = "insert into course(coursename,teachername,specialist,email,mobno,coursecode) values(?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getCourseName());
			ps.setString(2, c.getTeacherName());
			ps.setString(3, c.getSpecialist());
			ps.setString(4, c.getEmail());
			ps.setString(5, c.getMobNo());
			ps.setString(6, c.getCourseCode());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public List<Course> getAllCourse() {
		List<Course> list = new ArrayList<Course>();
		Course c = null;
		try {

			String sql = "select * from course";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Course();
				c.setId(rs.getInt(1));
				c.setCourseName(rs.getString(2));
				c.setTeacherName(rs.getString(3));
				c.setSpecialist(rs.getString(4));
				c.setEmail(rs.getString(5));
				c.setMobNo(rs.getString(6));
				c.setCourseCode(rs.getString(7));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Course getCourseById(int id) {

		Course c = null;
		try {

			String sql = "select * from course where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Course();
				c.setId(rs.getInt(1));
				c.setCourseName(rs.getString(2));
				c.setTeacherName(rs.getString(3));
				c.setSpecialist(rs.getString(4));
				c.setEmail(rs.getString(5));
				c.setMobNo(rs.getString(6));
				c.setCourseCode(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	public boolean updateCourse(Course c) {
		boolean f = false;

		try {
			String sql = "update course set coursename=?,teachername=?,specialist=?,email=?,mobno=?,coursecode=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getCourseName());
			System.out.println(c.getCourseName());
			ps.setString(2, c.getTeacherName());
			ps.setString(3, c.getSpecialist());
			ps.setString(4, c.getEmail());
			ps.setString(5, c.getMobNo());
			ps.setString(6, c.getCourseCode());
			ps.setInt(7, c.getId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	public boolean deleteCourse(int id) {
		boolean f = false;
		try {
			String sql = "delete from course where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	public int countCourse() {
		int i = 0;
		try {
			String sql = "select * from course";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countUser() {
		int i = 0;
		try {
			String sql = "select * from user_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	
	public List<Integer> getAllC_id(int k) {
		List<Integer> list = new ArrayList<Integer>();
		
		try {

			String sql = "select * from c_idTable where s_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, k);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
			
				list.add(rs.getInt(2));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	public boolean InsCourse(int c,int c2) {
		boolean f = false;

		try {
			String sql = "insert into c_idTable(c_id,s_id) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, c);
			ps.setLong(2, c2);
		

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
public List<Integer> EnrollList = new ArrayList<Integer>();
	
	public void ss() {
		EnrollList.add(1);
		EnrollList.add(2);
		EnrollList.add(12);
		}
	
    public void EnrollArray(int i)
    {
    	EnrollList.add(i);
    }
    public List<Integer> SList(){
    	try {
    		int i=11;
    		i++;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return EnrollList;
    }
	
    public List<Course> TeacherCourse(String s) { 
    	List<Course> CList=new ArrayList<Course>(); 
    	Course c; 
    	try { 
    		String sql = "select * from course where teachername=?"; 
    		PreparedStatement ps = conn.prepareStatement(sql);
    		ps.setString(1, s); 
    		ResultSet rs = ps.executeQuery(); 
    		while (rs.next()) { 
    			c = new Course();
    			c.setId(rs.getInt(1)); 
    			c.setCourseName(rs.getString(2)); 
    			c.setTeacherName(rs.getString(3)); 
    			c.setSpecialist(rs.getString(4)); 
    			c.setEmail(rs.getString(5)); 
    			c.setMobNo(rs.getString(6));
    			c.setCourseCode(rs.getString(7));
    			CList.add(c); 
    			}
    		} catch (Exception e) {
    			e.printStackTrace();
    			} 
    	return CList; 
    	}
    
   public List<Integer>CourseEnrolledStdIDs(int cid){
	   List<Integer> l=new ArrayList<Integer>();
	   try {
	   String sql = "select * from c_idTable where c_id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setLong(1, cid);
		ResultSet rs = ps.executeQuery(); 
		while (rs.next()) { 
		
			l.add(rs.getInt(3));
			}
		}catch(Exception e) {
			e.printStackTrace();
			} 
	   return l;
   }
    
	
}