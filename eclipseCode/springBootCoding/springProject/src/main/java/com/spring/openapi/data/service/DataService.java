package com.spring.openapi.data.service;

public interface DataService {
	public StringBuffer chungnamList() throws Exception;
	public StringBuffer chungnamDetail(String mng_no) throws Exception;
	public StringBuffer animalDaejeonList() throws Exception;
}