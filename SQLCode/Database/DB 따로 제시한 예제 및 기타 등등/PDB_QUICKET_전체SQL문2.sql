-- �� ���� �����ǵ���  drop ���� �ٲ���ϴ�(23.04.03.)
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

-- ������ ȸ������ ���������� ȸ����ȣ �������� ����ϱ� ���� �ε��� ����
-- (23.03.30 ����)
create index U_NUM_IDX
on q_user(u_num desc);


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



? 04.06 ȸ�� ������ �߰�
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('idkdw', q_user_seq.nextval, 'Kdw12345', '������', 'M', to_date('1986-08-04','YYYY-MM-DD'), 'idkdw@nate.com', '01012348745');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('skid', q_user_seq.nextval, 'S0123456', '�۰�', 'M', to_date('1996-11-20','YYYY-MM-DD'), 'song123@naver.com', '01056548545');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('sonhm123', q_user_seq.nextval, 'Son12345', '�����', 'M', to_date('1992-07-08','YYYY-MM-DD'), 'sonny07@gmail.com', '01015762549');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('suzy01', q_user_seq.nextval, 'Suzy01234', '�����', 'F', to_date('1991-04-22','YYYY-MM-DD'), 'bszjk@daum.net', '01045651236');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('shg09', q_user_seq.nextval, 'HG012345', '������', 'F', to_date('1980-04-21','YYYY-MM-DD'), 'song01@nate.com', '01095130412');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('jjh000', q_user_seq.nextval, 'Jj012345', '������', 'F', to_date('1985-02-10','YYYY-MM-DD'), 'j0123@gmail.com', '01051657825');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('jeon0123', q_user_seq.nextval, 'Jeon01234', '������', 'F', to_date('1980-08-25','YYYY-MM-DD'), '01jj@naver.com', '01064748552');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('han0123', q_user_seq.nextval, 'Han99999', '��ȿ��', 'F', to_date('1989-05-05','YYYY-MM-DD'), 'hhj012@gmail.com', '01045457825');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('ldh1234', q_user_seq.nextval, 'Ldh12345', '�̵���', 'M', to_date('1996-04-04','YYYY-MM-DD'), 'ldgh999@naver.com', '01016856945');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('irene0000', q_user_seq.nextval, 'Irene1000', '���̸�', 'F', to_date('1991-03-29','YYYY-MM-DD'), 'irene1@gmail.com', '01016200352');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('jjs0000', q_user_seq.nextval, 'Jj123456', '������', 'M', to_date('1989-09-08','YYYY-MM-DD'), 'jo123@gmail.com', '01026575548');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('park012', q_user_seq.nextval, 'Phs00000', '��ȿ��', 'M', to_date('1989-12-08','YYYY-MM-DD'), 'parhhs@nate.com', '01065238788');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('kjs9999', q_user_seq.nextval, 'Kjs01234', '���ؼ�', 'M', to_date('1985-01-16','YYYY-MM-DD'), 'kjs0123@gmail.com', '01065238788');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('jeong00', q_user_seq.nextval, 'Jeong012', '������', 'F', to_date('1986-04-16','YYYY-MM-DD'), 'jeong01@naver.com', '010165552345');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('yunakim', q_user_seq.nextval, 'Kim012345', '�迬��', 'F', to_date('1990-10-30','YYYY-MM-DD'), 'yunakim@naver.com', '01023100012');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone)
values ('hansh01', q_user_seq.nextval, 'Han00000', '�Ѽ���', 'F', to_date('1995-11-09','YYYY-MM-DD'), 'hsh011@nate.com', '01095652236');
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone,u_regdate, u_moddate, u_pwddate, u_state)
values ('jo999', q_user_seq.nextval, 'Jo012345', '���Լ�', 'M', to_date('1998-01-14','YYYY-MM-DD'), 'kyuseong@naver.com', '01065654512',to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), 0);
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone,u_regdate, u_moddate, u_pwddate, u_state)
values ('iu01234', q_user_seq.nextval, 'IU012345', '������', 'F', to_date('1990-03-27','YYYY-MM-DD'), 'iu012342@nate.com', '01023456850', to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), 0);
insert into q_user(u_id, u_num, u_pwd, u_name, u_gender, u_birth, u_email, u_phone,u_regdate, u_moddate, u_pwddate, u_state)
values ('sinm12', q_user_seq.nextval, 'Sin00000', '�Źξ�', 'F', to_date('1988-08-01','YYYY-MM-DD'), 'sin111@daum.net', '01013522654',to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), to_date('2023-01-01','YYYY-MM-DD'), 0);





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

	th_addr	VARCHAR2(100)		NOT NULL,
	th_map_lat	NUMBER		NULL,
	th_map_lng	NUMBER		NULL,
	th_web		VARCHAR2(100)		NULL,
	th_regdate	DATE	DEFAULT SYSDATE	NOT NULL,
	th_update	DATE		NULL
);

COMMENT ON COLUMN theater.th_num IS '������ ��ȣ';
COMMENT ON COLUMN theater.th_name IS '������ �̸�';
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

CREATE INDEX index_s_name ON show(s_name);		-- �̸�
CREATE INDEX index_s_point ON show(s_point);			-- ����
CREATE INDEX index_s_opendate ON show(s_opendate);	-- �󿵰�����
CREATE INDEX index_s_closedate ON show(s_closedate);	-- ��������


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
REFERENCES show(s_num) ON DELETE CASCADE;

CREATE SEQUENCE img_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;



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
REFERENCES show(s_num) ON DELETE CASCADE;

CREATE SEQUENCE RANK_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;


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

COMMENT ON COLUMN PAY.pay_num IS '������ȣ';
COMMENT ON COLUMN PAY.pay_name IS '������ �̸�';
COMMENT ON COLUMN PAY.pay_phone IS '������ ��ȭ��ȣ';
COMMENT ON COLUMN PAY.pay_amount IS '�����ݾ�';
COMMENT ON COLUMN PAY.pay_status IS '��������';
COMMENT ON COLUMN PAY.pay_regdate IS '���� ������ �����';
COMMENT ON COLUMN PAY.pay_update IS '���� ������ ������';
COMMENT ON COLUMN PAY.c_num IS '������ȣ';

CREATE SEQUENCE PAY_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;


-- ���� --------------------------------------------------------------
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



COMMENT ON COLUMN TICKET.pay_num IS '���Ź�ȣ';
COMMENT ON COLUMN TICKET.ti_date IS '������ �ð�/��¥';
COMMENT ON COLUMN TICKET.ti_status IS '���Ż���';
COMMENT ON COLUMN TICKET.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN TICKET.ti_regdate IS '���� ������ �����';
COMMENT ON COLUMN TICKET.ti_update IS '���� ������ ������';



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

?230405 ����Ÿ �߰� -
delete from FAQ;

Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (87,'ȸ������','�ڵ��α��� �̿� ����� �˷��ּ���.','�ڵ��α��� �̿� ����� �˷��ּ���.',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (88,'ȸ������','�ڵ��α��� ���� ����� �˷��ּ���.','�ڵ��α��� ���� ����� �˷��ּ���.',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (89,'ȸ������','�ڵ��α����̶� �����ΰ���?','�ڵ��α����̶� �����ΰ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (90,'ȸ������','�ڵ��α��� �˸��� �����ΰ���?','�ڵ��α��� �˸��� �����ΰ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (91,'ȸ������','������ �α��� ������ �ƴ� ��� ��� �ϳ���?','������ �α��� ������ �ƴ� ��� ��� �ϳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (92,'ȸ������','���̵� �ؾ���� ��� ��� Ȯ�� �ϳ���?','���̵� �ؾ���� ��� ��� Ȯ�� �ϳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (93,'ȸ������','��й�ȣ�� �ؾ���� ��� ��� Ȯ�� �ϳ���?','��й�ȣ�� �ؾ���� ��� ��� Ȯ�� �ϳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (94,'ȸ������','��ȸ�� �ֹ� Ȯ���� ��� �ϳ���?','��ȸ�� �ֹ� Ȯ���� ��� �ϳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (95,'ȸ������','ȸ�������� ���� ���µ� �̹� ���ԵǾ� �ִٰ� ���ɴϴ�.','��� �ؾ� �ϳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (96,'ȸ������','ȸ�������� ������ �ֳ���?','ȸ�������� ������ �ֳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (97,'ȸ������','��ȭ�� ȸ������/Ż��/���� ������ �����Ѱ���?','��ȭ�� ȸ������/Ż��/���� ������ �����Ѱ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (98,'ȸ������','ȸ��Ż�� �� ���� I-����Ʈ/S-Money/�������� ���� ��� �ǳ���?','ȸ��Ż�� �� ���� I-����Ʈ/S-Money/�������� ���� ��� �ǳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (99,'ȸ������','ȸ��Ż�� �� ���������� ���� �����ǳ���?','ȸ��Ż�� �� ���������� ���� �����ǳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (100,'ȸ������','��ȭ�� ȸ������/Ż��/���� ������ �����Ѱ���?','��ȭ�� ȸ������/Ż��/���� ������ �����Ѱ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (101,'ȸ������','Ż�� �� �簡�Ա��� �Ⱓ ������ �ֳ���?','Ż�� �� �簡�Ա��� �Ⱓ ������ �ֳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (102,'ȸ������','ȸ��Ż��� ��� �ϳ���?','ȸ��Ż��� ��� �ϳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (103,'����','���� ���Ű� ������ ���������� � �͵��� �ֳ���?','���� ���Ű� ������ ���������� � �͵��� �ֳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (104,'����','������ �Ϸ� �Ǿ��ٴµ� ���� ������ �����','������ �Ϸ� �Ǿ��ٴµ� ���� ������ �����',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (105,'����','�������Ա� ���� ����� �������� �̿밡���Ѱ���?','�������Ա� ���� ����� �������� �̿밡���Ѱ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (106,'����','�����ȣ����(�������)���� ������ ��� �븮�� ������ �����Ѱ���?','�����ȣ����(�������)���� ������ ��� �븮�� ������ �����Ѱ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (107,'����','���Ŵ�� ���񽺿� ���� �˰� �;��','���Ŵ�� ���񽺿� ���� �˰� �;��',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (108,'����','Ƽ���� �̹� ��� �޾Ҵµ� ����ϰ� �;��!','Ƽ���� �̹� ��� �޾Ҵµ� ����ϰ� �;��!',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (109,'����','���� ���� �� ������ �Ϻθ� ����� �� �ֳ���?','���� ���� �� ������ �Ϻθ� ����� �� �ֳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (110,'����','����/��ȭ������ [��Ҹ����ð�]�̶� �����ΰ���?','����/��ȭ������ [��Ҹ����ð�]�̶� �����ΰ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (111,'����','������ ��� �ƾ��!','������ ��� �ƾ��!',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (112,'����','����/��ȭ������ ��� ������ ���� �ڼ��� �˰� �;��.','����/��ȭ������ ��� ������ ���� �ڼ��� �˰� �;��.',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (113,'����','Ƽ���� �ݼ۵��� ��� ��� �ؾ� �ϳ���?','Ƽ���� �ݼ۵��� ��� ��� �ؾ� �ϳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (114,'����','������ Ƽ���� ��� �޳���?','������ Ƽ���� ��� �޳���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (115,'����','������ Ƽ���� ���� ��۵ǳ���?','������ Ƽ���� ���� ��۵ǳ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (117,'����','��۵Ǵ� Ƽ���� ���θ� ���� �����Ѱ���?','��۵Ǵ� Ƽ���� ���θ� ���� �����Ѱ���?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (121,'��Ÿ','�޴��� ��ȣ�� �����Ͽ����ϴ�. ���� ������ ��� �̿��� �� �ֳ���?','�޴��� ��ȣ�� ����Ǿ��ٸ�! 

�������� ������ �����ؾ� �մϴ�.

 

- STEP :  �α��� > ���������� > ȸ������ ���� > ��й�ȣ �Է� > �������� �޴��� [����] Ŭ�� > �޴��� �� ������ �����Ͻø� �˴ϴ�.? ',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (122,'��Ÿ','���̵� �޸�ó���� ���� ������ �޾Ҿ��','- ȸ��� �̿��ڰ� 1�� �̻� �α��� ����� ���� ���, ���������� ������ ��ȣ �� ���ظ� �����ϱ� ���� ������������ȣ�� �� 39���� 6 (���������� �ı⿡ ���� Ư��)''�� �ٰ��Ͽ� �̿��ڿ��� ���������ϰ� ���������� ������ �и��Ͽ� ���� �����մϴ�.


- ȸ��� �޸���ȯ(�Ǵ� �޸�Ż��) 30�� �� ���ڸ����� ���� ���������ϸ�, �޸�ó���� ������ ��� �޸� ��ȯ�Ϸκ��� ���� 4�Ⱓ �� �̿��� ���� ��� �и� ������ �̿����� ������ ������ �ı��մϴ�.
�ٸ�. �̿��ڰ� ���� �� �̿��� ���Ͻ� ��쿡�� �α��� �� "���̵� ���� ����"������ ���� ���񽺸� ���̿��Ͻ� �� �ֽ��ϴ�.?',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (124,'��Ÿ','�̺�Ʈ ��÷�� Ƽ�ϼ����� ��𿡼� �ؾ� �ϳ���?','1. ���������� > ����Ȯ��/��� > ����� ������ ���ϴ� ���Ź�ȣ�� �����մϴ�.

2. ������ Ƽ������ �Ʒ� [���������] ��ư Ŭ�� > ����� �����ϱ� �˾����� > [�ּ��Է�] ��ư�� �����Ͽ� ���ϴ� ������� �����մϴ�. 

 

��! �ش� ���Ű� ����غ���, ����� ���¶�� ����� ������ �Ұ��Ͽ��� ���� �ٶ��ϴ�.',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (125,'��Ÿ','�̵���Ŵܸ���ġ ������ ���ٱ��� ���� �� öȸ�� ��� �ϳ���?','���ٱ��� ���� �� �Ʒ��� ���� ���ٱ����� �� �����ϰų� öȸ�� �� �ֽ��ϴ�.

 

[�ȵ���̵� 6.0�̻� VER]

- ���� ���� �� öȸ��� : �ܸ��� ���� > APP > ������(���� �� ����) > �� ���� > �� ���� > ���ٱ��� ���� > ���ٱ��� ����

- �� �� öȸ��� : �ܸ��⼳�� > APP > �� ���� > ���ٱ��� ���� > ���ٱ��� ����

 

[�ȵ���̵� 6.0�̸� VER]

- �ü�� Ư���� ���� ���� �� öȸ�� �Ұ����ϹǷ�, ���� �����ϴ� ��쿡�� ���ٱ��� öȸ�� �����մϴ�.

- �ȵ���̵� ������ ���׷��̵� �Ͽ� �ֽñ� �����մϴ�.

 

[IOS]

- �� �� öȸ��� : �ܸ��� ���� > ���ø����̼� > �� ���� > �� ���� > ���ٱ��� ���� > ���ٱ��� ����',to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (8,'��Ÿ','�̵���Ŵܸ���ġ ������ ���ٱ��� ���� �� öȸ�� ��� �ϳ���?','���ٱ��� ���� �� �Ʒ��� ���� ���ٱ����� �� �����ϰų� öȸ�� �� �ֽ��ϴ�.

 

[�ȵ���̵� 6.0�̻� VER]

- ���� ���� �� öȸ��� : �ܸ��� ���� > APP > ������(���� �� ����) > �� ���� > �� ���� > ���ٱ��� ���� > ���ٱ��� ����

- �� �� öȸ��� : �ܸ��⼳�� > APP > �� ���� > ���ٱ��� ���� > ���ٱ��� ����

 

[�ȵ���̵� 6.0�̸� VER]

- �ü�� Ư���� ���� ���� �� öȸ�� �Ұ����ϹǷ�, ���� �����ϴ� ��쿡�� ���ٱ��� öȸ�� �����մϴ�.

- �ȵ���̵� ������ ���׷��̵� �Ͽ� �ֽñ� �����մϴ�.

 

[IOS]

- �� �� öȸ��� : �ܸ��� ���� > ���ø����̼� > �� ���� > �� ���� > ���ٱ��� ���� > ���ٱ��� ����
---

  ',to_date('23/03/24','RR/MM/DD'),to_date('23/03/28','RR/MM/DD'));
Insert into QUICKET.FAQ (F_NO,F_CATEGORY,F_TITLE,F_CONTENT,F_REGDATE,F_UPDATE) values (6,'ȸ��','ȸ�� Ż�� ��û�� ����ϰ� �;��','Quicket������ ���� Ż�� ��û �� öȸ�� �Ͻ� �� �����ϴ�.

 

�������� ���� ������ ���� ��ġ ���� ���� Ż��, ���� �̿� ���� � ����ϱ� ���Ͽ� ���� Ż�� ��û ��

3�� �� ���������� �����մϴ�.

 

���� �� �̿��� ���Ͻô� ���, Ż�� ��û3�� �� ���� �� �����Ͽ� �̿��� �����մϴ�. ',to_date('23/03/23','RR/MM/DD'),to_date('23/03/23','RR/MM/DD'));


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
   


-- ���̺� ����Ÿ �� �����ϰ� �ٽ� �־� �ּ���
-- 04/03 ����

DELETE FROM REVIEWBOARD;

Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (69,'yubin','�����ֿ� �ͼ��� ���� ����ƿ��','�ƿ� ĳ���� ������ �ƴ϶� ��ĳ��� �������. �׷��� ������ ���� ���� �����̾���. �������ֿ��� ���� ����ƿ�ٴ� ���� ������ ���� �Ϳ��� ��ƿ�ٿ���. ������ ���°� �� �ƽ�����. ����� �� ������.',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (67,'yubin','�ູ�ߴ� 5����. �¹���','�׸��Ͽ� �� �̾߱⵵ ���̳׿�. ���п� ���� �ູ�ϰ� �����ߴ� �ܿ��̾����ϴ�. ������ ������ ��� ��� ������ ������ �����λ� ��� ���� ���� �ſ���. ������ ���� �� �� �ٽ� ������ �ٶ��! ������, ���е� ��� ����ϼ̽��ϴ� :)',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (68,'yubin','�� �þ��.','�ʿ��� �̾� �翬 �������� �� ���� �Խ��ϴ�.
������ ���̵��� ���� ���ͼ� � �����鵵 ���� �Դ��󱸿�.
�׷��� ������ �ߴµ� ģ������ ���� �� �����󱸿�.
���� ���� �ణ�� �þ����� �־ �ƽ������� ��ü������ ���� �մϴ�.',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (70,'yubin','�ְ��� ������','��� ���� �� ���ι޾ҳ׿�...�� �� ���� ���� ���� �ٽ� ������ ���ڽ��ϴ�...!!

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (71,'yubin','�ְ���','�ٽ� �� �� ���� �� �ֱ⸦ �ٶ��

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (72,'yubin','������ ��������','�ʹ��� �Ϻ��� ���� �����־� �����մϴ�.

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (73,'yubin','ƿ�� ��¥ ����...?','���� �������ڸ��� ���� �͠����ϴ�... ���׾����� �׳� �����߱���̤̤� ƿ�� �� ���°���? ����?

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (74,'yubin','�������� ���̵���','�������� ���̵��� ����� �������� ���� �� ����������!

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (75,'yubin','��¥.. ������','ó������ 3�� �¼����� ���Ҵµ�
�ι��� ���� �� �Ⱥ����� �ʹ� �ƽ�����.',4,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (76,'yubin','��ũ�� �ƴϸ� �ູ','�Ź� ������ � ����� ��ũ�� �ұ� �η��� ���鼭 ���� ��

',5,0,to_date('23/04/03','RR/MM/DD'),to_date('23/04/03','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (54,'yubin','����� ��ƿ��','�־� ƿ�� ������ ���༭ ������. ���п� ȸ������ �Ǿ��׿�. .
���Ϲ����� �ڸ�! ��̱��̶� �����ߴ� ���� �Ӵ�. �������̴�.���� �ű��ϰ� ������ ���� ���̴�. ������ ���Ⱑ ���ƴ�. �ʹ� ��վ�...����� ���ָ� �ȵǴ°ɱ�?��� ���� �����ϤФ�',5,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (55,'yubin','��ƿ��','��¥ �������� �ФФФ�

',5,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (27,'yubin','�츮���� ���ѹα�','�Ѻ��Ѻ� �ʹ� ���ְ� ����ϴٴ� �����ۿ� �ȵ�����
',1,0,to_date('23/03/30','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),2);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (56,'yubin','�����ֿ� �ͼ��� ���� ����ƿ��','�� ĳ���� ������ �ƴ϶� ��ĳ��� �������. �׷��� ������ ���� ���� �����̾���. �������ֿ��� ���� ����ƿ�ٴ� ���� ������ ���� �Ϳ��� ��ƿ�ٿ���. ������ ���°� �� �ƽ�����. ����� �� ������.',4,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (57,'yubin','�ʹ� ����ִ� ������','�ƿ� ������ �ʹ� ����� �뷡�� ���ϳ׿�..!
�ʹ��ʹ� ����ְ� �þ��!',0,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);
Insert into QUICKET.REVIEWBOARD (R_NO,U_ID,R_TITLE,R_CONTENT,R_POINT,R_HIT,R_REGDATE,R_UPDATE,S_NUM) values (59,'yubin','�� �þ��^^','���̿� �������� ������ ���ҳ׿�~
���ΰ� ���̰� �� �� �ð����� ��縦 �� �ܿ�� �̲���°��� �ʹ����� �������~� ������ ����� ���� �θ��ϰ� ���̰� ��⿡ �� �׷��Ͱ����� ���� �־ �� �κ��� �� �����ϴ�����..��հԴ� �� �ý��ϴ�~���̵� �ڷγ� ���� ū ������ �������� ���� �����߳׿�^^',0,0,to_date('23/03/31','RR/MM/DD'),to_date('23/03/31','RR/MM/DD'),1);



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


-- expect ���̺� �÷� �߰�/���� �߽��ϴ�(23.04.04)

-- ����� --------------------------------------------------------------
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

COMMENT ON COLUMN expect .ex_no IS '����� �۹�ȣ';
COMMENT ON COLUMN expect.ex_content IS '����� ����';
COMMENT ON COLUMN expect.ex_title IS '����� ����';
COMMENT ON COLUMN expect.ex_hit IS '����� ��ȸ��';
COMMENT ON COLUMN expect.ex_regdate IS '����� �����';
COMMENT ON COLUMN expect.ex_update IS '����� ������';
COMMENT ON COLUMN expect.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN expect.s_num IS '���� ��ȣ';


insert into expect(ex_no, ex_title, ex_content, ex_hit, ex_regdate, ex_update, u_id, s_num)
values(expect_seq.nextval, '���Ǵ� ����', '1�� ���� �����ϰ� ��� ��ٷȴµ� �ʹ� ���˴ϴ�.' , 0, to_date('2023-04-02', 'YYYY-MM-DD'), '' , 'yubin', 1);


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

ALTER TABLE admin_coupon ADD c_startissue DATE NOT NULL;
ALTER TABLE admin_coupon ADD c_endissue DATE NOT NULL;
COMMENT ON COLUMN admin_coupon.c_startissue IS '�߱ޱⰣ ������';
COMMENT ON COLUMN admin_coupon.c_endissue IS '�߱ޱⰣ ������';
-- 04/02 ���� �߱ޱⰣ �ʿ��� �� ���Ƽ� �÷� �߰��߽��ϴ� ~ 


COMMENT ON COLUMN admin_coupon.c_num IS '������ȣ';
COMMENT ON COLUMN admin_coupon.c_name IS '������';
COMMENT ON COLUMN admin_coupon.c_discount IS '������';
COMMENT ON COLUMN admin_coupon.c_startdate IS '��ȿ�Ⱓ ������';
COMMENT ON COLUMN admin_coupon.c_enddate IS '��ȿ�Ⱓ ������';
COMMENT ON COLUMN admin_coupon.c_img IS '���� �̹���';
COMMENT ON COLUMN admin_coupon.c_regdate IS '���� �����';
COMMENT ON COLUMN admin_coupon.c_update IS '���� ������';


--���� ��� ��¥�� ���� ��¥ �÷��� ���� �⺻�� �߰�
alter table admin_coupon modify c_regdate default sysdate;
alter table admin_coupon modify c_update default sysdate;

INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('S02D8S1', '? ������ ���� ���� ?', 20, '2023-03-20', '2023-04-30', 'coupon_1680446180879_001.png', '2023-04-02',  '2023-04-02', '2023-03-06', '2023-04-30');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('W1L53CE', '? WELCOME ���� ?', 15, '2023-04-01', '2023-05-31', 'coupon_1680446265832_003.png', '2023-04-02', '2023-04-02', '2023-04-01', '2023-05-31');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('8K3L03X', '������Ư�� ���� ���� ?', 30, '2023-04-17', '2023-04-23', 'coupon_1680446480847_002.png', '2023-04-02', '2023-04-02', '2023-04-10', '2023-04-30');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('T8KL012', '? ���� ���� �̺�Ʈ ?', 30, '2023-04-03', '2023-04-09', 'coupon_1680453184152_007.png', '2023-04-03',  '2023-04-03', '2023-04-01', '2023-04-09');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('J9O15NE', '? ��̳� ���� ���� ?', 25, '2023-05-01', '2023-05-05', 'coupon_1680453283426_008.png', '2023-04-03', '2023-04-03', '2023-04-29', '2023-05-05');
INSERT INTO admin_coupon(c_num, c_name, c_discount, c_startdate, c_enddate, c_img, c_regdate, c_update, c_startissue, c_endissue)
VALUES('CKS8752', '���� Ư�� ���� ���� ��', 25, '2023-01-01', '2023-01-31', 'coupon_1680445914058_006.png', '2023-04-02', '2023-04-02', '2023-01-01', '2023-01-08');



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

-- ����
--INSERT INTO user_coupon(u_id, c_num, uc_date, uc_state)
--VALUES('user02', ��S02D8S1��, sysdate, 0);
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

COMMENT ON COLUMN qna.q_no IS 'QNA �۹�ȣ';
COMMENT ON COLUMN qna.q_title IS 'QNA ������';
COMMENT ON COLUMN qna.q_content IS 'QNA ����';
COMMENT ON COLUMN qna.q_regdate IS 'QNA �����';
COMMENT ON COLUMN qna.q_update IS 'QNA ������';
COMMENT ON COLUMN qna.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN qna.s_num IS '���� ��ȣ';
COMMENT ON COLUMN qna.q_cnt IS '��� ����';


insert into qna(q_no, q_title, q_content, q_regdate, q_update, u_id, s_num, q_cnt)
values(qna_seq.nextval, '������� �����Դϴ�.', 'Ƽ�� ��������� �� ���ų��� �� ����Ʈ �ذ����ϳ���?', to_date('2023-03-24', 'YYYY-MM-DD'), '', 'user02', 1, '');

insert into qna(q_no, q_title, q_content, q_regdate, q_update, u_id, s_num, q_cnt)
values(qna_seq.nextval, '������� �����Դϴ�.', 'Ƽ�� ��������� �� ���ų��� �� ����Ʈ �ذ����ϳ���?', to_date('2023-03-24', 'YYYY-MM-DD'), '', 'user02', 2, '');

insert into qna(q_no, q_title, q_content, q_regdate, q_update, u_id, s_num, q_cnt)
values(qna_seq.nextval, 'Ƽ�Ͽ��� �����Դϴ�.', 'Ƽ�� ������ �� ī������� �����Ѱ���?', to_date('2023-03-26', 'YYYY-MM-DD'), '', 'userid', 1, '');






-- QNA ��� --------------------------------------------------------------
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

COMMENT ON COLUMN qna_reply.q_no IS 'QNA �۹�ȣ';
COMMENT ON COLUMN qna_reply.q_r_no IS '�亯 �۹�ȣ';
COMMENT ON COLUMN qna_reply.q_r_content IS '�亯 ����';
COMMENT ON COLUMN qna_reply.q_r_regdate IS '�亯 �����';
COMMENT ON COLUMN qna_reply.q_r_update IS '�亯 ������';
COMMENT ON COLUMN qna_reply.u_id IS 'ȸ�� ���̵�';

ALTER TABLE qna_reply ADD CONSTRAINT pk_qna_reply PRIMARY KEY (q_r_no);
ALTER TABLE qna_reply ADD CONSTRAINT fk_qna_to_qna_reply_1 FOREIGN KEY (q_no) REFERENCES qna (q_no);
ALTER TABLE qna_reply ADD CONSTRAINT fk_q_user_to_qna_reply_1 FOREIGN KEY (u_id) REFERENCES q_user (u_id);

insert into qna_reply(q_no, q_r_no, q_r_content, q_r_regdate, q_r_update, u_id)
values(1, qna_reply_seq.nextval, 'û�ҳ� �����̶���� ��ȭ�� �� ���ζ���� ���εǴ� �����̸� ������ �� ���� ������ �� �ֽ��ϴ�.', to_date('2023-03-27', 'YYYY-MM-DD'), '', 'userid');

insert into qna_reply(q_no, q_r_no, q_r_content, q_r_regdate, q_r_update, u_id)
values(2, qna_reply_seq.nextval, '�׽�Ʈ �ۿ� ���� �׽�Ʈ ����Դϴ�.', to_date('2023-03-27', 'YYYY-MM-DD'), '', 'userid');
-- q_no ���ٰ� �������� 1, 2������ �ٲ���Ҿ��


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



-- �����¼� --------------------------------------------------------------
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



COMMENT ON COLUMN TICKET_SEAT.pay_num IS '������ȣ';
COMMENT ON COLUMN TICKET_SEAT.seat_num IS '�¼���ȣ';
COMMENT ON COLUMN TICKET_SEAT.hall_id IS '����������ID';


-- ��� --------------------------------------------------------------
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

COMMENT ON COLUMN STATISTICS.st_date IS '�ְ� ��¥ ������';
COMMENT ON COLUMN STATISTICS.s_num IS '���� ��ȣ';
COMMENT ON COLUMN STATISTICS.pay_num IS '���Ź�ȣ';
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
	pay_num	NUMBER
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
COMMENT ON COLUMN inquiry.pay_num IS '������ȣ';

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
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', '�α���', 0, '�ڵ��α��� �̿� ����� �˷��ּ���.', '�ڵ��α��� �̿� ����� �˷��ּ���.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', '�α���', 0, '�ڵ��α��� ���� ����� �˷��ּ���.', '�ڵ��α��� ���� ����� �˷��ּ���.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', '�α���', 0, '�ڵ��α����̶� �����ΰ���?', '�ڵ��α����̶� �����ΰ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', 'ȸ������', '�α���', 0, '�ڵ��α��� �˸��� �����ΰ���?', '�ڵ��α��� �˸��� �����ΰ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', 'ȸ������', '�α���', 0, '������ �α��� ������ �ƴ� ��� ��� �ϳ���?', '������ �α��� ������ �ƴ� ��� ��� �ϳ���?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', '���̵�/�н�����', 0, '���̵� �ؾ���� ��� ��� Ȯ�� �ϳ���?', '���̵� �ؾ���� ��� ��� Ȯ�� �ϳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', '���̵�/�н�����', 0, '��й�ȣ�� �ؾ���� ��� ��� Ȯ�� �ϳ���?', '��й�ȣ�� �ؾ���� ��� ��� Ȯ�� �ϳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', 'ȸ������', '���̵�/�н�����', 0, '��й�ȣ�� �ؾ���ȴµ� �ӽ� ��й�ȣ�� �ο� ���� ���� �ּҵ� ��� ���� �ʾƿ�.', '��й�ȣ�� �ؾ���ȴµ� �ӽ� ��й�ȣ�� �ο� ���� ���� �ּҵ� ��� ���� �ʾƿ�.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', 'ȸ������', '���̵�/�н�����', 0, '��ȸ�� �ֹ� Ȯ���� ��� �ϳ���?', '��ȸ�� �ֹ� Ȯ���� ��� �ϳ���?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', 'ȸ������', 0, 'ȸ�������� ���� ���µ� �̹� ���ԵǾ� �ִٰ� ���ɴϴ�.', '��� �ؾ� �ϳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', 'ȸ������', 0, 'ȸ�������� ������ �ֳ���?', 'ȸ�������� ������ �ֳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', 'ȸ������', 'ȸ������', 0, '��ȭ�� ȸ������/Ż��/���� ������ �����Ѱ���?', '��ȭ�� ȸ������/Ż��/���� ������ �����Ѱ���?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', 'ȸ��Ż��', 0, 'ȸ��Ż�� �� ���� I-����Ʈ/S-Money/�������� ���� ��� �ǳ���?', 'ȸ��Ż�� �� ���� I-����Ʈ/S-Money/�������� ���� ��� �ǳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', 'ȸ��Ż��', 0, 'ȸ��Ż�� �� ���������� ���� �����ǳ���?', 'ȸ��Ż�� �� ���������� ���� �����ǳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', 'ȸ������', 'ȸ��Ż��', 0, '��ȭ�� ȸ������/Ż��/���� ������ �����Ѱ���?', '��ȭ�� ȸ������/Ż��/���� ������ �����Ѱ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', 'ȸ������', 'ȸ��Ż��', 0, 'Ż�� �� �簡�Ա��� �Ⱓ ������ �ֳ���?', 'Ż�� �� �簡�Ա��� �Ⱓ ������ �ֳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', 'ȸ������', 'ȸ��Ż��', 0, 'ȸ��Ż��� ��� �ϳ���?', 'ȸ��Ż��� ��� �ϳ���?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '����', 0, '���� ���Ű� ������ ���������� � �͵��� �ֳ���?', '���� ���Ű� ������ ���������� � �͵��� �ֳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '����', 0, '������ �Ϸ� �Ǿ��ٴµ� ���� ������ �����', '������ �Ϸ� �Ǿ��ٴµ� ���� ������ �����');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '����', 0, '�������Ա� ���� ����� �������� �̿밡���Ѱ���?', '�������Ա� ���� ����� �������� �̿밡���Ѱ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '����', '����', 0, '�����ȣ����(�������)���� ������ ��� �븮�� ������ �����Ѱ���?', '�����ȣ����(�������)���� ������ ��� �븮�� ������ �����Ѱ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '����', '����', 0, '���Ŵ�� ���񽺿� ���� �˰� �;��', '���Ŵ�� ���񽺿� ���� �˰� �;��');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '���/����', 0, 'Ƽ���� �̹� ��� �޾Ҵµ� ����ϰ� �;��!', 'Ƽ���� �̹� ��� �޾Ҵµ� ����ϰ� �;��!');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '���/����', 0, '���� ���� �� ������ �Ϻθ� ����� �� �ֳ���?', '���� ���� �� ������ �Ϻθ� ����� �� �ֳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '���/����', 0, '����/��ȭ������ [��Ҹ����ð�]�̶� �����ΰ���?', '����/��ȭ������ [��Ҹ����ð�]�̶� �����ΰ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '����', '���/����', 0, '������ ��� �ƾ��!', '������ ��� �ƾ��!');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '����', '���/����', 0, '����/��ȭ������ ��� ������ ���� �ڼ��� �˰� �;��.', '����/��ȭ������ ��� ������ ���� �ڼ��� �˰� �;��.');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '���', 0, 'Ƽ���� �ݼ۵��� ��� ��� �ؾ� �ϳ���?', 'Ƽ���� �ݼ۵��� ��� ��� �ؾ� �ϳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '���', 0, '������ Ƽ���� ��� �޳���?', '������ Ƽ���� ��� �޳���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '����', '���', 0, '������ Ƽ���� ���� ��۵ǳ���?', '������ Ƽ���� ���� ��۵ǳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '����', '���', 0, '�����ȣ����(�������)���� ������ ���� Ƽ���� �޾ƺ� �� �ֳ���?', '�����ȣ����(�������)���� ������ ���� Ƽ���� �޾ƺ� �� �ֳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '����', '���', 0, '��۵Ǵ� Ƽ���� ���θ� ���� �����Ѱ���?', '��۵Ǵ� Ƽ���� ���θ� ���� �����Ѱ���?');

INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '��Ÿ', '��Ÿ', 0, '�ּ��� ������ ���� �˰� �;��.', '�ּ��� ������ ���� �˰� �;��.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '��Ÿ', '��Ÿ', 0, '��ǰ �̺�Ʈ�� ��÷�Ǿ����ϴ�.', '��ǰ ������ ��� �ϳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '��Ÿ', '��Ÿ', 0, '�ʴ� �̺�Ʈ�� ��÷�� Ƽ�Ͼ絵�� �����Ѱ���?', '�ʴ� �̺�Ʈ�� ��÷�� Ƽ�Ͼ絵�� �����Ѱ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '��Ÿ', '��Ÿ', 0, '�����¼� �翹�� ���񽺿� ���� �˰� �;��.', '�����¼� �翹�� ���񽺿� ���� �˰� �;��.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '��Ÿ', '��Ÿ', 0, '��������ó ���ſ� ���� �˰� �;��.', '��������ó ���ſ� ���� �˰� �;��.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'user02', '��Ÿ', '��Ÿ', 0, '�Ｎ���ǿ� ���� �˰� �;��.', '�Ｎ���ǿ� ���� �˰� �;��.');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '��Ÿ', '��Ÿ', 0, '�̺�Ʈ ��÷�� Ƽ�ϼ����� ��𿡼� �ؾ� �ϳ���?', '�̺�Ʈ ��÷�� Ƽ�ϼ����� ��𿡼� �ؾ� �ϳ���?');
INSERT INTO inquiry(i_num, u_id, i_category, i_cate_detail, i_reply, i_title, i_content)
VALUES(inquiry_seq.NEXTVAL, 'yubin', '��Ÿ', '��Ÿ', 0, '�̺�Ʈ ��÷�� ������ ������ ��¥�� �� �� �ֳ���?', '�̺�Ʈ ��÷�� ������ ������ ��¥�� �� �� �ֳ���?');


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

-- ���Ǳ� �亯 ���
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 1, 'Ȩ���� ���ư��� �ٽ� �α��� ��ư�� ����������', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 2, 'Ȩ ��ư�� ����������', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 3, '�ڵ��α��ο� üũ �� �α����Ͻø� �������� ��Ű�� �����ϰų� �α׾ƿ��� �����ϱ� �������� ��� �α��� ���°� �����˴ϴ�.', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 4, '������ũ ����Ʈ �� �α׾ƿ� ��ư Ŭ���Ͻø�, �ڵ��α����� ���� �˴ϴ�.', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 5, '������ũ ���� �̿�� ���� �α��� �� �ʿ� ���� �α��� ���¸� ������ �� �ִ� ����Դϴ�.', SYSDATE, SYSDATE);
INSERT INTO inquiry_reply(i_r_num, i_num, i_r_content, i_r_regidate, i_r_update)
VALUES(inquiry_reply_seq.NEXTVAL, 6, 'ȸ������ ������ �����ϰ� ��ȣ�ϱ� ����, �ڵ��α����� ��� �˸�(����)�� �߼��Ͽ� �������� ������ ���� �˸�(����) ���� �Դϴ�.', SYSDATE, SYSDATE);

SELECT i_r_num, i_num, i_r_content, i_r_regidate, i_r_update
FROM inquiry_reply;


-- ���ɰ��� --------------------------------------------------------------
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
