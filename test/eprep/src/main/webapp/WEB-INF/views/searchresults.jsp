<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
			<div class="col-lg-10 text-center ">
              <h3>${msg}  </h3>
              <p>Users</p>
              
              <table class="table table-bordered">
                <tr class="text-info">
					 <th>#</th>
					 <th>Name</th>
					 <th>Email</th>
					 <th>Roles</th>
					 <th>Action</th>
			    </tr>
			    <c:forEach var="item" items="${list}">
				<tr class="text-body">
					<td>${list.indexOf(item)+1}.</td>	
					<td>${item.fname} ${item.lname}</td>	
					<td>${item.email}</td>	
					<td>
					<form method="POST" action="editrole" >		    									
							<input type="hidden" name="id" value="${item.id}" />		    	 
							<select onchange="this.form.submit()" name="role" class="form-control">
							<option value="${item.role}">${item.role}</option>
							<option value="USER">USER </option>
							<option value="DBA">DBA</option>
							<option value="ADMIN">ADMIN</option>												  
						 </select>												
					 </form>
					</td>
					<td>
					<a href="removeuser?id=${item.id}" onclick="confirmed(); return false;" title="Delete member ${item.fname} ${item.lname}" class="btn btn-danger"> <i class="fa fa-trash"></i></a>
                    </td>
	
				</tr>
				</c:forEach>
				<tbody>
				</tbody>
				</table>
            </div>
            
</body>
</html>