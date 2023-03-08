package com.spring.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.admin.board.service.AdminBoardService;
import com.spring.admin.login.controller.AdminLoginController;
import com.spring.admin.login.sevice.AdminLoginService;
import com.spring.admin.login.vo.AdminLoginVO;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminBoardController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminBoardService adminBoardService;
	
	@RequestMapping("/board/boardList")
	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("admin boardList 호출 성공");
		//리스트 조회
		List<BoardVO> boardList = adminBoardService.boardList(bvo);
		model.addAttribute("boardList",boardList);
		
		// 전체 레코드수 조회
		int total = adminBoardService.boardListCnt(bvo);
		model.addAttribute("pageMaker", new PageDTO(bvo, total));
		
		// 리스트 번호 부여를 위한 속성
		int count = total - (bvo.getPageNum()-1) * bvo.getAmount();
		model.addAttribute("count", count);
		
		return "admin/board/boardList"; // /WEB-INF/views/admin/board/boardList.jsp
		
	}
}
