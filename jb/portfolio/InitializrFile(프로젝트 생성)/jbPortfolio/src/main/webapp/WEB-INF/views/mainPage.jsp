<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/common.jspf" %> 
    <!-- css연결 -->   
    <link rel = "stylesheet" href ="/resources/include/css/mainPageCss/mainPage.css">   
<body>
	<header>
       	<img id="logo" src="/resources/images/common/mainPageImage/jinbeomLogo.png"/>
           <nav>
               <ul>
                   <li style="color:#8BC0FF;">Home</li>
                   <li>Education</li>
                   <li>Skills</li>
                   <li>Certificate/Awards</li>
                   <li>Projects</li>
               </ul>
           </nav>
       </header>
    <div id = "home">
        <div id = "homebox1">
            <div id = "homeMain">
                <!-- <h2>Jinbeom's Portfolio</h2> -->
                <!-- <h1>Web Developer</h1> -->
                <h3 style="margin-top:170px;">안녕하세요. 저는 권진범입니다.<br>
                coment<br>
                coment<br>
                coment<br>
                ...<br>
                </h3>
                <a href="#">더 알아보기 ></a>
            </div>
            <div id = "myPic">
                <!-- <img src = "/resources/images/common/mainPageImage/people.png">
                <h3 style="text-align: center;">내 사진</h3> -->
            </div>
        </div>
    </div>
    <div id = "Education">
        <div id = "EducationSubTitle">
            <h1>Education</h1>
        </div>
        <div id = "EducationMainBox">
	        <div class = "EducationMain EducationMain1">
	            <table id="EducationMainTable1">
	                <tr>
	                    <td>이름</td>
	                    <td>생년월일</td>
	                    <td>주소지</td>
	                </tr>
	                <tr>
	                    <td>권진범</td>
	                    <td>98-01-24</td>
	                    <td>서울특별시 관악구</td>
	                </tr>
	                <tr>
	                    <td>연락처</td>
	                    <td>이메일</td>
	                    <td>학과</td>
	                </tr>
	                <tr>
	                    <td>010-2462-8384</td>
	                    <td>black_lukey@naver.com</td>
	                    <td>전자공학전공</td>
	                </tr>
	            </table>
	        </div>
	    </div>
	    <img id="downArrowImage" style="position:fixed;top:89%;left:91.5%;width:40px;height:40px;/* opacity:0.2; */ /* 80% 불투명도 */"src="/resources/images/common/mainPageImage/downArrowIcon.png"/>
	    <img id="homeImage" style="position:fixed;top:89%;left:95.5%;width:40px;height:40px;/* opacity:0.2; */ /* 80% 불투명도 */"src="/resources/images/common/mainPageImage/homeIcon.png"/>
	    
    </div>
    <div id = "Skills">

    </div>
    <div id = "Certificate">
        <div id = "CertificateMainBox">
	        <div class = "CertificateMain CertificateMain1">
	            <table class="table table-bordered CertificateTable">
	            <caption>자격증/수상내역</caption>
	                <thead>
	                	<tr>
		                    <th class="col-md-2">취득일/수상일</th>
		                    <th class="col-md-1">구분</th>
		                    <th class="col-md-5">자격/수상명(주제)</th>
		                    <th class="col-md-3">발행처/기관(공모명)</th>
		                    <th class="col-md-1">합격/점수</th>
	                    </tr>
	                </thead>
	                <tbody>
		                <tr>
		                    <td>2023.04</td>
		                    <td>자격증</td>
		                    <td>SQL 개발자(SQL-Developer)</td>
		                    <td>한국데이터베이스진흥원</td>
		                    <td>최종합격</td>
		                </tr>
		                <tr>
		                    <td>2022.07</td>
		                    <td>수상</td>
		                    <td>동상 (빛 반사를 이용한 블랙아이스 검출 시스템)</td>
		                    <td>강원대학교 LINC 3.0 사업단(캡스톤디자인)</td>
		                </tr>
		                <tr>
		                    <td>2022.05</td>
		                    <td>자격증</td>
		                    <td>정보처리기사</td>
		                    <td>한국산업인력공단</td>
		                    <td>필기합격(실기X)</td>
		                </tr>
		                <tr>
		                    <td>2020.10</td>
		                    <td>수상</td>
		                    <td>한국지능형사물인터넷협회장상/입선 (당뇨 환자를 위한 영양소 예측 시스템)</td>
		                    <td>국가과학기술연구회,KSB융합연구단(KSB 인공지능 프레임워크/플랫폼(BeeAI)활용 공모전)</td>
		                </tr>
	                </tbody>
	            </table>
	            <div style="width:10px;height:10px;border-radius:50%;background:black;"></div>
	            
	            <table class="table table-bordered CertificateTable">
	                <tbody>
		                <tr>
		                    <td class="col-md-2">2023.04</td>
		                    <td class="col-md-1">자격증</td>
		                    <td class="col-md-5">SQL 개발자(SQL-Developer)</td>
		                    <td class="col-md-3">한국데이터베이스진흥원</td>
		                    <td class="col-md-1">최종합격</td>
		                </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
    </div>
    <div id = "Projects">

    </div>
    <script src="/resources/include/js/mainPageJs/mainPage.js"></script>
</body>
</html>