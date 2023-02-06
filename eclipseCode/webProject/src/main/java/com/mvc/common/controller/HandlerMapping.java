package com.mvc.common.controller;

import java.util.HashMap;
import java.util.Map;

import com.mvc.board.controller.DeleteBoardController;
import com.mvc.board.controller.DetailBoardController;
import com.mvc.board.controller.GetBoardListController;
import com.mvc.board.controller.InsertReplyController;
import com.mvc.board.controller.PasswdCheckController;
import com.mvc.board.controller.ReplyFormController;
import com.mvc.board.controller.UpdateBoardController;
import com.mvc.board.controller.UpdateFormController;
import com.mvc.board.controller.insertBoardController;
import com.mvc.board.controller.insertFormController;

public class HandlerMapping {
	private Map<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		
		/* 답변형 게시판 처리 */
		mappings.put("/board/getBoardList.do", new GetBoardListController()); // 게시판 리스트
		mappings.put("/board/insertForm.do", new insertFormController());
		mappings.put("/board/insertBoard.do", new insertBoardController());
		mappings.put("/board/detailBoard.do", new DetailBoardController());
		mappings.put("/board/passwdCheck.do", new PasswdCheckController());// 비밀번호 확인
		mappings.put("/board/updateForm.do", new UpdateFormController());
		mappings.put("/board/updateBoard.do", new UpdateBoardController());
		mappings.put("/board/deleteBoard.do", new DeleteBoardController());
		mappings.put("/board/replyForm.do", new ReplyFormController()); // 답변 등록 화면
		mappings.put("/board/insertReply.do", new InsertReplyController()); // 답변 등록
		
		
		
		
		
		mappings.put("/board/login.do", new InsertReplyController()); // 답변 등록
		
		

	}

	public Controller getController(String path) { // 게시판리스트일 경우 path="/board/getBoardList.do"
		return mappings.get(path);                 // mappings.get("/board/getBoardList.do")=> new GetBoardListController()의 주솟값 반환
	}
} 