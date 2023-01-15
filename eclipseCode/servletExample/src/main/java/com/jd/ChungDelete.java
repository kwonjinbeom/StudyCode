package com.jd;

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

import com.Chung.ChungDAO;
import com.Chung.ChungVO;

/**
 * Servlet implementation class ChungServlet
 */
@WebServlet("/dele")
public class ChungDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String mng_no = request.getParameter("mng_no");
		
		ChungVO vo = new ChungVO();
		ChungDAO dao = ChungDAO.getInstance();
		
		vo.setMng_no(Integer.parseInt(mng_no));
		int result = dao.ChungDelete(vo);
		  
		if(result==1) {
		    response.sendRedirect("ChungServlet"); 
		}
		else {
			//pass }
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