package com.spring.client.board.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
   
   @Setter(onMethod_ = @Autowired)
   private BoardDao boardDao;
   

   @Test
   public void testBoardList() {
	   List<BoardVO> list = boardDao.boardList();
	   for(BoardVO vo : list) {
		   log.info(vo);
	   }
   }

   @Test
   public void testBoardInsert() {
	   BoardVO board = new BoardVO();
	   board.setB_name("김철수");
	   board.setB_title("용기가 필요할 때");
	   board.setB_content("도중에 포기하지말라. 망설이지 말라. 최후의 성공을 거둘 때까지 밀고 나가자.");
	   board.setB_pwd("1234");
	   
	   int count = boardDao.boardInsert(board);
	   log.info("입력된 행의 수 : "  + count);
	   }
   
}