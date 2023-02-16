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
}