package com.spring.polymorphism;

import java.util.Iterator;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {
	public static void main(String[] args) {
//		SamsungTV tv = new SamsungTV();
//		tv.powerOn();
//		tv.volumeUp();
//		tv.volumeDown();
//		tv.powerOff();

//		LgTV tv = new LgTV();
//		tv.turnOn();
//		tv.soundUp();
//		tv.soundDown();
//		tv.turnOff();
		
//		TV tv = new SamsungTV();
//		tv.powerOn();
//		tv.volumeUp();
//		tv.volumeDown();
//		tv.powerOff();
		
//		BeanFactory beanFactory = new BeanFactory();
////		TV tv = (TV)beanFactory.getBean("samsung");
//		for (int i = 0; i < args.length; i++) {
//			TV tv = (TV)beanFactory.getBean(args[i]);
//			tv.powerOn();
//			tv.volumeUp();
//			tv.volumeDown();
//			tv.powerOff();
//			System.out.println("---------------");
//		}
		
		// 1.Spring컨테이너를 구동한다.
		AbstractApplicationContext factory= new GenericXmlApplicationContext("applicationContext.xml");
		
		// 2.Spring 컨테이너로부터 필요한 객체를 요청(Lookup)한다.
		TV tv = (TV)factory.getBean("tv"); // <bean id="tv"에서 tv가 여기에 tv이다.
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		// 3.Spring 컨테이너를 종료한다.
		factory.close();
	}
}
