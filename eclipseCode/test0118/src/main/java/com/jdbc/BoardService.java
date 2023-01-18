package com.jdbc;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.board.Board;
import com.board.BoardDao;
import static com.common.JDBCTemplate.*;

public class BoardService {
	private static BoardService instance = null;
	
	private BoardService() {}
	
	public static BoardService getInstance() {
		if(instance == null) {
			instance = new BoardService();
		}
		return instance;
	}
	
	public ArrayList<Board> boardList(Board vo){
		ArrayList<Board> list = new BoardDao().getBoardTotal(vo);
		return list;
	}
	
	public boolean boardInsert(Board vo) { //insertBoard() 메소드 입니다.
		boolean result = new BoardDao().BoardInsert(vo);
		// Connection 생성 및 트랜잭션 처리 구문은 DAO의 BoardInsert()구문 내부에서 이미 실시하였지만
		// 조건에서 다음 boardInsert에서 처리하도록 되어있어 한 번 더 기술하였습니다.
		
		Connection con = null;
		try {
			con = getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return result;
	}
}
