package com.spring.example.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.example.domain.SampleDTO;

import lombok.extern.log4j.Log4j;



@Controller
@RequestMapping("/sample/*")   // 요청 URL에 /sample 이 들어가면 반드시 이 컨트롤러가 실행된다.
@Log4j
public class SampleController {
	@RequestMapping(value = "/start", method = {RequestMethod.GET, RequestMethod.POST})
	public void basicGet() {
		log.info("/sample/start get....................");
		// 무조건 /sample/start -> /WEB-INF/views/sample/start.jsp
	}
	
//	요청방법 : http://localhost:8080/sample/basic
	@RequestMapping(value = "/basic", method = RequestMethod.GET)
	public String basicGet1() {
		log.info("basic get....................");
		return "basic"; // /WEB-INF/views/basic.jsp를 의미
	}
	
//	사용 예시 
//	@RequestMapping("/test")
//	public String test() {
//		return "test"; // /WEB-INF/views/test.jsp
//		return "sample/test"; // /WEB-INF/views/sample/test.jsp
//	}
	
//	요청방법 : http://localhost:8080/sample/exam01?name=홍길동&age=25
	// @RequestMapping(value="/exam01", method = RequestMethod.GET)
	@GetMapping("/exam01")
	public String exam01(@RequestParam("name") String name, @RequestParam("age") int age, Model model) {
//		RequestParam("name") 생략 가능, 
//		age는 request.getParameter와 parseInt까지 스프링이 다해줘서 생략가능.
		log.info("name: " + name);
		log.info("age: " + age);
		
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		return "exam01"; // /WEB-INF/views/exam01.jsp를 의미
	}
	
	/* 요청방법: http://localhost:8080/sample/exam02?name=홍길동&age=25 */
	@GetMapping("/exam02")
	public String exam02(@ModelAttribute SampleDTO dto, Model model) {
//		기존에 SampleDTO에 request.getparameter로 받아와 set시켜서 dto 인스턴스를 전송했다면
//		스프링에서 ModelAttribute가 전부 다해준다. 그 대신 필드명과 변수명?이 일치해야 하는게 규칙이라함.
		log.info("" + dto);
		
		model.addAttribute("dto",dto);
//		model.addAttribute("dto",dto);를 주석해도 form에서 sampleDTO.name으로 사용할 수 있음
//		왜냐하면 위에 과정에서 이미 set이 이루어 졌기 때문에
		return "exam02"; // /WEB-INF/views/exam02.jsp를 의미
	}
	
	@GetMapping("/exam02List")
	public String exam02List(@RequestParam("language") ArrayList<String> language, Model model) {
		
		model.addAttribute("language",language);
		return "exam02List"; // /WEB-INF/views/exam02List.jsp를 의미
	}
}
