package com.mvc.board.service;

import java.util.ArrayList;

import com.mvc.board.dao.BoardDAO;
import com.mvc.board.vo.BoardVO;

public class BoardService {
	private static BoardService service = null;
	
	private BoardDAO dao = BoardDAO.getInstance();
	
	private BoardService(){ }
	public static BoardService getInstance() {
		if(service == null) {
			service = new BoardService();
		}
		return service;
	}

	public ArrayList<BoardVO> boardList() {
		ArrayList<BoardVO> list = dao.boardList();
		return list;
	}
	
}