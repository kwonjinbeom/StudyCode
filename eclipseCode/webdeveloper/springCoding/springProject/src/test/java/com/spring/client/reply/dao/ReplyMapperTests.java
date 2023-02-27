package com.spring.client.reply.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
   
   @Setter(onMethod_ = @Autowired)
   private ReplyDao replyDao;
   

//   @Test
//   public void testReplyList() {
//	   List<ReplyVO> list = replyDao.replyList(1);
//	   
//	   for(ReplyVO vo : list) {
//		   log.info(vo);
//	   }
//   }
   
   @Test
   public void testReplyInsert() {
	   ReplyVO rvo = new ReplyVO();
	   rvo.setB_num(1);
	   rvo.setR_name("홍길동");
	   rvo.setR_content("남을위해....");
	   rvo.setR_pwd("1234");
	   int result = replyDao.replyInsert(rvo);
	   
	   log.info("입력결과 : " + result);
   }

   
}