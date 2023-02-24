package com.spring.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	
//	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	
//	글목록 구현하기(페이징 처리부분 제외 목록 조회)
//	요청 URL : http://localhost:8080/board/boardList
	
	@RequestMapping(value="/boardList", method = RequestMethod.GET)
//	@GetMapping("/boardList")
	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardList 호출 성공");
		// 전체 레코드 조회
		List<BoardVO> boardList = boardService.boardList(bvo);
		log.info(boardList);
		model.addAttribute("boardList",boardList);
		
		// 전체 레코드수 구현
		int total = boardService.boardListCnt(bvo);
		log.info(total);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(bvo, total));
		return "board/boardList"; // /WEB-INF/views/board/boardList.jsp
	}
	
//	@GetMapping("/writeForm")
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		log.info("writeForm 메서드 호출...");
		
		
		return "board/writeForm";
	}
	
//	@GetMapping("/boardInsert")
	@RequestMapping(value="/boardInsert", method = RequestMethod.POST)
	public String boardInsert(BoardVO bvo, Model model) throws Exception{
		log.info("boardInsert 메서드 호출...");
		
//		같은 페이지에 존재하지 않았다면 아래와 같이 코딩
		int result = 0;
		String path ="";
		result = boardService.boardInsert(bvo);
		if(result==1) {
			path="/board/boardList";
		}else {
			path="/board/writeForm";
		}
		return "redirect:"+path;
	}
	
//	@GetMapping("/boardDetail")
	@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
	public String boardDetail(@ModelAttribute BoardVO bvo, Model model) {
		log.info("writeForm 메서드 호출...");
		boardService.readCount(String.valueOf(bvo.getB_num()));
		
		BoardVO data = boardService.boardDetail(bvo);
		model.addAttribute("detail", data);
		
		
		return "board/boardDetail";
	}
	
//	@GetMapping("/updateForm")
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute BoardVO bvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("b_num = " + bvo.getB_num());
		
		BoardVO updateData = boardService.updateForm(bvo);
		
		model.addAttribute("updateData", updateData);
		
		return "board/updateForm";
	}

	/**
	 * 글수정 구현하기
	 * @param : BoardVO
	 * 참고 : RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에 한번만 사용되는 데이터를
	 * 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다. addFlashAttribute() 메서드는 브라우저까지
	 * 전송되기는 하지만, URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 */

	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO bvo, RedirectAttributes ras) throws Exception {
		log.info("boardUpdate 호출 성공");
		
		int result = 0;
		String url="";
		
		result = boardService.boardUpdate(bvo);  
		ras.addFlashAttribute("boardVO",bvo); // 글번호인 b_num의 값을 유지하기위해서
//		만약 위의 문구를 사용한다면
//		url="/board/boardDetail?b_num=" + bvo.getB_num(); 얘를 사용해서 getB_num을 유지할 필요없이
//		url="/board/boardDetail"; 을 사용해서 유지할 수 있다. 근데 이러면 get방식?
		
		if(result == 1) {
			//아래 url은 수정 후 상세 페이지로 이동
//			url="/board/boardDetail?b_num=" + bvo.getB_num();
			url="/board/boardDetail";
		}else {
//			url="/board/updateForm?b_num=" + bvo.getB_num();
			url="/board/updateForm";
		}
		
		return "redirect:" + url;		
	}
	
	@RequestMapping(value="/boardDelete")
	public String boardDelete(@ModelAttribute BoardVO bvo) throws Exception{
		log.info("boardDelete 호출 성공");
		log.info("삭제할 글번호: " + bvo.getB_num());
		
		//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";
		
		//result = boardService.boardDelete(bvo.getB_num());
		result = boardService.boardDelete(bvo);
		
		if(result == 1) {
			url="/board/boardList";
		}else {
			url="/board/boardDetail?b_num=" + bvo.getB_num();
		}
		
		return "redirect:" + url;
		
		
	}
	
	@ResponseBody //원래 주소에다가 BVO 객체를 넘기는 등으로 사용되는데 현재는 RETURN으로 메서드안에서의 보내고 싶은 내용을 보내려한다. (원래의 RETURN METHOD)이럴 때는
	// RESPONSEBODY 를 사용해야함. 
	/* 근데 이제 둘을 합친게 Controller + Responsebody = RestController 어노테이션이다. Controller는 rest방식을 처리하기 위함을 명시, (기존의 특정한 jsp와 같은
	 * 뷰를 만들어내는 것이 목적이 아닌 rest 방식의 데이터 처리를 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
	 * Responsebody는 일반적인 jsp와 같은 뷰로 전달하는 게 아니라 데이터 자체를 전달하기 위한 용도이다.
	 *  */
	@RequestMapping(value="/boardPasswdChk")
	public String boardPasswdChk(@ModelAttribute BoardVO bvo) throws Exception{
		log.info("boardPasswdChk 호출 성공");
		
		int result = boardService.boardPasswdChk(bvo);
		
		
		/*String url = "";
		 * if(result == 1) {
			url="/board/boardList";
		}else {
			url="/board/boardDetail?b_num=" + bvo.getB_num()+"&b_pwd=" + bvo.getB_pwd();
		}
		
		return "redirect:" + url;*/
		return String.valueOf(result);
		
	}
	

	
	
}
