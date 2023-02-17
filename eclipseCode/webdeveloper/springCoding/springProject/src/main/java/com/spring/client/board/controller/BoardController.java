package com.spring.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
//	@GetMapping("/writeForm")
	@RequestMapping(value="/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model) {
		log.info("writeForm 메서드 호출...");
		
		
		return "board/writeForm";
	}
	
//	@GetMapping("/boardInsert")
	@RequestMapping(value="/boardInsert", method = RequestMethod.GET)
	public String boardInsert(BoardVO boardVO) {
		log.info("boardWrite 메서드 호출...");
		
//		같은 페이지에 존재하지 않았따면 아래와 같이 코딩
		int result = 0;
		String path ="";
		result = boardService.boardInsert(boardVO);
		if(result==1) {
			path="/board/boardList";
		}else {
			path="/board/writeForm";
		}
		return "redirect:"+path;
	}
	
//	@GetMapping("/boardDetail")
	@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam("num") String num,Model model) {
		log.info("writeForm 메서드 호출...");
		boardService.readCount(num);
		
		BoardVO data = boardService.boardDetail(num);
		model.addAttribute("detail", data);
		
		return "board/boardDetail";
	}
}
