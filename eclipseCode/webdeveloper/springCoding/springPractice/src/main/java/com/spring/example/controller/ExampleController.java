package com.spring.example.controller;

import org.springframework.http.MediaType;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.example.domain.ExampleVO;

import lombok.extern.log4j.Log4j;

@RestController //(@Conroller + @Responsebody)
// Controller 가 rest 방식을 처리하기 위한 것임을 명시 .....
@RequestMapping("/example/*")
@Log4j
public class ExampleController {

	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);

		return "안녕하세요";
	}

	@GetMapping(value = "/getExample", produces = MediaType.APPLICATION_XML_VALUE)
	public ExampleVO getSample() {
		return new ExampleVO(1, "홍길동", "010-1234-9087");
	}

	@GetMapping(value = "/getExample2", produces = MediaType.APPLICATION_JSON_VALUE)
	public ExampleVO getSample2() {
		return new ExampleVO(2, "김철수", "010-5678-8013");
	}
}