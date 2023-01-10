package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class calcServlet
 */
//@WebServlet("/calc")
public class calcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String paramNum1 = request.getParameter("num1");
		String paramNum2 = request.getParameter("num2");
		String paramOperator = request.getParameter("operator");
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html>");
		out.println("<head><meta charset='UTF-8' /><title>간단한 연산 프로그램</title>");
		out.println("<link rel='icon' href='data:,'>");
		out.println("<script type='text/javascript'>");
		out.println("window.onload=function(){");
		out.println("};");
		out.println("</script></head>");
		out.println("<body>");
		out.println("<h2>계산결과</h2><hr>");
		if(!(paramNum1.equals("")&& paramNum2.equals("")&& paramOperator.equals(""))) {
			out.println("<span>"+ paramNum1 + "</span>");
			out.println("<span>"+ paramOperator + "</span>");
			out.println("<span>"+ paramNum2 + "</span>");
			out.println("<span>=</span>");
			if(paramOperator.equals("+")) {
				out.println("<span>"+ (Integer.parseInt(paramNum1)+ Integer.parseInt(paramNum2)) + "</span>");
			}else if(paramOperator.equals("-")) {
				out.println("<span>"+ (Integer.parseInt(paramNum1) - Integer.parseInt(paramNum2)) + "</span>");
			}else if(paramOperator.equals("*")) {
				out.println("<span>"+ (Integer.parseInt(paramNum1) * Integer.parseInt(paramNum2)) + "</span>");
			}else if(paramOperator.equals("/")) {
				out.println("<span>"+ (Integer.parseInt(paramNum1) / Integer.parseInt(paramNum2)) + "</span>");
			}
			
		}
		out.println("</body>");
		out.println("</html>");
		
		out.close();
		
	}

}
