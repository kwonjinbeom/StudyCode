//package com.jdbc;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.chungnam.ChungnamDAO;
//import com.chungnam.ChungnamVO;
//
///**
// * Servlet implementation class ChungNamServlet
// */
//@WebServlet("/ChungnamServlet")
//public class SubjectServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		response.setContentType("text/html;charset=UTF-8");
//		response.sendRedirect("view");
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
////		PrintWriter out = response.getWriter();
////		request.setCharacterEncoding("UTF-8");
////		
////
////		ChungnamDAO dao = ChungnamDAO.getInstance();
////		ArrayList<ChungnamVO> list = dao.getChungnamList();
////		
////		int counter = list.size(); 
////		
////		out.println("<!DOCTYPE html><html>");
////		out.println("<head><meta charset='UTF-8' />");
////		out.println("<title>Chungnam 정보 리스트 예제</title>");
////		out.println("<link rel='stylesheet' type='text/css' href='/servletExample/css/chungnam.css' />");
////		out.println("<link rel='icon' href='data:,'>");
////		out.println("<script type='text/javascript' src='/servletExample/js/jquery-3.6.2.min.js'></script>");
////		out.println("<script type='text/javascript'>");
////		out.println("$(document).on('click','#delBtn',function(){");
////		out.println("const mngVal = $(this).parents('li').data('no')");
////		out.println("location.href='delete?mng_no='+mngVal");
////		out.println("})</script>");
////		
////		out.println("</head>");
////		out.println("<body><h1 class='title'>충남관광 - 관광명소</h1>");
////		out.println("<div class='btn'><a href='/servletExample/jdbc/chungnamForm.jsp'>정보등록</a></div>");
////		out.println("<ul id='list'>");
////		if (counter > 0) {
////			// for(int i=0; i < counter; i++) { // 인덱스 접근 시
////			// ChungNamVO cvo = list.get(i);
////			for( ChungnamVO cvo : list ) {
////				out.println("<li class='item' data-no='" + cvo.getMng_no() + "'>");
////				out.println("<span class='item-thumb'><img src='" + cvo.getList_img() + "' /></span>");
////				out.println("<span class='text'>");
////				out.println("<span class='item-type'>" + cvo.getType() + "</span>");
////				out.println("<span class='item-title'>" + cvo.getNm());
////				out.println("<input type='button' value ='삭제' id = 'delBtn'>");
////				out.println("</span>");
////				out.println("<span class='item-sub'>" + cvo.getNm_sub() + "</span>");
////				out.println("<span class='item-content'>" + cvo.getDescription() + "</span>");
////
////				out.println("</li>");
////			}
////		}
////		
////
////		out.println("</ul>");
////		out.println("</body></html>");
////		out.close();
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 *//*
//		 * protected void doPost(HttpServletRequest request, HttpServletResponse
//		 * response) throws ServletException, IOException { doGet(request, response); }
//		 */
//
//}