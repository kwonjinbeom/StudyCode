package com.sign.service;

import java.util.ArrayList;

import com.sign.dao.SignDAO;
import com.sign.vo.SignVO;

public class SignService {
	private static SignService service = null;
	
	private SignDAO dao = SignDAO.getInstance();
	
	private SignService(){ }
	public static SignService getInstance() {
		if(service == null) {
			service = new SignService();
		}
		return service;
	}

	
	  public ArrayList<SignVO> boardList() { 
		  ArrayList<SignVO> list = dao.signList();
		  return list;
	  
	  }
	 
		/*
		 * // 검색처리
		 * 
		 * public ArrayList<SignVO> boardList(SignVO vo){ ArrayList<SignVO> list =
		 * dao.boardList(vo); return list; }
		 */
}