//package com.spring.common.log;
//
//import java.util.Arrays;
//
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.AfterReturning;
//import org.aspectj.lang.annotation.AfterThrowing;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.springframework.stereotype.Component;
//import org.springframework.util.StopWatch;
//
//import com.google.common.base.Stopwatch;
//import com.spring.client.board.vo.BoardVO;
//
//import lombok.extern.log4j.Log4j;
//import lombok.extern.slf4j.Slf4j;
//
////@Log4j
///* 스프링에서 빈(bean)으로 인식하기 위해서 사용 */
//@Component
///* 해당 클래스의 객체가 Aspect를 구현한 것임으로 나타내기 위해서 사용 */
//@Aspect
//public class LoggerAdvice {
////	//조금 전에 수행한 메서드는 주석 또는 아래의 내용으로 변경하면 된다.
//	@Before("execution(* com.spring..*Impl.*(..))")
//	public void printLogging(JoinPoint jp) {
//		log.info("--------------------------");
//		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
//		// getArgs() : 전달되는 모든 파라미터들을 Object의 배열로 가져온다.
//		// getSignature() : 실행하는 대상 객체의 대한 정보를 알아낼 때 사용.
//		log.info("[호출 메서드명]" + jp.getSignature().getName());
//		log.info("[호출 메서드의 파라미터 값]" + Arrays.toString(jp.getArgs()));
//		log.info("--------------------------");
//		log.info("--------------------------");
//		
//	}
//	
////	//조금 전에 수행한 메서드는 주석 또는 아래의 내용으로 변경하면 된다.
//	@AfterThrowing(pointcut="execution(* com.spring..*Impl.*(..))", throwing="exception")
//	public void printLogging(JoinPoint jp, Throwable exception) {
//		log.info("--------------------------");
//		log.info("[예외발생]");
//		log.info("[예외발생 메서드명]" + jp.getSignature().getName());
//		//exception.printStackTrace();
//		log.info("[예외 메시지]" + exception);
//		log.info("--------------------------");
//		
//	}
//
////	//조금 전에 수행한 메서드는 주석 또는 아래의 내용으로 변경하면 된다.
//	@AfterThrowing(pointcut="execution(* com.spring..*Impl.*(..))", throwing="exception")
//	public void printLogging(JoinPoint jp, Throwable exception) {
//		log.info("--------------------------");
//		log.info("[예외발생]");
//		log.info("[예외발생 메서드명]" + jp.getSignature().getName());
//		//exception.printStackTrace();
//		log.info("[예외 메시지]" + exception);
//		log.info("--------------------------");
//	}
//	/* 비즈니스 로직 메서드가 정상적으로 수행 된 후 동작 */
//	@AfterReturning(pointcut = "execution(* com.spring..service.*Impl.*(..))",
//			returning = "returnValue")
//	public void afterReturningMethod(JoinPoint jp, Object returnValue) {
//		log.info("--------------------------");
//		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
//		log.info("aterReturningMethod() called...." + jp.getSignature().getName());
//		log.info("[리턴 결과 " + returnValue);
//		log.info("--------------------------");
//	}
//
//	//조금 전에 수행한 메서드는 주석 또는 아래의 내용으로 변경하면 된다.
//	@Around("execution(* com.spring..*Impl.*(..))")
//	public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable {
//		log.info("--------------------------");
//		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
//		
//		//long startTime = System.currentTimeMillis();
//		StopWatch watch = new StopWatch();
//		watch.start();
//		log.info("[호출 메서드의 파라미터 값]" + Arrays.toString(pjp.getArgs()));
//		
//		Object result = null;
//		// proceed() : 실제 target 객체의 메서드를 실행하는 기능
//		result = pjp.proceed();
//		
//		//long endTime = System.currentTimeMills();
//		watch.stop();
//		
//		log.info("[Class] " + pjp.getTarget().getClass());
//		
//		//logger.info(pjp.getSignature().getName() + ": 소요시간 " +(endTime - startTime)+"ms");
//		log.info("[호출 메서드명]" + pjp.getSignature().getName());
//		log.info("[소요시간]" + watch.getTotalTimeSeconds() + "ms");
//		log.info("[리턴 결과]" + result );
//		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
//		log.info("--------------------------");
//		
//		return result;
//	}
//}
