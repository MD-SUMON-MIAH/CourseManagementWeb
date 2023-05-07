package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CourseDao;
import com.db.DBConnect;
import com.entity.Course;

@WebServlet("/updateCourse")
public class UpdateCourse extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String courseName = req.getParameter("coursename");
			String teacherName = req.getParameter("teachername");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");

			int id = Integer.parseInt(req.getParameter("id"));

			Course c = new Course(id,courseName, teacherName, spec, email, mobno);

			CourseDao dao = new CourseDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.updateCourse(c)) {
				session.setAttribute("succMsg", "Course Update Sucessfully..");
				resp.sendRedirect("admin/course.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("admin/course.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
