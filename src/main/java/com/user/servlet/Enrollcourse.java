package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.*;
import com.db.DBConnect;
import com.entity.Course;


@WebServlet("/Enrolrlcourse")
public class Enrollcourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
		CourseDao d=new CourseDao(DBConnect.getConn());
		HttpSession session = request.getSession();
		String k=request.getParameter("C_id");
		int kk=Integer.parseInt(k);
		d.EnrollArray(kk);
		System.out.print(kk);
		
		//response.sendRedirect("all_courses.jsp");
		if (d.InsCourse(kk)) {
			session.setAttribute("succMsg", "Course Added Sucessfully..");
			response.sendRedirect("all_courses.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			response.sendRedirect("all_courses.jsp");
		}
		
	  }catch(Exception e){
		 e.printStackTrace();
		}
	
	
}
}
