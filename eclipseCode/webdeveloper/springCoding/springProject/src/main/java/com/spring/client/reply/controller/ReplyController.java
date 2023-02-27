package com.spring.client.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.reply.service.ReplyService;
import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/***************************************************************************************
 * 참고 : REST(Representational State Transfer)의 약어로 
 *      하나의 URI는 하나의 고유한 리소스를 대표하도록 설계된다는 개념이다. 
 *      즉 REST방식은 특정 URL는 반드시 그에 상응하는 데이터 자체라는 것을 의미하는 방식이다. 
 *      /member/join => GET(회원가입화면) /member/join => POST
 *      예를 들어 'board/125'은 게시물 중에서 125번이라는 고유한 의미를 가지도록 설계하고, 
 *      이에 대한 처리는 GET, POST 방식과 같이 추가적인 정보를 통해서 결정한다.
 *      http://localhost:8080/board/boardDetail?b_num=4
 *      http://localhost:8080/board/4  => GET
 *      
 *      http://localhost:8080/board/boardDelete?b_num=4 
 *      http://localhost:8080/board/4  => DELETE
 *      
 *      주고받는 자원(Resource)에 이름을 규정하고 URI에 명시해 HTTP 메서드(GET조회, POST입력, PUT수정, DELETE삭제)를 
 *      통해 해당 자원의 상태를 주고 받는 것을 의미.
 ***************************************************************************************/


/***************************************************************************************
 * 참고 : @RestController (@Controller + @ResponesBody)
 * Controller가 REST 방식을 처리하기 위한 것임을 명시. (기존의 특정한 JSP와 같은 뷰를 만들어 
 * 내는 것이 목적이 아닌 REST 방식의 데이터 처리를 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
 * @ResponesBody: 일반적인 JSP와 같은 뷰로 전달되는 게 아니라 데이터 자체를 전달하기 위한 용도이다.
 * @PathVariable: URL 경로에 있는 값을 파라미터로 추출하려고 할 때 사용한다.
 * name=value&name1=value1
 * @RequestBody: JSON 데이터를 원하는 타입으로 바인딩 처리한다.{name:value}
 ***************************************************************************************/

@RestController
@RequestMapping(value="/replies")
@Log4j
public class ReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;
	
	@GetMapping(value = "/all/{b_num}", produces =MediaType.APPLICATION_JSON_VALUE)
	public List<ReplyVO> replyList(@PathVariable("b_num") Integer b_num){
		log.info("list 호출 성공");
		
		List<ReplyVO> entity = null;
		entity = replyService.replyList(b_num);
		return entity;
	}

	/* 댓글 글쓰기 구현하기
	 * @return String
	 * 참고 : @RequestBody: JSON 데이터를 원하는 타입으로 바인딩 처리한다.{name:value}
	 * 		consumes 속성을 이용하면 사용자가 Request Body에 담는 타입을 제한할 수 있으며
	 * 		만약 요청 데이터가 JSON이라면 요청시 헤더에 반드시 application/json이 존재해야 한다.
	 * 
	 * 		produces 속성을 추가하고 dataType을 지정하면 해당 데이터타입으로만
	 * 		사용자에게 응답하겠다는 의미로 해석하면 된다.
	 * 	현재 요청URL: http://localhost:8080/replies/replyInsert
	 * 
	 * result값이 1일 경우 "SUCCESS문자와 200의 응답코드를 전송하고, 1이 아닐경우 서버측 에러코드(500)를 전송.
	 * return (result==1) ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	 * 						new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	 **/
	
	@PostMapping(value = "/replyInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String replyList(@RequestBody ReplyVO rvo){
		log.info("replyInsert 호출 성공");
		log.info("ReplyVO : " + rvo);
		int result = 0;
		
		result = replyService.replyInsert(rvo);
		return (result==1) ? "SUCCESS" : "FAILURE";

	}
}
