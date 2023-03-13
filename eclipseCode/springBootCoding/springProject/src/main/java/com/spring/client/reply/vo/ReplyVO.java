package com.spring.client.reply.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int r_num = 0; 			//댓글번호
	private int b_num = 0;			//게시판 글번호
	private String r_name = "";		//댓글 작성자
	private String r_content = "";	//댓글 내용
	private String r_date = "";		//날짜
	private String r_pwd = "";		//비밀번호
}
