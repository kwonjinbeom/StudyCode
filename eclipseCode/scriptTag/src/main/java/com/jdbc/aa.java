package com.jdbc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.subject.SubjectVO;

/**
 * Servlet implementation class aa
 */
@WebServlet("/aa")
public class aa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubjectService subjectservice = SubjectService.getInstance();
		ArrayList<SubjectVO> list = subjectservice.subjectList(null);
		
		request.setAttribute("list",list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jdbc/subjectForm.jsp");
		dispatcher.forward(request, response);
		
	}


}
