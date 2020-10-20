<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
 <c:choose>
  <c:when test="${empty role or role ==null}">
  <c:redirect url="/login?error=Unauthorised Access for protected resource"/>
  </c:when>
  <c:when test="${fn:contains(role, 'ADMIN') or fn:contains(role, 'DBA')}"></c:when>  
  <c:otherwise>
  <c:redirect url="/profile?error=Access Denied"/>
  </c:otherwise>
  </c:choose>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Profile</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="stylesheet" href="static/assets/css/main.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
</head>

<body class="inner-page">
	<div id="page">

		<!-- Header -->
		<jsp:include page="Components/header.jsp" />
		<!-- end header -->


		<!-- Main Container -->
		<section id="main" class="wrapper">
			<div class="inner">
				<div class="content">
					<div class="cart">
						<div class="page-title">
							<header>
						

								${success} <span class="text-danger">${error}</span>
	
							</header>
							<div class="container">
							<div class= "row">
							<div class="col-sm">
							<h3>Quick search: Start typing</h3>
							<form action="seachByemailOrlastname" method="post">
								<input id="searchnow" type="text" class="input-text"
									name="lname" placeholder="Last name"> <input
									type="email" name="email" class="input-text"
									placeholder="E-mail">
								<button type="submit" class="btn btn-danger btn-md">Search</button>
							</form>
							</div>
							<div class="col-sm"></div>
							</div>
							</div>
						</div>
						<br>
						Page ${list.getNumber()+1} of ${list.totalPages} showing
						${list.content.size()} of all ${list.getTotalElements()} Users
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col"><i class="fa fa-image"></i> Image</th>
									<th scope="col"><i class="fa fa-users"></i> User</th>
									<th scope="col"><i class="fa fa-envelope"></i> Email</th>
									<th scope="col"><i class="fa fa-key"></i> Role</th>
									<th scope="col"><i class="fa fa-edit"></i> Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list.content}">
									<tr>
										<td class="image"><c:if test="${not empty item.image}">
												<img width="75" height="75" alt=""
													src="static/img/users/${item.id}/profile/${item.image}">
											</c:if></td>
										<td>
												<a href="#" data-toggle="modal"
													data-target="#about${item.id}"><i class="fa fa-user"></i>
													${item.fname} ${item.lname}</a>
											</td>
										<td class="a-center hidden-table">
											${item.email}
												<a href="deleteByemail?email=${item.email}"><i
													class="fa fa-times"></i></a>
											
										</td>
										<td class="a-center hidden-table">
											
												<form method="POST" action="editrole">
													<input type="hidden" name="id" value="${item.id}" /> <select id = "category"
														onchange="this.form.submit()" name="role"
														class="validate-select required-entry">
														<option value="${item.role}">
															<c:forEach var="r" items="${item.getRoles()}">
 																 ${r.role}
															</c:forEach>
														</option>
														<option value="USER">USER</option>
														<option value="DBA">DBA</option>
														<option value="ADMIN">ADMIN</option>
													</select>
												</form>
											
										</td>
										<td>
												<a
												class= "button edit-item" href="#" data-toggle="modal"
													data-target="#edits${item.id}" title="Edit User"
													class="edit-bnt" href="#"><i class="fa fa-pencil"></i></a> 
													<a
													class="button remove-item" title="Remove item"
													href="deleteUser?id=${item.id}"
													onclick="confirmed(); return false;"
													class="btn btn-default"><i class="fa fa-trash"></i></a>
											</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
						Page ${list.getNumber()+1} of ${list.totalPages} showing
						${list.content.size()} of all ${list.getTotalElements()} Users

						<br>
						<c:if test="${list.hasContent()}">
							<div class="pages">
								<ul class="pagination">
									<c:set var="prev" value="0" />
									<c:if test="${list.hasContent()}">
										<c:set var="prev" value="${list.getNumber()-1}" />
									</c:if>
									<c:if test="${list.hasPrevious()}">
										<li class='page-item'><a class="page-link"
											href="admin?page=0&size=${list.getSize()}"> <i
												class="fa fa-angle-double-left margin-5px-left xs-display-none "></i></a>
										</li>
										<li class='page-item'><a class="page-link"
											href="admin?page=${prev}&size=${list.getSize()}"> <i
												class="fa fa-long-arrow-alt-left margin-5px-right xs-display-none"></i>
												Prev
										</a></li>
									</c:if>

									<c:forEach var="i" begin="0" end="${list.totalPages -1}">
										<li
											class='page-item <c:if test="${list.getNumber() eq i || (empty list.getNumber() && i eq 0)}">active</c:if>'>
											<a class="button primary small"
											href="admin?page=${i}&size=${list.getSize()}">${i+1} </a>
										</li>

									</c:forEach>
									<c:if test="${list.hasNext()}">
										<li class='page-item'><a class="page-link"
											href="admin?page=${list.getNumber() + 1}&size=${list.getSize()}">Next
												<i
												class="fa fa-long-arrow-alt-right margin-5px-left xs-display-none "></i>
										</a></li>
										<li class='page-item'><a class="page-link"
											href="admin?page=${list.totalPages -1}&size=${list.getSize()}">
												<i
												class="fa fa-angle-double-right margin-5px-left xs-display-none "></i>
										</a></li>
									</c:if>
								</ul>
							</div>
						</c:if>

					</div>
				</div>
			</div>
		</section>


		<c:forEach var="item" items="${list.content}">
			<div class="modal fade" id="edits${item.id}">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
						
								Update Info
								<button type="button" data-dismiss="modal" aria-label="Close"
									class="close">
									<span aria-hidden="true">×</span>
								</button>
							
						</div>
						<!-- Modal body -->
						<div class="modal-body">
							<form:form action="updateUsers" modelAttribute="user"
								method="post" id="form-validate">

								<input name="id" type="hidden" value="${item.id}">

								<ul class="form-list">
									<li class="fields">
										<div class="customer-name">
											<div class="input-box name-firstname">
												<label for="firstname">First Name<span
													class="required">*</span></label>
												<div class="input-box1">
													<form:input path="fname" value="${item.fname}"
														class="input-text" placeholder="First Name" />
												</div>
											</div>
											<div class="input-box name-lastname">
												<label for="lastname">Last Name <span
													class="required">*</span></label>
												<div class="input-box1">
													<form:input path="lname" value="${item.lname}"
														class="input-text" placeholder="Last Name" />
												</div>
												<form:input type="hidden" path="email" value="${item.email}"
													class="input-text" />
											</div>
											<div class="input-box name-lastname">
												<label for="lastname">Please select Roles <span
													class="required">*</span></label> <br>
												<form:select path="role" defaultvalue="${item.role}"
													class="col-md-12">
													<option value="${item.role}">${item.role}</option>
													<option value="USER">USER</option>
													<option value="DBA">DBA</option>
													<option value="ADMIN">ADMIN</option>
												</form:select>

											</div>


										</div>
									</li>
								</ul>

								<div class="buttons-set">
									<p class="required">* Required Fields</p>
									<button type="submit" title="Save" class="btn btn-info">
										<span>Save</span>
									</button>
									<button type="button" data-dismiss="modal" aria-label="Close"
										class="btn btn-danger">Close</button>
								</div>
							</form:form>


						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<c:forEach var="item" items="${list.content}">
			<div class="modal fade" id="about${item.id}">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">

								<b>${item.fname} ${item.lname}</b>
								<button type="button" data-dismiss="modal" aria-label="Close"
									class="close">
									<span aria-hidden="true">×</span>
								</button>
							
						</div>
						<!-- Modal body -->
						<div class="modal-body">

							<div class="text-secondary">

						
									<c:if test="${not empty item.getAddress()}">
										<i class="fa fa-home text-success"> </i>
             ${item.getAddress().street},
${item.getAddress().city},
${item.getAddress().state}<br>
									</c:if>
									<i class="fa fa-envelope"></i> ${item.email}
									<hr>
									<i class="fa fa-key"></i>
									<c:forEach var="r" items="${item.getRoles()}">
     ${r.role}<i class="fa fa-check"></i>
									</c:forEach>
									<br>
							
							</div>

							<div class="buttons-set">
								<button type="button" data-dismiss="modal" aria-label="Close"
									class="btn btn-danger">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<hr>
		<!-- Footer -->
		<jsp:include page="Components/footer.jsp" />
	</div>

	<!-- JavaScript -->

	<script type="text/javascript"
		src="static/js/jquery.mobile-menu.min.js"></script>
	<script type="text/javascript" src="static/js/cloud-zoom.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>

	<script>
		function confirmed() {
			if (confirm('You are about to delete, Do you want to proceed?')) {
				document.getElementById("del").submit();
				return true;
			} else {
				return false;
			}
		}

		$("#searchnow").keyup(function() {
			var value = this.value.toLowerCase().trim();

			$("table tr").each(function(index) {
				if (!index)
					return;
				$(this).find("td").each(function() {
					var id = $(this).text().toLowerCase().trim();
					var not_found = (id.indexOf(value) == -1);
					$(this).closest('tr').toggle(!not_found);
					return not_found;
				});
			});
		});
	</script>
</body>
</html>
