package com.forward.dispatcher;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/firstDispatcher") 
public class FirstDispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset = utf-8");
			request.setAttribute("lauguage", "java");
			request.setAttribute("name", "홍길동");
			request.setAttribute("address", "서울특별시 강남구 테헤란로14길 6");
			RequestDispatcher dispatch = request.getRequestDispatcher("secondDispatcher");
//			내가 쓴 답
			//			RequestDispatcher dispatch = request.getRequestDispatcher("secondDispatcher?language=java&name=jinbeom&address=Seoul");
			
			dispatch.forward(request, response);
			
		}


}
