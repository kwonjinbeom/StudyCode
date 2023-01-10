package com.forward.rediect;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/firstRedirect") 
public class FirstRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset = utf-8");
			
			//같은 context명을 사용하기에 생략 가능.
			// response.sendRedirect(" /servletExample/secondRedirect?name=Younghee");
			response.sendRedirect("secondRedirect?name=Younghee");
			
		}


}
