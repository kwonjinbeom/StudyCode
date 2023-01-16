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
@WebServlet("/delete")
public class ChungnamDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String mng_no = request.getParameter("mng_no");
		
		ChungnamVO vo = new ChungnamVO();
		ChungnamDAO dao = ChungnamDAO.getInstance();
		
		vo.setMng_no(Integer.parseInt(mng_no));
		int result = dao.ChungnamDelete(vo);
		  
		if(result==1) {
		    response.sendRedirect("ChungnamServlet"); 
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