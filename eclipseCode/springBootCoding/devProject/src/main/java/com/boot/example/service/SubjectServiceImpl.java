package com.boot.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.example.dao.SubjectDAO;

import lombok.Setter;

@Service
public class SubjectServiceImpl {
	@Setter(onMethod_ = @Autowired)
	private SubjectDAO subject;
}
