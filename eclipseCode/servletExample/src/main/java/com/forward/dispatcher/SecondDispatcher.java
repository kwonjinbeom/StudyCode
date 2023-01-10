package com.forward.dispatcher;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/secondDispatcher") 
public class SecondDispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset = utf-8");
			PrintWriter out = response.getWriter();
			/*
			 * String language = request.getParameter("language"); String name =
			 * request.getParameter("name"); String address =
			 * request.getParameter("address");
			 */
			String language = (String)request.getAttribute("language");
			String name = (String)request.getAttribute("name");
			String address = (String)request.getAttribute("address");
			
			out.println("<!DOCTYPE html><html>");
			out.println("<head><meta charset='UTF-8' />");
			out.println("<title>dispatcher 예제</title>");
			out.println("<link rel='icon' href='data:,'></head>");
			out.println("<body><div> 우리가 배운 언어 : " + language + "</div>");
			out.println("<div> 이름 : " + name + "</div>");
			out.println("<div> 주소 : " + address + "</div>");
			out.println("</body></html>");
			
		}


}
