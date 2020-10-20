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
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
	   <base href="profile" target="_self">
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
									<c:forEach items="${user.getRoles()}" var="r">
										<span class="badge badge-secondary">${r.role}</span>
									</c:forEach>
								</p>
							</div>


							<div class="nav flex-column nav-pills" id="v-pills-tab"
								role="tablist" aria-orientation="vertical">
								<a class="button" id="v-pills-profile-tab" data-toggle="pill"
									href="#v-pills-profile" role="tab"
									aria-controls="v-pills-profile" aria-selected="true">Profile</a>
								<a class="button" id="v-pills-dashboard-tab" data-toggle="pill"
									href="#v-pills-dashboard" role="tab"
									aria-controls="v-pills-dashboard" aria-selected="true">Dashboard</a>
								<a class="button" id="v-pills-equipment-tab" data-toggle="pill"
									href="#v-pills-equipment" role="tab"
									aria-controls="v-pills-equipment" aria-selected="false"
									href="getAllEquipment">Equipment</a>
								<c:if
									test="${fn:contains(role, 'ADMIN') or fn:contains(role, 'DBA')}">
									<a class="button" id="v-pills-employees-tab" data-toggle="pill"
										href="#v-pills-employees" role="tab"
										aria-controls="v-pills-employees" aria-selected="false"
										onclick="getemployees">Employees</a>

									<a class="button" id="v-pills-customers-tab" data-toggle="pill"
										href="#v-pills-customers" role="tab"
										aria-controls="v-pills-customers" aria-selected="false">Customers</a>
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-8">
						<div class="tab-content" id="v-pills-tabContent">
							<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
								aria-labelledby="v-pills-profile-tab">
								<h1 class="h2">Profile</h1>


								<div class="card">
									<div class="card-body">
										<div class="e-profile">
											<div class="row">

												<div class="mx-auto" style="width: 140px;">
													<div
														class="d-flex justify-content-center align-items-center rounded"
														style="height: 140px; background-color: rgb(233, 236, 239);">
														<c:if test="${not empty user.image}">
															<img
																src="static/img/users/${user.id}/profile/${user.image}"
																style="width: 200px; height: 150px;"
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
														</div>
													</div>
													<div class="text-center text-sm-right">
														<%-- 																<span class="badge badge-secondary">${user.roles}</span> --%>
														<c:forEach items="${user.getRoles()}" var="r">
															<span class="badge badge-secondary">${r.role}</span>
														</c:forEach>
														<div class="text-muted">
															<small>${user.getAddress().getCreatedon()}</small>
														</div>
													</div>
												</div>
											</div>
											<ul class="nav nav-pills">

												<li class="nav-item" role="presentation"><a
													class="button secondary" id="home-tab" data-toggle="tab"
													href="#messages" role="tab" aria-controls="messages"
													aria-selected="false">Messages</a></li>
												<li class="nav-item" role="presentation"><a
													class="button secondary" id="home-tab" data-toggle="tab"
													href="#settings" role="tab" aria-controls="settings"
													aria-selected="false">Edit Profile</a></li>
											</ul>
											<div class="tab-content" id="updatecontact">
												<div class="tab-pane fade" id="settings" role="tabpanel"
													aria-labelledby="settings">
													<form:form action="updatecontact" modelAttribute="address"
														method="post" id="contactinfo" target="_self">
														<div class="fieldset group-select" href="#contactinfo" id="conactinfo">
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
														aria-labelledby="messages">
														<form class="form" novalidate="">


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

							<div class="tab-pane fade show active" id="v-pills-dashboard"
								role="tabpanel" aria-labelledby="v-pills-dashboard-tab">
								<div
									class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
									<h1 class="h2">Dashboard</h1>
									<div class="btn-toolbar mb-2 mb-md-0"></div>

									<ul
										class=" nav nav-tabs align-items-center pt-3 pb-2 mb-3 border-bottom">

										<li class="nav-item dropdown"><a
											class="button dropdown-toggle" href="#" id="dropdown08"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">Pre/Post</a>
											<div class="dropdown-menu" aria-labelledby="dropdown08">
												<a class="dropdown-item" href="#">Crane Op Pre</a> <a
													class="dropdown-item" href="#">Crane Op Post</a> <a
													class="dropdown-item" href="#">Driver Pre</a> <a
													class="dropdown-item" href="#">Driver Post</a> <a
													class="dropdown-item" href="#">Tech Pre</a> <a
													class="dropdown-item" href="#">Tech Post</a>
											</div></li>
										<li class="nav-item dropdown"><a
											class="button dropdown-toggle" href="#" id="dropdown08"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">Reports</a>
											<div class="dropdown-menu" aria-labelledby="dropdown08">
												<a class="dropdown-item" href="#">Incident</a> <a
													class="dropdown-item" href="#">Damage</a> <a
													class="dropdown-item" href="#">Repair Order</a>
											</div></li>

										<li class="nav-item"><a class="button" href="#"
											tabindex="-1" aria-disabled="true">Jobs</a></li>
										<li class="nav-item"><a class="button" href="#"
											tabindex="-1" aria-disabled="true">Work Orders</a></li>

									</ul>
								</div>

							</div>

							<div class="tab-pane fade" id="v-pills-equipment" role="tabpanel"
								aria-labelledby="v-pills-equipment-tab">
								<c:import url="admin"/>
								<ul
									class=" nav nav-tabs align-items-center pt-3 pb-2 mb-3 border-bottom">
									<h1 class="h2">Equipment</h1>
									<li class="nav-item"><a class="button" href="#">Link</a></li>
									<li class="nav-item"><a class="button" href="#"
										tabindex="-1" aria-disabled="true">Disabled</a></li>
									<c:if
										test="${fn:contains(role, 'ADMIN') or fn:contains(role, 'DBA')}">

										<li class="nav-item dropdown"><a
											class="button dropdown-toggle" href="#" id="dropdown08"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">Add Equipment</a>
											<div class="dropdown-menu" aria-labelledby="dropdown08">
												<a class="dropdown-item" href="#" data-toggle="modal" data-target="#addhead">Add Head</a> <a
													class="dropdown-item" href="#">Add Crane</a> <a
													class="dropdown-item" href="#">Add Car</a> <a
													class="dropdown-item" href="#">Add Trailer</a> <a
													class="dropdown-item" href="#">Add Truck</a> <a
													class="dropdown-item" href="#">Add Accessory</a>
											</div></li>
									</c:if>

									<li class="nav-item"><a class="button" href="#"
										data-toggle="modal" data-target="#equipSearch" tabindex="-1"
										aria-disabled="true">Search</a></li>

								</ul>
								Page ${equipment.getNumber()+1} of ${equipment.totalPages}
								showing ${list.content.size()} of all
								${equipment.getTotalElements()} Users
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
										<c:forEach var="item" items="${equipment.content}">
											<tr>
												<td class="a-center hidden-table"></td>
												<td><a href="#" data-toggle="modal"
													data-target="#about${item.id}"><i class="fa fa-user"></i>
														${item.fname} ${item.lname}</a></td>
												<td class="a-center hidden-table">${item.email}<a
													href="deleteByemail?email=${item.email}"><i
														class="fa fa-times"></i></a>

												</td>
												<td class="a-center hidden-table"></td>
												<td><a class="button edit-item" href="#"
													data-toggle="modal" data-target="#edits${item.id}"
													title="Edit User" class="edit-bnt" href="#"><i
														class="fa fa-pencil"></i></a> <a class="button remove-item"
													title="Remove item" href="deleteUser?id=${item.id}"
													onclick="confirmed(); return false;"
													class="btn btn-default"><i class="fa fa-trash"></i></a></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
								Page ${equipment.getNumber()+1} of ${equipment.totalPages}
								showing ${equipment.content.size()} of all
								${equipment.getTotalElements()} Users <br>
							</div>

							<div class="tab-pane fade" id="v-pills-employees" role="tabpanel"
								aria-labelledby="v-pills-employees-tab">
								<a href="admin" class="button">Refresh</a>

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
															id="category" onchange="this.form.submit()" name="role"
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
												<td><a class="button edit-item" href="#"
													data-toggle="modal" data-target="#edits${item.id}"
													title="Edit User" class="edit-bnt" href="#"><i
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




								<c:forEach var="item" items="${list.content}">
									<div class="modal fade" id="edits${item.id}">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">

													Update Info
													<button type="button" data-dismiss="modal"
														aria-label="Close" class="close">
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
																		<form:input type="hidden" path="email"
																			value="${item.email}" class="input-text" />
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
															<button type="button" data-dismiss="modal"
																aria-label="Close" class="btn btn-danger">Close</button>
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
													<button type="button" data-dismiss="modal"
														aria-label="Close" class="close">
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
														<button type="button" data-dismiss="modal"
															aria-label="Close" class="btn btn-danger">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<hr>
							</div>
							<div class="tab-pane fade" id="v-pills-customers" role="tabpanel"
								aria-labelledby="v-pills-customers-tab">...</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>




	<jsp:include page="Components/footer.jsp" />


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
							<button type="submit" title="Save" class="btn btn-info">
								<span>Save</span>
							</button>
							<button type="button" data-dismiss="modal" aria-label="Close"
								class="btn btn-danger">Close</button>
						</div>
					</form>


				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="equipSearch">
		<div class="modal-dialog modal-sm">
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

	<!-- Scripts -->
	<script src="static/assets/js/jquery.min.js"></script>
	<script src="static/assets/js/browser.min.js"></script>
	<script src="static/assets/js/breakpoints.min.js"></script>
	<script src="static/assets/js/util.js"></script>
	<script src="static/assets/js/main.js"></script>
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
		
			<script type="text/javascript"
		src="static/js/jquery.mobile-menu.min.js"></script>
	<script type="text/javascript" src="static/js/cloud-zoom.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript">
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
					

					$(document).ready(() => {
						  let url = location.href.replace(/\/$/, "");
						 
						  if (location.hash) {
						    const hash = url.split("#");
						    $('#myTab a[href="#'+hash[1]+'"]').tab("show");
						    url = location.href.replace(/\/#/, "#");
						    history.replaceState(null, null, url);
						    setTimeout(() => {
						      $(window).scrollTop(0);
						    }, 400);
						  } 
						   
						  $('a[data-toggle="tab"]').on("click", function() {
						    let newUrl;
						    const hash = $(this).attr("href");
						    if(hash == "#home") {
						      newUrl = url.split("#")[0];
						    } else {
						      newUrl = url.split("#")[0] + hash;
						    }
						    newUrl += "/";
						    history.replaceState(null, null, newUrl);
						  });
						});
					

	
	</script>



</body>
</html>