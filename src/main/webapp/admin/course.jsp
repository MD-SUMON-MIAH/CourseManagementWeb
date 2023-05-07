<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="com.entity.Specialist"%> 
<%@page import="java.util.List"%>
<%@page import="com.entity.Course"%> 
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses Page</title>
<%@include file="../component/allcdn.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Courses</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="../addCourse" method="post">
							<div class="mb-3">
								<label class="form-label">Course Name</label> <input type="text"
									required name="coursename" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Teacher Name</label> <input required
									name="teachername" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>--select--</option>

									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
          
		    <div class="col-md-8">
		       <div class="card paint-card">
		         <div class="card-body">
		           <p class="fs-3 text-center"> Course Details </p>
		             <table class="table">
		               <thead>
		                 <tr> 
					          <th scope="col">Course Name</th>
					          <th scope="col">Teacher Name</th>
					          <th scope="col">Specialist</th>
					          <th scope="col">Email</th>
					          <th scope="col">Mob No</th>
					          <th scope="col">Action</th>
		                </tr>
		              </thead>
		          
		              <tbody>
		                 <% 
		                 CourseDao dao2= new CourseDao(DBConnect.getConn());
		                 List<Course> list2= dao2.getAllCourse();
		                 for(Course c:list2)
		                 {%>
		                 <tr>
		                   <td><%=c.getCourseName() %></td>
		                   <td><%=c.getTeacherName() %></td>
		                   <td><%=c.getSpecialist() %></td>
		                   <td><%=c.getEmail() %></td>
		                   <td><%=c.getMobNo() %></td>
		                   <td>
		                   <a href="edit_course.jsp?id=<%=c.getId()%>" class="btn btn-sm btn-primary">Edit</a>
		                   <a href="../deleteCourse?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Delete</a>
		                   </td>
		                 </tr>
		                 <%}
		                 %>
		          
		             </tbody>
		          
		          </table>
		          </div>
		          </div>
		          
		      </div>

			
		</div>
	</div>
</body>
</html>