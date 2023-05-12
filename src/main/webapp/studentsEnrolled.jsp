<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.UserDao" %>
<%@page import="com.entity.User" %>
<%@page import="java.util.List"%>
<%@page import="com.dao.CourseDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students Page</title>
<link rel="icon" href="../img/logo2.png" sizes="32x32" type="image/png">
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcdn.jsp"%>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	

	<nav class="navbar navbar-expand-lg navbar-dark bg-info">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><img src="img/img12.png" alt="" height="50" width="200"><!-- <i class="fa-solid fa-graduation-cap"></i>  LEARN HUB --> </a>
		<img src="img/sustlogo.png" class="d-block w-30" height=50px>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="user_courses.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="user_courses.jsp">COURSES</a></li>
			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fas fa-user-circle"></i> ${doctObj.fullName }
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
						<li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>

</head>
<body>
        <div class="container mt-4">
        <div class="row">
        <div class="col-md-12">
		       <div class="card paint-card">
		         <div class="card-body">
		           <p class="fs-3 text-center"> Students Details </p>
		             <table class="table table-centered">
		               <thead>
		                 <tr> 
					          <th scope="col">Full Name</th>
					          <th scope="col">Email</th>
					          <th scope="col">Mob No</th>

		                </tr>
		              </thead>
		          
		              <tbody>
		                 <% 
		                 UserDao dao2=new UserDao(DBConnect.getConn());
		                 List<User> list2=dao2.getAllUser();
		                 list2.clear();
		                 String ss=request.getParameter("cId");
		                 System.out.println(ss);
		                 int kint=Integer.parseInt(ss);
		                 CourseDao dow=new CourseDao(DBConnect.getConn());
		                 List<Integer> skk=dow.CourseEnrolledStdIDs(kint);
		                 if(!skk.isEmpty())
		                 {
		                	 System.out.println("CourseArray Not empty");
		                 }
		                 else System.out.println("Array is empty");
		                 for(Integer i: skk){
				               System.out.print(i);
				               User cc=dao2.getUserById(i);
				               list2.add(cc);
				                }
				              
		                 for(User d:list2)
		                 {%>
		                 <tr>
		                   <td><%=d.getFullName() %></td>
		                   <td><%=d.getEmail() %></td>
		                   <td><%=d.getMobNo() %></td>
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