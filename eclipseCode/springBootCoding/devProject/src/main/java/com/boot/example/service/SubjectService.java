package com.boot.example.service;

import java.util.List;

import com.boot.example.domain.SubjectVO;

public interface SubjectService {
	public List<SubjectVO> subjectList(int no);
	public int subjectInsert(SubjectVO subject);
	
}
