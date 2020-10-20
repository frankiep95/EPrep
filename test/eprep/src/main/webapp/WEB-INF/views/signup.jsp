<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
		<title>Register</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<meta name="description" content="">
		<meta name="keywords" content="">
		<link rel="stylesheet" href="static/assets/css/main.css">
</head>



<body class="contacts-index-index rtl inner-page">
	<div id="page">
		<jsp:include page="Components/header.jsp" />
		
		
		<section class="main-container col1-layout bounceInUp animated">
			<div class="main container">


				<div class="col-lg-6">
					<div class="box">
						<h1 class="text-center">${msg}</h1>
						<h3 class="text-muted">
							<span class="text-danger">${error}</span>
						</h3>
						<hr>
						<form:form action="register" modelAttribute="users" method="post">
							<h3 class="text-danger">${_error}</h3>
							<div class="form-group">
								<label for="fname">First Name</label>
								<form:input path="fname" class="form-control"
									placeholder="First Name" />
								<form:errors path="fname" class="text-danger text-center" />
							</div>
							<div class="form-group">
								<label for="lname">Last Name</label>
								<form:input path="lname" class="form-control"
									placeholder="Last Name" />
								<form:errors path="lname" class="text-danger text-center" />
							</div>
							<div class="form-group">
								<label for="email">Email</label>
								<form:input path="email" id="e-mail" type="email"
									class="form-control" placeholder="Email" />
								<form:errors path="email" class="text-danger text-center" />
							</div>
							<div class="form-group">
								<label for="password">Password</label>
								<form:input path="password" type="password" id="pass"
									class="form-control" placeholder="password" />
								<form:errors path="password" class="text-danger text-center" />
							</div>
							<div class="form-group">
								<label for="password2">Re-Enter Password</label>
								<form:input path="password2" id="pass2" type="password"
									class="form-control" placeholder="Re-enter password" />
								<form:errors path="password2" class="text-danger text-center" />
							</div>
							<div class="text-left">
								<button type="submit" class="btn btn-primary"
									id="submit-register">
									<i class="fa fa-user-md"></i> Register
								</button>
							</div>

						</form:form>
					</div>
				</div>
				
			</div>
		</section>
		<br> <br> <br> <br> <br>
		<jsp:include page="Components/footer.jsp"></jsp:include>
	</div>

</body>
</html>