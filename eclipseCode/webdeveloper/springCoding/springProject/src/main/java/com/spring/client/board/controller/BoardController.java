package com.spring.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	
//	글목록 구현하기(페이징 처리부분 제외 목록 조회)
//	요청 URL : http://localhost:8080/board/boardList
	
	@RequestMapping(value="/boardList", method = RequestMethod.GET)
//	@GetMapping("/boardList")
	public String boardList(Model model) {
		log.info("boardList 호출 성공");
		// 전체 레코드 조회
		List<BoardVO> boardList = boardService.boardList();
		model.addAttribute("boardList",boardList);
		return "board/boardList"; // /WEB-INF/views/board/boardList.jsp
	}
}
