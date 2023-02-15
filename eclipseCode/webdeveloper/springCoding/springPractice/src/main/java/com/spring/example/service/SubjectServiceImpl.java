package com.spring.example.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.example.domain.SubjectVO;
import com.spring.mapper.ExampleMapper;

import lombok.Setter;

@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Setter(onMethod_ = @Autowired)
	private ExampleMapper exampleMapper;
	
	@Override
	public List<SubjectVO> subjectList(int no){
		List<SubjectVO> subjectList = exampleMapper.getSubjectList(no);
		return subjectList;
	}
	
	@Override
	public int subjectInsert(SubjectVO subject) {
		int result = exampleMapper.subjectInsert(subject);
		return result;
	}
}
