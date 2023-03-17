--SQL developer
--데이터 베이스 접속 이름 : quicket        (소문자로 통일) 
--데이터베이스 비밀번호 : quicket1234
--
--테이블 작성
--
--테이블 생성, 테스트 데이터 추가문(insert), 시퀀스 
--

--이유빈
CREATE TABLE q_user (
	u_id	VARCHAR2(15)	NOT NULL,
	u_num	NUMBER(10)	NOT NULL,
	u_pwd	VARCHAR2(20)	NOT NULL,
	u_name	VARCHAR2(15)	NOT NULL,
	u_gender	VARCHAR2(1)	NOT NULL  CHECK (u_gender IN('M', 'F')),
	u_birth	DATE	NOT NULL,
	u_email	VARCHAR2(40)	NOT NULL,
	u_phone	VARCHAR2(15)	NOT NULL,
	u_regdate	DATE	DEFAULT SYSDATE,
	u_moddate	DATE	DEFAULT SYSDATE,
	u_pwddate	DATE	DEFAULT SYSDATE,
	u_state	NUMBER(1)	DEFAULT 1	 CHECK (u_state IN('0', '1'))
);

ALTER TABLE q_user ADD CONSTRAINT PK_USER PRIMARY KEY (
	u_id
);

create sequence q_user_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('yubin', q_user_seq.nextval, '0000', '이유빈', 'F', to_date('2000-09-02','YYYY-MM-DD'), 'yubinn2@naver.com', '01077563279');

insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('userid', q_user_seq.nextval, 'user1234', '홍길동', 'M', to_date('1990-01-11','YYYY-MM-DD'), 'hgd0123@naver.com', '01022222222');


insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('user02', q_user_seq.nextval, 'user1234', '김철수', 'M', to_date('1999-12-30','YYYY-MM-DD'), 'kcs001@naver.com', '01000000000');


--저는 회원 관리할 때 데이터 여러 개 필요할 것 같아서 3개 만들었습니다!

CREATE TABLE admin (
	admin_num	NUMBER(2)	NOT NULL,
	admin_id	VARCHAR2(15)	NOT NULL,
	admin_pwd	VARCHAR2(20)	NOT NULL
);



ALTER TABLE admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	admin_num
);



create sequence admin_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;


insert into admin(admin_num, admin_id, admin_pwd)
values (admin_seq.nextval, 'admin', 'admin1234');

select * from admin;


-------------------------------------------------------------------------------------------------------------------


--박영석(작성중)
--
--공연 테이블
--
--테이블 생성
CREATE TABLE "SHOW" (
	"s_num"	NUMBER(20)		NOT NULL,
	"s_name"	VARCHAR2(50)		NOT NULL,
	"s_opendate"	DATE		NOT NULL,
	"s_closedate"	DATE		NOT NULL,
	"s_time"	NUMBER(5)		NOT NULL,
	"s_price"	NUMBER(10)		NOT NULL,
	"s_director"	VARCHAR2(50)		NULL,
	"s_sponsor"	VARCHAR2(50)		NULL,
	"s_actor"	VARCHAR2(4000)		NULL,
	"s_point"	NUMBER	DEFAULT 0	NULL,
	"s_ticketcnt"	NUMBER(20)	DEFAULT 0	NULL,
	"s_guide"	CLOB		NULL,
	"s_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"s_update"	DATE		NULL,
	"th_num"	NUMBER(20)		NOT NULL
);

--코멘트 부여
COMMENT ON COLUMN "SHOW"."s_num" IS '공연 번호';
COMMENT ON COLUMN "SHOW"."s_name" IS '공연 이름';
COMMENT ON COLUMN "SHOW"."s_opendate" IS '공연 시작일';
COMMENT ON COLUMN "SHOW"."s_closedate" IS '공연 종료일';
COMMENT ON COLUMN "SHOW"."s_time" IS '공연 상영시간';
COMMENT ON COLUMN "SHOW"."s_price" IS '공연 티켓가격';
COMMENT ON COLUMN "SHOW"."s_director" IS '공연 기획 제작 정보';
COMMENT ON COLUMN "SHOW"."s_sponsor" IS '공연 주최 주관 정보';
COMMENT ON COLUMN "SHOW"."s_actor" IS '공연 캐스팅 배우 정보';
COMMENT ON COLUMN "SHOW"."s_point" IS '공연 별점 평균';
COMMENT ON COLUMN "SHOW"."s_ticketcnt" IS '공연 예매횟수';
COMMENT ON COLUMN "SHOW"."s_guide" IS '공연 안내사항';
COMMENT ON COLUMN "SHOW"."s_regdate" IS '공연 데이터 등록일';
COMMENT ON COLUMN "SHOW"."s_update" IS '공연 데이터 수정일';
COMMENT ON COLUMN "SHOW"."th_num" IS '공연장 번호';

--PK와 FK 설정
ALTER TABLE "SHOW" ADD CONSTRAINT "PK_SHOW" PRIMARY KEY ("s_num");
ALTER TABLE "SHOW" ADD CONSTRAINT "FK_THEATER_TO_SHOW_1" FOREIGN KEY("th_num")
REFERENCES "THEATER" ("th_num");

--사용 시퀀스
CREATE SEQUENCE SHOW_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;


--공연장 테이블

--테이블 생성
CREATE TABLE "THEATER" (
	"th_num"	NUMBER(20)		NOT NULL,
	"th_name"	VARCHAR2(50)		NOT NULL,
	"th_seat"	NUMBER(5)		NOT NULL,
	"th_addr"	VARCHAR2(100)		NOT NULL,
	"th_map_lat"	NUMBER		NULL,
	"th_map_lng"	NUMBER		NULL,
	"th_web"	VARCHAR2(100)		NULL,
	"th_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"th_update"	DATE		NULL
);

--코멘트 부여
COMMENT ON COLUMN "THEATER"."th_num" IS '공연장 번호';
COMMENT ON COLUMN "THEATER"."th_name" IS '공연장 이름';
COMMENT ON COLUMN "THEATER"."th_seat" IS '공연장 좌석 수';
COMMENT ON COLUMN "THEATER"."th_addr" IS '공연장 주소';
COMMENT ON COLUMN "THEATER"."th_map_lat" IS '공연장 지도상 위도';
COMMENT ON COLUMN "THEATER"."th_map_lng" IS '공연장 지도상 경도';
COMMENT ON COLUMN "THEATER"."th_web" IS '공연장 웹사이트 주소';
COMMENT ON COLUMN "THEATER"."th_regdate" IS '공연장 데이터 등록일';
COMMENT ON COLUMN "THEATER"."th_update" IS '공연장 데이터 수정일';

--PK 설정
ALTER TABLE "THEATER" ADD CONSTRAINT "PK_THEATER" PRIMARY KEY ("th_num");

--사용 시퀀스
CREATE SEQUENCE THEATER_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;


--파일 테이블

--테이블 생성
CREATE TABLE "FILE" (
	"file_id"	NUMBER(20)		NOT NULL,
	"file_name"	VARCHAR2(255)		NOT NULL,
	"file_dir"	VARCHAR2(255)		NOT NULL,
	"file_type"	VARCHAR2(50)		NOT NULL,
	"file_size"	NUMBER(10)	DEFAULT 0	NULL,
	"file_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"file_update"	DATE		NULL,
	"s_num"	NUMBER(20)		NOT NULL
);

--코멘트 부여
COMMENT ON COLUMN "FILE"."file_id" IS '파일 ID';
COMMENT ON COLUMN "FILE"."file_name" IS '파일 이름';
COMMENT ON COLUMN "FILE"."file_dir" IS '파일 경로';
COMMENT ON COLUMN "FILE"."file_type" IS '파일 확장자';
COMMENT ON COLUMN "FILE"."file_size" IS '파일 용량';
COMMENT ON COLUMN "FILE"."file_regdate" IS '파일 등록일';
COMMENT ON COLUMN "FILE"."file_update" IS '파일 수정일';
COMMENT ON COLUMN "FILE"."s_num" IS '공연 번호';

--PK와 FK 설정
ALTER TABLE "FILE" ADD CONSTRAINT "PK_FILE" PRIMARY KEY ("file_id");
ALTER TABLE "FILE" ADD CONSTRAINT "FK_SHOW_TO_FILE_1" FOREIGN KEY("s_num")
REFERENCES "SHOW" ("s_num");

--사용 시퀀스
CREATE SEQUENCE FILE_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;


--랭킹 테이블

--테이블 생성
CREATE TABLE "RANK" (
	"rank_id"	NUMBER(20)		NOT NULL,
	"rank_start"	DATE		NOT NULL,
	"rank_end"	DATE		NOT NULL,
	"rank_ticket"	NUMBER		NULL,
	"rank_rank"	NUMBER(10)		NULL,
	"rank_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"rank_update"	DATE		NULL,
	"s_num"	NUMBER(20)		NOT NULL
);

--코멘트 부여
COMMENT ON COLUMN "RANK"."rank_id" IS '랭킹정보 ID';
COMMENT ON COLUMN "RANK"."rank_start" IS '랭킹 집계 시작일';
COMMENT ON COLUMN "RANK"."rank_end" IS '랭킹 집계 종료일';
COMMENT ON COLUMN "RANK"."rank_ticket" IS '랭킹 기간 예매율';
COMMENT ON COLUMN "RANK"."rank_rank" IS '랭킹 순위';
COMMENT ON COLUMN "RANK"."rank_regdate" IS '랭킹정보 등록일';
COMMENT ON COLUMN "RANK"."rank_update" IS '랭킹정보 수정일';
COMMENT ON COLUMN "RANK"."s_num" IS '공연 번호';

--PK와 FK 설정
ALTER TABLE "RANK" ADD CONSTRAINT "PK_RANK" PRIMARY KEY ("rank_id");
ALTER TABLE "RANK" ADD CONSTRAINT "FK_SHOW_TO_RANK_1" FOREIGN KEY ("s_num")
REFERENCES "SHOW" ("s_num");

--랭킹 테이블은 랭킹정보 ID를 집계시작일, 집계종료일, 공연번호로 생성할 예정이므로 따로 시퀀스를 두지 않음


-------------------------------------------------------------------------------------------------------------------
--임은재

CREATE TABLE "CS_INQUIRY" (
	"i_num"	NUMBER(20)		NOT NULL,
	"u_id"	VARCHAR2(15)		NOT NULL,
	"i_category"	VARCHAR2(30)		NOT NULL,
	"i_cate_detail"	VARCHAR2(30)		NOT NULL,
	"i_reply"	VARCHAR2(2)	DEFAULT 'N'	NOT NULL,
    "i_title"	VARCHAR2(100)		NOT NULL,
	"i_content"	VARCHAR2(500)		NOT NULL,
	"i_regidate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"i_update"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ti_num"	NUMBER(20)		NOT NULL
);

COMMENT ON COLUMN "CS_INQUIRY"."i_num" IS '문의글번호';
COMMENT ON COLUMN "CS_INQUIRY"."u_id" IS '회원 아이디';
COMMENT ON COLUMN "CS_INQUIRY"."i_category" IS '유형';
COMMENT ON COLUMN "CS_INQUIRY"."i_cate_detail" IS '세부유형';
COMMENT ON COLUMN "CS_INQUIRY"."i_reply" IS '답변여부';
COMMENT ON COLUMN "CS_INQUIRY"."i_title" IS '답변제목';
COMMENT ON COLUMN "CS_INQUIRY"."i_content" IS '답변내용';
COMMENT ON COLUMN "CS_INQUIRY"."i_regidate" IS '등록일';
COMMENT ON COLUMN "CS_INQUIRY"."i_update" IS '수정일';
COMMENT ON COLUMN "CS_INQUIRY"."ti_num" IS '예매번호';

create sequence CS_INQUIRY_SEQ
start with 1
increment by 1
minvalue 1
nocycle
cache 2;



ALTER TABLE "CS_INQUIRY" ADD CONSTRAINT "PK_CS_INQUIRY" PRIMARY KEY ("i_num");
ALTER TABLE "CS_INQUIRY" ADD CONSTRAINT "FK_Q_USER_TO_CS_INQUIRY_1" FOREIGN KEY ("u_id") REFERENCES "Q_USER" ("u_id");

CREATE TABLE "CS_INQUIRY_REPLY" (
	"i_r_num"	NUMBER(20)		NOT NULL,
	"i_num"	NUMBER(20)		NOT NULL,
	"i_r_content"	VARCHAR2(500)		NOT NULL,
	"i_r_regidate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"i_r_update"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_r_num" IS '문의글답변번호';
COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_num" IS '문의글번호';
COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_r_content" IS '문의글답변내용';
COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_r_regidate" IS '답변등록일';
COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_r_update" IS '답변수정일';

create sequence CS_INQUIRY_REPLY_SEQ
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

ALTER TABLE "CS_INQUIRY_REPLY" ADD CONSTRAINT "PK_CS_INQUIRY_REPLY" PRIMARY KEY ("i_r_num");
ALTER TABLE "CS_INQUIRY" ADD CONSTRAINT "FK_TICKET_TO_CS_INQUIRY_1" FOREIGN KEY ("ti_num") REFERENCES "TICKET" ("ti_num");
ALTER TABLE "CS_INQUIRY_REPLY" ADD CONSTRAINT "FK_CS_INQUIRY_TO_CS_INQUIRY_REPLY_1" FOREIGN KEY ("i_num") REFERENCES "CS_INQUIRY" ("i_num");



?-------------------------------------------------------------------------------------------------------------------


--오명숙 작성 

CREATE TABLE "NOTICE" (
	"n_no"	NUMBER(20)		NOT NULL,
	"n_category"	VARCHAR2(50)		NOT NULL,
	"n_title"	VARCHAR2(100)		NOT NULL,
	"n_content"	VARCHAR2(2000)		NOT NULL,
	"n_file"	VARCHAR2(500)		NULL,
	"n_hit"	NUMBER(20)	DEFAULT 0	NOT NULL,
	"n_regdate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"n_update"	DATE	DEFAULT SYSDATE	NOT NULL
);
COMMENT ON COLUMN "NOTICE"."n_no" IS '공지사항 글번호';
COMMENT ON COLUMN "NOTICE"."n_category" IS '공지사항 카테고리';
COMMENT ON COLUMN "NOTICE"."n_title" IS '공지사항 제목';
COMMENT ON COLUMN "NOTICE"."n_content" IS '공지사항 글내용';
COMMENT ON COLUMN "NOTICE"."n_file" IS '이미지 경로 및 파 일명';
COMMENT ON COLUMN "NOTICE"."n_hit" IS '공지사항 조회수';
COMMENT ON COLUMN "NOTICE"."n_regdate" IS '공지사항 등록일';
COMMENT ON COLUMN "NOTICE"."n_update" IS '공지사항 수정일';
ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"n_no"
);
     
create sequence quicket_noteice_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;


Insert into QUICKET.NOTICE ("n_no","n_category","n_title","n_content","n_file","n_hit","n_regdate","n_update") values (quicket_noteice_seq,'기타','티켓 배송료 인상 안내 (2023년 03월 23일부)','안녕하세요. QUICKet입니다. 항상 QUICKet를 이용해 주시는 고객분들께 감사 말씀 드립니다.
티켓 제작 단가 인상 및 배송 단가 인상 등 원자재 가격 상승으로 인하여 2023년 3월 23일(목)부터 티켓 배송료가 아래와 같이 부득이하게 인상되었습니다.
고객님들의 양해 부탁드립니다. 
▶ 배송비 변경 시행일: 2023년 3월 23일(목)
▶ 변경 내용: 기존 3,000원(건당) →변경 3,200원(건당)
※ 상품 유형에 따라 배송비가 다를 수 있음
 편리한 서비스로 보답하는 QUICKet이 되겠습니다.
감사합니다.',null,0,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'));

select * from NOTICE;
----------------------------------------------------------------------------------------------------------------------

CREATE TABLE "FAQ" (
	"f_no"	NUMBER(20)		NOT NULL,
	"f_category"	VARCHAR2(50)		NOT NULL,
	"f_title"	VARCHAR2(100)		NOT NULL,
	"f_content"	VARCHAR2(2000)		NOT NULL,
	"f_regdate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"f_update"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "FAQ"."f_no" IS 'FAQ 글번호';
COMMENT ON COLUMN "FAQ"."f_category" IS 'FAQ 카테고리';
COMMENT ON COLUMN "FAQ"."f_title" IS 'FAQ 제목';
COMMENT ON COLUMN "FAQ"."f_content" IS 'FAQ 글내용';
COMMENT ON COLUMN "FAQ"."f_regdate" IS 'FAQ 등록일';
COMMENT ON COLUMN "FAQ"."f_update" IS 'FAQ 수정일';

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"f_no"
);

create sequence quicket_faq_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

insert into QUICKET.FAQ ("f_no","f_category","f_title","f_content","f_regdate","f_update") values (quicket_faq_seq.nextval,'회원','회원 탈퇴 신청을 하고 싶어요','티켓링크에서는 서비스 탈퇴 신청 후 철회를 하실 수 없습니다.
개인정보 도용 등으로 인한 원치 않은 서비스 탈퇴, 부정 이용 방지 등에 대비하기 위하여 서비스 탈퇴 요청 후 3일간 개인정보를 보관합니다. 서비스 재 이용을 원하시는 경우, 탈퇴 신청 3일 후 서비스 재 가입하여 이용하시기 바랍니다.',
to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'));

select * from FAQ;
----------------------------------------------------------------------------------------------------------------------

CREATE TABLE "REVIEWBOARD" (
	"r_no"	NUMBER(20)		NOT NULL,
	"u_id"	VARCHAR2(15)		NOT NULL,
	"r_title"	VARCHAR2(100)		NOT NULL,
	"r_content"	VARCHAR2(2000)		NOT NULL,
	"r_point"	NUMBER(20)		NOT NULL,
	"r_hit"	NUMBER(20)	DEFAULT 0	NOT NULL,
	"r_regdate"	DATE	DEFAULT SYSDATE	NOT NULL,
	"r_update"	DATE	DEFAULT SYSDATE	NOT NULL,
	"s_num"	NUMBER(20)		NOT NULL
);

COMMENT ON COLUMN "REVIEWBOARD"."r_no" IS '관람후기 글번호';
COMMENT ON COLUMN "REVIEWBOARD"."u_id" IS '회원 아이디';
COMMENT ON COLUMN "REVIEWBOARD"."r_title" IS '관람후기 제목';
COMMENT ON COLUMN "REVIEWBOARD"."r_content" IS '관람후기 내용';
COMMENT ON COLUMN "REVIEWBOARD"."r_point" IS '관람후기 별점';
COMMENT ON COLUMN "REVIEWBOARD"."r_hit" IS '관람후기 조회수';
COMMENT ON COLUMN "REVIEWBOARD"."r_regdate" IS '관람후기 등록일';
COMMENT ON COLUMN "REVIEWBOARD"."r_update" IS '관람후기 수정일';
COMMENT ON COLUMN "REVIEWBOARD"."s_num" IS '공연 번호';

ALTER TABLE "REVIEWBOARD" ADD CONSTRAINT "PK_REVIEWBOARD" PRIMARY KEY (
	"r_no",	"u_id"
);

ALTER TABLE "REVIEWBOARD" ADD CONSTRAINT "FK_Q_USER_TO_REVIEWBOARD_1" FOREIGN KEY (
	"u_id"
)
REFERENCES "Q_USER" (
	"u_id"
);

ALTER TABLE "REVIEWBOARD" ADD CONSTRAINT "FK_SHOW_TO_REVIEWBOARD_1" FOREIGN KEY (
	"s_num"
)
REFERENCES "SHOW" (
	"s_num"
);

        
create sequence quicket_reviewboard_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
   
select * from  REVIEWBOARD ;





--====
--
--김나정 (작성중)
--
--이벤트
CREATE TABLE EVENT (
    E_NUM VARCHAR2(10) NOT NULL ,
    E_NAME VARCHAR2(50) NOT NULL,
    E_STARTDATE DATE NOT NULL,
    E_ENDDATE DATE NOT NULL,
    E_IMG VARCHAR2(255) NOT NULL,
    E_REGDATE DATE NOT NULL,
    E_UPDATE DATE NOT NULL,
    S_NUM NUMBER(20) NOT NULL
);

create sequence event_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;


ALTER TABLE `EVENT` ADD CONSTRAINT `PK_EVENT` PRIMARY KEY (`e_num`);
ALTER TABLE `EVENT` ADD CONSTRAINT `FK_SHOW_TO_EVENT_1` FOREIGN KEY (`s_num`) REFERENCES `SHOW` (`s_num`);


COMMENT ON TABLE EVENT IS '이벤트 테이블';
COMMENT ON COLUMN EVENT.E_NUM IS '이벤트 글번호';
COMMENT ON COLUMN EVENT.e_name IS '이벤트명';
COMMENT ON COLUMN EVENT.e_startdate IS '이벤트 시작일';
COMMENT ON COLUMN EVENT.e_enddate IS '이벤트 종료일';
COMMENT ON COLUMN EVENT.e_img IS '이벤트 관련 이미지';
COMMENT ON COLUMN EVENT.e_regdate IS '이벤트 등록일';
COMMENT ON COLUMN EVENT.e_update IS '이벤트 수정일';
COMMENT ON COLUMN EVENT.s_num IS '이벤트 공연 번호';



--기대평
CREATE TABLE EXPECTATION (
	ex_no	NUMBER(20)		NOT NULL,
	ex_title	VARCHAR2(100)		NOT NULL,
	ex_content	VARCHAR2(2000)		NOT NULL,
	ex_hit	NUMBER(20)		NOT NULL,
	ex_regdate	DATE		NOT NULL,
	ex_update	DATE		NOT NULL,
	u_id	VARCHAR2(15)		NOT NULL,
	s_num	NUMBER(20)		NOT NULL,
	ti_num	NUMBER		NOT NULL
);


create sequence expectation_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;


ALTER TABLE `EXPECTATION` ADD CONSTRAINT PK_EXPECTATION PRIMARY KEY (ex_no);
ALTER TABLE `EXPECTATION` ADD CONSTRAINT `FK_Q_USER_TO_EXPECTATION_1` FOREIGN KEY (`u_id`) REFERENCES `Q_USER` (`u_id`);
ALTER TABLE `EXPECTATION` ADD CONSTRAINT `FK_SHOW_TO_EXPECTATION_1` FOREIGN KEY (`s_num`) REFERENCES `SHOW` (`s_num`);
ALTER TABLE `EXPECTATION` ADD CONSTRAINT `FK_TICKET_TO_EXPECTATION_1` FOREIGN KEY (`ti_num`) REFERENCES `TICKET` (`ti_num`);

COMMENT ON COLUMN EXPECTATION.ex_no IS '기대평 글번호';
COMMENT ON COLUMN EXPECTATION.ex_title IS '기대평 제목';
COMMENT ON COLUMN EXPECTATION.ex_content IS '기대평 내용';
COMMENT ON COLUMN EXPECTATION.ex_hit IS '기대평 조회수';
COMMENT ON COLUMN EXPECTATION.ex_regdate IS '기대평 등록일';
COMMENT ON COLUMN EXPECTATION.ex_update IS '기대평 수정일';
COMMENT ON COLUMN EXPECTATION.u_id IS '회원 아이디';
COMMENT ON COLUMN EXPECTATION.s_num IS '공연 번호';
COMMENT ON COLUMN EXPECTATION.ti_num IS '예매번호';


--관리자 쿠폰
CREATE TABLE ADMIN_COUPON (
	c_num	VARCHAR2(10)		NOT NULL,
	c_name	VARCHAR2(50)		NOT NULL,
	c_discount	NUMBER		NOT NULL,
	c_startdate	DATE		NOT NULL,
	c_enddate	DATE		NOT NULL,
	c_img	VARCHAR2(255)		NOT NULL,
	c_regdate	DATE		NOT NULL,
	c_update	DATE		NOT NULL
);

ALTER TABLE `ADMIN_COUPON` ADD CONSTRAINT `PK_ADMIN_COUPON` PRIMARY KEY (`c_num`);

COMMENT ON COLUMN ADMIN_COUPON.c_num IS '쿠폰번호';
COMMENT ON COLUMN ADMIN_COUPON.c_name IS '쿠폰명';
COMMENT ON COLUMN ADMIN_COUPON.c_discount IS '할인율';
COMMENT ON COLUMN ADMIN_COUPON.c_startdate IS '유효기간 시작일';
COMMENT ON COLUMN ADMIN_COUPON.c_enddate IS '유효기간 종료일';
COMMENT ON COLUMN ADMIN_COUPON.c_img IS '쿠폰 이미지';
COMMENT ON COLUMN ADMIN_COUPON.c_regdate IS '쿠폰 등록일';
COMMENT ON COLUMN ADMIN_COUPON.c_update IS '쿠폰 수정일';



--보유쿠폰
CREATE TABLE "USER_COUPON" (
	"u_id"	VARCHAR2(15)		NOT NULL,
	"c_num"	VARCHAR2(10)		NOT NULL,
	"uc_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"uc_state"	NUMBER(1)	DEFAULT 0	NOT NULL
);

ALTER TABLE `USER_COUPON` ADD CONSTRAINT `PK_USER_COUPON` PRIMARY KEY (`u_id`, `c_num`);
ALTER TABLE `USER_COUPON` ADD CONSTRAINT `FK_ADMIN_COUPON_TO_USER_COUPON_1` FOREIGN KEY (`c_num`) REFERENCES `ADMIN_COUPON` (`c_num`);

COMMENT ON COLUMN "USER_COUPON"."u_id" IS '회원 아이디';
COMMENT ON COLUMN "USER_COUPON"."c_num" IS '쿠폰번호';
COMMENT ON COLUMN "USER_COUPON"."uc_date" IS '쿠폰 발급일';
COMMENT ON COLUMN "USER_COUPON"."uc_state" IS '0:미사용, 1:사용완료, -1:기간만료';


--QNA 
CREATE TABLE "QNA" (
	"q_no"	NUMBER(20)		NOT NULL,
	"q_title"	VARCHAR2(100)		NOT NULL,
	"q_content"	VARCHAR2(2000)		NOT NULL,
	"q_regdate"	DATE		NOT NULL,
	"q_update"	DATE		NOT NULL,
	"q_reply"	VARCHAR2(1000)		NOT NULL,
	"u_id"	VARCHAR2(15)		NOT NULL,
	"s_num"	NUMBER(20)		NOT NULL
);


create sequence qna_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;


ALTER TABLE `QNA` ADD CONSTRAINT `PK_QNA` PRIMARY KEY (`q_no`);
ALTER TABLE `QNA` ADD CONSTRAINT `FK_Q_USER_TO_QNA_1` FOREIGN KEY (`u_id`) REFERENCES `Q_USER` (`u_id`);


COMMENT ON COLUMN "QNA"."q_no" IS 'QNA 글번호';
COMMENT ON COLUMN "QNA"."q_title" IS 'QNA 제목';
COMMENT ON COLUMN "QNA"."q_content" IS 'QNA 내용';
COMMENT ON COLUMN "QNA"."q_regdate" IS 'QNA 등록일';
COMMENT ON COLUMN "QNA"."q_update" IS 'QNA 수정일';
COMMENT ON COLUMN "QNA"."q_reply" IS 'QNA 답변';
COMMENT ON COLUMN "QNA"."u_id" IS '회원 아이디';
COMMENT ON COLUMN "QNA"."s_num" IS '공연 번호';


--QNA 댓글
CREATE TABLE "QNA_REPLY" (
	"q_no"	NUMBER(20)		NOT NULL,
	"q_r_no"	NUMBER(20)		NOT NULL,
	"q_r_content"	VARCHAR2(2000)		NOT NULL,
	"q_r_regdate"	DATE		NOT NULL,
	"q_r_update"	DATE		NOT NULL,
	"u_id"	VARCHAR2(15)		NOT NULL
);


create sequence q_r_no_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;


ALTER TABLE `QNA_REPLY` ADD CONSTRAINT `PK_QNA_REPLY` PRIMARY KEY (`q_no`);
ALTER TABLE `QNA_REPLY` ADD CONSTRAINT `FK_QNA_TO_QNA_REPLY_1` FOREIGN KEY (`q_no`) REFERENCES `QNA` (`q_no`);
ALTER TABLE `QNA_REPLY` ADD CONSTRAINT `FK_Q_USER_TO_QNA_REPLY_1` FOREIGN KEY (`u_id`) REFERENCES `Q_USER` (`u_id`);


COMMENT ON COLUMN "QNA_REPLY"."q_no" IS 'QA 글번호';
COMMENT ON COLUMN "QNA_REPLY"."q_r_no" IS '답변 글번호';
COMMENT ON COLUMN "QNA_REPLY"."q_r_content" IS '답변 내용';
COMMENT ON COLUMN "QNA_REPLY"."q_r_regdate" IS '답변 등록일';
COMMENT ON COLUMN "QNA_REPLY"."q_r_update" IS '답변 수정일';
COMMENT ON COLUMN "QNA_REPLY"."u_id" IS '회원 아이디';

-------------------------------------------------------------------------------------------------------------------
--권진범


CREATE TABLE "SEAT" (
	"seat_num"	NUMBER		NOT NULL,
	"hall_id"	VARCHAR2(100)		NOT NULL,
	"seat_status"	NUMBER		NOT NULL,
	"seat_age"	VARCHAR2(20)		NULL,
	"seat_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"seat_update"	DATE		NULL
);

ALTER TABLE "SEAT" ADD CONSTRAINT "PK_SEAT" PRIMARY KEY (
	"seat_num",
	"hall_id"
);

ALTER TABLE "SEAT" ADD CONSTRAINT "FK_HALL_TO_SEAT_1" FOREIGN KEY (
	"hall_id"
)
REFERENCES "HALL" (
	"hall_id"
);

COMMENT ON COLUMN "SEAT"."seat_num" IS '좌석번호';

COMMENT ON COLUMN "SEAT"."hall_id" IS '공연장정보ID';

COMMENT ON COLUMN "SEAT"."seat_status" IS '좌석 활성/비활성화';

COMMENT ON COLUMN "SEAT"."seat_age" IS '성인/아동';

COMMENT ON COLUMN "SEAT"."seat_regdate" IS '좌석 데이터 등록일';

COMMENT ON COLUMN "SEAT"."seat_update" IS '좌석 데이터 수정일';

CREATE TABLE "HALL" (
	"hall_id"	VARCHAR2(100)		NOT NULL,
	"hall_place"	VARCHAR2(10)		NOT NULL,
	"hall_turn"	VARCHAR2(5)		NOT NULL,
	"hall_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"hall_update"	DATE		NULL,
	"th_num"	NUMBER(20)		NOT NULL
);

ALTER TABLE "HALL" ADD CONSTRAINT "PK_HALL" PRIMARY KEY (
	"hall_id"
);
ALTER TABLE "HALL" ADD CONSTRAINT "FK_THEATER_TO_HALL_1" FOREIGN KEY (
	"th_num"
)
REFERENCES "THEATER" (
	"th_num"
);

COMMENT ON COLUMN "HALL"."hall_id" IS '공연장정보ID';

COMMENT ON COLUMN "HALL"."hall_place" IS '공연관';

COMMENT ON COLUMN "HALL"."hall_turn" IS '상영회차';

COMMENT ON COLUMN "HALL"."hall_regdate" IS '공연홀 데이터 등록일';

COMMENT ON COLUMN "HALL"."hall_update" IS '공연홀 데이터 수정일';

COMMENT ON COLUMN "HALL"."th_num" IS '공연장 번호';

CREATE TABLE "STATISTICS" (
	"st_date"	VARCHAR2(1000)		NOT NULL,
	"s_num"	NUMBER(20)		NOT NULL,
	"ti_num"	NUMBER		NOT NULL,
	"st_cash"	NUMBER		NULL,
	"st_per"	VARCHAR2(1000)		NULL
);

ALTER TABLE "STATISTICS" ADD CONSTRAINT "PK_STATISTICS" PRIMARY KEY (
	"st_date"
);
ALTER TABLE "STATISTICS" ADD CONSTRAINT "FK_SHOW_TO_STATISTICS_1" FOREIGN KEY (
	"s_num"
)
REFERENCES "SHOW" (
	"s_num"
);
ALTER TABLE "STATISTICS" ADD CONSTRAINT "FK_PAY_TO_STATISTICS_1" FOREIGN KEY (
	"ti_num"
)
REFERENCES "PAY" (
	"ti_num"
);

COMMENT ON COLUMN "STATISTICS"."st_date" IS '주간 날짜 데이터';

COMMENT ON COLUMN "STATISTICS"."s_num" IS '공연 번호';

COMMENT ON COLUMN "STATISTICS"."ti_num" IS '예매번호';

COMMENT ON COLUMN "STATISTICS"."st_cash" IS '주간별 저장될 수익의 합';

COMMENT ON COLUMN "STATISTICS"."st_per" IS '주간별 저장될 예매율';

CREATE TABLE "PAY" (
	"ti_num"	NUMBER(20)		NOT NULL,
	"pay_name"	VARCHAR2(20)		NULL,
	"pay_phone"	VARCHAR2(30)		NULL,
	"pay_amount"	NUMBER		NOT NULL,
	"pay_virtual_num"	VARCHAR2(100)		NULL,
	"pay_cardNum"	VARCHAR2(100)		NULL,
	"pay_cardPwd"	NUMBER(20)		NULL,
	"pay_status"	VARCHAR2(20)		NOT NULL,
	"pay_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"pay_update"	DATE		NULL,
	"c_num"	VARCHAR2(10)		NULL
);

ALTER TABLE "PAY" ADD CONSTRAINT "PK_PAY" PRIMARY KEY (
	"ti_num"
);

ALTER TABLE "PAY" ADD CONSTRAINT "FK_TICKET_TO_PAY_1" FOREIGN KEY (
	"ti_num"
)
REFERENCES "TICKET" (
	"ti_num"
);

ALTER TABLE "PAY" ADD CONSTRAINT "FK_USER_COUPON_TO_PAY_1" FOREIGN KEY (
	"c_num"
)
REFERENCES "USER_COUPON" (
	"c_num"
);

COMMENT ON COLUMN "PAY"."ti_num" IS '예매번호';

COMMENT ON COLUMN "PAY"."pay_name" IS '결제자 이름';

COMMENT ON COLUMN "PAY"."pay_phone" IS '결제자 전화번호';

COMMENT ON COLUMN "PAY"."pay_amount" IS '결제금액';

COMMENT ON COLUMN "PAY"."pay_virtual_num" IS '가상계좌번호';

COMMENT ON COLUMN "PAY"."pay_cardNum" IS '카드번호';

COMMENT ON COLUMN "PAY"."pay_cardPwd" IS '카드비밀번호';

COMMENT ON COLUMN "PAY"."pay_status" IS '결제상태';

COMMENT ON COLUMN "PAY"."pay_regdate" IS '결제 데이터 등록일';

COMMENT ON COLUMN "PAY"."pay_update" IS '결제 데이터 수정일';

COMMENT ON COLUMN "PAY"."c_num" IS '쿠폰번호';

CREATE TABLE "TICKET_SEAT" (
	"ti_num"	NUMBER		NOT NULL,
	"seat_num"	NUMBER		NOT NULL,
	"hall_id"	VARCHAR2(100)		NOT NULL
);

ALTER TABLE "TICKET_SEAT" ADD CONSTRAINT "FK_TICKET_TO_TICKET_SEAT_1" FOREIGN KEY (
	"ti_num"
)
REFERENCES "TICKET" (
	"ti_num"
);

ALTER TABLE "TICKET_SEAT" ADD CONSTRAINT "FK_SEAT_TO_TICKET_SEAT_1" FOREIGN KEY (
	"seat_num"
)
REFERENCES "SEAT" (
	"seat_num"
);

ALTER TABLE "TICKET_SEAT" ADD CONSTRAINT "FK_SEAT_TO_TICKET_SEAT_2" FOREIGN KEY (
	"hall_id"
)
REFERENCES "SEAT" (
	"hall_id"
);

COMMENT ON COLUMN "TICKET_SEAT"."ti_num" IS '예매번호';

COMMENT ON COLUMN "TICKET_SEAT"."seat_num" IS '좌석번호';

COMMENT ON COLUMN "TICKET_SEAT"."hall_id" IS '공연장정보ID';

CREATE TABLE "TICKET" (
	"ti_num"	NUMBER		NOT NULL,
	"seat_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ti_status"	VARCHAR2(20)		NOT NULL,
	"u_id"	VARCHAR2(15)		NOT NULL,
	"ti_regdate"	DATE	DEFAULT SYSDATE	NULL,
	"ti_update"	DATE		NULL
);

ALTER TABLE "TICKET" ADD CONSTRAINT "PK_TICKET" PRIMARY KEY (
	"ti_num"
);
ALTER TABLE "TICKET" ADD CONSTRAINT "FK_Q_USER_TO_TICKET_1" FOREIGN KEY (
	"u_id"
)
REFERENCES "Q_USER" (
	"u_id"
);

COMMENT ON COLUMN "TICKET"."ti_num" IS '예매번호';

COMMENT ON COLUMN "TICKET"."seat_date" IS '예매한 시간/날짜';

COMMENT ON COLUMN "TICKET"."ti_status" IS '예매상태';

COMMENT ON COLUMN "TICKET"."u_id" IS '회원 아이디';

COMMENT ON COLUMN "TICKET"."ti_regdate" IS '예매 데이터 등록일';

COMMENT ON COLUMN "TICKET"."ti_update" IS '예매 데이터 수정일';



-------------------------------------------------------------------------------------------------------------------


