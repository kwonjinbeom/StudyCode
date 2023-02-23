package com.spring.client.board.dao;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface BoardDao {

	public List<BoardVO> boardList();

	public List<BoardVO> boardList(BoardVO bvo); /* 검색 포함 리스트 */

	public int boardListCnt(BoardVO bvo); /* board 테이블의 전체 레코드 수 */
	
	public int boardInsert(BoardVO boardVO);
	public BoardVO boardDetail(BoardVO boardVO);
//	public int readCntUpdate(BoardVO bvo);
	public void readCount(String num);
	
	
	public int pwdConfirm(BoardVO boardVO);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(int b_num);
	
	public List<BoardVO> boardListExcel(BoardVO bvo);
	
}
