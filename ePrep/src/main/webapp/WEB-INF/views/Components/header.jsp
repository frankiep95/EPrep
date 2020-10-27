<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<header id="header">
	<a class="logo" href="home">E-Prep</a>
	<nav>
		<div>

				<c:choose>
					<c:when test="${empty loggedInUser}">
						<a class="button primary small" href="login">Log In</a>
						<a class="button primary small" href="register">Register</a>
					</c:when>
					<c:otherwise>

							<a class="button small" href="profile">Profile</a>
							<a class="button small" href="logout">Logout</a>
					</c:otherwise>
				</c:choose>



		</div>
	</nav>
</header>
