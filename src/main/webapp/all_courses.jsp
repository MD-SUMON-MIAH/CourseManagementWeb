<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="com.entity.Specialist"%> 
<%@page import="java.util.List"%>
<%@page import="com.entity.Course"%> 
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Course</title>
<link rel="icon" href="img/logo2.png" sizes="32x32" type="image/png">
<%@include file="../component/allcdn.jsp"%>
<style type="text/css">
.card {
        transition: transform 0.2s;
      }
      .card:hover {
        transform: scale(1.05);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      }

</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<p class="text-center card-header  fs-3">All courses</p>
	</div>

	<div class="container">
 
		<div class="row">
		 <% 
		                 CourseDao dao2= new CourseDao(DBConnect.getConn());
		                 List<Course> list2= dao2.getAllCourse();
		                 List<Integer> listk=dao2.SList();
		                 
		                 for(Course c:list2)
		                 {%>
			<div class="col-md-3 p-3">

				<div class="card" style="width: 18rem;">
					<img class="card-img-top" src="img/2.png" alt="Card image cap">
					<div class="card-body">
					
					    
						<h5 class="card-title"><%=c.getCourseName() %></h5>
						<h5 class="card-title">SL No. : <%=c.getId() %></h5>
						<p class="card-text">Course Code: <%=c.getCourseCode() %></p>
						<p class="card-text">Course Teacher : <%=c.getTeacherName() %> </p>
                   
						<form action="Enrollcourse" method="post">
                            <% dao2.EnrollList.add(c.getId()); %>
                            <input type="hidden" value="<%= c.getId() %>"  name="C_id" required>
                            <input type="hidden" value="${userObj.id }"  name="S_id" required>
							<button type="submit" onClick="MyFun()" class="btn btn-outline-info text-black col-md-12 mt-2">Enroll Course</button>
						</form>
				        <script type="text/javascript">
				        function MyFun()
				        {
				        	alert("Your Course Enrolled\nSee View Course");
				        }
				        </script>
						
					</div>
				
				</div>
					
			</div>
				 <%}
		               
				      
				      %>
			

		</div>


	</div>


</body>
</html>