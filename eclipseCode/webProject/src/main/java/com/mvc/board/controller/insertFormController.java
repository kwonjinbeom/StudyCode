package com.mvc.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardService;
import com.mvc.board.vo.BoardVO;
import com.mvc.common.controller.Controller;

public class insertFormController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "/board/insertForm";
	}
}