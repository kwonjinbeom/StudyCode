package com.mvc.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class GetBoardListController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardService service = BoardService.getInstance();
		// 검색 부분 제외하고 게시판 리스트 보여주기 위한 요청
		// ArrayList<BoardVO> list = service.boardList():
		
		// 게시판 레코드 검색 시 검색할 대상과 단어를 인자값으로 전달
		String search = request.getParameter("search");
		//최초 요청 시 null 값 처리
		if(search==null) {
			search="all"; // search값이 all 이면 전체 조회
		}
		
		BoardVO vo = new BoardVO();
		vo.setSearch(search);
		vo.setKeyword(request.getParameter("keyword"));
		
		ArrayList<BoardVO> list = service.boardList(vo);
		
		request.setAttribute("list", list);
		//jsp 페이지에서 사용방법은 ${requestScope.list}
		
		return "/board/getBoardList";
	}
}