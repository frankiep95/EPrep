<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Vehicles</title>
</head>
<body>
<body>
	<h1>Car O Sell</h1>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand " href="index.jsp">CarOsell</a>
	<button class="navbar-toggler active" type="button"
		data-toggle="collapse" data-target="#navbarNav"
		aria-controls="navbarNav" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="newCars">New
					Vehicles</a></li>
			<li class="nav-item"><a class="nav-link" href="usedCars">Used
					Vehicles</a></li>
			<li class="nav-item"><a class="nav-link" href="Account">Account</a></li>
		</ul>
	</div>
	</nav>
	<c:if test="${cars != null}">
		<form action="viewDetails" method="post">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>Images</th>
						<th>Manufacturer</th>
						<th>Model</th>
						<th>Year</th>
						<th>Price</th>
						<th>Color</th>
						<th>Drive</th>
						<th>Transmission</th>
						<th>Miles</th>
						<th>Description</th>
					</tr>
					<c:forEach var="car" items="${cars}">
						<tr>

							<td><input type="image" value="${car}" id="selected"
								name="selected" height="100px" width="200px"
								src="<c:out value="${car.images[0]}"/>" /></td>
							<td><c:out value="${car.manufacturer}" /></td>
							<td><c:out value="${car.model}" /></td>
							<td><c:out value="${car.year}" /></td>
							<td><c:out value="${car.price}" /></td>
							<td><c:out value="${car.color}" /></td>
							<td><c:out value="${car.drive}" /></td>
							<td><c:out value="${car.transmission}" /></td>
							<td><c:out value="${car.miles}" /></td>
							<td><c:out value="${car.description}" /></td>
						</tr>
					</c:forEach>

					<tr></tr>
				</table>

			</div>
		</form>
	</c:if>
</body>
</html>