package com.spring.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		log.info("timeMapper 인터페이스로 구현된 구현 클래스명");
		log.info(timeMapper.getClass().getName());
		log.info("------------------------------");
		log.info("getTime() 메서드 실행");
		log.info(timeMapper.getTime());
		
		log.info("------------------------------");
		log.info("getTime2() 메서드 실행");
		log.info(timeMapper.getTime2());
	}
}