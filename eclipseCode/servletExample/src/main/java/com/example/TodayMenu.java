package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TodayMenu
 */
//@WebServlet("/todayMenu")
public class TodayMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String[] lunchList = request.getParameterValues("lunch");
		
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html>");
		out.println("<head><meta charset='UTF-8' /><title>POST DATA(2)</title>");
		out.println("<link rel='icon' href='data:,'>");
		out.println("<script type='text/javascript'>");
		out.println("window.onload=function(){");
		out.println("let backPage = document.getElementById('btn')");
		out.println("backPage.onclick=function(){");
		out.println("history.back() };");
		out.println("};");
		out.println("</script></head>");
		out.println("<body>");
		out.println("<h2 style='text-align:center'>select를 이용한 데이터의 POST 전송방식 테스트입니다.</h2><ul>");
		if(lunchList.length!=0){
			int i = 1;
			for(String lunch : lunchList){
				if(lunch!=null) {
					out.println("<li>"+i+"번째 선택한 점심 메뉴: "+ lunch + "</li>");
					i++;
				}
			}
		}
		out.println("<a href='#' id='btn'>이전 페이지</a>");
		out.println("</ul></body>");
		out.println("</html>");
		
		out.close();
	}

}
