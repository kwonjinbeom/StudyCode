package com.spring.client.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
	public BoardVO boardDetail(BoardVO bvo) {
		BoardVO boardVO = boardDao.boardDetail(bvo);
//		boardVO.setB_content(boardVO.getB_content().toString().replaceAll("\n","<br />"));

		return boardVO;
	}
//	@Override
//	public BoardVO boardDetail(BoardVO bvo) {
//		BoardVO detail = null;
//		boardDao.readCntUpdata(bvo); //조회수 증가 메서드 호출
//		detail=boardDao.boardDetail(bvo);
//		if(detail!=null) {
//			detail.setB_content(detail.getB_content().toString().replaceAll("\n","<br />"));
//		}
//		return detail;
//	}

	@Override
	public BoardVO updateForm(BoardVO bvo) {
		BoardVO updateData = null;
		updateData = boardDao.boardDetail(bvo);
		return updateData;
	}

	@Override
	public int boardUpdate(BoardVO bvo) {
		int result = 0;
		result = boardDao.boardUpdate(bvo);
		return result;
	}

	@Override
	public int boardDelete(BoardVO bvo) {
		int result = 0;
		result = boardDao.boardDelete(bvo.getB_num());
		return result;
	}

	@Override
	public int boardPasswdChk(BoardVO bvo) {
		int result = 0;
		result = boardDao.pwdConfirm(bvo);
		return result;
	}

	
	
	
	
//	public class BoardDaoImpl implements BoardDao {
//		@Autowired
//		private SqlSession session;
//		
//		// 글목록 구현
//		@Override
//		pulbic List<BoardVO> boardList(){
//			return session.selectList("boardList");
//		}
//		
//		// 글입력구현
//		@Override
//		public int boardInset(BoardVO pvo) {
//			return session.insert("boardInsert");
//		}
//		
//		// 글상세구현
//		@Override
//		public BoardVO boardDetail(BoardVO pvo) {
//			return (BoardVO)session.selectOne("boardDetail");
//		}
//		
//	}

	

}
