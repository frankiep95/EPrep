package com.servlet;

import com.user.Address;
import com.user.Student;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		Student student = new Student();

       student.setEmail(request.getParameter("email"));
       student.setFirstName(request.getParameter("firstName"));
       student.setLastName(request.getParameter("lastName"));
       student.setPassword(request.getParameter("password"));
       student.setSchoolName("Claim Academy");
	
       Address address = new Address();
       address.setStreet(request.getParameter("street"));
       address.setCity(request.getParameter("city"));
       address.setState(request.getParameter("state"));
       address.setZipCode(request.getParameter("zipCode"));
       
       student.setAddress(address);
       
       HttpSession session = request.getSession(true);
       session.setAttribute("student", student);
	     
	   RequestDispatcher rs = request.getRequestDispatcher("account.jsp");
	   rs.forward(request,response);
	}

}
