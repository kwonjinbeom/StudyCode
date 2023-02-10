package com.spring.injection;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {
	public static void main(String[] args) {
		AbstractApplicationContext factory = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		CollectionBean bean = (CollectionBean)factory.getBean("collectionBean");
//		List<String> addressList = bean.getAddressList();
//		Set<String> addressList = bean.getAddressList();
//		for(String address:addressList) {
//			System.out.println(address.toString());
//		}
		
		Map<String, String> addressList = bean.getAddressList();
		//모든 항목을 방문한다.
		for(Map.Entry<String, String> addList : addressList.entrySet()) {
			String key = addList.getKey();
			String value = addList.getValue();
			System.out.println("key=" + key + ",value="+value);
		}
		factory.close();
	}
}
