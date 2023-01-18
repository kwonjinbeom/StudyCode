package com.jdbc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.Board;
import com.board.BoardDao;


/**
 * Servlet implementation class SubjectInsert
 */
@WebServlet("/boardInsert")
public class BoardWriteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Board vo = new Board();
		BoardDao dao = new BoardDao();
		
		vo.setBoardNum(Integer.parseInt(dao.getBoardNum()));
		vo.setBoardWriter(request.getParameter("boardWriter"));
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardContent(request.getParameter("boardContent"));
		
		BoardService boardService = BoardService.getInstance();
		boolean result = boardService.boardInsert(vo);
		
		if(result) {
			response.sendRedirect("/test0118/boardList");
		} else {
			request.setAttribute("message", "게시글 등록 실패!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("jdbc/error.jsp");
			dispatcher.forward(request, response);
		}	
	}
}