package com.spring.client.reply.controller;

/***************************************************************************************
 * 참고 : REST(Representational State Transfer)의 약어로 
 *      하나의 URI는 하나의 고유한 리소스를 대표하도록 설계된다는 개념이다. 
 *      즉 REST방식은 특정 URL는 반드시 그에 상응하는 데이터 자체라는 것을 의미하는 방식이다. 
 *      /member/join => GET(회원가입화면) /member/join => POST
 *      예를 들어 'board/125'은 게시물 중에서 125번이라는 고유한 의미를 가지도록 설계하고, 
 *      이에 대한 처리는 GET, POST 방식과 같이 추가적인 정보를 통해서 결정한다.
 *      http://localhost:8080/board/boardDetail?b_num=4
 *      http://localhost:8080/board/4  => GET
 *      
 *      http://localhost:8080/board/boardDelete?b_num=4 
 *      http://localhost:8080/board/4  => DELETE
 *      
 *      주고받는 자원(Resource)에 이름을 규정하고 URI에 명시해 HTTP 메서드(GET, POST, PUT, DELETE)를 
 *      통해 해당 자원의 상태를 주고 받는 것을 의미.
 ***************************************************************************************/


/***************************************************************************************
 * 참고 : @RestController (@Controller + @ResponesBody)
 * Controller가 REST 방식을 처리하기 위한 것임을 명시. (기존의 특정한 JSP와 같은 뷰를 만들어 
 * 내는 것이 목적이 아닌 REST 방식의 데이터 처리를 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
 * @ResponesBody: 일반적인 JSP와 같은 뷰로 전달되는 게 아니라 데이터 자체를 전달하기 위한 용도이다.
 * @PathVariable: URL 경로에 있는 값을 파라미터로 추출하려고 할 때 사용한다.
 * name=value&name1=value1
 * @RequestBody: JSON 데이터를 원하는 타입으로 바인딩 처리한다.{name:value}
 ***************************************************************************************/


public class ReplyController {

}
