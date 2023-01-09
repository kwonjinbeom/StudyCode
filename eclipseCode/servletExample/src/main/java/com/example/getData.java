package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServlet
 */
//@WebServlet("/getData")
public class getData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String paramName = request.getParameter("name");
		String paramAddress= request.getParameter("Address");
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html>");
		out.println("<head><meta charset='UTF-8' /><title>POST DATA</title>");
		out.println("<link rel='icon' href='data:,'>");
		out.println("<script type='text/javascript'>");
		out.println("window.onload=function(){");
		out.println("let backPage = document.getElementById('btn')");
		out.println("backPage.onclick=function(){");
		out.println("history.back()};");
		out.println("};");
		out.println("</script></head>");
		out.println("<body>");
		out.println("<h2 style='text-align:center'>POST 방식 테스트입니다.</h2><ul>");
		if(!(paramName.equals("")&& paramAddress.equals(""))) {
			out.println("<li>입력한 이름 : " + paramName + "</li>");
			out.println("<li>입력한 주소 : " + paramAddress + "</li>");
			
		}
//		out.println("<a href='#' id = 'btn' onclick='histoy.back()'>이전페이지</a>");
		out.println("<a href='#' id = 'btn'>이전 페이지</a>");
		out.println("</ul></body>");
		out.println("</html>");
		
		out.close();
		
	}

}
