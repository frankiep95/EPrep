<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="page" value="Access Denied"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <!-- font awesome -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
 		
</head>
<body>
<jsp:include page="components/header.jsp"/>

	<br> <br> <br>         
	<div class="container">
        	<div class="col-lg-12">
             <div class="col-lg-6 offset-md-2">
                <h4 class="text-muted"><span class="text-danger">You are not authorized to Access this page</span>
                </h4>
                <hr>
                <c:choose>
                <c:when test="${empty loggedInUser}">                
                <a class="btn btn-success" href="login">Login</a>
	            <a class="btn btn-success" href="register">Register</a>	         
                </c:when>
                <c:otherwise>
                <a class="btn btn-success" href="profile"><i class="fa fa-user"></i> Profile</a>
                <a class="btn btn-success" href="logout">Logout</a>
                </c:otherwise>
           </c:choose> 			   		
              </div>
             </div>
       </div>
     
</body>
</html>
