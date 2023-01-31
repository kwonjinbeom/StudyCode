package com.mvc.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class DeleteBoardController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path= null;
		String num = request.getParameter("num"); // 게시글의 글번호
		
		BoardService service = BoardService.getInstance();
		boolean result = service.boardDelete(num);
		
		
		if(result == true) {
			path = "/board/getBoardList.do";
		}else {
			path="/board/insertForm";
			request.setAttribute("errorMsg", "삭제완료에 문제가 있어 잠시 후 다시 입력해 주세요.");
		}
		
		return "/board/getBoardList.do";
	}
}