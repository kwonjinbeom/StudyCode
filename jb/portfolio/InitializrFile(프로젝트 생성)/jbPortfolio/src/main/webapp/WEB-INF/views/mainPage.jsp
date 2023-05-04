<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/common.jspf" %> 
    <!-- css연결 -->   
    <link rel = "stylesheet" href ="/resources/include/css/mainPageCss/mainPage.css">   
<body>
    <div id = "home">
        <header>
            <nav>
                <ul>
                    <li>Home</li>
                    <li>Me</li>
                    <li>Skills</li>
                    <li>Projects</li>
                    <li>Career</li>
                </ul>
            </nav>
        </header>
        <div id = "homebox1">
            <div id = "homeMain">
                <h2>Portfolio</h2>
                <h1>Developer.Full stack.</h1>
                <h3>안녕하세요. 저는 권진범입니다.
                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리 나라 만세<br>
                무궁화 삼천리 화려강산 대한 사람 대한으로 <br>
                길이 보전하세</h3>
                <a href="#">더 알아보기 ></a>
            </div>
            <div id = "myPic">
                <img src = "/resources/images/common/mainPageImage/people.png">
                <h3 style="text-align: center;">내 사진</h3>
            </div>
        </div>
    </div>
    <div id = "Me">
        <div id = "MeSubTitle">
            <h1>Me</h1>
        </div>
        <div id = "MeMainBox">
	        <div class = "MeMain">
	            <table id="MeMainTable1">
	                <tr>
	                    <td>이름</td>
	                    <td>생년월일</td>
	                    <td>주소지</td>
	                </tr>
	                <tr>
	                    <td>권진범</td>
	                    <td>98.01.24</td>
	                    <td>서울특별시 관악구</td>
	                </tr>
	                <tr>
	                    <td>연락처</td>
	                    <td>이메일</td>
	                    <td>취미</td>
	                </tr>
	                <tr>
	                    <td>010-2462-8384</td>
	                    <td>black_lukey@naver.com</td>
	                    <td>룰루랄라</td>
	                </tr>
	            </table>
	        </div>
			<div class = "MeMain">
	            <table id="MeMainTable2">
	                <tr>
	                    <td>학과</td>
	                    <td>전자정보통신공학부<br>
	                    	<span style="font-weight:bold;">전자공학전공</span></td>
	                </tr>
	                <tr>
	                    <td>전자정보통신공학부<br>
	                    	<span style="font-weight:bold;">전자공학전공</span></td>
	                    <td>98.01.24</td>
	                    <td>서울특별시 관악구</td>
	                </tr>
	            </table>
	        </div>
	    </div>
    </div>
    <div id = "skills">

    </div>
    <div id = "projects">

    </div>
    <div id = "career">

    </div>
    <script src="/resources/include/js/mainPageJs/mainPage.js"></script>
</body>
</html>