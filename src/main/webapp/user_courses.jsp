<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="com.entity.Specialist"%> 
<%@page import="java.util.List"%>
<%@page import="com.entity.Course"%> 
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Page</title>
<link rel="icon" href="img/logo2.png" sizes="32x32" type="image/png">
<%@include file="component/allcdn.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/img6.jpeg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}


.site-footer
{
  background-color:#26272b;
  padding:45px 0 20px;
  font-size:15px;
  line-height:24px;
  color:#737373;
}
.site-footer hr
{
  border-top-color:#bbb;
  opacity:0.5
}
.site-footer hr.small
{
  margin:20px 0
}
.site-footer h6
{
  color:#fff;
  font-size:16px;
  text-transform:uppercase;
  margin-top:5px;
  letter-spacing:2px
}
.site-footer a
{
  color:#737373;
}
.site-footer a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links
{
  padding-left:0;
  list-style:none
}
.footer-links li
{
  display:block
}
.footer-links a
{
  color:#737373
}
.footer-links a:active,.footer-links a:focus,.footer-links a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links.inline li
{
  display:inline-block
}
.site-footer .social-icons
{
  text-align:right
}
.site-footer .social-icons a
{
  width:40px;
  height:40px;
  line-height:40px;
  margin-left:6px;
  margin-right:0;
  border-radius:100%;
  background-color:#33353d
}
.copyright-text
{
  margin:0
}
@media (max-width:991px)
{
  .site-footer [class^=col-]
  {
    margin-bottom:30px
  }
}
@media (max-width:767px)
{
  .site-footer
  {
    padding-bottom:0
  }
  .site-footer .copyright-text,.site-footer .social-icons
  {
    text-align:center
  }
}
.social-icons
{
  padding-left:0;
  margin-bottom:0;
  list-style:none
}
.social-icons li
{
  display:inline-block;
  margin-bottom:4px
}
.social-icons li.title
{
  margin-right:15px;
  text-transform:uppercase;
  color:#96a2b2;
  font-weight:700;
  font-size:13px
}
.social-icons a{
  background-color:#eceeef;
  color:#818a91;
  font-size:16px;
  display:inline-block;
  line-height:44px;
  width:44px;
  height:44px;
  text-align:center;
  margin-right:8px;
  border-radius:100%;
  -webkit-transition:all .2s linear;
  -o-transition:all .2s linear;
  transition:all .2s linear
}
.social-icons a:active,.social-icons a:focus,.social-icons a:hover
{
  color:#fff;
  background-color:#29aafe
}
.social-icons.size-sm a
{
  line-height:34px;
  height:34px;
  width:34px;
  font-size:14px
}
.social-icons a.facebook:hover
{
  background-color:#3b5998
}
.social-icons a.twitter:hover
{
  background-color:#00aced
}
.social-icons a.linkedin:hover
{
  background-color:#007bb6
}
.social-icons a.dribbble:hover
{
  background-color:#ea4c89
}
@media (max-width:767px)
{
  .social-icons li.title
  {
    display:block;
    margin-right:0;
    font-weight:600
  }
}



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
				<li class="nav-item"><a class="nav-link" href="doctor/index.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="../user_courses.jsp">COURSES</a></li>
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
	

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container mt-3 p-3">
	 <div class="row">
			<%
			CourseDao dao= new CourseDao(DBConnect.getConn());
            String ss=request.getParameter("dName");
	     	System.out.println(ss);
	     	List<Course> c=dao.TeacherCourse(ss);
		   
	     	if(!c.isEmpty())
	     	{ 
	     		
	     		for(Course i:c)
	     		{
	     			System.out.println(i.getCourseName() );
	     			System.out.println("s");
	     			%>
	     	     	
	     	       
	     	          <div class="col-md-4 mb-4">
	     	            <div class="card">
	     	              <img class="card-img-top" src="img/ds.jpg" alt="Card image cap">
	     	              <div class="card-body">
	     	                <h5 class="card-title">Course Name: <%= i.getCourseName() %></h5>
	     	                <p class="card-text">Teacher Name: <%=i.getTeacherName() %></p>
	     	                <p class="card-text">Course Code: <%=i.getCourseCode() %></p>
	     	                
	     	                <a href="studentsEnrolled.jsp?cId=<%= i.getId() %>" class="btn btn-primary">See Enrolled Students</a>
	     	              </div>
	     	            </div>
	     	       
	     	     	   </div>
	     	     	 <%
	     		}
	     		
	     	     	 
	     	}
	     	else
	     		System.out.println("TeacherLiat is empty()");
        
	     	 System.out.println("ll");
	     	 
	     	
	   %>
	    
	   </div>
	   
	   	<div class="container p-5">
		<p class="text-center card-header  fs-3">Static Course</p>
	</div>
	   
	<div class="container mt-3 p-3">
      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card">
            <img class="card-img-top" src="img/ds.jpg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Data Structure</h5>
              <p class="card-text">This is some example text for card 1.</p>
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img class="card-img-top" src="img/dm.jpeg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Discrete Math</h5>
              <p class="card-text">This is some example text for card 2.</p>
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img class="card-img-top" src="img/java.jpeg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">JAVA</h5>
              <p class="card-text">This is some example text for card 3.</p>
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img class="card-img-top" src="img/ML.png" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Machine Learning</h5>
              <p class="card-text">This is some example text for card 1.</p>
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img class="card-img-top" src="img/com.jpeg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Compiler</h5>
              <p class="card-text">This is some example text for card 2.</p>
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img class="card-img-top" src="img/algo.jpeg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Algorithm Analysis</h5>
              <p class="card-text">This is some example text for card 2.</p>
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
      </div>
    </div>
	
	
	
	
	<%@include file="component/footer.jsp"%>

</body>
</html>