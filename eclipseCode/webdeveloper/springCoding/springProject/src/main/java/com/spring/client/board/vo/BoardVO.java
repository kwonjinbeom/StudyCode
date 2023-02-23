package com.spring.client.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;


/* equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며, 
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다*/

@Data
@EqualsAndHashCode(callSuper=false)
public class BoardVO extends CommonVO {
	private int    b_num     =0;  //글번호
	private String b_name    =""; //작성자 
	private String b_title   =""; //제목 
	private String b_content =""; //내용 
	private String b_date;        //작성일 
	private String b_pwd     =""; //비밀번호 
	private int    readcnt     =0;  //조회수
	
	private MultipartFile file;   // 파일 업로드를 위한 필드 아래 두 개로 쪼개지는 역할
	private String b_thumb   =""; //실제서버에 저장할 썸네일 이미지 파일명
	private String b_file    =""; //실제서버에 저장할 파일명
}