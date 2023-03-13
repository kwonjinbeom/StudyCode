package com.boot.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.example.dao.SubjectDAO;
import com.boot.example.domain.SubjectVO;

import lombok.Setter;
@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Setter(onMethod_ = @Autowired)
	private SubjectDAO subjectDAO;
	
	@Override
	public List<SubjectVO> subjectList(int no){
		List<SubjectVO> subjectList = subjectDAO.subjectList();
		return subjectList;
	}
	
//	@Override
//	public String subjectNumber() {
//		String number = subjectDAO.subjectNumber();
//		return number;
//	}
	
	@Override
	public int subjectInsert(SubjectVO subject) {
		int result = subjectDAO.subjectInsert(subject);
		return result;
	}
}