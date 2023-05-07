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
<title>Your Course</title>
<%@include file="../component/allcdn.jsp"%>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<p class="text-center card-header  fs-3">Your Registered Courses</p>
	</div>
	
	<div class="container">
 
		<div class="row">
		 <% 
		                 CourseDao dao2= new CourseDao(DBConnect.getConn());
		                 List<Course> list2= dao2.getAllCourse();
		                 list2.clear();
		                 
		                 
		             
                    	   List<Integer> listk=dao2.getAllC_id();
                    	   if(!listk.isEmpty())
                    	   System.out.print(listk.get(1));
                    	   else System.out.print("Array is empty");
                    	   
		              for(Integer i: listk){
		               System.out.print(i);
		               Course cc=dao2.getCourseById(i);
		               list2.add(cc);
		                }
		              
		                 for(Course c:list2)
		                 {%>
			<div class="col-md-3"">

				<div class="card" style="width: 18rem;">
					<img class="card-img-top" src="img/course.jpg" alt="Card image cap">
					<div class="card-body">
					
					    
						<h5 class="card-title"><%=c.getCourseName() %></h5>
						<p class="card-text">Course Code: CSE212</p>
						<p class="card-text">Course Teacher : <%=c.getTeacherName() %> </p>
						<a href="#" class="btn btn-danger">Remove</a>
						
					</div>
				
				</div>
					
			</div>
				 <%}
				      %>
			

		</div>


	</div>

</body>
</html>