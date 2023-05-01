-- 한 번에 삭제되도록  drop 순서 바꿨습니다(23.04.03.)
DROP TABLE bookmark;
DROP TABLE inquiry_reply;
DROP SEQUENCE inquiry_reply_seq;
DROP TABLE inquiry;
DROP SEQUENCE inquiry_seq;
DROP TABLE statistics;
DROP TABLE qna_reply;
DROP SEQUENCE qna_reply_seq;
DROP TABLE qna;
DROP SEQUENCE qna_seq;
DROP TABLE user_coupon;
DROP TABLE admin_coupon;
DROP TABLE expect;
DROP SEQUENCE expect_seq;
DROP TABLE event;
DROP SEQUENCE event_seq;
DROP TABLE reviewboard;
DROP SEQUENCE reviewboard_seq;
DROP TABLE faq;
DROP SEQUENCE faq_seq;
DROP TABLE notice;
DROP SEQUENCE notice_seq;
DROP TABLE ticket_seat;
DROP TABLE seat;
DROP TABLE hall;
DROP SEQUENCE hall_seq;
DROP TABLE ticket;
DROP SEQUENCE ticket_seq;
DROP TABLE pay;
DROP SEQUENCE pay_seq;
DROP TABLE rank;
DROP SEQUENCE rank_seq;
DROP TABLE img;
DROP SEQUENCE img_seq;
DROP TABLE show;
DROP SEQUENCE show_seq;
DROP TABLE theater;
DROP SEQUENCE theater_seq;
DROP TABLE admin;
DROP SEQUENCE admin_seq;
DROP TABLE q_user;
DROP SEQUENCE q_user_seq;


-- 회원 --------------------------------------------------------------
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

-- 관리자 회원관리 페이지에서 회원번호 기준으로 출력하기 위한 인덱스 생성
-- (23.03.30 수정)
create index U_NUM_IDX
on q_user(u_num desc);


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



? 04.06 회원 데이터 추가
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('idkdw', q_user_seq.nextval, 'Kdw12345', '강동원', 'M', to_date('1986-08-04','YYYY-MM-DD'), 'idkdw@nate.com', '01012348745');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('skid', q_user_seq.nextval, 'S0123456', '송강', 'M', to_date('1996-11-20','YYYY-MM-DD'), 'song123@naver.com', '01056548545');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('sonhm123', q_user_seq.nextval, 'Son12345', '손흥민', 'M', to_date('1992-07-08','YYYY-MM-DD'), 'sonny07@gmail.com', '01015762549');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('suzy01', q_user_seq.nextval, 'Suzy01234', '배수지', 'F', to_date('1991-04-22','YYYY-MM-DD'), 'bszjk@daum.net', '01045651236');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('shg09', q_user_seq.nextval, 'HG012345', '송혜교', 'F', to_date('1980-04-21','YYYY-MM-DD'), 'song01@nate.com', '01095130412');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('jjh000', q_user_seq.nextval, 'Jj012345', '전지현', 'F', to_date('1985-02-10','YYYY-MM-DD'), 'j0123@gmail.com', '01051657825');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('jeon0123', q_user_seq.nextval, 'Jeon01234', '전도연', 'F', to_date('1980-08-25','YYYY-MM-DD'), '01jj@naver.com', '01064748552');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('han0123', q_user_seq.nextval, 'Han99999', '한효주', 'F', to_date('1989-05-05','YYYY-MM-DD'), 'hhj012@gmail.com', '01045457825');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('ldh1234', q_user_seq.nextval, 'Ldh12345', '이도현', 'M', to_date('1996-04-04','YYYY-MM-DD'), 'ldgh999@naver.com', '01016856945');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('irene0000', q_user_seq.nextval, 'Irene1000', '아이린', 'F', to_date('1991-03-29','YYYY-MM-DD'), 'irene1@gmail.com', '01016200352');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('jjs0000', q_user_seq.nextval, 'Jj123456', '조정석', 'M', to_date('1989-09-08','YYYY-MM-DD'), 'jo123@gmail.com', '01026575548');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('park012', q_user_seq.nextval, 'Phs00000', '박효신', 'M', to_date('1989-12-08','YYYY-MM-DD'), 'parhhs@nate.com', '01065238788');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('kjs9999', q_user_seq.nextval, 'Kjs01234', '김준수', 'M', to_date('1985-01-16','YYYY-MM-DD'), 'kjs0123@gmail.com', '01065238788');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('jeong00', q_user_seq.nextval, 'Jeong012', '정선아', 'F', to_date('1986-04-16','YYYY-MM-DD'), 'jeong01@naver.com', '010165552345');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('yunakim', q_user_seq.nextval, 'Kim012345', '김연아', 'F', to_date('1990-10-30','YYYY-MM-DD'), 'yunakim@naver.com', '01023100012');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('hansh01', q_user_seq.nextval, 'Han00000', '한소희', 'F', to_date('1995-11-09','YYYY-MM-DD'), 'hsh011@nate.com', '01095652236');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone,u_regdate, u_moddate, u_pwddate, u_state)
values ('jo999', q_user_seq.nextval, 'Jo012345', '조규성', 'M', to_date('1998-01-14','YYYY-MM-DD'), 'kyuseong@naver.com', '01065654512',to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), 0);
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone,u_regdate, u_moddate, u_pwddate, u_state)
values ('iu01234', q_user_seq.nextval, 'IU012345', '아이유', 'F', to_date('1990-03-27','YYYY-MM-DD'), 'iu012342@nate.com', '01023456850', to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), 0);
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone,u_regdate, u_moddate, u_pwddate, u_state)
values ('sinm12', q_user_seq.nextval, 'Sin00000', '신민아', 'F', to_date('1988-08-01','YYYY-MM-DD'), 'sin111@daum.net', '01013522654',to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), 0);





-- 관리자 --------------------------------------------------------------
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

-- 공연장 --------------------------------------------------------------
CREATE TABLE theater (
	th_num	NUMBER(20)		NOT NULL,
	th_name	VARCHAR2(50)		NOT NULL,

	th_addr	VARCHAR2(100)		NOT NULL,
	th_map_lat	NUMBER		NULL,
	th_map_lng	NUMBER		NULL,
	th_web		VARCHAR2(100)		NULL,
	th_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	th_update	DATE		NULL
);

COMMENT ON COLUMN theater.th_num IS '공연장 번호';
COMMENT ON COLUMN theater.th_name IS '공연장 이름';
COMMENT ON COLUMN theater.th_addr IS '공연장 주소';
COMMENT ON COLUMN theater.th_map_lat IS '공연장 지도상 위도';
COMMENT ON COLUMN theater.th_map_lng IS '공연장 지도상 경도';
COMMENT ON COLUMN theater.th_web IS '공연장 웹사이트 주소';
COMMENT ON COLUMN theater.th_regdate IS '공연장 데이터 등록일';
COMMENT ON COLUMN theater.th_update IS '공연장 데이터 수정일';

ALTER TABLE theater ADD CONSTRAINT pk_theater PRIMARY KEY(th_num);

CREATE SEQUENCE THEATER_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;

CREATE INDEX index_th_name ON theater(th_name);
CREATE INDEX index_th_addr ON theater(th_addr);
CREATE INDEX index_th_regdate ON theater(th_regdate);




-- 공연 --------------------------------------------------------------
CREATE TABLE show (
	s_num		NUMBER(20)		NOT NULL,
	s_name	VARCHAR2(50)		NOT NULL,
	s_genre	VARCHAR2(30)		NOT NULL,
	s_opendate	DATE		NOT NULL,
	s_closedate	DATE		NOT NULL,
	s_time		NUMBER(5)		NOT NULL,
	s_price		NUMBER(10)		NOT NULL,
	s_director	VARCHAR2(200)		NULL,
	s_sponsor	VARCHAR2(200)		NULL,
	s_actor	VARCHAR2(4000)		NULL,
	s_point		NUMBER	DEFAULT 0	NOT NULL,
	s_ticketcnt	NUMBER(20)	DEFAULT 0	NULL,
	s_guide	CLOB		NULL,
	s_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	s_update	DATE		NULL,
	th_num	NUMBER(20)		NOT NULL
);

COMMENT ON COLUMN show.s_num IS '공연 번호';
COMMENT ON COLUMN show.s_name IS '공연 이름';
COMMENT ON COLUMN show.s_genre IS '공연 장르';
COMMENT ON COLUMN show.s_opendate IS '공연 시작일';
COMMENT ON COLUMN show.s_closedate IS '공연 종료일';
COMMENT ON COLUMN show.s_time IS '공연 상영시간';
COMMENT ON COLUMN show.s_price IS '공연 티켓가격';
COMMENT ON COLUMN show.s_director IS '공연 기획 제작 정보';
COMMENT ON COLUMN show.s_sponsor IS '공연 주최 주관 정보';
COMMENT ON COLUMN show.s_actor IS '공연 캐스팅 배우 정보';
COMMENT ON COLUMN show.s_point IS '공연 별점 평균';
COMMENT ON COLUMN show.s_ticketcnt IS '공연 예매횟수';
COMMENT ON COLUMN show.s_guide IS '공연 안내사항';
COMMENT ON COLUMN show.s_regdate IS '공연 데이터 등록일';
COMMENT ON COLUMN show.s_update IS '공연 데이터 수정일';
COMMENT ON COLUMN show.th_num IS '공연장 번호';

ALTER TABLE show ADD CONSTRAINT pk_show PRIMARY KEY(s_num);
ALTER TABLE show ADD CONSTRAINT fk_theater_to_show_1 FOREIGN KEY(th_num)
REFERENCES theater(th_num);

CREATE SEQUENCE show_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;

CREATE INDEX index_s_name ON show(s_name);		-- 이름
CREATE INDEX index_s_point ON show(s_point);			-- 평점
CREATE INDEX index_s_opendate ON show(s_opendate);	-- 상영개시일
CREATE INDEX index_s_closedate ON show(s_closedate);	-- 상영종료일


-- 파일 --------------------------------------------------------------
CREATE TABLE img (
	img_id		NUMBER(20)		NOT NULL,
	img_name	VARCHAR2(255)		NOT NULL,
	img_dir		VARCHAR2(255)		NOT NULL,
	img_type	VARCHAR2(50)		NOT NULL,
	img_size	NUMBER(10)	DEFAULT 0	NULL,
	img_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	img_update	DATE		NULL,
	s_num		NUMBER(20)		NOT NULL
);

COMMENT ON COLUMN img.img_id IS '파일 ID';
COMMENT ON COLUMN img.img_name IS '파일 이름';
COMMENT ON COLUMN img.img_dir IS '파일 경로';
COMMENT ON COLUMN img.img_type IS '파일 확장자';
COMMENT ON COLUMN img.img_size IS '파일 용량';
COMMENT ON COLUMN img.img_regdate IS '파일 등록일';
COMMENT ON COLUMN img.img_update IS '파일 수정일';
COMMENT ON COLUMN img.s_num IS '공연 번호';

ALTER TABLE img ADD CONSTRAINT pk_img PRIMARY KEY(img_id);
ALTER TABLE img ADD CONSTRAINT fk_show_to_img_1 FOREIGN KEY(s_num)
REFERENCES show(s_num) ON DELETE CASCADE;

CREATE SEQUENCE img_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;



-- 랭킹 --------------------------------------------------------------
CREATE TABLE rank (
	rank_id	NUMBER(20)		NOT NULL,
	rank_start	DATE		NOT NULL,
	rank_end	DATE		NOT NULL,
	rank_ticket	NUMBER		NOT NULL,
	rank_rank	NUMBER(10)		NOT NULL,
	rank_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	rank_update	DATE		NULL,
	s_num		NUMBER(20)		NOT NULL
);

COMMENT ON COLUMN rank.rank_id IS '랭킹정보 ID';
COMMENT ON COLUMN rank.rank_start IS '랭킹 집계 시작일';
COMMENT ON COLUMN rank.rank_end IS '랭킹 집계 종료일';
COMMENT ON COLUMN rank.rank_ticket IS '랭킹 기간 예매율';
COMMENT ON COLUMN rank.rank_rank IS '랭킹 순위';
COMMENT ON COLUMN rank.rank_regdate IS '랭킹정보 등록일';
COMMENT ON COLUMN rank.rank_update IS '랭킹정보 수정일';
COMMENT ON COLUMN rank.s_num IS '공연 번호';

ALTER TABLE rank ADD CONSTRAINT pk_rank PRIMARY KEY(rank_id);
ALTER TABLE rank ADD CONSTRAINT fk_show_to_rank_1 FOREIGN KEY(s_num)
REFERENCES show(s_num) ON DELETE CASCADE;

CREATE SEQUENCE RANK_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;


-- 결제 --------------------------------------------------------------
CREATE TABLE PAY (
	pay_num	NUMBER		NOT NULL,
	pay_name	VARCHAR2(20)	NOT NULL,
	pay_phone	VARCHAR2(30)	NOT NULL,
    pay_email	VARCHAR2(200)	NOT NULL,
	pay_amount	NUMBER		NOT NULL,
	pay_status	NUMBER	default 0	NOT NULL,
	pay_regdate	DATE	DEFAULT SYSDATE	NULL,
	pay_update	DATE		NULL,
   	u_id VARCHAR2(15) NOT NULL,
    imp_uid VARCHAR2(200) NULL,
    token VARCHAR2(200) NULL

);



ALTER TABLE PAY ADD CONSTRAINT PK_PAY PRIMARY KEY (
	pay_num
);


ALTER TABLE PAY ADD CONSTRAINT FK_Q_USER_TO_PAY_1 FOREIGN KEY (
	u_id
)
REFERENCES Q_USER(
	u_id
);


ALTER TABLE PAY ADD CONSTRAINT FK_USER_COUPON_TO_PAY_1 FOREIGN KEY (
	u_id, c_num
)
REFERENCES USER_COUPON (
	u_id, c_num
);

COMMENT ON COLUMN PAY.pay_num IS '결제번호';
COMMENT ON COLUMN PAY.pay_name IS '결제자 이름';
COMMENT ON COLUMN PAY.pay_phone IS '결제자 전화번호';
COMMENT ON COLUMN PAY.pay_amount IS '결제금액';
COMMENT ON COLUMN PAY.pay_status IS '결제상태';
COMMENT ON COLUMN PAY.pay_regdate IS '결제 데이터 등록일';
COMMENT ON COLUMN PAY.pay_update IS '결제 데이터 수정일';
COMMENT ON COLUMN PAY.c_num IS '쿠폰번호';

CREATE SEQUENCE PAY_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;


-- 예매 --------------------------------------------------------------
CREATE TABLE TICKET (
	pay_num	NUMBER		NOT NULL,
	ti_date	DATE	DEFAULT SYSDATE	NOT NULL,
	ti_status	NUMBER	default 1	NOT NULL,
	u_id	VARCHAR2(15)		NOT NULL,
	ti_regdate	DATE	DEFAULT SYSDATE	NULL,
	ti_update	DATE		NULL
);


ALTER TABLE TICKET ADD CONSTRAINT PK_TICKET PRIMARY KEY (
	pay_num
);
ALTER TABLE TICKET ADD CONSTRAINT FK_Q_USER_TO_TICKET_1 FOREIGN KEY (
	u_id
)
REFERENCES Q_USER (
	u_id
);



COMMENT ON COLUMN TICKET.pay_num IS '예매번호';
COMMENT ON COLUMN TICKET.ti_date IS '예매한 시간/날짜';
COMMENT ON COLUMN TICKET.ti_status IS '예매상태';
COMMENT ON COLUMN TICKET.u_id IS '회원 아이디';
COMMENT ON COLUMN TICKET.ti_regdate IS '예매 데이터 등록일';
COMMENT ON COLUMN TICKET.ti_update IS '예매 데이터 수정일';



-- 공지사항 --------------------------------------------------------------
CREATE TABLE NOTICE (
	n_no	NUMBER(20)		NOT NULL,
	n_category	VARCHAR2(50)		NOT NULL,
	n_title	VARCHAR2(100)		NOT NULL,
	n_content	VARCHAR2(2000)		NOT NULL,
	n_file	VARCHAR2(500)		NULL,
	n_hit	NUMBER(20)	DEFAULT 0	NOT NULL,
	n_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	n_update	DATE	DEFAULT SYSDATE	NOT NULL
);
COMMENT ON COLUMN NOTICE.n_no IS '공지사항 글번호';
COMMENT ON COLUMN NOTICE.n_category IS '공지사항 카테고리';
COMMENT ON COLUMN NOTICE.n_title IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.n_content IS '공지사항 글내용';
COMMENT ON COLUMN NOTICE.n_file IS '이미지 경로 및 파 일명';
COMMENT ON COLUMN NOTICE.n_hit IS '공지사항 조회수';
COMMENT ON COLUMN NOTICE.n_regdate IS '공지사항 등록일';
COMMENT ON COLUMN NOTICE.n_update IS '공지사항 수정일';

ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	n_no
);
   
create sequence notice_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

Insert into QUICKET.NOTICE (n_no,n_category,n_title,n_content,n_file,n_hit,n_regdate,n_update) values (notice_seq.NEXTVAL,'기타','티켓 배송료 인상 안내 (2023년 03월 23일부)','안녕하세요. QUICKet입니다. 항상 QUICKet를 이용해 주시는 고객분들께 감사 말씀 드립니다.
티켓 제작 단가 인상 및 배송 단가 인상 등 원자재 가격 상승으로 인하여 2023년 3월 23일(목)부터 티켓 배송료가 아래와 같이 부득이하게 인상되었습니다.
고객님들의 양해 부탁드립니다. 
▶ 배송비 변경 시행일: 2023년 3월 23일(목)
▶ 변경 내용: 기존 3,000원(건당) →변경 3,200원(건당)
※ 상품 유형에 따라 배송비가 다를 수 있음
 편리한 서비스로 보답하는 QUICKet이 되겠습니다.
감사합니다.',null,0,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'));

select * from NOTICE;

-- FAQ --------------------------------------------------------------
CREATE TABLE FAQ (
	f_no	NUMBER(20)		NOT NULL,
	f_category	VARCHAR2(50)		NOT NULL,
	f_title	VARCHAR2(100)		NOT NULL,
	f_content	VARCHAR2(2000)		NOT NULL,
	f_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	f_update	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN FAQ.f_no IS 'FAQ 글번호';
COMMENT ON COLUMN FAQ.f_category IS 'FAQ 카테고리';
COMMENT ON COLUMN FAQ.f_title IS 'FAQ 제목';
COMMENT ON COLUMN FAQ.f_content IS 'FAQ 글내용';
COMMENT ON COLUMN FAQ.f_regdate IS 'FAQ 등록일';
COMMENT ON COLUMN FAQ.f_update IS 'FAQ 수정일';

ALTER TABLE FAQ ADD CONSTRAINT PK_FAQ PRIMARY KEY (
	f_no
);

create sequence faq_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

?230405 데이타 추가 -
delete from FAQ;

Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (87,'회원정보','자동로그인 이용 방법을 알려주세요.','자동로그인 이용 방법을 알려주세요.',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (88,'회원정보','자동로그인 해제 방법을 알려주세요.','자동로그인 해제 방법을 알려주세요.',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (89,'회원정보','자동로그인이란 무엇인가요?','자동로그인이란 무엇인가요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (90,'회원정보','자동로그인 알림은 무엇인가요?','자동로그인 알림은 무엇인가요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (91,'회원정보','본인의 로그인 정보가 아닐 경우 어떻게 하나요?','본인의 로그인 정보가 아닐 경우 어떻게 하나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (92,'회원정보','아이디를 잊어버린 경우 어떻게 확인 하나요?','아이디를 잊어버린 경우 어떻게 확인 하나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (93,'회원정보','비밀번호를 잊어버린 경우 어떻게 확인 하나요?','비밀번호를 잊어버린 경우 어떻게 확인 하나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (94,'회원정보','비회원 주문 확인은 어떻게 하나요?','비회원 주문 확인은 어떻게 하나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (95,'회원정보','회원가입한 적이 없는데 이미 가입되어 있다고 나옵니다.','어떻게 해야 하나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (96,'회원정보','회원가입의 조건이 있나요?','회원가입의 조건이 있나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (97,'회원정보','전화로 회원가입/탈퇴/정보 수정이 가능한가요?','전화로 회원가입/탈퇴/정보 수정이 가능한가요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (98,'회원정보','회원탈퇴 시 남은 I-포인트/S-Money/할인쿠폰 등은 어떻게 되나요?','회원탈퇴 시 남은 I-포인트/S-Money/할인쿠폰 등은 어떻게 되나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (99,'회원정보','회원탈퇴 후 개인정보는 언제 삭제되나요?','회원탈퇴 후 개인정보는 언제 삭제되나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (100,'회원정보','전화로 회원가입/탈퇴/정보 수정이 가능한가요?','전화로 회원가입/탈퇴/정보 수정이 가능한가요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (101,'회원정보','탈퇴 후 재가입까지 기간 제한이 있나요?','탈퇴 후 재가입까지 기간 제한이 있나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (102,'회원정보','회원탈퇴는 어떻게 하나요?','회원탈퇴는 어떻게 하나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (103,'공연','공연 예매가 가능한 결제수단은 어떤 것들이 있나요?','공연 예매가 가능한 결제수단은 어떤 것들이 있나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (104,'공연','결제가 완료 되었다는데 예매 내역이 없어요','결제가 완료 되었다는데 예매 내역이 없어요',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (105,'공연','무통장입금 결제 방식은 언제까지 이용가능한가요?','무통장입금 결제 방식은 언제까지 이용가능한가요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (106,'공연','예약번호입장(현장수령)으로 예매할 경우 대리인 수령이 가능한가요?','예약번호입장(현장수령)으로 예매할 경우 대리인 수령이 가능한가요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (107,'공연','예매대기 서비스에 대해 알고 싶어요','예매대기 서비스에 대해 알고 싶어요',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (108,'공연','티켓을 이미 우송 받았는데 취소하고 싶어요!','티켓을 이미 우송 받았는데 취소하고 싶어요!',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (109,'공연','공연 예매 후 수량을 일부만 취소할 수 있나요?','공연 예매 후 수량을 일부만 취소할 수 있나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (110,'공연','공연/영화예매의 [취소마감시간]이란 무엇인가요?','공연/영화예매의 [취소마감시간]이란 무엇인가요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (111,'공연','공연이 취소 됐어요!','공연이 취소 됐어요!',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (112,'공연','공연/영화예매의 취소 규정에 대해 자세히 알고 싶어요.','공연/영화예매의 취소 규정에 대해 자세히 알고 싶어요.',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (113,'공연','티켓이 반송됐을 경우 어떻게 해야 하나요?','티켓이 반송됐을 경우 어떻게 해야 하나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (114,'공연','예매한 티켓은 어떻게 받나요?','예매한 티켓은 어떻게 받나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (115,'공연','예매한 티켓은 언제 배송되나요?','예매한 티켓은 언제 배송되나요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (117,'공연','배송되는 티켓은 본인만 수령 가능한가요?','배송되는 티켓은 본인만 수령 가능한가요?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (121,'기타','휴대폰 번호를 변경하였습니다. 기존 정보로 계속 이용할 수 있나요?','휴대폰 번호가 변경되었다면! 

본인인증 변경을 진행해야 합니다.

 

- STEP :  로그인 > 마이페이지 > 회원정보 수정 > 비밀번호 입력 > 본인인증 휴대폰 [변경] 클릭 > 휴대폰 재 인증을 진행하시면 됩니다.? ',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (122,'기타','아이디 휴면처리에 대한 메일을 받았어요','- 회사는 이용자가 1년 이상 로그인 기록이 없는 경우, 개인정보의 안전한 보호 및 피해를 방지하기 위해 ‘개인정보보호법 제 39조의 6 (개인정보의 파기에 대한 특례)''에 근거하여 이용자에게 사전통지하고 개인정보를 별도로 분리하여 저장 관리합니다.


- 회사는 휴면전환(또는 휴면탈퇴) 30일 전 전자메일을 통해 사전통지하며, 휴면처리된 계정의 경우 휴면 전환일로부터 이후 4년간 재 이용이 없는 경우 분리 보관된 이용자의 정보를 완전히 파기합니다.
다만. 이용자가 서비스 재 이용을 원하실 경우에는 로그인 후 "아이디 재사용 동의"절차를 거쳐 서비스를 재이용하실 수 있습니다.?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (124,'기타','이벤트 당첨된 티켓수령은 어디에서 해야 하나요?','1. 마이페이지 > 예매확인/취소 > 배송지 변경을 원하는 예매번호를 선택합니다.

2. 예매한 티켓정보 아래 [배송지변경] 버튼 클릭 > 배송지 변경하기 팝업노출 > [주소입력] 버튼을 선택하여 원하는 배송지로 변경합니다. 

 

단! 해당 예매가 배송준비중, 배송중 상태라면 배송지 변경이 불가하오니 참고 바랍니다.',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (125,'기타','이동통신단말장치 내에서 접근권한 동의 및 철회는 어떻게 하나요?','접근권한 동의 후 아래와 같이 접근권한을 재 설정하거나 철회할 수 있습니다.

 

[안드로이드 6.0이상 VER]

- 접근 권한 별 철회방법 : 단말기 설정 > APP > 더보기(설정 및 제어) > 앱 설정 > 앱 권한 > 접근권한 선택 > 접근권한 관리

- 앱 별 철회방법 : 단말기설정 > APP > 앱 선택 > 접근권한 선택 > 접근권한 관리

 

[안드로이드 6.0미만 VER]

- 운영체제 특성상 접근 권한 별 철회가 불가능하므로, 앱을 삭제하는 경우에만 접근권한 철회가 가능합니다.

- 안드로이드 버전을 업그레이드 하여 주시길 권장합니다.

 

[IOS]

- 앱 별 철회방법 : 단말기 설정 > 애플리케이션 > 앱 선택 > 앱 권한 > 접근권한 선택 > 접근권한 관리',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (8,'기타','이동통신단말장치 내에서 접근권한 동의 및 철회는 어떻게 하나요?','접근권한 동의 후 아래와 같이 접근권한을 재 설정하거나 철회할 수 있습니다.

 

[안드로이드 6.0이상 VER]

- 접근 권한 별 철회방법 : 단말기 설정 > APP > 더보기(설정 및 제어) > 앱 설정 > 앱 권한 > 접근권한 선택 > 접근권한 관리

- 앱 별 철회방법 : 단말기설정 > APP > 앱 선택 > 접근권한 선택 > 접근권한 관리

 

[안드로이드 6.0미만 VER]

- 운영체제 특성상 접근 권한 별 철회가 불가능하므로, 앱을 삭제하는 경우에만 접근권한 철회가 가능합니다.

- 안드로이드 버전을 업그레이드 하여 주시길 권장합니다.

 

[IOS]

- 앱 별 철회방법 : 단말기 설정 > 애플리케이션 > 앱 선택 > 앱 권한 > 접근권한 선택 > 접근권한 관리
---

  ',to_date('23/03/24','RR/MM/DD'),to_date('23/03/28','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (6,'회원','회원 탈퇴 신청을 취소하고 싶어요','Quicket에서는 서비스 탈퇴 신청 후 철회를 하실 수 없습니다.

 

개인정보 도용 등으로 인한 원치 않은 서비스 탈퇴, 부정 이용 방지 등에 대비하기 위하여 서비스 탈퇴 요청 후

3일 간 개인정보를 보관합니다.

 

서비스 재 이용을 원하시는 경우, 탈퇴 신청3일 후 서비스 재 가입하여 이용이 가능합니다. ',to_date('23/03/23','RR/MM/DD'),to_date('23/03/23','RR/MM/DD'));


-- 관람후기 --------------------------------------------------------------
CREATE TABLE REVIEWBOARD (
	r_no	NUMBER(20)		NOT NULL,
	u_id	VARCHAR2(15)		NOT NULL,
	r_title	VARCHAR2(100)		NOT NULL,
	r_content	VARCHAR2(2000)		NOT NULL,
	r_point	NUMBER(20)		NOT NULL,
	r_hit	NUMBER(20)	DEFAULT 0	NOT NULL,
	r_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	r_update	DATE	DEFAULT SYSDATE	NOT NULL,
	s_num	NUMBER(20)		NOT NULL
);

COMMENT ON COLUMN REVIEWBOARD.r_no IS '관람후기 글번호';
COMMENT ON COLUMN REVIEWBOARD.u_id IS '회원 아이디';
COMMENT ON COLUMN REVIEWBOARD.r_title IS '관람후기 제목';
COMMENT ON COLUMN REVIEWBOARD.r_content IS '관람후기 내용';
COMMENT ON COLUMN REVIEWBOARD.r_point IS '관람후기 별점';
COMMENT ON COLUMN REVIEWBOARD.r_hit IS '관람후기 조회수';
COMMENT ON COLUMN REVIEWBOARD.r_regdate IS '관람후기 등록일';
COMMENT ON COLUMN REVIEWBOARD.r_update IS '관람후기 수정일';
COMMENT ON COLUMN REVIEWBOARD.s_num IS '공연 번호';

ALTER TABLE REVIEWBOARD ADD CONSTRAINT PK_REVIEWBOARD PRIMARY KEY (
	r_no,	u_id
);

ALTER TABLE REVIEWBOARD ADD CONSTRAINT FK_Q_USER_TO_REVIEWBOARD_1 FOREIGN KEY (
	u_id
)
REFERENCES Q_USER (
	u_id
);

ALTER TABLE REVIEWBOARD ADD CONSTRAINT FK_SHOW_TO_REVIEWBOARD_1 FOREIGN KEY (
	s_num
)
REFERENCES SHOW (
	s_num
);
      
create sequence reviewboard_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
   


-- 테이블 데이타 다 삭제하고 다시 넣어 주세요
-- 04/03 수정

DELETE FROM REVIEWBOARD;

Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (69,'yubin','막공주에 와서야 만난 연우틸다','아역 캐스팅 선공개 아니라 전캐찍기 어려웠다. 그래도 누구로 봐도 좋은 공연이었다. 마지막주에나 만난 연우틸다는 정말 스누피 닮은 귀여운 마틸다였네. 발음이 새는건 좀 아쉽더라. 연기는 참 좋았음.',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (67,'yubin','행복했던 5개월. 굿바이','그리하여 이 이야기도 끝이네요. 덕분에 정말 행복하고 따뜻했던 겨울이었습니다. 애정과 진심이 듬뿍 담긴 마지막 공연과 무대인사 모두 잊지 못할 거예요. 언젠가 좋은 날 꼭 다시 만나길 바라요! 제작진, 배우분들 모두 고생하셨습니다 :)',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (68,'yubin','잘 봤어요.','초연에 이어 재연 공연까지 잘 보고 왔습니다.
공연이 아이들이 많이 나와서 어린 관객들도 많이 왔더라구요.
그래서 걱정을 했는데 친구들이 아주 잘 보더라구요.
공연 끝에 약간의 늘어짐이 있어서 아쉬웠으나 대체적으로 만족 합니다.',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (70,'yubin','최고의 뮤지컬','어른인 제가 더 위로받았네요...ㅠ 꼭 빠른 시일 내로 다시 봤으면 좋겠습니다...!!

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (71,'yubin','최고예요','다시 또 꼭 만날 수 있기를 바라요

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (72,'yubin','마지막 공연까지','너무나 완벽한 공연 보여주어 감사합니다.

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (73,'yubin','틸다 진짜 가요...?','막공 시작하자마자 눈물 터졋읍니다... 웬그업때는 그냥 오열했구요ㅜㅜㅜ 틸다 또 오는거죠? 그쵸?

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (74,'yubin','기적같은 아이들이','기적같은 아이들이 만드는 기적같은 무대 꼭 보러가세요!

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (75,'yubin','진짜.. 좋았음','처음으로 3층 좌석에서 보았는데
인물의 얼굴이 잘 안보여서 너무 아쉬웠다.',4,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (76,'yubin','관크만 아니면 행복','매번 오늘은 어떤 사람이 관크를 할까 두려움에 떨면서 가야 됨

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (54,'yubin','사랑해 마틸다','최애 틸다 만나게 해줘서 고마워요. 덕분에 회전돌게 되었네요. .
종일반으로 자막! 어린이극이라 오해했던 내가 밉다. 가족극이다.정말 신기하게 눈물이 나는 극이다. 배우들의 연기가 미쳤다. 너무 재밌어...지방공 해주면 안되는걸까?어떻게 너흴 보내니ㅠㅠ',5,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (55,'yubin','마틸다','진짜 갓뮤지컬 ㅠㅠㅠㅠ

',5,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (27,'yubin','우리나라 대한민국','한분한분 너무 멋있고 대단하다는 생각밖에 안들었어요
',1,0,to_date('23/03/30','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (56,'yubin','막공주에 와서야 만난 연우틸다','역 캐스팅 선공개 아니라 전캐찍기 어려웠다. 그래도 누구로 봐도 좋은 공연이었다. 마지막주에나 만난 연우틸다는 정말 스누피 닮은 귀여운 마틸다였네. 발음이 새는건 좀 아쉽더라. 연기는 참 좋았음.',4,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (57,'yubin','너무 재미있는 뮤지컬','아역 배우들이 너무 연기와 노래를 잘하네요..!
너무너무 재미있게 봤어요!',0,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (59,'yubin','잘 봤어요^^','아이와 마지막날 공연을 보았네요~
주인공 아이가 그 긴 시간동안 대사를 다 외우고 이끌어가는것이 너무나도 놀라웠어요~어른 배우들의 대사중 가끔 민망하고 아이가 듣기에 좀 그럴것같은게 종종 있어서 그 부분이 좀 불편하더라고요..재밌게는 잘 봤습니다~아이도 코로나 이후 큰 공연을 오랜만에 봐서 좋아했네요^^',0,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);



select * from  REVIEWBOARD ;




-- 이벤트 --------------------------------------------------------------
CREATE TABLE event(
	e_num	VARCHAR2(10)		NOT NULL,
	e_name	VARCHAR2(50)		NOT NULL,
	e_startdate	DATE		NOT NULL,
	e_enddate	DATE		NOT NULL,
	e_img	VARCHAR2(255)		NOT NULL,
	e_regdate	DATE		NOT NULL,
	e_update	DATE		NOT NULL,
	s_num	NUMBER(20)		NOT NULL
);

create sequence event_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

ALTER TABLE event ADD CONSTRAINT pk_event PRIMARY KEY (e_num);
ALTER TABLE event ADD CONSTRAINT fk_show_to_event_1 FOREIGN KEY (s_num) REFERENCES show (s_num);

COMMENT ON COLUMN event.e_num IS '이벤트 글번호';
COMMENT ON COLUMN event.e_name IS '이벤트명';
COMMENT ON COLUMN event.e_startdate IS '이벤트 시작일';
COMMENT ON COLUMN event.e_enddate IS '이벤트 종료일';
COMMENT ON COLUMN event.e_img IS '이벤트 관련 이미지';
COMMENT ON COLUMN event.e_regdate IS '이벤트 등록일';
COMMENT ON COLUMN event.e_update IS '이벤트 수정일';
COMMENT ON COLUMN event.s_num IS '이벤트 공연 번호';


-- expect 테이블 컬럼 추가/삭제 했습니다(23.04.04)

-- 기대평 --------------------------------------------------------------
CREATE TABLE expect (
	ex_no	NUMBER(20)		NOT NULL,
	ex_title VARCHAR2(200)  NOT NULL,
	ex_content VARCHAR2(2000)		NOT NULL,
	ex_hit	NUMBER(20)		DEFAULT 0,
	ex_regdate	DATE		DEFAULT SYSDATE,
	ex_update	DATE		,
	u_id	VARCHAR2(15)		NOT NULL,
	s_num	NUMBER(20)		NOT NULL
);


create sequence expect_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

ALTER TABLE expect  ADD CONSTRAINT pk_expect  PRIMARY KEY (ex_no);
ALTER TABLE expect  ADD CONSTRAINT fk_q_user_to_expect_1 FOREIGN KEY (u_id) REFERENCES q_user(u_id);
ALTER TABLE expect ADD CONSTRAINT fk_show_to_expect FOREIGN KEY (s_num) REFERENCES show(s_num);

COMMENT ON COLUMN expect .ex_no IS '기대평 글번호';
COMMENT ON COLUMN expect.ex_content IS '기대평 내용';
COMMENT ON COLUMN expect.ex_title IS '기대평 제목';
COMMENT ON COLUMN expect.ex_hit IS '기대평 조회수';
COMMENT ON COLUMN expect.ex_regdate IS '기대평 등록일';
COMMENT ON COLUMN expect.ex_update IS '기대평 수정일';
COMMENT ON COLUMN expect.u_id IS '회원 아이디';
COMMENT ON COLUMN expect.s_num IS '공연 번호';


insert into expect(ex_no, ex_title, ex_content, ex_hit, ex_regdate, ex_update, u_id, s_num)
values(expect_seq.nextval, '기대되는 공연', '1달 전에 예매하고 계속 기다렸는데 너무 기대됩니다.' , 0, to_date('2023-04-02', 'YYYY-MM-DD'), '' , 'yubin', 1);


-- 관리자 쿠폰 --------------------------------------------------------------
CREATE TABLE admin_coupon (
	c_num	VARCHAR2(10)		NOT NULL,
	c_name	VARCHAR2(50)		NOT NULL,
	c_discount	NUMBER		NOT NULL,
	c_startdate	DATE		NOT NULL,
	c_enddate	DATE		NOT NULL,
	c_img	VARCHAR2(255)		NOT NULL,
	c_regdate	DATE		NOT NULL,
	c_update	DATE		NOT NULL
);

ALTER TABLE admin_coupon ADD CONSTRAINT pk_admin_coupon PRIMARY KEY (c_num);

ALTER TABLE admin_coupon ADD c_startissue DATE NOT NULL;
ALTER TABLE admin_coupon ADD c_endissue DATE NOT NULL;
COMMENT ON COLUMN admin_coupon.c_startissue IS '발급기간 시작일';
COMMENT ON COLUMN admin_coupon.c_endissue IS '발급기간 종료일';
-- 04/02 쿠폰 발급기간 필요할 것 같아서 컬럼 추가했습니다 ~ 


COMMENT ON COLUMN admin_coupon.c_num IS '쿠폰번호';
COMMENT ON COLUMN admin_coupon.c_name IS '쿠폰명';
COMMENT ON COLUMN admin_coupon.c_discount IS '할인율';
COMMENT ON COLUMN admin_coupon.c_startdate IS '유효기간 시작일';
COMMENT ON COLUMN admin_coupon.c_enddate IS '유효기간 종료일';
COMMENT ON COLUMN admin_coupon.c_img IS '쿠폰 이미지';
COMMENT ON COLUMN admin_coupon.c_regdate IS '쿠폰 등록일';
COMMENT ON COLUMN admin_coupon.c_update IS '쿠폰 수정일';


--쿠폰 등록 날짜와 수정 날짜 컬럼에 대한 기본값 추가
alter table admin_coupon modify c_regdate default sysdate;
alter table admin_coupon modify c_update default sysdate;

INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('S02D8S1', '? 봄맞이 할인 쿠폰 ?', 20, '2023-03-20', '2023-04-30', 'coupon_1680446180879_001.png', '2023-04-02',  '2023-04-02', '2023-03-06', '2023-04-30');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('W1L53CE', '? WELCOME 쿠폰 ?', 15, '2023-04-01', '2023-05-31', 'coupon_1680446265832_003.png', '2023-04-02', '2023-04-02', '2023-04-01', '2023-05-31');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('8K3L03X', '우주초특가 할인 쿠폰 ?', 30, '2023-04-17', '2023-04-23', 'coupon_1680446480847_002.png', '2023-04-02', '2023-04-02', '2023-04-10', '2023-04-30');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('T8KL012', '? 퀵켓 감사 이벤트 ?', 30, '2023-04-03', '2023-04-09', 'coupon_1680453184152_007.png', '2023-04-03',  '2023-04-03', '2023-04-01', '2023-04-09');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('J9O15NE', '? 어린이날 할인 쿠폰 ?', 25, '2023-05-01', '2023-05-05', 'coupon_1680453283426_008.png', '2023-04-03', '2023-04-03', '2023-04-29', '2023-05-05');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('CKS8752', '새해 특별 할인 쿠폰 ♥', 25, '2023-01-01', '2023-01-31', 'coupon_1680445914058_006.png', '2023-04-02', '2023-04-02', '2023-01-01', '2023-01-08');



-- 사용자 쿠폰 --------------------------------------------------------------
CREATE TABLE user_coupon (
	u_id	VARCHAR2(15)		NOT NULL,
	c_num	VARCHAR2(10)		NOT NULL,
	uc_date	DATE	DEFAULT SYSDATE	NOT NULL,
	uc_state	NUMBER(1)	DEFAULT 0	NOT NULL
);

ALTER TABLE user_coupon ADD CONSTRAINT pk_user_coupon PRIMARY KEY (u_id, c_num);
--ALTER TABLE user_coupon ADD CONSTRAINT fk_q_user_to_user_coupon_1 FOREIGN KEY (u_id, c_num) REFERENCES q_user(u_id, c_num);
ALTER TABLE user_coupon ADD CONSTRAINT fk_admin_coupon_to_user_coupon_1 FOREIGN KEY (c_num) REFERENCES admin_coupon (c_num);

COMMENT ON COLUMN user_coupon.u_id IS '회원 아이디';
COMMENT ON COLUMN user_coupon.c_num IS '쿠폰번호';
COMMENT ON COLUMN user_coupon.uc_date IS '쿠폰 발급일';
COMMENT ON COLUMN user_coupon.uc_state IS '0:미사용 1:사용완료 -1:기간만료';

-- 샘플
--INSERT INTO user_coupon(u_id, c_num, uc_date, uc_state)
--VALUES('user02', ‘S02D8S1’, sysdate, 0);
SELECT * FROM user_coupon;

-- QNA --------------------------------------------------------------
CREATE TABLE qna (
	q_no	NUMBER(20)		NOT NULL,
   	q_title VARCHAR2(200) NOT NULL,
	q_content	VARCHAR2(2000)		NOT NULL,
	q_regdate	DATE		DEFAULT SYSDATE,
	q_update	DATE		,
	u_id	VARCHAR2(15)		NOT NULL,
	s_num	NUMBER(20)		NOT NULL,
	q_cnt NUMBER(20) DEFAULT 0
);



create sequence qna_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

ALTER TABLE qna ADD CONSTRAINT pk_qna PRIMARY KEY (q_no);
ALTER TABLE qna ADD CONSTRAINT fk_q_user_to_qna_1 FOREIGN KEY (u_id) REFERENCES q_user (u_id);
ALTER TABLE qna ADD CONSTRAINT fk_show_to_qna_1 FOREIGN KEY (s_num) REFERENCES show (s_num);

COMMENT ON COLUMN qna.q_no IS 'QNA 글번호';
COMMENT ON COLUMN qna.q_title IS 'QNA 글제목';
COMMENT ON COLUMN qna.q_content IS 'QNA 내용';
COMMENT ON COLUMN qna.q_regdate IS 'QNA 등록일';
COMMENT ON COLUMN qna.q_update IS 'QNA 수정일';
COMMENT ON COLUMN qna.u_id IS '회원 아이디';
COMMENT ON COLUMN qna.s_num IS '공연 번호';
COMMENT ON COLUMN qna.q_cnt IS '댓글 개수';


insert into qna(q_no, q_title, q_content, q_regdate, q_update, u_id, s_num, q_cnt)
values(qna_seq.nextval, '현장수령 질문입니다.', '티켓 현장수령할 때 예매내역 꼭 프린트 해가야하나요?', to_date('2023-03-24', 'YYYY-MM-DD'), '', 'user02', 1, '');

insert into qna(q_no, q_title, q_content, q_regdate, q_update, u_id, s_num, q_cnt)
values(qna_seq.nextval, '현장수령 질문입니다.', '티켓 현장수령할 때 예매내역 꼭 프린트 해가야하나요?', to_date('2023-03-24', 'YYYY-MM-DD'), '', 'user02', 2, '');

insert into qna(q_no, q_title, q_content, q_regdate, q_update, u_id, s_num, q_cnt)
values(qna_seq.nextval, '티켓예매 질문입니다.', '티켓 예매할 때 카드결제도 가능한가요?', to_date('2023-03-26', 'YYYY-MM-DD'), '', 'userid', 1, '');






-- QNA 댓글 --------------------------------------------------------------
CREATE TABLE qna_reply (
	q_no	NUMBER(20)		NOT NULL,
	q_r_no	NUMBER(20)		NOT NULL,
	q_r_content	VARCHAR2(2000)		NOT NULL,
	q_r_regdate	DATE		DEFAULT SYSDATE,
	q_r_update	DATE		,
	u_id	VARCHAR2(15)		NOT NULL
);

create sequence qna_reply_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

COMMENT ON COLUMN qna_reply.q_no IS 'QNA 글번호';
COMMENT ON COLUMN qna_reply.q_r_no IS '답변 글번호';
COMMENT ON COLUMN qna_reply.q_r_content IS '답변 내용';
COMMENT ON COLUMN qna_reply.q_r_regdate IS '답변 등록일';
COMMENT ON COLUMN qna_reply.q_r_update IS '답변 수정일';
COMMENT ON COLUMN qna_reply.u_id IS '회원 아이디';

ALTER TABLE qna_reply ADD CONSTRAINT pk_qna_reply PRIMARY KEY (q_r_no);
ALTER TABLE qna_reply ADD CONSTRAINT fk_qna_to_qna_reply_1 FOREIGN KEY (q_no) REFERENCES qna (q_no);
ALTER TABLE qna_reply ADD CONSTRAINT fk_q_user_to_qna_reply_1 FOREIGN KEY (u_id) REFERENCES q_user (u_id);

insert into qna_reply(q_no, q_r_no, q_r_content, q_r_regdate, q_r_update, u_id)
values(1, qna_reply_seq.nextval, '청소년 할인이라던가 문화의 날 할인라던가 할인되는 공연이면 예매할 때 할인 적용할 수 있습니다.', to_date('2023-03-27', 'YYYY-MM-DD'), '', 'userid');

insert into qna_reply(q_no, q_r_no, q_r_content, q_r_regdate, q_r_update, u_id)
values(2, qna_reply_seq.nextval, '테스트 글에 대한 테스트 답글입니다.', to_date('2023-03-27', 'YYYY-MM-DD'), '', 'userid');
-- q_no 없다고 오류나서 1, 2번으로 바꿔놓았어요


-- 공연홀 --------------------------------------------------------------
CREATE TABLE HALL (
	hall_id	NUMBER	    NOT NULL,
	hall_place	VARCHAR2(100)		NULL,
	hall_turn	VARCHAR2(100)		NULL,
    	hall_time	VARCHAR2(100)		NULL,
   	hall_seatNum NUMBER NULL,
    	hall_date VARCHAR2(1000) NOT NULL,
    	hall_start VARCHAR2(1000) NOT NULL,
    	hall_end VARCHAR2(1000) NOT NULL,
   	hall_regdate	DATE	DEFAULT SYSDATE	NULL,
	hall_update	DATE		NULL,
   	th_num	NUMBER(20)		NOT NULL
);

CREATE SEQUENCE HALL_SEQ
START WITH 840
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;


ALTER TABLE HALL ADD CONSTRAINT PK_HALL PRIMARY KEY (
	hall_id
);
ALTER TABLE HALL ADD CONSTRAINT FK_THEATER_TO_HALL_1 FOREIGN KEY (
	th_num
)
REFERENCES THEATER (
	th_num
);

COMMENT ON COLUMN HALL.hall_id IS '공연장정보ID';
COMMENT ON COLUMN HALL.hall_place IS '공연관';
COMMENT ON COLUMN HALL.hall_turn IS '상영회차';
COMMENT ON COLUMN HALL.hall_regdate IS '공연홀 데이터 등록일';
COMMENT ON COLUMN HALL.hall_update IS '공연홀 데이터 수정일';
COMMENT ON COLUMN HALL.th_num IS '공연장 번호';




-- 좌석 --------------------------------------------------------------
CREATE TABLE SEAT (
	seat_num	NUMBER		NOT NULL,
    seat_name VARCHAR2(200) NOT NULL,
	hall_id	NUMBER		NOT NULL,
	seat_status	NUMBER  default 0   NOT NULL,
	seat_age	VARCHAR2(20)		NULL,
	seat_regdate	DATE	DEFAULT SYSDATE	NULL,
	seat_update	DATE		NULL
);

ALTER TABLE SEAT ADD CONSTRAINT PK_SEAT PRIMARY KEY (
	seat_num,
	hall_id
);

ALTER TABLE SEAT ADD CONSTRAINT FK_HALL_TO_SEAT_1 FOREIGN KEY (
	hall_id
)
REFERENCES HALL (
	hall_id
);

COMMENT ON COLUMN SEAT.seat_num IS '좌석번호';
COMMENT ON COLUMN SEAT.hall_id IS '공연장정보ID';
COMMENT ON COLUMN SEAT.seat_status IS '좌석 활성/비활성화';
COMMENT ON COLUMN SEAT.seat_age IS '성인/아동';
COMMENT ON COLUMN SEAT.seat_regdate IS '좌석 데이터 등록일';
COMMENT ON COLUMN SEAT.seat_update IS '좌석 데이터 수정일';



-- 예매좌석 --------------------------------------------------------------
CREATE TABLE TICKET_SEAT (
	seat_num	NUMBER		NOT NULL,
	hall_id	NUMBER		NOT NULL,
    pay_num NUMBER		NOT NULL
);
ALTER TABLE TICKET_SEAT ADD CONSTRAINT pk_TICKET_SEAT PRIMARY KEY (seat_num, hall_id);

ALTER TABLE TICKET_SEAT ADD CONSTRAINT FK_TICKET_TO_TICKET_SEAT_1 FOREIGN KEY (
	pay_num
)
REFERENCES TICKET (
	pay_num
);



COMMENT ON COLUMN TICKET_SEAT.pay_num IS '결제번호';
COMMENT ON COLUMN TICKET_SEAT.seat_num IS '좌석번호';
COMMENT ON COLUMN TICKET_SEAT.hall_id IS '공연장정보ID';


-- 통계 --------------------------------------------------------------
CREATE TABLE STATISTICS (
	st_date	VARCHAR2(1000)		NOT NULL,
	s_num	NUMBER(20)		NOT NULL,
	pay_num	NUMBER		NOT NULL,
	st_cash	NUMBER		NULL,
	st_per	VARCHAR2(1000)		NULL
);

ALTER TABLE STATISTICS ADD CONSTRAINT PK_STATISTICS PRIMARY KEY (
	st_date
);
ALTER TABLE STATISTICS ADD CONSTRAINT FK_SHOW_TO_STATISTICS_1 FOREIGN KEY (
	s_num
)
REFERENCES SHOW (
	s_num
);
ALTER TABLE STATISTICS ADD CONSTRAINT FK_PAY_TO_STATISTICS_1 FOREIGN KEY (
	pay_num
)
REFERENCES PAY (
	pay_num
);

COMMENT ON COLUMN STATISTICS.st_date IS '주간 날짜 데이터';
COMMENT ON COLUMN STATISTICS.s_num IS '공연 번호';
COMMENT ON COLUMN STATISTICS.pay_num IS '예매번호';
COMMENT ON COLUMN STATISTICS.st_cash IS '주간별 저장될 수익의 합';
COMMENT ON COLUMN STATISTICS.st_per IS '주간별 저장될 예매율';

-- 1대1문의 --------------------------------------------------------------
CREATE TABLE inquiry (
	i_num	NUMBER(20)		NOT NULL,
	u_id	VARCHAR2(15)		NOT NULL,
	i_category	VARCHAR2(30)		NOT NULL,
	i_cate_detail	VARCHAR2(30)		NOT NULL,
	i_reply	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:답변대기중, 1:답변완료
    i_title	VARCHAR2(100)		NOT NULL,
	i_content	VARCHAR2(500)		NOT NULL,
	i_regidate	DATE	DEFAULT SYSDATE	NOT NULL,
	i_update	DATE	DEFAULT SYSDATE	NOT NULL,
	pay_num	NUMBER
);

COMMENT ON COLUMN inquiry.i_num IS '문의글번호';
COMMENT ON COLUMN inquiry.u_id IS '회원 아이디';
COMMENT ON COLUMN inquiry.i_category IS '유형';
COMMENT ON COLUMN inquiry.i_cate_detail IS '세부유형';
COMMENT ON COLUMN inquiry.i_reply IS '답변여부';
COMMENT ON COLUMN inquiry.i_title IS '답변제목';
COMMENT ON COLUMN inquiry.i_content IS '답변내용';
COMMENT ON COLUMN inquiry.i_regidate IS '등록일';
COMMENT ON COLUMN inquiry.i_update IS '수정일';
COMMENT ON COLUMN inquiry.pay_num IS '결제번호';

create sequence inquiry_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

ALTER TABLE inquiry ADD CONSTRAINT pk_inquiry PRIMARY KEY (i_num);
ALTER TABLE inquiry ADD CONSTRAINT fk_q_user_to_inquiry_1 FOREIGN KEY (u_id) REFERENCES q_user (u_id);
ALTER TABLE inquiry ADD CONSTRAINT fk_ticket_to_inquiry_1 FOREIGN KEY (pay_num) REFERENCES ticket (pay_num);

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '로그인', 0, '자동로그인 이용 방법을 알려주세요.', '자동로그인 이용 방법을 알려주세요.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '로그인', 0, '자동로그인 해제 방법을 알려주세요.', '자동로그인 해제 방법을 알려주세요.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '로그인', 0, '자동로그인이란 무엇인가요?', '자동로그인이란 무엇인가요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '회원정보', '로그인', 0, '자동로그인 알림은 무엇인가요?', '자동로그인 알림은 무엇인가요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '회원정보', '로그인', 0, '본인의 로그인 정보가 아닐 경우 어떻게 하나요?', '본인의 로그인 정보가 아닐 경우 어떻게 하나요?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '아이디/패스워드', 0, '아이디를 잊어버린 경우 어떻게 확인 하나요?', '아이디를 잊어버린 경우 어떻게 확인 하나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '아이디/패스워드', 0, '비밀번호를 잊어버린 경우 어떻게 확인 하나요?', '비밀번호를 잊어버린 경우 어떻게 확인 하나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '회원정보', '아이디/패스워드', 0, '비밀번호를 잊어버렸는데 임시 비밀번호를 부여 받은 메일 주소도 기억 나지 않아요.', '비밀번호를 잊어버렸는데 임시 비밀번호를 부여 받은 메일 주소도 기억 나지 않아요.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '회원정보', '아이디/패스워드', 0, '비회원 주문 확인은 어떻게 하나요?', '비회원 주문 확인은 어떻게 하나요?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '회원가입', 0, '회원가입한 적이 없는데 이미 가입되어 있다고 나옵니다.', '어떻게 해야 하나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '회원가입', 0, '회원가입의 조건이 있나요?', '회원가입의 조건이 있나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '회원정보', '회원가입', 0, '전화로 회원가입/탈퇴/정보 수정이 가능한가요?', '전화로 회원가입/탈퇴/정보 수정이 가능한가요?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '회원탈퇴', 0, '회원탈퇴 시 남은 I-포인트/S-Money/할인쿠폰 등은 어떻게 되나요?', '회원탈퇴 시 남은 I-포인트/S-Money/할인쿠폰 등은 어떻게 되나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '회원탈퇴', 0, '회원탈퇴 후 개인정보는 언제 삭제되나요?', '회원탈퇴 후 개인정보는 언제 삭제되나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '회원정보', '회원탈퇴', 0, '전화로 회원가입/탈퇴/정보 수정이 가능한가요?', '전화로 회원가입/탈퇴/정보 수정이 가능한가요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '회원정보', '회원탈퇴', 0, '탈퇴 후 재가입까지 기간 제한이 있나요?', '탈퇴 후 재가입까지 기간 제한이 있나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '회원정보', '회원탈퇴', 0, '회원탈퇴는 어떻게 하나요?', '회원탈퇴는 어떻게 하나요?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '예매', 0, '공연 예매가 가능한 결제수단은 어떤 것들이 있나요?', '공연 예매가 가능한 결제수단은 어떤 것들이 있나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '예매', 0, '결제가 완료 되었다는데 예매 내역이 없어요', '결제가 완료 되었다는데 예매 내역이 없어요');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '예매', 0, '무통장입금 결제 방식은 언제까지 이용가능한가요?', '무통장입금 결제 방식은 언제까지 이용가능한가요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '공연', '예매', 0, '예약번호입장(현장수령)으로 예매할 경우 대리인 수령이 가능한가요?', '예약번호입장(현장수령)으로 예매할 경우 대리인 수령이 가능한가요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '공연', '예매', 0, '예매대기 서비스에 대해 알고 싶어요', '예매대기 서비스에 대해 알고 싶어요');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '취소/변경', 0, '티켓을 이미 우송 받았는데 취소하고 싶어요!', '티켓을 이미 우송 받았는데 취소하고 싶어요!');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '취소/변경', 0, '공연 예매 후 수량을 일부만 취소할 수 있나요?', '공연 예매 후 수량을 일부만 취소할 수 있나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '취소/변경', 0, '공연/영화예매의 [취소마감시간]이란 무엇인가요?', '공연/영화예매의 [취소마감시간]이란 무엇인가요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '공연', '취소/변경', 0, '공연이 취소 됐어요!', '공연이 취소 됐어요!');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '공연', '취소/변경', 0, '공연/영화예매의 취소 규정에 대해 자세히 알고 싶어요.', '공연/영화예매의 취소 규정에 대해 자세히 알고 싶어요.');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '배송', 0, '티켓이 반송됐을 경우 어떻게 해야 하나요?', '티켓이 반송됐을 경우 어떻게 해야 하나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '배송', 0, '예매한 티켓은 어떻게 받나요?', '예매한 티켓은 어떻게 받나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '공연', '배송', 0, '예매한 티켓은 언제 배송되나요?', '예매한 티켓은 언제 배송되나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '공연', '배송', 0, '예약번호입장(현장수령)으로 예매한 경우라도 티켓을 받아볼 수 있나요?', '예약번호입장(현장수령)으로 예매한 경우라도 티켓을 받아볼 수 있나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '공연', '배송', 0, '배송되는 티켓은 본인만 수령 가능한가요?', '배송되는 티켓은 본인만 수령 가능한가요?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '기타', '기타', 0, '핫세일 공연에 대해 알고 싶어요.', '핫세일 공연에 대해 알고 싶어요.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '기타', '기타', 0, '경품 이벤트에 당첨되었습니다.', '경품 수령은 어떻게 하나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '기타', '기타', 0, '초대 이벤트로 당첨된 티켓양도기 가능한가요?', '초대 이벤트로 당첨된 티켓양도기 가능한가요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '기타', '기타', 0, '동일좌석 재예매 서비스에 대해 알고 싶어요.', '동일좌석 재예매 서비스에 대해 알고 싶어요.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '기타', '기타', 0, '지정예매처 예매에 대해 알고 싶어요.', '지정예매처 예매에 대해 알고 싶어요.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '기타', '기타', 0, '즉석복권에 대해 알고 싶어요.', '즉석복권에 대해 알고 싶어요.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '기타', '기타', 0, '이벤트 당첨된 티켓수령은 어디에서 해야 하나요?', '이벤트 당첨된 티켓수령은 어디에서 해야 하나요?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '기타', '기타', 0, '이벤트 당첨된 공연은 정해진 날짜만 볼 수 있나요?', '이벤트 당첨된 공연은 정해진 날짜만 볼 수 있나요?');


-- 1대1문의 답변 --------------------------------------------------------------
CREATE TABLE inquiry_reply (
	i_r_num	NUMBER(20)		NOT NULL,
	i_num	NUMBER(20)		NOT NULL,
	i_r_content	VARCHAR2(500)		NOT NULL,
	i_r_regidate	DATE	DEFAULT SYSDATE	NOT NULL,
	i_r_update	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN inquiry_reply.i_r_num IS '문의글답변번호';
COMMENT ON COLUMN inquiry_reply.i_num IS '문의글번호';
COMMENT ON COLUMN inquiry_reply.i_r_content IS '문의글답변내용';
COMMENT ON COLUMN inquiry_reply.i_r_regidate IS '답변등록일';
COMMENT ON COLUMN inquiry_reply.i_r_update IS '답변수정일';

ALTER TABLE inquiry_reply ADD CONSTRAINT pk_inquiry_reply PRIMARY KEY (i_r_num);
ALTER TABLE inquiry_reply ADD CONSTRAINT fk_inquiry_to_inquiry_reply_1 FOREIGN KEY (i_num) REFERENCES inquiry (i_num);

create sequence inquiry_reply_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

-- 문의글 답변 등록
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 1, '홈으로 돌아가서 다시 로그인 버튼을 눌러보세요', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 2, '홈 버튼을 눌러보세요', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 3, '자동로그인에 체크 후 로그인하시면 브라우저의 쿠키를 삭제하거나 로그아웃을 선택하기 전까지는 계속 로그인 상태가 유지됩니다.', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 4, '인터파크 사이트 내 로그아웃 버튼 클릭하시면, 자동로그인은 해제 됩니다.', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 5, '인터파크 서비스 이용시 마다 로그인 할 필요 없이 로그인 상태를 유지할 수 있는 기능입니다.', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 6, '회원님의 계정을 안전하게 보호하기 위해, 자동로그인의 경우 알림(메일)을 발송하여 계정도용 방지를 위한 알림(메일) 서비스 입니다.', SYSDATE, SYSDATE);

SELECT i_r_num, i_num, i_r_content, i_r_regidate, i_r_update
FROM inquiry_reply;


-- 관심공연 --------------------------------------------------------------
CREATE TABLE bookmark(
    u_id	VARCHAR2(15)		NOT NULL,
    s_num		NUMBER(20)		NOT NULL,
    b_regidate DATE DEFAULT SYSDATE
);

ALTER TABLE bookmark ADD CONSTRAINT FK_Q_USER_TO_BOOKMARK_1 FOREIGN KEY (u_id)
REFERENCES q_user (u_id)
on delete cascade;
ALTER TABLE bookmark ADD CONSTRAINT FK_SHOW_TO_BOOKMARK_1 FOREIGN KEY (s_num)
REFERENCES show (s_num)
on delete cascade;
ALTER TABLE bookmark ADD CONSTRAINT pk_bookmark PRIMARY KEY (u_id, s_num);

-- INSERT INTO bookmark(u_id, s_num) VALUES('yubin', 1);
-- INSERT INTO bookmark(u_id, s_num) VALUES('userid', 1);
-- INSERT INTO bookmark(u_id, s_num) VALUES('yubin', 2);

SELECT * FROM bookmark
ORDER BY u_id;

commit;
