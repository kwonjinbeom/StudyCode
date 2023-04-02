DROP TABLE inquiry_reply;
DROP SEQUENCE inquiry_reply_seq;
DROP TABLE inquiry;
DROP SEQUENCE inquiry_seq;
DROP TABLE statistics;
DROP TABLE pay;
DROP TABLE qna_reply;
DROP SEQUENCE qna_reply_seq;
DROP TABLE qna;
DROP SEQUENCE qna_seq;
DROP TABLE user_coupon;
DROP TABLE admin_coupon;
DROP TABLE expectation;
DROP SEQUENCE expectation_seq;
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
DROP SEQUENCE TICKET_SEQ;
DROP TABLE rank;
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
	th_seat	NUMBER(5)		NOT NULL,
	th_addr	VARCHAR2(100)		NOT NULL,
	th_map_lat	NUMBER		NULL,
	th_map_lng	NUMBER		NULL,
	th_web		VARCHAR2(100)		NULL,
	th_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	th_update	DATE		NULL
);

COMMENT ON COLUMN theater.th_num IS '공연장 번호';
COMMENT ON COLUMN theater.th_name IS '공연장 이름';
COMMENT ON COLUMN theater.th_seat IS '공연장 좌석 수';
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

INSERT INTO theater(th_num, th_name, th_seat, th_addr, th_map_lat, th_map_lng, th_web)
VALUES(theater_seq.nextval, '예술의전당 오페라극장', 2283,  '서울 서초구 남부순환로 2406', 37.47942828868689, 127.01183723667019, 'https://www.sac.or.kr/site/main/content/operaTheater');

INSERT INTO theater(th_num, th_name, th_seat, th_addr, th_map_lat, th_map_lng, th_web)
VALUES(theater_seq.nextval, '예스24스테이지', 962,  '서울 종로구 대학로 12길 21', 37.58280297706721, 127.00321812946142, 'https://yes24stage.com/index.php');


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

CREATE INDEX index_s_name ON show(s_name);		//이름
CREATE INDEX index_s_point ON show(s_point);			//평점
CREATE INDEX index_s_opendate ON show(s_opendate);	//상영개시일
CREATE INDEX index_s_closedate ON show(s_closedate);	//상영종료일

INSERT INTO show(s_num, s_name, s_genre, s_opendate, s_closedate, s_time, s_price, s_director, s_sponsor, s_actor, s_point, s_ticketcnt, s_guide, th_num)
VALUES(show_seq.nextval, '베토벤', '뮤지컬', to_date('2023-01-12','yyyy-MM-dd'), to_date('2023-03-26','yyyy-MM-dd'), 165, 56000, '(주) EMK뮤지컬컴퍼니','예술의전당, EMK, (주)카카오엔터테인먼트','[{“role”:”루드비히 반 베토벤”,”actor”:”박효신”},{“role”:”안토니 브렌타노”,”actor”:”조정은”}]', 7.8, 9060, '(공지사항 없음)', 1);

INSERT INTO show(s_num, s_name, s_genre, s_opendate, s_closedate, s_time, s_price, s_director, s_sponsor, s_actor, s_point, s_ticketcnt, s_guide, th_num)
VALUES(show_seq.nextval,'인터뷰','뮤지컬',to_date('2023-03-04','yyyy-MM-dd'),to_date('2023-05-28','yyyy-MM-dd'),110,44000,'(주)더블케이엔터테인먼트','(주)아떼오드','[{“role”:”유진 킴”,”actor”:”정성일”},{“role”:”싱클레어”,”actor”:”최호승”}]', 9.5, 452, '(공지사항 없음)', 2);

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
REFERENCES show(s_num);

CREATE SEQUENCE img_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;

(포스터 이미지 2개)

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_p0', '/show/1/poster', 'gif', 28025, 1);

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_2_p0', '/show/2/poster', 'gif', 28798, 2);

(상세 이미지 4개 (1번 영화용))

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_001', '/show/1/detail', 'jpg', 343874, 1);

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_002', '/show/1/detail', 'jpg', 362470, 1);

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_003', '/show/1/detail', 'jpg', 415165, 1);

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_004', '/show/1/detail', 'jpg', 2973431, 1);


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
REFERENCES show(s_num);

CREATE SEQUENCE RANK_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;

INSERT INTO rank(rank_id, rank_start, rank_end, rank_ticket, rank_rank, s_num)
VALUES(rank_seq.nextval, to_date('2023-03-13','yyyy-MM-dd'), to_date('2023-03-19','yyyy-MM-dd'), 10.0, 2, 1);

INSERT INTO rank(rank_id, rank_start, rank_end, rank_ticket, rank_rank, s_num)
VALUES(rank_seq.nextval, to_date('2023-03-13','yyyy-MM-dd'), to_date('2023-03-19','yyyy-MM-dd'), 15.0, 1, 2);

-- 예매 --------------------------------------------------------------
CREATE TABLE TICKET (
	ti_num	NUMBER		NOT NULL,
	seat_date	DATE	DEFAULT SYSDATE	NOT NULL,
	ti_status	NUMBER	default 0	NOT NULL,
	pay_num VARCHAR2(200) NOT NULL,
	u_id	VARCHAR2(15)		NOT NULL,
	ti_regdate	DATE	DEFAULT SYSDATE	NULL,
	ti_update	DATE		NULL
);


ALTER TABLE TICKET ADD CONSTRAINT PK_TICKET PRIMARY KEY (
	ti_num
);
ALTER TABLE TICKET ADD CONSTRAINT FK_Q_USER_TO_TICKET_1 FOREIGN KEY (
	u_id
)
REFERENCES Q_USER (
	u_id
);

ALTER TABLE TICKET ADD CONSTRAINT FK_PAY_TO_TICKET_1 FOREIGN KEY (
	pay_num 
)
REFERENCES PAY(
	pay_num 
);


COMMENT ON COLUMN TICKET.ti_num IS '예매번호';
COMMENT ON COLUMN TICKET.seat_date IS '예매한 시간/날짜';
COMMENT ON COLUMN TICKET.ti_status IS '예매상태';
COMMENT ON COLUMN TICKET.u_id IS '회원 아이디';
COMMENT ON COLUMN TICKET.ti_regdate IS '예매 데이터 등록일';
COMMENT ON COLUMN TICKET.ti_update IS '예매 데이터 수정일';

CREATE SEQUENCE TICKET_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;
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

insert into QUICKET.FAQ (f_no,f_category,f_title,f_content,f_regdate,f_update) values (faq_seq.nextval,'회원','회원 탈퇴 신청을 하고 싶어요','QUIcket에서는 서비스 탈퇴 신청 후 철회를 하실 수 없습니다.개인정보 도용 등으로 인한 원치 않은 서비스 탈퇴, 부정 이용 방지 등에 대비하기 위하여 서비스 탈퇴 요청 후 3일간 개인정보를 보관합니다. 서비스 재 이용을 원하시는 경우, 탈퇴 신청 3일 후 서비스 재 가입하여 이용하시기 바랍니다.',
to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'));

select * from FAQ;

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

-- 기대평 --------------------------------------------------------------
CREATE TABLE expectation (
	ex_no	NUMBER(20)		NOT NULL,
	ex_title VARCHAR2(100)		NOT NULL,
	ex_content VARCHAR2(2000)		NOT NULL,
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

ALTER TABLE expectation  ADD CONSTRAINT pk_expectation  PRIMARY KEY (ex_no);
ALTER TABLE expectation  ADD CONSTRAINT fk_q_user_to_expectation_1 FOREIGN KEY (u_id) REFERENCES q_user(u_id);
ALTER TABLE expectation ADD CONSTRAINT fk_show_to_expectation FOREIGN KEY (s_num) REFERENCES show(s_num);
ALTER TABLE expectation ADD CONSTRAINT fk_ticket_to_expectation FOREIGN KEY (ti_num) REFERENCES ticket (ti_num);

COMMENT ON COLUMN expectation .ex_no IS '기대평 글번호';
COMMENT ON COLUMN expectation.ex_title IS '기대평 제목';
COMMENT ON COLUMN expectation.ex_content IS '기대평 내용';
COMMENT ON COLUMN expectation.ex_hit IS '기대평 조회수';
COMMENT ON COLUMN expectation.ex_regdate IS '기대평 등록일';
COMMENT ON COLUMN expectation.ex_update IS '기대평 수정일';
COMMENT ON COLUMN expectation.u_id IS '회원 아이디';
COMMENT ON COLUMN expectation.s_num IS '공연 번호';
COMMENT ON COLUMN expectation.ti_num IS '예매번호';

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

COMMENT ON COLUMN admin_coupon.c_num IS '쿠폰번호';
COMMENT ON COLUMN admin_coupon.c_name IS '쿠폰명';
COMMENT ON COLUMN admin_coupon.c_discount IS '할인율';
COMMENT ON COLUMN admin_coupon.c_startdate IS '유효기간 시작일';
COMMENT ON COLUMN admin_coupon.c_enddate IS '유효기간 종료일';
COMMENT ON COLUMN admin_coupon.c_img IS '쿠폰 이미지';
COMMENT ON COLUMN admin_coupon.c_regdate IS '쿠폰 등록일';
COMMENT ON COLUMN admin_coupon.c_update IS '쿠폰 수정일';
COMMENT ON COLUMN admin_coupon.c_update IS '쿠폰 수정일';

INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update)
VALUES('ABCD1234', '가입환영쿠폰', 5, '2023-04-01', '2023-09-30', 'coupon.png', sysdate, sysdate);

INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update)
VALUES('ABCD1235', '이벤트쿠폰', 10, '2023-04-01', '2023-09-30', 'coupon.png', sysdate, sysdate);

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

INSERT INTO user_coupon(u_id, c_num, uc_date, uc_state)
VALUES('user02', 'ABCD1234', sysdate, 0);
INSERT INTO user_coupon(u_id, c_num, uc_date, uc_state)
VALUES('user02', 'ABCD1235', sysdate, 0);
-- QNA --------------------------------------------------------------
CREATE TABLE qna (
	q_no	NUMBER(20)		NOT NULL,
	q_content	VARCHAR2(2000)		NOT NULL,
	q_regdate	DATE		NOT NULL,
	q_update	DATE		NOT NULL,
	q_reply	VARCHAR2(1000)		NOT NULL,
	u_id	VARCHAR2(15)		NOT NULL,
	s_num	NUMBER(20)		NOT NULL
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
COMMENT ON COLUMN qna.q_content IS 'QNA 내용';
COMMENT ON COLUMN qna.q_regdate IS 'QNA 등록일';
COMMENT ON COLUMN qna.q_update IS 'QNA 수정일';
COMMENT ON COLUMN qna.q_reply IS 'QNA 답변';
COMMENT ON COLUMN qna.u_id IS '회원 아이디';
COMMENT ON COLUMN qna.s_num IS '공연 번호';

insert into qna(q_no, q_content, q_regdate, q_update, u_id, s_num)
values(qna_seq.nextval, '티켓 현장수령할 때 예매내역 꼭 프린트 해가야하나요?', to_date('2023-03-22', 'YYYY-MM-DD'), to_date('2023-03-23', 'YYYY-MM-DD'), 'user02', 1);



-- QNA 댓글 --------------------------------------------------------------
CREATE TABLE qna_reply (
	q_no	NUMBER(20)		NOT NULL,
	q_r_no	NUMBER(20)		NOT NULL,
	q_r_content	VARCHAR2(2000)		NOT NULL,
	q_r_regdate	DATE		NOT NULL,
	q_r_update	DATE		NOT NULL,
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
CREATE TABLE FAQ (
	f_no	NUMBER(20)		NOT NULL,
	f_category	VARCHAR2(50)		NOT NULL,
	f_title	VARCHAR2(100)		NOT NULL,
	f_content	VARCHAR2(2000)		NOT NULL,
	f_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	f_update	DATE	DEFAULT SYSDATE	NOT NULL
);
COMMENT ON COLUMN qna_reply.q_r_update IS '답변 수정일';
COMMENT ON COLUMN qna_reply.u_id IS '회원 아이디';

ALTER TABLE qna_reply ADD CONSTRAINT pk_qna_reply PRIMARY KEY (q_no);
ALTER TABLE qna_reply ADD CONSTRAINT fk_qna_to_qna_reply_1 FOREIGN KEY (q_no) REFERENCES qna (q_no);
ALTER TABLE qna_reply ADD CONSTRAINT fk_q_user_to_qna_reply_1 FOREIGN KEY (u_id) REFERENCES q_user (u_id);

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
START WITH 1
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
	c_num	VARCHAR2(10)	NULL,
   	u_id VARCHAR2(15) NOT NULL
);



ALTER TABLE PAY ADD CONSTRAINT PK_PAY PRIMARY KEY (
	pay_num
);


ALTER TABLE PAY ADD CONSTRAINT FK_TICKET_TO_PAY_1 FOREIGN KEY (
	ti_num
)
REFERENCES TICKET (
	ti_num
);

-- 열목록에 대해 일치하는 고유 또는 기본 키가 없습니다. -> u_id 부적합한 식별자
ALTER TABLE PAY ADD CONSTRAINT FK_USER_COUPON_TO_PAY_1 FOREIGN KEY (
	u_id, c_num
)
REFERENCES USER_COUPON (
	u_id, c_num
);

COMMENT ON COLUMN PAY.ti_num IS '예매번호';
COMMENT ON COLUMN PAY.pay_name IS '결제자 이름';
COMMENT ON COLUMN PAY.pay_phone IS '결제자 전화번호';
COMMENT ON COLUMN PAY.pay_amount IS '결제금액';
COMMENT ON COLUMN PAY.pay_virtual_num IS '가상계좌번호';
COMMENT ON COLUMN PAY.pay_cardNum IS '카드번호';
COMMENT ON COLUMN PAY.pay_cardPwd IS '카드비밀번호';
COMMENT ON COLUMN PAY.pay_status IS '결제상태';
COMMENT ON COLUMN PAY.pay_regdate IS '결제 데이터 등록일';
COMMENT ON COLUMN PAY.pay_update IS '결제 데이터 수정일';
COMMENT ON COLUMN PAY.c_num IS '쿠폰번호';

-- 예매좌석 --------------------------------------------------------------
CREATE TABLE TICKET_SEAT (
	ti_num	NUMBER		NOT NULL,
	seat_num	NUMBER		NOT NULL,
	hall_id	NUMBER		NOT NULL
);

ALTER TABLE TICKET_SEAT ADD CONSTRAINT FK_TICKET_TO_TICKET_SEAT_1 FOREIGN KEY (
	ti_num
)
REFERENCES TICKET (
	ti_num
);

ALTER TABLE TICKET_SEAT ADD CONSTRAINT FK_SEAT_TO_TICKET_SEAT_1 FOREIGN KEY (
	seat_num, hall_id
)
REFERENCES SEAT (
	seat_num, hall_id
);

COMMENT ON COLUMN TICKET_SEAT.ti_num IS '예매번호';
COMMENT ON COLUMN TICKET_SEAT.seat_num IS '좌석번호';
COMMENT ON COLUMN TICKET_SEAT.hall_id IS '공연장정보ID';

-- 통계 --------------------------------------------------------------
CREATE TABLE STATISTICS (
	st_date	VARCHAR2(1000)		NOT NULL,
	s_num	NUMBER(20)		NOT NULL,
	ti_num	NUMBER		NOT NULL,
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
	ti_num
)
REFERENCES PAY (
	ti_num
);

COMMENT ON COLUMN STATISTICS.st_date IS '주간 날짜 데이터';
COMMENT ON COLUMN STATISTICS.s_num IS '공연 번호';
COMMENT ON COLUMN STATISTICS.ti_num IS '예매번호';
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
	ti_num	NUMBER
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
COMMENT ON COLUMN inquiry.ti_num IS '예매번호';

create sequence inquiry_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

ALTER TABLE inquiry ADD CONSTRAINT pk_inquiry PRIMARY KEY (i_num);
ALTER TABLE inquiry ADD CONSTRAINT fk_q_user_to_inquiry_1 FOREIGN KEY (u_id) REFERENCES q_user (u_id);
ALTER TABLE inquiry ADD CONSTRAINT fk_ticket_to_inquiry_1 FOREIGN KEY (ti_num) REFERENCES ticket (ti_num);

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content, i_regidate, i_update)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '회원정보', '로그인', 0, '로그인이 안됩니다', '로그인이 안 되는데 이유를 모르겠어요', SYSDATE, SYSDATE);

UPDATE inquiry
SET i_title = '로그인은 됐는데 비밀번호가 안 맞아요', i_content='비밀번호 찾기를 해도 비밀번호가 맞지 않는다고 나와요'
WHERE i_num=1;

SELECT i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content, TO_CHAR(i_regidate, 'YYYY-MM-DD') AS i_regidate, i_update
FROM inquiry
ORDER BY i_num desc;

-- 조인해서 이름 가져오기
SELECT i_num, U.u_name, i_category, i_cate_detail, i_reply, i_title, i_content, TO_CHAR(i_regidate, 'YYYY-MM-DD') AS i_regidate, i_update
FROM inquiry I LEFT OUTER JOIN q_user U ON I.u_id = U.u_id
WHERE i_num = 3;


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

INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 1, '홈으로 돌아가서 다시 로그인 버튼을 눌러보세요', SYSDATE, SYSDATE);

SELECT i_r_num, i_num, i_r_content, i_r_regidate, i_r_update
FROM inquiry_reply;
