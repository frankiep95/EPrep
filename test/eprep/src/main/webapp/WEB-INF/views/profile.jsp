<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty loggedInUser}">
	<c:redirect url="/login?expired=Session expired please login" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
		<title>Profile</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<meta name="description" content="">
		<meta name="keywords" content="">
		<link rel="stylesheet" href="static/assets/css/main.css">
	</head>
	<body class="">

<jsp:include page="Components/header.jsp"/>
			

		<!-- Heading -->
			<div id="heading">
				<h1>Profile</h1>
			</div>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
					
					</div>
				</div>
			</section>

		<!-- Footer -->
<jsp:include page="Components/footer.jsp"/>

		<!-- Scripts -->
			<script src="static/assets/js/jquery.min.js"></script>
			<script src="static/assets/js/browser.min.js"></script>
			<script src="static/assets/js/breakpoints.min.js"></script>
			<script src="static/assets/js/util.js"></script>
			<script src="static/assets/js/main.js"></script><nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="elements.html">Elements</a></li>
					<li><a href="generic.html">Generic</a></li>
				</ul>
			<a href="#menu" class="close"></a></nav>

	
</body></html>