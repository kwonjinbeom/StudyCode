//package com.boot.example.log;
//
//import org.springframework.util.StopWatch;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//public class LoggerAdvice {
//	
//	
//	/* 예외가 발생한 시점에 동작 */
//	@AfterThrowing(pointcut="execution(* com.boot..*Impl.*(..))", throwing = "exception")
//	public void exceptionLogging(JoinPoint jp, Throwable exception) {
//		log.info("----------------------------------");
//		log.info("[예외발생]");
//		log.info("[예외발생 메서드명] " + jp.getSignature().getName());
//		//exception.printStackTrace();
//		log.info("[예외 메시지] " + exception);
//		log.info("----------------------------------");
//	}
//
//	/* 비즈니스 로직 메서드가 정상적으로 수행 된 후 동작
//	@AfterReturning(pointcut = "execution(* com.boot..service.*Impl.*(..))",returning = "returnValue")
//	public void afterReturningMethod(JoinPoint jp, Object returnValue) {
//		log.info("-------------------------");
//		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
//		log.info("afterReturningMethod() called..... " + jp.getSignature().getName());
//		log.info("[리턴 결과] " + returnValue);
//		log.info("-------------------------");
//	}
//	 */
//	@Around("execution(* com.boot..*Impl.*(..))")
//	public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable{
//		log.info("---------------------------");
//		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
//		// long startTime = System.currentTimeMillis();
//		StopWatch watch = new StopWatch();
//		watch.start();
//		log.info("[호출 메서드의 파라미터 값] ") + Array.toString(pjp.getArgs()));
//		Object result  = null;
//		// proceed() : 실제 target 객체의 메서드를 실행하는 기능
//		result = pjp.proceed();
//	}
//}
