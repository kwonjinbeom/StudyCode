package com.spring.example.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.example.domain.ExampleVO;
import com.spring.example.domain.SampleDTO;
import com.spring.example.domain.SampleDTOList;
import com.spring.example.domain.Ticket;

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
	
	@GetMapping("/exam02Array")
	public String exam02Array(@RequestParam("hobby") String[] hobby, Model model) {
		log.info("array hobby: " + Arrays.toString(hobby));
		model.addAttribute("hobby", hobby);	
		
		return "exam02Array"; // /WEB-INF/views/exam02Array.jsp를 의미.
	}
	
	@GetMapping("/exam02Bean")
	public String exam02Bean(SampleDTOList list) {
			log.info("list dtoList: " + list);

			return "exam02Bean";
	}
	
	@GetMapping("/exam03")
	public String exam03(SampleDTO dto, @ModelAttribute("number") int number) {
			log.info("dto: " + dto);
			log.info("number: " + number);
			
			return "sample/exam03"; //WEB-INF/views/sample/exam03.jsp를 의미
	}
	
	/* @ResponesBody: 일반적인 JSP와 같은 뷰로 전달되는 게 아니라 데이터 자체를 전달하기 위한 용도이다.*/
	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	@ResponseBody 
	public String getText() {
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);

		return "안녕하세요";
	}
	
	@GetMapping(value="/getExample", produces = MediaType.APPLICATION_XML_VALUE)
	@ResponseBody 
	public SampleDTO getExample() {
		log.info("/getExample..........");

		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");

		return dto;
	} 

	@GetMapping(value = "/getExample2", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ExampleVO getExample2() {
		return new ExampleVO(1, "김철수", "010-5678-8013"); // ExampleVO 클래스의 필드는 no, name, phone이 존재.
	}
	
	@GetMapping("/getExample3")
	public ResponseEntity<String> getExample3() {
		log.info("/getExample3..........");

		// {"name": "홍길동", "email":"javauser@naver.com"}
		String msg = "{\"name\": \"홍길동\", \"email\": \"javauser@naver.com\"}";
//		ExampleVO exampleVO = new ExampleVO(2, "홍길동", "010-2345-7890");
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");

		return new ResponseEntity<>(msg, header, HttpStatus.OK);
	}
	
	@GetMapping(value = "/getList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ExampleVO> getList() {
		 List<ExampleVO> list = new ArrayList<>();
		 list.add(new ExampleVO(1, "홍길동","010-6703-1209"));
		 list.add(new ExampleVO(2, "한늘봄","010-9427-8930"));
		 list.add(new ExampleVO(3, "이진희","010-1295-4510"));
		 list.add(new ExampleVO(4, "박철희","010-3492-6711"));
		 
		 return list;
	}
	
   @GetMapping("/examMethod")
	public String examMethod() {
		log.info("/getMethod Get..........");
		
		return "sample/examMethod"; // /WEB-INF/views/sample/examMethod.jsp를 의미.
	}
	
	@PostMapping(value="/examMethod",produces = "text/plain; charset=UTF-8")
	@ResponseBody 
	public String examMethod(ExampleVO evo, Ticket tvo) {
		log.info("/examMethod Post..........");
		log.info("/ExampleVO : " + evo + "Ticket : " + tvo);
		return "전송 성공";
	}
}
