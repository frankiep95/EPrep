package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.course.Course;

/**
 * Servlet implementation class SchedulerServlet
 */
@WebServlet("/SchedulerServlet")
public class SchedulerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SchedulerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		List<Course> courses = (ArrayList<Course>)session.getAttribute("courses");
		String[] weekdays = request.getParameterValues("weekday"); 
		if(courses == null) {
			courses = new ArrayList<Course>();
		}
		
		Course course = new Course();
		course.setCourseName((String)request.getParameter("courseName"));
		course.setProfessor((String)request.getParameter("professor"));
		course.setStartDate((String)request.getParameter("startDate"));
	//	course.setRoom(Integer.parseInt(request.getParameter("roomNumber")));
		//course.setTime(Integer.parseInt(request.getParameter("time")));
			courses.add(course);
			session.setAttribute("courses", courses);
		   RequestDispatcher rs = request.getRequestDispatcher("course.jsp");
		   rs.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
