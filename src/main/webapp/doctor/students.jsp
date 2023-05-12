<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.UserDao" %>
<%@page import="com.entity.User" %>
<%@page import="java.util.List"%>
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
	<%@include file="navbar.jsp"%>

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