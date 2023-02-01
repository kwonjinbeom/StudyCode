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
	public boolean boardInsert(BoardVO vo) {
		boolean result = dao.boardInsert(vo);
		return result;
	}
	public void readCount(String num) {
		dao.readCount(num);
	}

	public BoardVO boardDetail(String num) {
		BoardVO vo = dao.boardDetail(num);
		vo.setContent(vo.getContent().toString().replaceAll("\n","<br />"));
		return vo;
	}
	public BoardVO updateForm(String num) {
		BoardVO vo = dao.boardDetail(num);
		return vo;
	}
	public boolean boardUpdate(BoardVO vo) {
		boolean result = dao.boardUpdate(vo);
		return result;
	}
	
	public boolean boardDelete(String num) {
		boolean result = dao.boardDelete(num);
		return result;
	}
	
	public int boardPasswdChk(String num, String passwd) {
		int result = dao.boardPasswdChk(num, passwd);
		return result;
	}
	
	public BoardVO replyForm(String num) {
		BoardVO vo = dao.boardDetail(num);
		return vo;
	}

	public boolean replyInsert(BoardVO vo) {
		boolean result = dao.replyInsert(vo);
		return result;
	}
}