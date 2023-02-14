package com.spring.persistence;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


/* JUnit 프레임워크의 테스트 실행 방법을 확장할 때 사용하는 애노테이션. Runner클래스를 설정하면 JUnit에 내장된 Runner대신 그 클래스를 실행.
 * JUnit이 테스트를 진행하는 중 테스트가 사용할 어플리케이션 컨텍스트를 만들고 관리하는 작업을 해준다.  */
@RunWith(SpringJUnit4ClassRunner.class)
/* 자동으로 만들어줄 어플리케이션 컨텍스트의 설정파일의 위치를 지정할 때 사용한다. */
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {

	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {
		try(Connection conn = dataSource.getConnection()){
			log.info(conn);
			log.info("-------------------------------");
			log.info("오라클 데이터베이스에 정상적으로 연결되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testMybatis() {
		try(SqlSession session = sqlSessionFactory.openSession();
			Connection conn = session.getConnection(); ){
			log.info(session);
			log.info(conn);
			log.info("-------------------------------");
			log.info("Mybatis 연동 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}