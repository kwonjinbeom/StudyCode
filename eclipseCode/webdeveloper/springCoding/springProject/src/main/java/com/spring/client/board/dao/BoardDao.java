package com.spring.client.board.dao;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface BoardDao {

	public List<BoardVO> boardList();
	public int boardInsert(BoardVO boardVO);
	public BoardVO boardDetail(BoardVO boardVO);
	
	public void readCount(String num);
	
	
	public int pwdConfirm(BoardVO boardVO);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(int b_num);
}
