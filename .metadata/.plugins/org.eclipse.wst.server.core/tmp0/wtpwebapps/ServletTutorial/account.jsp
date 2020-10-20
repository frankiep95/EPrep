<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.user.Student" %>
    
<%Student student = (Student) session.getAttribute("student"); %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>account</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Account Home</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="course.jsp">Scheduler</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div> 
      </div>
    </nav>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Hello, <%  out.print(student.getFirstName());  %></h1>
        <p>This is a simple java servlet program for a functional website. </p>
      </div>
    </div>
    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>My GPA </h2>
          <p><%  out.print(student.getGpa());  %></p>
          <h2> MY BMI</h2>
          <p><%out.print(student.getBMI());  %>
          <h2> Taxes Due</h2>
          <p>$<%out.print(student.getTaxDue());  %>
</div>        
        <div class="col-md-4">
          <h2>Enter Grades </h2>
           <form action="GpaServlet" method="post">
           <div class="form-group">
    <label for="gradeOne">GradeOne</label>
    <input type="text" class="form-control" name="gradeOne" id="gradeOne" placeholder="Grade One">
  </div>
  <div class="form-group">
    <label for="gradeTwo">Grade Two</label>
    <input type="text" class="form-control" name="gradeTwo" id="gradeTwo" placeholder="Grade Two">
  </div>
  <div class="form-group">
    <label for="gradeThree">Grade Three</label>
    <input type="text" class="form-control" name="gradeThree" id="gradeThree" placeholder="Grade Three">
  </div>        
             <button type="submit" class="btn btn-default">Submit</button>  
                      
           </form>   
           <h2>Enter Height and Weight</h2> 
           <form action="BMIServlet" method="post">
             <div class="form-group">
    <label for="Height">Height</label>
    <input type="text" class="form-control" name="height" id="height" placeholder="INCHES">
  </div>
  <div class="form-group">
    <label for="weight">Weight</label>
    <input type="text" class="form-control" name="weight" id="weight" placeholder="POUNDS">
  </div>        
             <button type="submit" class="btn btn-default">Calculate</button>  
           </form> 
          
           <h1> Income Tax Calculator</h1>
           <h2> Enter income information</h2>
    <form action="IncomeTaxServlet" method="post">
  <div class="form-group">
    <label for="income">Income</label>
    <input type="text" class="form-control" name="income" id="income" placeholder="80,0000">
  </div>
 <label for="status">Filing Status</label><br>
<select class="custom-select" size="3" name="status" id="status">
  <option value="1" selected>Single</option>
  <option value="2">Married</option>
  <option value="3">Head of Household</option>
</select><br>
       
             <button type="submit" class="btn btn-default">Calculate Income Tax</button> 
           
           </form>  

         </div>        
      <hr>
      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->
    </div>
</body>
</html>