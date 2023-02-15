package com.spring.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.example.domain.SubjectVO;
import com.spring.mapper.ExampleMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ExampleMapperTests {
   
   @Setter(onMethod_ = @Autowired)
   private ExampleMapper exampleMapper;
   
   /*@Test
   public void testSubjectList() {
      log.info("-------------------------------");
      log.info("getSubjectList() 메서드 실행");
      List<SubjectVO> list = exampleMapper.getSubjectList(5);
      for(SubjectVO vo : list) {
         log.info(vo);
      }
      
      log.info("-------------------------------");
      log.info("getSubjectList() 메서드 실행");
      list = exampleMapper.getSubjectList(0);
      for(SubjectVO vo : list) {
         log.info(vo);
      }
   }
   
   @Test
   public void testSubjectInsert() {
      log.info("-------------------------------");
      log.info("SubjectInsert() 메서드 실행");
      SubjectVO svo = new SubjectVO();
      svo.setS_num("10");
      svo.setS_name("물리학과");
      log.info(exampleMapper.subjectInsert(svo));
      
   } */
   
//   @Test
//   public void testSubjectUpdate() {
//      log.info("-------------------------------");
//      log.info("testSubjectUpdate() 메서드 실행");
//      SubjectVO subvo = new SubjectVO();
//      subvo.setS_name("정치외교학과");
//      subvo.setNo(8);
//      log.info(exampleMapper.subjectUpdate(subvo));
//   }
//   
//   @Test
//   public void testSubjectDelete() {
//	   log.info("-------------------------------");
//	   log.info("testSubjectDelete() 메서드 실행");
//	   SubjectVO subjectVO = new SubjectVO();
//	   subjectVO.setNo(9);
//	   log.info(exampleMapper.subjectDelete(subjectVO));
//   }

   @Test
   public void testGetSubjectName() {
	   log.info("-------------------------------");
	   log.info("testGetSubjectName() 메서드 실행");
	   log.info(exampleMapper.getSubjectName("05"));
   }
}