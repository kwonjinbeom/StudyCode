package com.spring.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDao;
import com.spring.client.board.vo.BoardVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardDao boardDao;

	@Override
	public List<BoardVO> boardList() {
		// 글목록 구현
		List<BoardVO> list = null;
		list = boardDao.boardList();
		return list;
		
	}

	@Override
	public int boardInsert(BoardVO boardVO) {
		int result = boardDao.boardInsert(boardVO);
		return result;
	}

	@Override
	public void readCount(String num) {
		boardDao.readCount(num);
		
	}

	@Override
	public BoardVO boardDetail(String num) {
		BoardVO boardVO = boardDao.boardDetail(num);
//		boardVO.setB_content(boardVO.getB_content().toString().replaceAll("\n","<br />"));
		return boardVO;
	}
	
	
	
	

}
