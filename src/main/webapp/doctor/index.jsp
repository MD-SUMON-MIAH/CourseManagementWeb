<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Page</title>
<link rel="icon" href="../img/logo2.png" sizes="32x32" type="image/png">
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.card-main {
        transition: transform 0.2s;
      }
      .card-main:hover {
        transform: scale(1.05);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      }
      
 /* footer style starts */

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

/* footer style ends */
</style>
<%@include file="../component/allcdn.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<nav class="navbar navbar-expand-lg navbar-dark bg-info">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><img src="../img/img12.png" alt="" height="50" width="200"><!-- <i class="fa-solid fa-graduation-cap"></i>  LEARN HUB --> </a>
		<img src="../img/sustlogo.png" class="d-block w-30" height=50px>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="index.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="../user_courses.jsp?dName=${doctObj.fullName}">COURSES</a></li>
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

	<p class="text-center fs-3 mt-2">Teacher Dashboard</p>

	<%
	Doctor d = (Doctor) session.getAttribute("doctObj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-info">
						 <i class="fa-sharp fa-solid fa-person-chalkboard fa-3x"></i><br>
						<p class="fs-4 text-center">
							Teacher <br><%=dao.countDoctor()%>
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-info">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Courses <br>
							 4<%-- <%=dao.countAppointmentByDocotrId(d.getId())%> --%>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>
	

	<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="card"  style="width: 25rem;">
        <img src="data:image/jpeg;base64,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" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">HCI</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="students.jsp" class="btn btn-primary">View Students</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card" style="width: 25rem;">
        <img src="https://www.freecodecamp.org/news/content/images/2022/01/machine-learning-banner-2.png" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">ML</h5>
          <p class="card-text">Some quick example text to build on the card title.</p>
          <a href="students.jsp" class="btn btn-primary">View Students</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card" style="width: 25rem;">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnvdDcApsScEFBa2_64UQG1o9ddGU7nsI5-g&usqp=CAU" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">CNN</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content named Networking.</p>
          <a href="students.jsp" class="btn btn-primary">View Students</a>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 mt-4">
      <div class="card" style="width: 25rem;">
        <img src="../img/ds.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Data Structures</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content named Data.</p>
          <a href="students.jsp" class="btn btn-primary">View Students</a>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../component/footer.jsp"%>
	
</body>
</html>