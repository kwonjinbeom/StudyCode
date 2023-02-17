package com.spring.client.board.service;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList();
	public int boardInsert(BoardVO boardVO);
	public void readCount(String num);
	public BoardVO boardDetail(String num);
}
