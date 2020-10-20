package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.IncomeTax;
import com.user.Student;

/**
 * Servlet implementation class IncomeTaxServlet
 */
@WebServlet("/IncomeTaxServlet")
public class IncomeTaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	       HttpSession session = request.getSession(true);
	        Student student = (Student)session.getAttribute("student");
	        
	        IncomeTax taxinfo = new IncomeTax();
	        taxinfo.setIncome(Double.parseDouble(request.getParameter("income")));
	        taxinfo.setStatus(Integer.parseInt(request.getParameter("status")));
	        taxinfo.calculateTaxes();
			student.setIncomeTax(taxinfo);
			student.setTaxDue(taxinfo.getTaxDue());
			
	        RequestDispatcher rs = request.getRequestDispatcher("account.jsp");
	        rs.forward(request,response);  
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		HttpSession session = request.getSession(true);
		String selected = request.getParameter("selected");
		session.setAttribute("selected", selected);
		RequestDispatcher rs = request.getRequestDispatcher("viewDetails");
				rs.forward(request, response);
	}

}
