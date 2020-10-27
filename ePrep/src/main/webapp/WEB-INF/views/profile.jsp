<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${empty loggedInUser}">
	<c:redirect url="/login?expired=Session expired please login" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<link
	href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'
	rel='stylesheet'>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"> 
    </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> 
    </script>
<title>Dashboard</title>
<link href="static/css/bootstrap.css" rel="stylesheet"
	th:href="@{/css/bootstrap.css}" />
<link rel="stylesheet" href="static/assets/css/main.css">

</head>
<body class="">

	<jsp:include page="Components/header.jsp" />

	<div id="heading">
		<h1>Welcome back ${user.fname}!</h1>
	</div>

	<section id="main" class="wrapper">
		<div class="inner">

			<div class="container-fluid">
				<div class="row">
					<div class="content">
						<div class="col-3">

							<div>
								<c:choose>
									<c:when test="${not empty user.image}">
										<img src="static/img/users/${user.id}/profile/${user.image}"
											style="width: 100px; height: 100px;"
											class="rounded  ml-3 d-block">
									</c:when>
									<c:otherwise>

										<button class="btn " data-toggle="modal"
											data-target="#add-images">
											<i class="fa fa-fw fa-camera"></i> <span> <c:choose>
													<c:when test="${not empty user.image}">
													Change Image
												</c:when>
													<c:otherwise>
													Add Image
													<i class="fa fa-plus"></i>
													</c:otherwise>
												</c:choose>
											</span>
										</button>

									</c:otherwise>
								</c:choose>


								<p class="ml-3">${user.fname}${user.lname}</p>
								<p>
									<c:forEach items="${user.getPermissions()}" var="p">
										<span class="badge badge-secondary">${p.permissions}</span>
									</c:forEach>
								</p>
							</div>


							<div class="nav flex-column nav-tabs nav-tabs-sticky" id="myTab"
								role="tablist " aria-orientation="vertical">



								<a class="nav-link button" id="profile-tab" data-toggle="tab"
									href="#profile" role="tab" aria-controls="profile"
									aria-selected="false">Profile</a> <a class="nav-link button"
									id="dashboard-tab" data-toggle="tab" href="#dashboard"
									role="tab" aria-controls="dashboard" aria-selected="false">Dashboard</a>


								<c:if
									test="${fn:contains(permissions, 'ADMIN') or fn:contains(permissions, 'DBA')}">


									<a class="nav-link button" id="equipment-tab" data-toggle="tab"
										href="#equipment" role="tab" aria-controls="equipment"
										aria-selected="false">Equipment</a>


									<a class="nav-link button" id="employees-tab" data-toggle="tab"
										href="#employees" role="tab" aria-controls="employees"
										aria-selected="false">Employees</a>


									<a class="nav-item nav-link button" id="customers-tab"
										data-toggle="tab" href="#customers" role="tab"
										aria-controls="customers" aria-selected="false">Customers</a>


								</c:if>
							</div>
						</div>
					</div>


					<div class="col-8">
						<div class="tab-content">
							<div class="tab-pane fade" id="profile" role="tabpanel"
								aria-labelledby="profile-tab">
								<div
									class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
									<h1 class="h2">Profile</h1>
								</div>
								<div class="btn-toolbar mb-2 mb-md-0"></div>

								<div class="card">
									<div class="card-body">
										<div class="e-profile">
											<div class="row">
												<div class="mx-auto">
													<div
														class="d-flex justify-content-center align-items-center rounded"
														style=>
														<c:if test="${not empty user.image}">
															<img
																src="static/img/users/${user.id}/profile/${user.image}"
																style="width: 150px; height: 150px;"
																class="rounded mx-auto d-block">
														</c:if>


													</div>
												</div>

												<div
													class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
													<div class="text-center text-sm-left mb-2 mb-sm-0">
														<h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${user.fname}
															${user.lname}</h4>
														<p class="mb-0">${user.email}</p>
														<div class="text-muted">
															<small>Last seen 2 hours ago</small>
														</div>
														<div class="mt-2">
															<button class="button " data-toggle="modal"
																data-target="#add-images">
																<i class="fa fa-fw fa-camera"></i> <span> <c:choose>
																		<c:when test="${not empty user.image}">
																				
																					Change Image
																				

																			</c:when>
																		<c:otherwise>
																				Add Image
																				<i class="fa fa-plus"></i>
																		</c:otherwise>
																	</c:choose>
																</span>
															</button>
														</div>
													</div>
													<div class="text-center text-sm-right">
														<%-- 																<span class="badge badge-secondary">${user.roles}</span> --%>
														<c:forEach items="${user.getPermissions()}" var="p">
															<span class="badge badge-secondary">${p.permissions}</span>
														</c:forEach>
														<div class="text-muted">
															<small>${user.getAddress().getCreatedon()}</small>
														</div>
													</div>
												</div>
											</div>

											<div class="tabbable">
												<div class="nav nav-tabs nav-tabs-sticky " id="myTab"
													role="tablist">


													<a class="nav-link button" id="messages-tab"
														data-toggle="tab1" href="#messages" role="tab"
														aria-controls="messages" aria-selected="false">messages</a>


													<a class="nav-link button" id="edit-profile-tab"
														data-toggle="tab1" href="#edit-profile" role="tab"
														aria-controls="edit-profile" aria-selected="false">Edit
														Profile</a>

												</div>

												<h3>${msg}</h3>


												<div class="tab-pane fade" id="edit-profile" role="tabpanel"
													aria-labelledby="edit-profile-tab">

													<form:form action="updatecontact" modelAttribute="address"
														method="post" id="contactinfo" target="_self">
														<div class="fieldset group-select" id="conactinfo">
															<h2 class="legend">Contact Information</h2>
															<ul class="">
																<li class="fields">
																	<div class="customer-name">
																		<div class="input-box">
																			<label for="firstname">First Name<span
																				class="required">*</span></label>
																			<div class="input-box1">
																				<form:input type="text" id="firstname"
																					path="user.fname" value="${user.fname}"
																					class="input-text required-entry" />
																			</div>
																		</div>
																		<div class="input-box name-lastname">
																			<label for="lastname">Last Name<span
																				class="required">*</span></label>
																			<div class="input-box1">
																				<form:input type="text" id="lastname"
																					path="user.lname" value="${user.lname}"
																					class="input-text required-entry" />
																			</div>
																		</div>
																	</div>
																</li>
																<li class=""><label for="phone">Telephone<em
																		class="required">*</em></label> <br> <form:input
																		type="hidden" path="id" value="${user.id}" /> <form:input
																		type="hidden" path="user.id" value="${user.id}" /> <form:input
																		class="input-text required-entry" path="phone"
																		value="" placeholder="Enter phone" /></li>

															</ul>
														</div>
														<div class="fieldset group-select">
															<h2 class="legend">Address</h2>
															<ul class="">

																<li class="">
																	<div class="field">
																		<div class="input-box">
																			<label for="street">Street Address<em
																				class="required">*</em></label> <br>
																			<form:input class="input-text required-entry"
																				path="street" value="" placeholder="Enter Address" />
																		</div>
																	</div>
																	<div class="field">
																		<div class="input-box">
																			<label for="city">City<em class="required">*</em></label>
																			<br>
																			<form:input class="input-text required-entry"
																				path="city" value="" placeholder="Enter City" />
																		</div>
																	</div>
																</li>

																<li class="">

																	<div class="field">
																		<div class="input-box">
																			<label for="zip">Zip/Postal Code<em
																				class="required">*</em></label> <br>
																			<form:input class="input-text required-entry"
																				path="zip" value="" placeholder="Enter ZIP" />
																		</div>
																	</div>
																	<div class="field">
																		<div class="input-box">
																			<label for="region_id">State/Province<em
																				class="required">*</em></label> <br>
																			<form:select class="input-text" id="region_id"
																				path="state" required="true">
																				<c:choose>
																					<c:when test="${empty user.getAddress().state}">
																						<option value="">Select State</option>
																					</c:when>
																					<c:otherwise>
																						<option value="${user.getAddress().state}">
																							${user.getAddress().state}</option>
																					</c:otherwise>
																				</c:choose>
																				<c:forEach items="${states}" var="state">
																					<option value="${state}">${state}</option>
																				</c:forEach>
																			</form:select>
																		</div>
																	</div>
																</li>

															</ul>
														</div>
														<div class="buttons-set">
															<p class="required">* Required Fields</p>
															<button type="submit" title="" class="button">
																<span>Save </span>
															</button>
														</div>
													</form:form>
												</div>
												<div class="tab-pane fade" id="messages" role="tabpanel"
													aria-labelledby="messages-tab">
													<form class="form">
														<div class="row">
															<div class="col d-flex justify-content-end">
																<button class="button primary" type="submit">Save
																	Changes</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="dashboard" role="tabpanel"
								aria-labelledby="dashboard-tab">
								<div
									class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
									<h1 class="h2">Dashboard</h1>
									<div class="btn-toolbar mb-2 mb-md-0"></div>


									<ul
										class="nav nav-tabs nav-tabs-sticky align-items-center pt-3 pb-2 mb-3 border-bottom"
										id="myDashTab" role="tablist">



										<li class="nav-item dropdown"><a
											class="button dropdown-toggle" href="#" id="dropdown08"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">Pre/Post</a>
											<div class="dropdown-menu" aria-labelledby="dropdown08">
												<a class=" nav-link dropdown-item" href="#">Crane Op Pre</a>
												<a class="dropdown-item" href="#">Crane Op Post</a> <a
													class="dropdown-item" href="#">Driver Pre</a> <a
													class="dropdown-item" href="#">Driver Post</a> <a
													class="dropdown-item" href="#">Tech Pre</a> <a
													class="dropdown-item" href="#">Tech Post</a>
											</div></li>



										<li class="nav-item dropdown"><a
											class="nav-link button dropdown-toggle" href="#"
											id="dropdown08" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">Reports</a>
											<div class="dropdown-menu" aria-labelledby="dropdown08">
												<a class="dropdown-item" href="#">Incident</a> <a
													class="dropdown-item" href="#">Damage</a> <a
													class="dropdown-item" href="#">Repair Order</a>
											</div></li>



										<li class="nav-item"><a class="nav-link button"
											id="jobs-tab" href="#jobs" role="tab" aria-controls="jobs"
											aria-selected="false" data-toggle="tab1">Jobs</a></li>



										<li class="nav-item"><a class="nav-link button"
											id="work-order-tab" href="#workorders" role="tab"
											aria-controls="workorders" aria-selected="false"
											data-toggle="tab1">Work Orders</a></li>

										<c:if
											test="${fn:contains(permissions, 'ADMIN') or fn:contains(permissions, 'DBA')}">
											<li class="nav-item"><a class="button"
												data-toggle="modal" data-target="#add-job"> ADD Job</a></li>
										</c:if>

									</ul>




								</div>
								<div class="tab-content">


									<div class="tab-pane fade" id="jobs" role="tabpanel"
										aria-labelledby="jobs-tab">

										Page ${works.getNumber()+1} of ${works.totalPages} showing
										${works.content.size()} of all ${works.getTotalElements()}
										Users
										<table class="table ">
											<thead class="thead-dark">
												<tr>
													<th scope="col">ID</th>
													<th scope="col">Job Name</th>
													<th scope="col">Production</th>
													<th scope="col">Start Date</th>
													<th scope="col">End Date</th>
													<th scope="col">Edit/Info</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="items" items="${works.content}">
													<tr>
														<td>${items.id}</td>
														<td>${items.jobname}</td>
														<td>${items.productioncompany}</td>
														<td>${items.startdate}</td>
														<td>${items.enddate}</td>
														<td><a class="button edit-item" href="#"
															data-toggle="modal" data-target="#info${items.id}"
															title="Job Info" class="edit-bnt" href="#"><i
																class="fa fa-pencil"></i></a></td>

													</tr>
												</c:forEach>
											</tbody>
										</table>
										Page ${works.getNumber()+1} of ${works.totalPages} showing
										${works.content.size()} of all ${works.getTotalElements()}
										jobs <br>
										<c:if test="${works.hasContent()}">
											<div class="pages">
												<ul class="pagination">
													<c:set var="prev" value="0" />
													<c:if test="${works.hasContent()}">
														<c:set var="prev" value="${works.getNumber()-1}" />
													</c:if>
													<c:if test="${works.hasPrevious()}">
														<li class='page-item'><a class="page-link"
															href="profile?page=0&size=${works.getSize()}#jobs"> <i
																class="fa fa-angle-double-left margin-5px-left xs-display-none "></i></a>
														</li>
														<li class='page-item'><a class="page-link"
															href="profile?page=${prev}&size=${works.getSize()}#jobs">
																<i
																class="fa fa-long-arrow-alt-left margin-5px-right xs-display-none"></i>
																Prev
														</a></li>
													</c:if>
													<c:forEach var="i" begin="0" end="${works.totalPages -1}">
														<li
															class='page-item <c:if test="${works.getNumber() eq i || (empty works.getNumber() && i eq 0)}">active</c:if>'>
															<a class="button primary small"
															href="profile?page=${i}&size=${works.getSize()}#jobs">${i+1}
														</a>
														</li>

													</c:forEach>
													<c:if test="${works.hasNext()}">
														<li class='page-item'><a class="page-link"
															href="profile?page=${works.getNumber() + 1}&size=${works.getSize()}#jobs">Next
																<i
																class="fa fa-long-arrow-alt-right margin-5px-left xs-display-none "></i>
														</a></li>
														<li class='page-item'><a class="page-link"
															href="profile?page=${works.totalPages -1}&size=${works.getSize()}#jobs">
																<i
																class="fa fa-angle-double-right margin-5px-left xs-display-none "></i>
														</a></li>
													</c:if>
												</ul>
											</div>
										</c:if>
									</div>


									<div class="tab-pane fade" id="workorders" role="tabpanel"
										aria-labelledby="work-order-tab">yes</div>


									<div class="tab-pane fade" id="contact" role="tabpanel"
										aria-labelledby="contact-tab">...</div>


								</div>
							</div>

							<div class="tab-pane fade" id="equipment" role="tabpanel"
								aria-labelledby="equipment-tab">
								<div
									class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
									<h1 class="h2">Equipment</h1>
									<div class="btn-toolbar mb-2 mb-md-0"></div>
								</div>
								
									
									<div class="dropdown show">
										<a class="button dropdown-toggle" href="#"
											role="button" id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">ADD
										</a>

										<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
											<a class=" dropdown-item" href="#"
										data-toggle="modal" data-target="#addHead">Add Head</a>
											
											
											 <a class="dropdown-item" href="#"
										data-toggle="modal" data-target="#addTrailer">Add Trailer</a>
												
												
												<a class="dropdown-item" href="#"
										data-toggle="modal" data-target="#addCrane">Add Crane</a>
										
										<a class="dropdown-item" href="#"
										data-toggle="modal" data-target="#addTruck">Add Truck</a>
										
										<a class="dropdown-item" href="#"
										data-toggle="modal" data-target="#addCar">Add Car</a>
										
										</div>
									</div>


									<a class="button" href="#"
										data-toggle="modal" data-target="#equipSearch" tabindex="-1"
										aria-disabled="true">Search</a>

						
<p>
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-secondary button active"> <input
										type="radio" name="options" id="option1" autocomplete="off"
										checked>Heads
									</label> <label class="btn btn-secondary button"> <input type="radio"
										name="options" id="option2" autocomplete="off"> Cranes
									</label> <label class="btn button btn-secondary"> <input type="radio"
										name="options" id="option3" autocomplete="off"> Cars
									</label> <label class="btn button btn-secondary"> <input type="radio"
										name="options" id="option2" autocomplete="off"> Trucks
									</label> <label class="btn button btn-secondary"> <input type="radio"
										name="options" id="option3" autocomplete="off">
										Trailers
									</label> <label class="btn button btn-secondary"> <input type="radio"
										name="options" id="option3" autocomplete="off">
										Accessories
									</label>
								</div>
								</p>
								Page ${equip.getNumber()+1} of ${equip.totalPages} showing
								${equip.content.size()} of all ${equip.getTotalElements()}
								equipment
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col"><i class="fa fa-id-badge"></i> Name</th>
											<th scope="col"><i class="fa fa-puzzle-piece"></i> Type</th>
											<th scope="col"><i class="fa fa-location-arrow"></i>
												Location</th>
											<th scope="col"><i class="fa fa-thermometer-quarter"></i>
												Status</th>
											<th scope="col"><i class="fa fa-edit"></i> Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${equip.content}">
											<tr>
												<td>${item.equipName}</td>
												<td>${item.equipType}</td>


											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>


							<div class="tab-pane fade" id="employees" role="tabpanel"
								aria-labelledby="employees-tab">
								<div
									class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
									<h1 class="h2">Employees</h1>
									<div class="btn-toolbar mb-2 mb-md-0"></div>
								</div>
								Page ${list.getNumber()+1} of ${list.totalPages} showing
								${list.content.size()} of all ${list.getTotalElements()} Users
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col"><i class="fa fa-image"></i> Image</th>
											<th scope="col"><i class="fa fa-users"></i> User</th>
											<th scope="col"><i class="fa fa-envelope"></i> Email</th>
											<th scope="col"><i class="fas fa-user-cog"></i> Roles</th>
											<th scope="col"><i class="fa fa-key"></i> Access</th>
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
												<td><a href="#" data-toggle="modal"
													data-target="#about${item.id}"><i class="fa fa-user"></i>
														${item.fname} ${item.lname}</a></td>
												<td class="a-center hidden-table">${item.email}<a
													href="deleteByemail?email=${item.email}"><i
														class="fa fa-times"></i></a>
												</td>
												<td class="a-center hidden-table">

													<form method="POST" action="editrole">
														<input type="hidden" name="id" value="${item.id}" /> <select
															id="category" onchange="this.form.submit()" name="roles"
															class="validate-select required-entry">
															<option value="${item.roles}">
																<c:forEach var="r" items="${item.getRoles()}">
 																 ${r.roles}
															</c:forEach>
															</option>
															<option value="Package Driver">Package Driver</option>
															<option value="Precision Driver">Precision
																Driver</option>
															<option value="Crane OP">Crane Operator</option>
															<option value="Tech">Equipment Technician</option>
														</select>
													</form>

												</td>
												<td class="a-center hidden-table">
													<form method="POST" action="editpermissions">
														<input type="hidden" name="id" value="${item.id}" /> <select
															id="category" onchange="this.form.submit()"
															name="permissions" class="validate-select required-entry">
															<option value="${item.permissions}">
																<c:forEach var="p" items="${item.getPermissions()}">
 																 ${p.permissions}
															</c:forEach>
															</option>
															<option value="USER">USER</option>
															<option value="DBA">DBA</option>
															<option value="ADMIN">ADMIN</option>
														</select>
													</form>
												</td>
												<td><a class=" button" data-toggle="modal"
													data-target="#edits${item.id}" title="Edit User"><i
														class="fa fa-pencil"></i></a> <a class="button remove-item"
													title="Remove item" href="deleteUser?id=${item.id}"
													onclick="confirmed(); return false;"
													class="btn btn-default"><i class="fa fa-trash"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								Page ${list.getNumber()+1} of ${list.totalPages} showing
								${list.content.size()} of all ${list.getTotalElements()} Users <br>
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


							<div class="tab-pane fade" id="customers" role="tabpanel"
								aria-labelledby="customers-tab"></div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</section>

	<jsp:include page="Components/footer.jsp" />


	<c:forEach var="item" items="${list.content}">
		<div class="modal fade" id="edit-user">
			<div class="modal-diaglog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">User Information</div>
					<div class="modal-body"></div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="about${item.id}">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<b>${item.fname} ${item.lname}</b>
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
							<c:forEach var="p" items="${item.getPermissions()}">
    							${p.permissions}<i class="fa fa-check"></i>
							</c:forEach>
							<br>
						</div>
						<div class="buttons-set">
							<button type="button" data-dismiss="modal" aria-label="Close"
								class="button primary">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>


	<c:forEach var="item" items="${list.content}">
		<div class="modal fade" id="edits${item.id}">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">Update Info</div>
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
											<label for="lastname">Please select Permissions <span
												class="required">*</span></label> <br>
											<form:select path="role" defaultvalue="${item.permissions}"
												class="col-md-12">
												<option value="${item.getPermissions()}">${item.permissions}</option>
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
								<button type="submit" title="Save" class="button">
									<span>Save</span>
								</button>
								<button type="button" data-dismiss="modal" aria-label="Close"
									class="button primary">Close</button>
							</div>
						</form:form>


					</div>
				</div>
			</div>
		</div>
	</c:forEach>


	<c:forEach var="items" items="${works.content}">
		<div class="modal fade" id="info${items.id}">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">Job Info</div>
					<!-- Modal body -->
					<div class="modal-body">
						<form:form action="updateUsers" modelAttribute="user"
							method="post" id="form-validate">

							<input name="id" type="hidden" value="${items.id}">
						<ul class="form-list">
								<li class="fields">
									<div class="customer-name">
								
										
										
										</div>
										</li>
										</ul>
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<div class="modal fade" id="add-images">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-">
						Add Image <span aria-hidden="true">×</span>
					</h3>
				</div>
				<!-- Modal body -->
				<div class="modal-body">

					<form method="POST" action="addimages"
						enctype="multipart/form-data" id="form-validate">

						<input name="id" type="hidden" value="${user.id}">
						<h5 class="legend">Select Photo</h5>
						<ul class="form-list">
							<li class="fields">
								<div class="customer-name">
									<div class="input-box name-firstname">
										<img id="output_image" class="col-md-8" />
									</div>

									<div class="input-box">
										<div class="input-box1">
											<input type="file" name="file" class="input-text"
												onchange="preview_image(event)" required>

										</div>
									</div>
								</div>
							</li>
						</ul>

						<div class="buttons-set">
							<p class="required">* Required Fields</p>
							<button type="submit" title="Save" class=" btn button">
								<span>Save</span>
							</button>
							<button type="button" data-dismiss="modal" aria-label="Close"
								class=" btn button primary">Close</button>
						</div>
					</form>


				</div>
			</div>

		</div>
	</div>


	<div class="modal fade" id="add-job">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3>Add Job</h3>
				</div>
				<div class="modal-body">
					<form:form action="addwork" modelAttribute="work" method="post"
						id="addjob" target="_self">

						<div class="input-box">
							<label for="jobname">Job Name<em class="required">*</em></label>
							<br>
							<form:input class="input-text required-entry" path="jobname"
								value="" placeholder="Enter Job Name" />
						</div>
						
						
							<div class="input-box">
							<label for="productioncompany">Production Company<em class="required">*</em></label>
							<br>
							<form:input class="input-text required-entry" path="productioncompany"
								value="" placeholder="Enter Production Company Name" />
						</div>


						<div class="row">
							<div class="col">
								<div class="input-box1">
									<label for="startdate">Start Date<em class="required">*</em></label>
									<br>
									<form:input type="text" id="datepicker1" path="startdate"
										placeholder="Enter Start Date" />
								</div>
							</div>
							<div class="col">
								<div class="input-box">
									<label for="enddate">End Date<em class="required">*</em></label>
									<br>
									<form:input type="text" id="datepicker" path="enddate"
										placeholder="Enter End Date" />
								</div>

							</div>
						</div>

						<div class="input-box">
							<label for="jobDescription"> Job Desciption<em
								class="required">*</em></label> <br>
							<form:textarea path="jobDescription"
								placeholder="Enter Job notes" cols="30" rows="5"
								style="resize: none; overflow-y: visible; height: 140px;"></form:textarea>
						</div>

						<div class="input-box">
							<label for="jobNotes">Job Notes<em class="required">*</em></label>
							<br>
							<form:textarea path="jobNotes" placeholder="Enter Job notes"
								cols="30" rows="5"
								style="resize: none; overflow-y: visible; height: 140px;"></form:textarea>
						</div>

						<label for="precisionDriver">Driver</label>
						<select id="inputState" class="form-control">
							<option selected>Choose...</option>
							<option>...</option>
						</select>



						<label for="craneOperator">Crane Operator</label>
						<select id="inputState" class="form-control">
							<option selected>Choose...</option>
							<option>...</option>
						</select>



						<label for="technician">Technician</label>
						<select id="inputState" class="form-control">
							<option selected>Choose...</option>
							<option>...</option>
						</select>


						<label for="packageDriver">State</label>
						<select id="inputState" class="form-control">
							<option selected>Choose...</option>
							<option>...</option>
						</select>


						<button type="submit" class="button my-1">Submit</button>

					</form:form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="equipSearch">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-">Search for Equipment</h3>
				</div>
				<!-- Modal body -->
				<div class="modal-body">

					<form class="form-inline my-2 my-md-0">
						<input class="form-control" type="text"
							placeholder="Enter Equip Name" aria-label="Search">
					</form>


				</div>
			</div>

		</div>
	</div>


	<div class="modal fade" id="addHead" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Head</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form action="addhead" method="POST" modelAttribute="head">

						<div class="input-box">
							<label for="headname">Head Name<em class="required">*</em></label>
							<br>
							<form:input class="input-text required-entry" path="headname"
								value="" placeholder="Enter Head Name" />
						</div>

						<div class="input-box">
							<label for="controlboarversion">Control Board Version<em
								class="required">*</em></label> <br>
							<form:input class="input-text required-entry"
								path="controlboardversion" value=""
								placeholder="Enter Control Board Version" />
						</div>
						<div class="modal-footer">
							<button type="button" class="button" data-dismiss="modal">Close</button>
							<button type="submit" class="button primary">SUBMIT</button>
						</div>
					</form:form>
				</div>

			</div>
		</div>
	</div>


	<div class="modal fade" id="addTrailer" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Trailer</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="button" data-dismiss="modal">Close</button>
					<button type="button" class="button primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="addCrane" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Crane</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="button" data-dismiss="modal">Close</button>
					<button type="button" class="button primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="addTruck" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Truck</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="button" data-dismiss="modal">Close</button>
					<button type="button" class="button primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="addCar" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Car</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="button" data-dismiss="modal">Close</button>
					<button type="button" class="button primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Scripts -->

	<script src="static/assets/js/browser.min.js"></script>
	<script src="static/assets/js/breakpoints.min.js"></script>
	<script src="static/assets/js/util.js"></script>
	<script src="static/assets/js/main.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>

	<script type="text/javascript">

    $(document).ready(function() { 
    	  
        $(function() { 
            $("#datepicker").datepicker({}); 
        }); 

        $(function() { 
            $("#datepicker1").datepicker({}); 
        }); 

        $('#datepicker1').change(function() { 
            startDate = $(this).datepicker('getDate'); 
            $("#datepicker").datepicker("option", "minDate", startDate); 
        }) 

        $('#datepicker').change(function() { 
            endDate = $(this).datepicker('getDate'); 
            $("#datepicker1").datepicker("option", "maxDate", endDate); 
        }) 
        
        
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            localStorage.setItem('activeTab', $(e.target).attr('href'));
        });
        $('a[data-toggle="tab1"]').on('shown.bs.tab', function (e) {
            localStorage.setItem('activeTab1', $(e.target).attr('href'));
        });
  
    }) 
         var activeTab = localStorage.getItem('activeTab');
        if(activeTab){
            $('.nav-tabs a[href="' + activeTab + '"]').tab('show');
        }
          var activeTab1 = localStorage.getItem('activeTab1');
        if(activeTab1){
            $('.nav-tabs a[href="' + activeTab + '"]').tab('show');
        }

		function preview_image(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('output_image');
				output.classList.add("preview");
				output.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
		}
		function confirmed() {
			if (confirm('You are about to delete, Do you want to proceed?')) {
				document.getElementById("del").submit();
				return true;
			} else {
				return false;
			}
		}
		
		$(function() {
			var options = { 
				selectorAttribute: "data-target",
				backToTop: true
			};
			$('.nav-tabs').stickyTabs( options );
		});

		const connect = () => {
		    const Stomp = require("stompjs");
		    var SockJS = require("sockjs-client");
		    SockJS = new SockJS("http://localhost:8080/ws");
		    stompClient = Stomp.over(SockJS);
		    stompClient.connect({}, onConnected, onError);
		  };
		  
		  const onConnected = () => {
			    console.log("connected");

			    stompClient.subscribe(
			      "/user/" + currentUser.id + "/queue/messages",
			      onMessageReceived
			    );
			  };
			  
			  const sendMessage = (msg) => {
				    if (msg.trim() !== "") {
				      const message = {
				        senderId: currentUser.id,
				        recipientId: activeContact.id,
				        senderName: currentUser.name,
				        recipientName: activeContact.name,
				        content: msg,
				        timestamp: new Date(),
				      };
				        
				      stompClient.send("/app/chat", {}, JSON.stringify(message));
				    }
				  };
				  
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
					

				    $(function() {
				        openTabHash(); // for the initial page load
				        window.addEventListener("hashchange", openTabHash, false); // for later changes to url
				    });


				    function openTabHash()
				    {
				        console.log('openTabHash');
				        // Javascript to enable link to tab
				        var url = document.location.toString();
				        if (url.match('#')) {
				            $('.nav-tabs a[href="#'+url.split('#')[1]+'"]').tab('show') ;
				        } 

				        // With HTML5 history API, we can easily prevent scrolling!
				        $('.nav-tabs a').on('shown.bs.tab', function (e) {
				            if(history.pushState) {
				                history.pushState(null, null, e.target.hash); 
				            } else {
				                window.location.hash = e.target.hash; //Polyfill for old browsers
				            }
				        })
				    }
	
				 // opens all tabs down to the specified tab
// 				    var hash = location.hash.split('?')[0];
// 				    if(hash) {
// 				      var $link = $('[href=' + hash + ']');
// 				      var parents = $link.parents('.tab-pane').get();
// 				      $(parents.reverse()).each(function() {
// 				        $('[href=#' + this.id + ']').tab('show') ;
// 				      });
// 				      $link.tab('show');
// 				    }
				    
// 				    $("ul.nav-tabs a").click(function (e) {
// 				    	  e.preventDefault();  
// 				    	    $(this).tab('show');
// 				    	});
// 				    $("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
// 				    	  var id = $(e.target).attr("href").substr(1);
// 				    	  window.location.hash = id;
// 				    	});

// 				    	// on load of the page: switch to the currently selected tab
// 				    	var hash = window.location.hash;
// 				    	console.log("hash",hash);

// 				    	if (hash) {
// 				    	  var target = $(`${hash}`);
// 				    	  var targetLink = $(`#myTab a[href="${hash}"]`);
// 				    	  var parentPanes=[];
// 				    	  target.parentsUntil("body").each(function(){
// 				    	    var $dom=$(this);
// 				    	    if($dom.hasClass("tab-pane")&&$dom.attr("id")){
// 				    	      parentPanes.push($dom.attr("id"));
// 				    	    }    
// 				    	  });
// 				    	  parentPanes.reduceRight(function(pre,parentId){
// 				    	    $(`#myTab a[href="#${parentId}"]`).tab('show');
// 				    	  },"");
// 				    	  targetLink.tab('show');
// 				    	}
				    	
				    				    	
					     $(function () {
					    		 $('#myDashTab li:last-child a').tab('show')
					    	 })
	</script>

</body>
</html>
