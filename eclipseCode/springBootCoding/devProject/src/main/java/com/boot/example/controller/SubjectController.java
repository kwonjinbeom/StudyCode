package com.boot.example.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boot.example.domain.SubjectVO;
import com.boot.example.service.SubjectService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/subject/*")
@Slf4j 
public class SubjectController {
	
	@Setter(onMethod_ = @Autowired )
	private SubjectService subjectService;
	
	@RequestMapping(value="/subjectList" , method=RequestMethod.GET)
	public String subjectList(Model model) {
		log.info("subjectList() 메서드 호출....");
		int no = 0;
		
		List<SubjectVO> subjectList = subjectService.subjectList(no);
		model.addAttribute("subjectList", subjectList);
		return "subject/subjectList"; // /WEB-INF/subject/subjectList.jsp
	}
	
	@GetMapping("/insertForm")
	public String insertForm(Model model) {
		log.info("insertForm 메서드 호출...");
		
		
		return "subject/insertForm";
	}
	
	@GetMapping("/subjectInsert")
	public String insert(SubjectVO subject) {
		log.info("insertForm 메서드 호출...");
		
//		같은 페이지에 존재하지 않았따면 아래와 같이 코딩
		int result = 0;
		String path ="";
		result = subjectService.subjectInsert(subject);
		if(result==1) {
			path="/subject/subjectList";
		}else {
			path="/subject/insertForm";
		}
		return "redirect:"+path;
	}
}
