<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
	<div class="container-fluid">
		<!-- <a class="navbar-brand" href="../index.jsp">
		<i class="fa-solid fa-graduation-cap"></i>  LEARN HUB </a> -->
		
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
				<li class="nav-item"><a class="nav-link active" href="doctor.jsp">TEACHER</a></li>
			     <li class="nav-item"><a class="nav-link active" href="course.jsp">COURSES</a></li>
				<li class="nav-item"><a class="nav-link active" href="students.jsp">STUDENT</a></li>
           </ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Admin</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>