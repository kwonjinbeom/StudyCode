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
 * Servlet implementation class ChungNamServlet
 */
@WebServlet("/insert")
public class ChungnamInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int mng_no = Integer.parseInt(request.getParameter("mng_no"));
		String local_nm = request.getParameter("local_nm");
		String type = request.getParameter("type");
		String nm = request.getParameter("nm");
		String nm_sub = request.getParameter("nm_sub");
		String addr = request.getParameter("addr");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		String description = request.getParameter("description");
		String list_img = request.getParameter("list_img");
		
		ChungnamVO vo = new ChungnamVO(mng_no, local_nm, type, nm, nm_sub, addr, lat, lng, description, list_img);
		ChungnamDAO dao = ChungnamDAO.getInstance();
		int result = dao.ChungnamInsert(vo);
		
		if(result==1) {
			response.sendRedirect("ChungnamServlet");
		}else {
			//pass
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { doGet(request, response); }
		 */

}