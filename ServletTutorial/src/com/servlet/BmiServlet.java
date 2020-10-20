package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.Student;

/**
 * Servlet implementation class BmiCalculator
 */
@WebServlet("/BMIServlet")
public class BmiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double height =  Double.parseDouble(request.getParameter("height"));
		double weight = Double.parseDouble(request.getParameter("weight"));
		
		weight = weight * 0.45;
		height = height * 0.025;
		height = height * height;
		double BMI = weight/height;
		
        HttpSession session = request.getSession(true);
        Student student = (Student)session.getAttribute("student");
        
		student.setBMI(BMI);
		
        RequestDispatcher rs = request.getRequestDispatcher("account.jsp");
        rs.forward(request,response);  
		
	}

}
