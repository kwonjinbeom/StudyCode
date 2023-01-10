package com.forward.rediect;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/secondRedirect") 
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset = utf-8");
			PrintWriter out = response.getWriter();
			
			String name = request.getParameter("name");
			
			out.println("<!DOCTYPE html><html>");
			out.println("<head><meta charset='UTF-8' />");
			out.println("<title>redirect 예제</title>");
			out.println("<link rel='icon' href='data:,'></head>");
			out.println("<body><div>sendRedirect를 이용한 refresh 실습입니다.</div>");
			out.println("<div>이름 : " + name + "</div>");
			out.println("</body></html>");
			
		}


}
