package com.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chungnam.ChungnamDAO;
import com.chungnam.ChungnamVO;

/**
 * Servlet implementation class ChungnamServlet
 */
@WebServlet("/insert")
public class ChungnamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		
		ServletContext context = getServletContext();
		List<String> member = (List<String>) context.getAttribute("member");
		ChungnamDAO dao = ChungnamDAO.getInstance();
		ArrayList<ChungnamVO> list = dao.getChungnamList();
		ArrayList<Integer> mng_no_list = new ArrayList<Integer>();
		
		int counter = list.size();
		
//		새로 작성한 부분
		String mng_no = request.getParameter("mng_no");
		for(int i = 0; i < counter; i++) {
			ChungnamVO cvo = list.get(i);
			mng_no_list.add(cvo.getMng_no());
		}
		System.out.println(mng_no_list);
//		새로 작성한 부분 끝
		out.println("<!DOCTYPE html><html>");
		out.println("<head><meta charset='UTF-8' />");
		out.println("<title>Chungnam 정보 리스트 예제</title>");
		out.println("<link rel='stylesheet' type='text/css' href='/servletExample/css/chungnam.css' />");
		out.println("<link rel='icon' href='data:,'>");
		out.println("<script type='text/javascript' src='/servletExample/js/jquery-3.6.2.min.js'></script>");
		out.println("<script type='text/javascript'>");
		out.println("function deleteMethod(val){");
		out.println("location.href = 'servletExample/delete?mng_no='+val;");
		out.println("}</script>");
		
		out.println("</head>");
		out.println("<body><h1 class='title'>충남관광 - 관광명소</h1>");
		out.println("<div class='btn'><a href='/servletExample/jdbc/chungnamForm.jsp'>정보등록</a></div>");
		out.println("<ul id='list'>");
		if (counter > 0) {
			// for(int i=0; i < counter; i++) { // 인덱스 접근 시
			// ChungnamVO cvo = list.get(i);
//			for( ChungnamVO cvo : list ) {
			for (int i = 0; i < counter; i++) {
				ChungnamVO cvo = list.get(i);
				out.println("<li class='item' data-no='" + cvo.getMng_no() + "'>");
				out.println("<span class='item-thumb'><img src='" + cvo.getList_img() + "' /></span>");
				out.println("<span class='text'>");
				out.println("<span class='item-type'>" + cvo.getType() + "</span>");
				out.println("<span class='item-title'>" + cvo.getNm());
				out.println("<input type='button' value ='삭제' onclick='deleteMethod("+cvo.getMng_no()+")'>");
				out.println("</span>");
				out.println("<span class='item-sub'>" + cvo.getNm_sub() + "</span>");
				out.println("<span class='item-content'>" + cvo.getDescription() + "</span>");

				out.println("</li>");
			}
		}
		int cvo2_index = dao.chungnamInsert(mng_no_list, mng_no);
		
		if (cvo2_index != 0) {
			dao.arr.add(cvo2_index);
			System.out.println(dao.arr);
			for(int j = 0; j < dao.arr.size(); j++) {
				ChungnamVO cvo3 = list.get(dao.arr.get(j));
				out.println("<li class='item' data-no='" + cvo3.getMng_no() + "'>");
				out.println("<span class='item-thumb'><img src='" + cvo3.getList_img() + "' /></span>");
				out.println("<span class='text'>");
				out.println("<span class='item-type'>" + cvo3.getType() + "</span>");
				out.println("<span class='item-title'>" + cvo3.getNm());
				out.println("<input type='button' value ='삭제' onclick='deleteMethod("+cvo3.getMng_no()+")'>");
				out.println("</span>");
				out.println("<span class='item-sub'>" + cvo3.getNm_sub() + "</span>");
				out.println("<span class='item-content'>" + cvo3.getDescription() + "</span>");
				
				out.println("</li>");
				
			}
			return;
		}  
			
		

		out.println("</ul>");
		out.println("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { doGet(request, response); }
		 */

}