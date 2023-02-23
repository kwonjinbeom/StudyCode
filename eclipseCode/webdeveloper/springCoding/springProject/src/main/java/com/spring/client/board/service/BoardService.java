package com.spring.client.board.service;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList();

	public List<BoardVO> boardList(BoardVO bvo); /* 검색 포함 리스트 */
	public int boardListCnt(BoardVO bvo);
	
	public int boardInsert(BoardVO boardVO) throws Exception;
	public void readCount(String num);
	public BoardVO boardDetail(BoardVO bvo);
	public BoardVO updateForm(BoardVO bvo);
	public int boardUpdate(BoardVO bvo) throws Exception;
	public int boardDelete(BoardVO bvo) throws Exception;
	public int boardPasswdChk(BoardVO bvo);
}
