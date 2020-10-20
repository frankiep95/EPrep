<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<a class="logo" href="index.html">E-Prep</a>
	<nav>
		<div>

				<c:choose>
					<c:when test="${empty loggedInUser}">
						<a class="button primary" href="login">Log In</a>
						<a class="button primary" href="register">Register</a>
					</c:when>
					<c:otherwise>
						<%--             	<c:if test="${fn:contains(role,'ADMINDBA')}"> --%>
						<c:if test="${role eq 'ADMIN' || role eq 'DBA'}">
							<a class="button" href="admin">ADMIN</a>"
						</c:if>
							<a class="button" href="preps">Preps</a>
							<a class="button" href="profile">Profile</a>
							<a class="button" href="logout">Logout</a>
					</c:otherwise>
				</c:choose>



		</div>
	</nav>
</header>
<nav id="menu">
	<ul class="links">
		<li><a href="index.html">Home</a></li>
		<li><a href="elements.html">Elements</a></li>
		<li><a href="generic.html">Generic</a></li>
	</ul>
	<a href="#menu" class="close"></a>
</nav>