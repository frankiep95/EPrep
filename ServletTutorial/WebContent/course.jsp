<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<title>Courses</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	type="text/javascript"></script>

<style type="text/css">
.weekDays-selector input {
	display: none !important;
}

.weekDays-selector input[type=checkbox]+label {
	display: inline-block;
	border-radius: 6px;
	background: #dddddd;
	height: 40px;
	width: 30px;
	margin-right: 3px;
	line-height: 40px;
	text-align: center;
	cursor: pointer;
}

.weekDays-selector input[type=checkbox]:checked+label {
	background: #2AD705;
	color: #ffffff;
}
</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Scheduler</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="account.jsp">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div style="margin-top: 100px"></div>
		<div style="width: 300px">

			<br> <br>
			<form action="SchedulerServlet" method="get">
				Professors <select class="form-control" name="professor">
					<option value="John White">John White</option>
					<option value="Michael Brown">Michael Brown</option>
					<option value="Tina Doe">Tina Doe</option>
					<option value="Emily Winter">Emily Winter</option>
					<option value="Christine Summer">Christine Summer</option>
				</select> <br> <select class="form-control" name="courseName">
					<option value="csharp">C#</option>
					<option value="cpp">C++</option>
					<option value="c">C</option>
					<option value="ruby">Ruby on Rails</option>
					<option value="php">PHP</option>
					<option value="SQL">SQL</option>
					<option value="javascript">JavaScript</option>
				</select><br>

				<div class="weekDays-selector" >
					<input type="checkbox" name="weekday" value="MONDAY"
						id="weekday-mon" class="weekday" /> <label for="weekday-mon">M</label>
					<input type="checkbox" name="weekday" value="TUESDAY"
						id="weekday-tue" class="weekday" /> <label for="weekday-tue">T</label>
					<input type="checkbox" name="weekday" value="WEDNESDAY"
						id="weekday-wed" class="weekday" /> <label for="weekday-wed">W</label>
					<input type="checkbox" name="weekday" value="THURSDAY"
						id="weekday-thu" class="weekday" /> <label for="weekday-thu">T</label>
					<input type="checkbox" name="weekday" value="FRIDAY"
						id="weekday-fri" class="weekday" /> <label for="weekday-fri">F</label>
				</div>
				<div class="form-group">
					<label for="roomNumber">Room Number</label> <input type="number"
						class="form-control" id="roomNumber" name="roomNumber" aria-describedby="roomNumber"
						placeholder="Enter Room Number">
				</div>
				<div class="form-group">
					<label for="time">Time</label> <input type="time"
						class="form-control" id="time" aria-describedby="time" name="time"
						placeholder="enter time as 0830">
				</div>
				<br>
				<p>
					Date: <input type="date" id="startDate">
				</p>
				<button type="submit">add course</button>
			</form>

			<c:if test="${courses != null}">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Course Name</th>
							<th>Professor Name</th>
<!-- 							<th>Room Number</th> -->
<!-- 							<th>Start Date</th> -->
<!-- 							<th>Time</th> -->
						</tr>
						<c:forEach var="course" items="${courses}">
							<tr>
								<td><c:out value="${course.courseName}" /></td>
								<td><c:out value="${course.professor}" /></td>
<%-- 								<td><c:out value="${course.roomNumber}" /></td> --%>
<%-- 								<td><c:out value="${course.startDate}" /></td> --%>
<%-- 								<td><c:out value="${course.time}" /></td> --%>
<%-- 								<td><c:forEach var="day" items="${course.occurences}">> --%>
									</c:forEach></td>
							</tr>


					</table>
				</div>
			</c:if>
		</div>
	</div>

</body>
</html>
