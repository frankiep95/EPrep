<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
					<c:if test="${fn:contains(role, 'ADMIN') or fn:contains(role, 'DBA')}">
<%-- 					<c:if test="${roles eq 'ADMIN' || roles eq 'DBA'}"> --%>
							<a class="button small" href="admin">ADMIN</a>
						</c:if>
							<a class="button small" href="profile">Profile</a>
							<a class="button small" href="logout">Logout</a>
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