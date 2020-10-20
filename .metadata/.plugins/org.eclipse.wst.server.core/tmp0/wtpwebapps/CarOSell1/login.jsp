<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./Styles/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account login</title>
</head>
<body>
<body>
<h1>Car O Sell</h1>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	 <a class="navbar-brand" href="index.jsp">CarOsell</a>
	 <button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"  href="newCars">New Vehicles</a></li>
			<li class="nav-item"><a class="nav-link"  href="usedCars">Used Vehicles</a></li>
			<li class="nav-item active"><a class="nav-link" href="loginServlet">Account</a></li>
		</ul>
	</div>
	</nav>
	
<form class="login" action="loginServlet" method="post">
<c:if test="${validUser}">
<h4><span class="loginError"> Incorrect login details!</span></h4>
</c:if>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="password" placeholder="password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="notRobot">
    <label class="form-check-label" for="exampleCheck1">I am not a Robot</label>
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
</form>
</body>
</html>