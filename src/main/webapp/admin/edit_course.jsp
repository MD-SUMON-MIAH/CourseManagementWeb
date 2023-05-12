<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="com.entity.Course"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Course Page</title>
<link rel="icon" href="../img/logo2.png" sizes="32x32" type="image/png">
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

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Course Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						CourseDao dao2 = new CourseDao(DBConnect.getConn());
						Course c = dao2.getCourseById(id);
						%>


						<form action="../updateCourse" method="post">
							<div class="mb-3">
								<label class="form-label">Course Name</label> <input type="text"
									required name="coursename" class="form-control"
									value="<%=c.getCourseName()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Teacher Name</label> <input type="text"
									value="<%=c.getTeacherName()%>" required name="teachername"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option><%=c.getSpecialist()%></option>

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
									value="<%=c.getEmail()%>" required name="email"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									value="<%=c.getMobNo()%>" required name="mobno"
									class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Course Code</label> <input type="text"
									value="<%=c.getCourseCode()%>" required name="coursecode"
									class="form-control">
							</div>

							<input type="hidden" name="id" value="<%=c.getId()%>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>




		</div>
	</div>
</body>
</html>