package com.mvc.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class test0206_loginFormController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("id"); // 게시글의 글번호
		String passwd = request.getParameter("pw");  
		
		BoardService service = BoardService.getInstance();
		int result = service.boardPasswdChk(num, passwd);
		
		request.setAttribute("resultData", result);
		
		return "/common/resultData";
	}
}