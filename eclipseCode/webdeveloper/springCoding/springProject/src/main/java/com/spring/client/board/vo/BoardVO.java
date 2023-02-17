package com.spring.client.board.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int b_num=0;
	private String b_name="";
	private String b_title="";
	private String b_content="";
	private String b_pwd="";
	private String b_date;
	private	int readcnt;     // 글 조회수
	
	
}
