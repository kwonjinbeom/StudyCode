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

-- ȸ�� --------------------------------------------------------------
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
values ('yubin', q_user_seq.nextval, '0000', '������', 'F', to_date('2000-09-02','YYYY-MM-DD'), 'yubinn2@naver.com', '01077563279');

insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('userid', q_user_seq.nextval, 'user1234', 'ȫ�浿', 'M', to_date('1990-01-11','YYYY-MM-DD'), 'hgd0123@naver.com', '01022222222');

insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('user02', q_user_seq.nextval, 'user1234', '��ö��', 'M', to_date('1999-12-30','YYYY-MM-DD'), 'kcs001@naver.com', '01000000000');

-- ������ --------------------------------------------------------------
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

-- ������ --------------------------------------------------------------
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

COMMENT ON COLUMN theater.th_num IS '������ ��ȣ';
COMMENT ON COLUMN theater.th_name IS '������ �̸�';
COMMENT ON COLUMN theater.th_seat IS '������ �¼� ��';
COMMENT ON COLUMN theater.th_addr IS '������ �ּ�';
COMMENT ON COLUMN theater.th_map_lat IS '������ ������ ����';
COMMENT ON COLUMN theater.th_map_lng IS '������ ������ �浵';
COMMENT ON COLUMN theater.th_web IS '������ ������Ʈ �ּ�';
COMMENT ON COLUMN theater.th_regdate IS '������ ������ �����';
COMMENT ON COLUMN theater.th_update IS '������ ������ ������';

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
VALUES(theater_seq.nextval, '���������� ��������', 2283,  '���� ���ʱ� ���μ�ȯ�� 2406', 37.47942828868689, 127.01183723667019, 'https://www.sac.or.kr/site/main/content/operaTheater');

INSERT INTO theater(th_num, th_name, th_seat, th_addr, th_map_lat, th_map_lng, th_web)
VALUES(theater_seq.nextval, '����24��������', 962,  '���� ���α� ���з� 12�� 21', 37.58280297706721, 127.00321812946142, 'https://yes24stage.com/index.php');


-- ���� --------------------------------------------------------------
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

COMMENT ON COLUMN show.s_num IS '���� ��ȣ';
COMMENT ON COLUMN show.s_name IS '���� �̸�';
COMMENT ON COLUMN show.s_genre IS '���� �帣';
COMMENT ON COLUMN show.s_opendate IS '���� ������';
COMMENT ON COLUMN show.s_closedate IS '���� ������';
COMMENT ON COLUMN show.s_time IS '���� �󿵽ð�';
COMMENT ON COLUMN show.s_price IS '���� Ƽ�ϰ���';
COMMENT ON COLUMN show.s_director IS '���� ��ȹ ���� ����';
COMMENT ON COLUMN show.s_sponsor IS '���� ���� �ְ� ����';
COMMENT ON COLUMN show.s_actor IS '���� ĳ���� ��� ����';
COMMENT ON COLUMN show.s_point IS '���� ���� ���';
COMMENT ON COLUMN show.s_ticketcnt IS '���� ����Ƚ��';
COMMENT ON COLUMN show.s_guide IS '���� �ȳ�����';
COMMENT ON COLUMN show.s_regdate IS '���� ������ �����';
COMMENT ON COLUMN show.s_update IS '���� ������ ������';
COMMENT ON COLUMN show.th_num IS '������ ��ȣ';

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

CREATE INDEX index_s_name ON show(s_name);		//�̸�
CREATE INDEX index_s_point ON show(s_point);			//����
CREATE INDEX index_s_opendate ON show(s_opendate);	//�󿵰�����
CREATE INDEX index_s_closedate ON show(s_closedate);	//��������

INSERT INTO show(s_num, s_name, s_genre, s_opendate, s_closedate, s_time, s_price, s_director, s_sponsor, s_actor, s_point, s_ticketcnt, s_guide, th_num)
VALUES(show_seq.nextval, '���亥', '������', to_date('2023-01-12','yyyy-MM-dd'), to_date('2023-03-26','yyyy-MM-dd'), 165, 56000, '(��) EMK���������۴�','����������, EMK, (��)īī���������θ�Ʈ','[{��role��:�������� �� ���亥��,��actor��:����ȿ�š�},{��role��:������� �귻Ÿ�롱,��actor��:����������}]', 7.8, 9060, '(�������� ����)', 1);

INSERT INTO show(s_num, s_name, s_genre, s_opendate, s_closedate, s_time, s_price, s_director, s_sponsor, s_actor, s_point, s_ticketcnt, s_guide, th_num)
VALUES(show_seq.nextval,'���ͺ�','������',to_date('2023-03-04','yyyy-MM-dd'),to_date('2023-05-28','yyyy-MM-dd'),110,44000,'(��)�������̿������θ�Ʈ','(��)�ƶ�����','[{��role��:������ Ŵ��,��actor��:�������ϡ�},{��role��:����Ŭ���,��actor��:����ȣ�¡�}]', 9.5, 452, '(�������� ����)', 2);

-- ���� --------------------------------------------------------------
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

COMMENT ON COLUMN img.img_id IS '���� ID';
COMMENT ON COLUMN img.img_name IS '���� �̸�';
COMMENT ON COLUMN img.img_dir IS '���� ���';
COMMENT ON COLUMN img.img_type IS '���� Ȯ����';
COMMENT ON COLUMN img.img_size IS '���� �뷮';
COMMENT ON COLUMN img.img_regdate IS '���� �����';
COMMENT ON COLUMN img.img_update IS '���� ������';
COMMENT ON COLUMN img.s_num IS '���� ��ȣ';

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

(������ �̹��� 2��)

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_p0', '/show/1/poster', 'gif', 28025, 1);

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_2_p0', '/show/2/poster', 'gif', 28798, 2);

(�� �̹��� 4�� (1�� ��ȭ��))

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_001', '/show/1/detail', 'jpg', 343874, 1);

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_002', '/show/1/detail', 'jpg', 362470, 1);

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_003', '/show/1/detail', 'jpg', 415165, 1);

INSERT INTO img(img_id, img_name, img_dir, img_type, img_size, s_num)
VALUES(img_seq.nextval, '230322_1_004', '/show/1/detail', 'jpg', 2973431, 1);


-- ��ŷ --------------------------------------------------------------
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

COMMENT ON COLUMN rank.rank_id IS '��ŷ���� ID';
COMMENT ON COLUMN rank.rank_start IS '��ŷ ���� ������';
COMMENT ON COLUMN rank.rank_end IS '��ŷ ���� ������';
COMMENT ON COLUMN rank.rank_ticket IS '��ŷ �Ⱓ ������';
COMMENT ON COLUMN rank.rank_rank IS '��ŷ ����';
COMMENT ON COLUMN rank.rank_regdate IS '��ŷ���� �����';
COMMENT ON COLUMN rank.rank_update IS '��ŷ���� ������';
COMMENT ON COLUMN rank.s_num IS '���� ��ȣ';

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

-- ���� --------------------------------------------------------------
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


COMMENT ON COLUMN TICKET.ti_num IS '���Ź�ȣ';
COMMENT ON COLUMN TICKET.seat_date IS '������ �ð�/��¥';
COMMENT ON COLUMN TICKET.ti_status IS '���Ż���';
COMMENT ON COLUMN TICKET.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN TICKET.ti_regdate IS '���� ������ �����';
COMMENT ON COLUMN TICKET.ti_update IS '���� ������ ������';

CREATE SEQUENCE TICKET_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;
-- �������� --------------------------------------------------------------
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
COMMENT ON COLUMN NOTICE.n_no IS '�������� �۹�ȣ';
COMMENT ON COLUMN NOTICE.n_category IS '�������� ī�װ�';
COMMENT ON COLUMN NOTICE.n_title IS '�������� ����';
COMMENT ON COLUMN NOTICE.n_content IS '�������� �۳���';
COMMENT ON COLUMN NOTICE.n_file IS '�̹��� ��� �� �� �ϸ�';
COMMENT ON COLUMN NOTICE.n_hit IS '�������� ��ȸ��';
COMMENT ON COLUMN NOTICE.n_regdate IS '�������� �����';
COMMENT ON COLUMN NOTICE.n_update IS '�������� ������';

ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	n_no
);
   
create sequence notice_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

Insert into QUICKET.NOTICE (n_no,n_category,n_title,n_content,n_file,n_hit,n_regdate,n_update) values (notice_seq.NEXTVAL,'��Ÿ','Ƽ�� ��۷� �λ� �ȳ� (2023�� 03�� 23�Ϻ�)','�ȳ��ϼ���. QUICKet�Դϴ�. �׻� QUICKet�� �̿��� �ֽô� ���е鲲 ���� ���� �帳�ϴ�.
Ƽ�� ���� �ܰ� �λ� �� ��� �ܰ� �λ� �� ������ ���� ������� ���Ͽ� 2023�� 3�� 23��(��)���� Ƽ�� ��۷ᰡ �Ʒ��� ���� �ε����ϰ� �λ�Ǿ����ϴ�.
���Ե��� ���� ��Ź�帳�ϴ�. 
�� ��ۺ� ���� ������: 2023�� 3�� 23��(��)
�� ���� ����: ���� 3,000��(�Ǵ�) �溯�� 3,200��(�Ǵ�)
�� ��ǰ ������ ���� ��ۺ� �ٸ� �� ����
 ���� ���񽺷� �����ϴ� QUICKet�� �ǰڽ��ϴ�.
�����մϴ�.',null,0,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'));

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

COMMENT ON COLUMN FAQ.f_no IS 'FAQ �۹�ȣ';
COMMENT ON COLUMN FAQ.f_category IS 'FAQ ī�װ�';
COMMENT ON COLUMN FAQ.f_title IS 'FAQ ����';
COMMENT ON COLUMN FAQ.f_content IS 'FAQ �۳���';
COMMENT ON COLUMN FAQ.f_regdate IS 'FAQ �����';
COMMENT ON COLUMN FAQ.f_update IS 'FAQ ������';

ALTER TABLE FAQ ADD CONSTRAINT PK_FAQ PRIMARY KEY (
	f_no
);

create sequence faq_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

insert into QUICKET.FAQ (f_no,f_category,f_title,f_content,f_regdate,f_update) values (faq_seq.nextval,'ȸ��','ȸ�� Ż�� ��û�� �ϰ� �;��','QUIcket������ ���� Ż�� ��û �� öȸ�� �Ͻ� �� �����ϴ�.�������� ���� ������ ���� ��ġ ���� ���� Ż��, ���� �̿� ���� � ����ϱ� ���Ͽ� ���� Ż�� ��û �� 3�ϰ� ���������� �����մϴ�. ���� �� �̿��� ���Ͻô� ���, Ż�� ��û 3�� �� ���� �� �����Ͽ� �̿��Ͻñ� �ٶ��ϴ�.',
to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'));

select * from FAQ;

-- �����ı� --------------------------------------------------------------
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

COMMENT ON COLUMN REVIEWBOARD.r_no IS '�����ı� �۹�ȣ';
COMMENT ON COLUMN REVIEWBOARD.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN REVIEWBOARD.r_title IS '�����ı� ����';
COMMENT ON COLUMN REVIEWBOARD.r_content IS '�����ı� ����';
COMMENT ON COLUMN REVIEWBOARD.r_point IS '�����ı� ����';
COMMENT ON COLUMN REVIEWBOARD.r_hit IS '�����ı� ��ȸ��';
COMMENT ON COLUMN REVIEWBOARD.r_regdate IS '�����ı� �����';
COMMENT ON COLUMN REVIEWBOARD.r_update IS '�����ı� ������';
COMMENT ON COLUMN REVIEWBOARD.s_num IS '���� ��ȣ';

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

-- �̺�Ʈ --------------------------------------------------------------
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

COMMENT ON COLUMN event.e_num IS '�̺�Ʈ �۹�ȣ';
COMMENT ON COLUMN event.e_name IS '�̺�Ʈ��';
COMMENT ON COLUMN event.e_startdate IS '�̺�Ʈ ������';
COMMENT ON COLUMN event.e_enddate IS '�̺�Ʈ ������';
COMMENT ON COLUMN event.e_img IS '�̺�Ʈ ���� �̹���';
COMMENT ON COLUMN event.e_regdate IS '�̺�Ʈ �����';
COMMENT ON COLUMN event.e_update IS '�̺�Ʈ ������';
COMMENT ON COLUMN event.s_num IS '�̺�Ʈ ���� ��ȣ';

-- ����� --------------------------------------------------------------
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

COMMENT ON COLUMN expectation .ex_no IS '����� �۹�ȣ';
COMMENT ON COLUMN expectation.ex_title IS '����� ����';
COMMENT ON COLUMN expectation.ex_content IS '����� ����';
COMMENT ON COLUMN expectation.ex_hit IS '����� ��ȸ��';
COMMENT ON COLUMN expectation.ex_regdate IS '����� �����';
COMMENT ON COLUMN expectation.ex_update IS '����� ������';
COMMENT ON COLUMN expectation.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN expectation.s_num IS '���� ��ȣ';
COMMENT ON COLUMN expectation.ti_num IS '���Ź�ȣ';

-- ������ ���� --------------------------------------------------------------
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

COMMENT ON COLUMN admin_coupon.c_num IS '������ȣ';
COMMENT ON COLUMN admin_coupon.c_name IS '������';
COMMENT ON COLUMN admin_coupon.c_discount IS '������';
COMMENT ON COLUMN admin_coupon.c_startdate IS '��ȿ�Ⱓ ������';
COMMENT ON COLUMN admin_coupon.c_enddate IS '��ȿ�Ⱓ ������';
COMMENT ON COLUMN admin_coupon.c_img IS '���� �̹���';
COMMENT ON COLUMN admin_coupon.c_regdate IS '���� �����';
COMMENT ON COLUMN admin_coupon.c_update IS '���� ������';
COMMENT ON COLUMN admin_coupon.c_update IS '���� ������';

INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update)
VALUES('ABCD1234', '����ȯ������', 5, '2023-04-01', '2023-09-30', 'coupon.png', sysdate, sysdate);

INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update)
VALUES('ABCD1235', '�̺�Ʈ����', 10, '2023-04-01', '2023-09-30', 'coupon.png', sysdate, sysdate);

-- ����� ���� --------------------------------------------------------------
CREATE TABLE user_coupon (
	u_id	VARCHAR2(15)		NOT NULL,
	c_num	VARCHAR2(10)		NOT NULL,
	uc_date	DATE	DEFAULT SYSDATE	NOT NULL,
	uc_state	NUMBER(1)	DEFAULT 0	NOT NULL
);

ALTER TABLE user_coupon ADD CONSTRAINT pk_user_coupon PRIMARY KEY (u_id, c_num);
--ALTER TABLE user_coupon ADD CONSTRAINT fk_q_user_to_user_coupon_1 FOREIGN KEY (u_id, c_num) REFERENCES q_user(u_id, c_num);
ALTER TABLE user_coupon ADD CONSTRAINT fk_admin_coupon_to_user_coupon_1 FOREIGN KEY (c_num) REFERENCES admin_coupon (c_num);



COMMENT ON COLUMN user_coupon.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN user_coupon.c_num IS '������ȣ';
COMMENT ON COLUMN user_coupon.uc_date IS '���� �߱���';
COMMENT ON COLUMN user_coupon.uc_state IS '0:�̻�� 1:���Ϸ� -1:�Ⱓ����';

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

COMMENT ON COLUMN qna.q_no IS 'QNA �۹�ȣ';
COMMENT ON COLUMN qna.q_content IS 'QNA ����';
COMMENT ON COLUMN qna.q_regdate IS 'QNA �����';
COMMENT ON COLUMN qna.q_update IS 'QNA ������';
COMMENT ON COLUMN qna.q_reply IS 'QNA �亯';
COMMENT ON COLUMN qna.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN qna.s_num IS '���� ��ȣ';

insert into qna(q_no, q_content, q_regdate, q_update, u_id, s_num)
values(qna_seq.nextval, 'Ƽ�� ��������� �� ���ų��� �� ����Ʈ �ذ����ϳ���?', to_date('2023-03-22', 'YYYY-MM-DD'), to_date('2023-03-23', 'YYYY-MM-DD'), 'user02', 1);



-- QNA ��� --------------------------------------------------------------
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

COMMENT ON COLUMN qna_reply.q_no IS 'QNA �۹�ȣ';
COMMENT ON COLUMN qna_reply.q_r_no IS '�亯 �۹�ȣ';
COMMENT ON COLUMN qna_reply.q_r_content IS '�亯 ����';
CREATE TABLE FAQ (
	f_no	NUMBER(20)		NOT NULL,
	f_category	VARCHAR2(50)		NOT NULL,
	f_title	VARCHAR2(100)		NOT NULL,
	f_content	VARCHAR2(2000)		NOT NULL,
	f_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	f_update	DATE	DEFAULT SYSDATE	NOT NULL
);
COMMENT ON COLUMN qna_reply.q_r_update IS '�亯 ������';
COMMENT ON COLUMN qna_reply.u_id IS 'ȸ�� ���̵�';

ALTER TABLE qna_reply ADD CONSTRAINT pk_qna_reply PRIMARY KEY (q_no);
ALTER TABLE qna_reply ADD CONSTRAINT fk_qna_to_qna_reply_1 FOREIGN KEY (q_no) REFERENCES qna (q_no);
ALTER TABLE qna_reply ADD CONSTRAINT fk_q_user_to_qna_reply_1 FOREIGN KEY (u_id) REFERENCES q_user (u_id);

-- ����Ȧ --------------------------------------------------------------
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

COMMENT ON COLUMN HALL.hall_id IS '����������ID';
COMMENT ON COLUMN HALL.hall_place IS '������';
COMMENT ON COLUMN HALL.hall_turn IS '��ȸ��';
COMMENT ON COLUMN HALL.hall_regdate IS '����Ȧ ������ �����';
COMMENT ON COLUMN HALL.hall_update IS '����Ȧ ������ ������';
COMMENT ON COLUMN HALL.th_num IS '������ ��ȣ';

-- �¼� --------------------------------------------------------------
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

COMMENT ON COLUMN SEAT.seat_num IS '�¼���ȣ';
COMMENT ON COLUMN SEAT.hall_id IS '����������ID';
COMMENT ON COLUMN SEAT.seat_status IS '�¼� Ȱ��/��Ȱ��ȭ';
COMMENT ON COLUMN SEAT.seat_age IS '����/�Ƶ�';
COMMENT ON COLUMN SEAT.seat_regdate IS '�¼� ������ �����';
COMMENT ON COLUMN SEAT.seat_update IS '�¼� ������ ������';

-- ���� --------------------------------------------------------------
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

-- ����Ͽ� ���� ��ġ�ϴ� ���� �Ǵ� �⺻ Ű�� �����ϴ�. -> u_id �������� �ĺ���
ALTER TABLE PAY ADD CONSTRAINT FK_USER_COUPON_TO_PAY_1 FOREIGN KEY (
	u_id, c_num
)
REFERENCES USER_COUPON (
	u_id, c_num
);

COMMENT ON COLUMN PAY.ti_num IS '���Ź�ȣ';
COMMENT ON COLUMN PAY.pay_name IS '������ �̸�';
COMMENT ON COLUMN PAY.pay_phone IS '������ ��ȭ��ȣ';
COMMENT ON COLUMN PAY.pay_amount IS '�����ݾ�';
COMMENT ON COLUMN PAY.pay_virtual_num IS '������¹�ȣ';
COMMENT ON COLUMN PAY.pay_cardNum IS 'ī���ȣ';
COMMENT ON COLUMN PAY.pay_cardPwd IS 'ī���й�ȣ';
COMMENT ON COLUMN PAY.pay_status IS '��������';
COMMENT ON COLUMN PAY.pay_regdate IS '���� ������ �����';
COMMENT ON COLUMN PAY.pay_update IS '���� ������ ������';
COMMENT ON COLUMN PAY.c_num IS '������ȣ';

-- �����¼� --------------------------------------------------------------
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

COMMENT ON COLUMN TICKET_SEAT.ti_num IS '���Ź�ȣ';
COMMENT ON COLUMN TICKET_SEAT.seat_num IS '�¼���ȣ';
COMMENT ON COLUMN TICKET_SEAT.hall_id IS '����������ID';

-- ��� --------------------------------------------------------------
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

COMMENT ON COLUMN STATISTICS.st_date IS '�ְ� ��¥ ������';
COMMENT ON COLUMN STATISTICS.s_num IS '���� ��ȣ';
COMMENT ON COLUMN STATISTICS.ti_num IS '���Ź�ȣ';
COMMENT ON COLUMN STATISTICS.st_cash IS '�ְ��� ����� ������ ��';
COMMENT ON COLUMN STATISTICS.st_per IS '�ְ��� ����� ������';

-- 1��1���� --------------------------------------------------------------
CREATE TABLE inquiry (
	i_num	NUMBER(20)		NOT NULL,
	u_id	VARCHAR2(15)		NOT NULL,
	i_category	VARCHAR2(30)		NOT NULL,
	i_cate_detail	VARCHAR2(30)		NOT NULL,
	i_reply	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:�亯�����, 1:�亯�Ϸ�
    i_title	VARCHAR2(100)		NOT NULL,
	i_content	VARCHAR2(500)		NOT NULL,
	i_regidate	DATE	DEFAULT SYSDATE	NOT NULL,
	i_update	DATE	DEFAULT SYSDATE	NOT NULL,
	ti_num	NUMBER
);

COMMENT ON COLUMN inquiry.i_num IS '���Ǳ۹�ȣ';
COMMENT ON COLUMN inquiry.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN inquiry.i_category IS '����';
COMMENT ON COLUMN inquiry.i_cate_detail IS '��������';
COMMENT ON COLUMN inquiry.i_reply IS '�亯����';
COMMENT ON COLUMN inquiry.i_title IS '�亯����';
COMMENT ON COLUMN inquiry.i_content IS '�亯����';
COMMENT ON COLUMN inquiry.i_regidate IS '�����';
COMMENT ON COLUMN inquiry.i_update IS '������';
COMMENT ON COLUMN inquiry.ti_num IS '���Ź�ȣ';

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
VALUES(inquiry_seq.NEXTVAL, 'yubin', 'ȸ������', '�α���', 0, '�α����� �ȵ˴ϴ�', '�α����� �� �Ǵµ� ������ �𸣰ھ��', SYSDATE, SYSDATE);

UPDATE inquiry
SET i_title = '�α����� �ƴµ� ��й�ȣ�� �� �¾ƿ�', i_content='��й�ȣ ã�⸦ �ص� ��й�ȣ�� ���� �ʴ´ٰ� ���Ϳ�'
WHERE i_num=1;

SELECT i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content, TO_CHAR(i_regidate, 'YYYY-MM-DD') AS i_regidate, i_update
FROM inquiry
ORDER BY i_num desc;

-- �����ؼ� �̸� ��������
SELECT i_num, U.u_name, i_category, i_cate_detail, i_reply, i_title, i_content, TO_CHAR(i_regidate, 'YYYY-MM-DD') AS i_regidate, i_update
FROM inquiry I LEFT OUTER JOIN q_user U ON I.u_id = U.u_id
WHERE i_num = 3;


-- 1��1���� �亯 --------------------------------------------------------------
CREATE TABLE inquiry_reply (
	i_r_num	NUMBER(20)		NOT NULL,
	i_num	NUMBER(20)		NOT NULL,
	i_r_content	VARCHAR2(500)		NOT NULL,
	i_r_regidate	DATE	DEFAULT SYSDATE	NOT NULL,
	i_r_update	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN inquiry_reply.i_r_num IS '���Ǳ۴亯��ȣ';
COMMENT ON COLUMN inquiry_reply.i_num IS '���Ǳ۹�ȣ';
COMMENT ON COLUMN inquiry_reply.i_r_content IS '���Ǳ۴亯����';
COMMENT ON COLUMN inquiry_reply.i_r_regidate IS '�亯�����';
COMMENT ON COLUMN inquiry_reply.i_r_update IS '�亯������';

ALTER TABLE inquiry_reply ADD CONSTRAINT pk_inquiry_reply PRIMARY KEY (i_r_num);
ALTER TABLE inquiry_reply ADD CONSTRAINT fk_inquiry_to_inquiry_reply_1 FOREIGN KEY (i_num) REFERENCES inquiry (i_num);

create sequence inquiry_reply_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 1, 'Ȩ���� ���ư��� �ٽ� �α��� ��ư�� ����������', SYSDATE, SYSDATE);

SELECT i_r_num, i_num, i_r_content, i_r_regidate, i_r_update
FROM inquiry_reply;
