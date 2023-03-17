--SQL developer
--������ ���̽� ���� �̸� : quicket        (�ҹ��ڷ� ����) 
--�����ͺ��̽� ��й�ȣ : quicket1234
--
--���̺� �ۼ�
--
--���̺� ����, �׽�Ʈ ������ �߰���(insert), ������ 
--

--������
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


--���� ȸ�� ������ �� ������ ���� �� �ʿ��� �� ���Ƽ� 3�� ��������ϴ�!

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


--�ڿ���(�ۼ���)
--
--���� ���̺�
--
--���̺� ����
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

--�ڸ�Ʈ �ο�
COMMENT ON COLUMN "SHOW"."s_num" IS '���� ��ȣ';
COMMENT ON COLUMN "SHOW"."s_name" IS '���� �̸�';
COMMENT ON COLUMN "SHOW"."s_opendate" IS '���� ������';
COMMENT ON COLUMN "SHOW"."s_closedate" IS '���� ������';
COMMENT ON COLUMN "SHOW"."s_time" IS '���� �󿵽ð�';
COMMENT ON COLUMN "SHOW"."s_price" IS '���� Ƽ�ϰ���';
COMMENT ON COLUMN "SHOW"."s_director" IS '���� ��ȹ ���� ����';
COMMENT ON COLUMN "SHOW"."s_sponsor" IS '���� ���� �ְ� ����';
COMMENT ON COLUMN "SHOW"."s_actor" IS '���� ĳ���� ��� ����';
COMMENT ON COLUMN "SHOW"."s_point" IS '���� ���� ���';
COMMENT ON COLUMN "SHOW"."s_ticketcnt" IS '���� ����Ƚ��';
COMMENT ON COLUMN "SHOW"."s_guide" IS '���� �ȳ�����';
COMMENT ON COLUMN "SHOW"."s_regdate" IS '���� ������ �����';
COMMENT ON COLUMN "SHOW"."s_update" IS '���� ������ ������';
COMMENT ON COLUMN "SHOW"."th_num" IS '������ ��ȣ';

--PK�� FK ����
ALTER TABLE "SHOW" ADD CONSTRAINT "PK_SHOW" PRIMARY KEY ("s_num");
ALTER TABLE "SHOW" ADD CONSTRAINT "FK_THEATER_TO_SHOW_1" FOREIGN KEY("th_num")
REFERENCES "THEATER" ("th_num");

--��� ������
CREATE SEQUENCE SHOW_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;


--������ ���̺�

--���̺� ����
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

--�ڸ�Ʈ �ο�
COMMENT ON COLUMN "THEATER"."th_num" IS '������ ��ȣ';
COMMENT ON COLUMN "THEATER"."th_name" IS '������ �̸�';
COMMENT ON COLUMN "THEATER"."th_seat" IS '������ �¼� ��';
COMMENT ON COLUMN "THEATER"."th_addr" IS '������ �ּ�';
COMMENT ON COLUMN "THEATER"."th_map_lat" IS '������ ������ ����';
COMMENT ON COLUMN "THEATER"."th_map_lng" IS '������ ������ �浵';
COMMENT ON COLUMN "THEATER"."th_web" IS '������ ������Ʈ �ּ�';
COMMENT ON COLUMN "THEATER"."th_regdate" IS '������ ������ �����';
COMMENT ON COLUMN "THEATER"."th_update" IS '������ ������ ������';

--PK ����
ALTER TABLE "THEATER" ADD CONSTRAINT "PK_THEATER" PRIMARY KEY ("th_num");

--��� ������
CREATE SEQUENCE THEATER_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;


--���� ���̺�

--���̺� ����
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

--�ڸ�Ʈ �ο�
COMMENT ON COLUMN "FILE"."file_id" IS '���� ID';
COMMENT ON COLUMN "FILE"."file_name" IS '���� �̸�';
COMMENT ON COLUMN "FILE"."file_dir" IS '���� ���';
COMMENT ON COLUMN "FILE"."file_type" IS '���� Ȯ����';
COMMENT ON COLUMN "FILE"."file_size" IS '���� �뷮';
COMMENT ON COLUMN "FILE"."file_regdate" IS '���� �����';
COMMENT ON COLUMN "FILE"."file_update" IS '���� ������';
COMMENT ON COLUMN "FILE"."s_num" IS '���� ��ȣ';

--PK�� FK ����
ALTER TABLE "FILE" ADD CONSTRAINT "PK_FILE" PRIMARY KEY ("file_id");
ALTER TABLE "FILE" ADD CONSTRAINT "FK_SHOW_TO_FILE_1" FOREIGN KEY("s_num")
REFERENCES "SHOW" ("s_num");

--��� ������
CREATE SEQUENCE FILE_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
CACHE 2;


--��ŷ ���̺�

--���̺� ����
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

--�ڸ�Ʈ �ο�
COMMENT ON COLUMN "RANK"."rank_id" IS '��ŷ���� ID';
COMMENT ON COLUMN "RANK"."rank_start" IS '��ŷ ���� ������';
COMMENT ON COLUMN "RANK"."rank_end" IS '��ŷ ���� ������';
COMMENT ON COLUMN "RANK"."rank_ticket" IS '��ŷ �Ⱓ ������';
COMMENT ON COLUMN "RANK"."rank_rank" IS '��ŷ ����';
COMMENT ON COLUMN "RANK"."rank_regdate" IS '��ŷ���� �����';
COMMENT ON COLUMN "RANK"."rank_update" IS '��ŷ���� ������';
COMMENT ON COLUMN "RANK"."s_num" IS '���� ��ȣ';

--PK�� FK ����
ALTER TABLE "RANK" ADD CONSTRAINT "PK_RANK" PRIMARY KEY ("rank_id");
ALTER TABLE "RANK" ADD CONSTRAINT "FK_SHOW_TO_RANK_1" FOREIGN KEY ("s_num")
REFERENCES "SHOW" ("s_num");

--��ŷ ���̺��� ��ŷ���� ID�� ���������, ����������, ������ȣ�� ������ �����̹Ƿ� ���� �������� ���� ����


-------------------------------------------------------------------------------------------------------------------
--������

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

COMMENT ON COLUMN "CS_INQUIRY"."i_num" IS '���Ǳ۹�ȣ';
COMMENT ON COLUMN "CS_INQUIRY"."u_id" IS 'ȸ�� ���̵�';
COMMENT ON COLUMN "CS_INQUIRY"."i_category" IS '����';
COMMENT ON COLUMN "CS_INQUIRY"."i_cate_detail" IS '��������';
COMMENT ON COLUMN "CS_INQUIRY"."i_reply" IS '�亯����';
COMMENT ON COLUMN "CS_INQUIRY"."i_title" IS '�亯����';
COMMENT ON COLUMN "CS_INQUIRY"."i_content" IS '�亯����';
COMMENT ON COLUMN "CS_INQUIRY"."i_regidate" IS '�����';
COMMENT ON COLUMN "CS_INQUIRY"."i_update" IS '������';
COMMENT ON COLUMN "CS_INQUIRY"."ti_num" IS '���Ź�ȣ';

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

COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_r_num" IS '���Ǳ۴亯��ȣ';
COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_num" IS '���Ǳ۹�ȣ';
COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_r_content" IS '���Ǳ۴亯����';
COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_r_regidate" IS '�亯�����';
COMMENT ON COLUMN "CS_INQUIRY_REPLY"."i_r_update" IS '�亯������';

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


--����� �ۼ� 

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
COMMENT ON COLUMN "NOTICE"."n_no" IS '�������� �۹�ȣ';
COMMENT ON COLUMN "NOTICE"."n_category" IS '�������� ī�װ�';
COMMENT ON COLUMN "NOTICE"."n_title" IS '�������� ����';
COMMENT ON COLUMN "NOTICE"."n_content" IS '�������� �۳���';
COMMENT ON COLUMN "NOTICE"."n_file" IS '�̹��� ��� �� �� �ϸ�';
COMMENT ON COLUMN "NOTICE"."n_hit" IS '�������� ��ȸ��';
COMMENT ON COLUMN "NOTICE"."n_regdate" IS '�������� �����';
COMMENT ON COLUMN "NOTICE"."n_update" IS '�������� ������';
ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"n_no"
);
     
create sequence quicket_noteice_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;


Insert into QUICKET.NOTICE ("n_no","n_category","n_title","n_content","n_file","n_hit","n_regdate","n_update") values (quicket_noteice_seq,'��Ÿ','Ƽ�� ��۷� �λ� �ȳ� (2023�� 03�� 23�Ϻ�)','�ȳ��ϼ���. QUICKet�Դϴ�. �׻� QUICKet�� �̿��� �ֽô� ���е鲲 ���� ���� �帳�ϴ�.
Ƽ�� ���� �ܰ� �λ� �� ��� �ܰ� �λ� �� ������ ���� ������� ���Ͽ� 2023�� 3�� 23��(��)���� Ƽ�� ��۷ᰡ �Ʒ��� ���� �ε����ϰ� �λ�Ǿ����ϴ�.
���Ե��� ���� ��Ź�帳�ϴ�. 
�� ��ۺ� ���� ������: 2023�� 3�� 23��(��)
�� ���� ����: ���� 3,000��(�Ǵ�) �溯�� 3,200��(�Ǵ�)
�� ��ǰ ������ ���� ��ۺ� �ٸ� �� ����
 ���� ���񽺷� �����ϴ� QUICKet�� �ǰڽ��ϴ�.
�����մϴ�.',null,0,to_date('23/03/16','RR/MM/DD'),to_date('23/03/16','RR/MM/DD'));

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

COMMENT ON COLUMN "FAQ"."f_no" IS 'FAQ �۹�ȣ';
COMMENT ON COLUMN "FAQ"."f_category" IS 'FAQ ī�װ�';
COMMENT ON COLUMN "FAQ"."f_title" IS 'FAQ ����';
COMMENT ON COLUMN "FAQ"."f_content" IS 'FAQ �۳���';
COMMENT ON COLUMN "FAQ"."f_regdate" IS 'FAQ �����';
COMMENT ON COLUMN "FAQ"."f_update" IS 'FAQ ������';

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"f_no"
);

create sequence quicket_faq_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

insert into QUICKET.FAQ ("f_no","f_category","f_title","f_content","f_regdate","f_update") values (quicket_faq_seq.nextval,'ȸ��','ȸ�� Ż�� ��û�� �ϰ� �;��','Ƽ�ϸ�ũ������ ���� Ż�� ��û �� öȸ�� �Ͻ� �� �����ϴ�.
�������� ���� ������ ���� ��ġ ���� ���� Ż��, ���� �̿� ���� � ����ϱ� ���Ͽ� ���� Ż�� ��û �� 3�ϰ� ���������� �����մϴ�. ���� �� �̿��� ���Ͻô� ���, Ż�� ��û 3�� �� ���� �� �����Ͽ� �̿��Ͻñ� �ٶ��ϴ�.',
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

COMMENT ON COLUMN "REVIEWBOARD"."r_no" IS '�����ı� �۹�ȣ';
COMMENT ON COLUMN "REVIEWBOARD"."u_id" IS 'ȸ�� ���̵�';
COMMENT ON COLUMN "REVIEWBOARD"."r_title" IS '�����ı� ����';
COMMENT ON COLUMN "REVIEWBOARD"."r_content" IS '�����ı� ����';
COMMENT ON COLUMN "REVIEWBOARD"."r_point" IS '�����ı� ����';
COMMENT ON COLUMN "REVIEWBOARD"."r_hit" IS '�����ı� ��ȸ��';
COMMENT ON COLUMN "REVIEWBOARD"."r_regdate" IS '�����ı� �����';
COMMENT ON COLUMN "REVIEWBOARD"."r_update" IS '�����ı� ������';
COMMENT ON COLUMN "REVIEWBOARD"."s_num" IS '���� ��ȣ';

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
--�質�� (�ۼ���)
--
--�̺�Ʈ
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


COMMENT ON TABLE EVENT IS '�̺�Ʈ ���̺�';
COMMENT ON COLUMN EVENT.E_NUM IS '�̺�Ʈ �۹�ȣ';
COMMENT ON COLUMN EVENT.e_name IS '�̺�Ʈ��';
COMMENT ON COLUMN EVENT.e_startdate IS '�̺�Ʈ ������';
COMMENT ON COLUMN EVENT.e_enddate IS '�̺�Ʈ ������';
COMMENT ON COLUMN EVENT.e_img IS '�̺�Ʈ ���� �̹���';
COMMENT ON COLUMN EVENT.e_regdate IS '�̺�Ʈ �����';
COMMENT ON COLUMN EVENT.e_update IS '�̺�Ʈ ������';
COMMENT ON COLUMN EVENT.s_num IS '�̺�Ʈ ���� ��ȣ';



--�����
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

COMMENT ON COLUMN EXPECTATION.ex_no IS '����� �۹�ȣ';
COMMENT ON COLUMN EXPECTATION.ex_title IS '����� ����';
COMMENT ON COLUMN EXPECTATION.ex_content IS '����� ����';
COMMENT ON COLUMN EXPECTATION.ex_hit IS '����� ��ȸ��';
COMMENT ON COLUMN EXPECTATION.ex_regdate IS '����� �����';
COMMENT ON COLUMN EXPECTATION.ex_update IS '����� ������';
COMMENT ON COLUMN EXPECTATION.u_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN EXPECTATION.s_num IS '���� ��ȣ';
COMMENT ON COLUMN EXPECTATION.ti_num IS '���Ź�ȣ';


--������ ����
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

COMMENT ON COLUMN ADMIN_COUPON.c_num IS '������ȣ';
COMMENT ON COLUMN ADMIN_COUPON.c_name IS '������';
COMMENT ON COLUMN ADMIN_COUPON.c_discount IS '������';
COMMENT ON COLUMN ADMIN_COUPON.c_startdate IS '��ȿ�Ⱓ ������';
COMMENT ON COLUMN ADMIN_COUPON.c_enddate IS '��ȿ�Ⱓ ������';
COMMENT ON COLUMN ADMIN_COUPON.c_img IS '���� �̹���';
COMMENT ON COLUMN ADMIN_COUPON.c_regdate IS '���� �����';
COMMENT ON COLUMN ADMIN_COUPON.c_update IS '���� ������';



--��������
CREATE TABLE "USER_COUPON" (
	"u_id"	VARCHAR2(15)		NOT NULL,
	"c_num"	VARCHAR2(10)		NOT NULL,
	"uc_date"	DATE	DEFAULT SYSDATE	NOT NULL,
	"uc_state"	NUMBER(1)	DEFAULT 0	NOT NULL
);

ALTER TABLE `USER_COUPON` ADD CONSTRAINT `PK_USER_COUPON` PRIMARY KEY (`u_id`, `c_num`);
ALTER TABLE `USER_COUPON` ADD CONSTRAINT `FK_ADMIN_COUPON_TO_USER_COUPON_1` FOREIGN KEY (`c_num`) REFERENCES `ADMIN_COUPON` (`c_num`);

COMMENT ON COLUMN "USER_COUPON"."u_id" IS 'ȸ�� ���̵�';
COMMENT ON COLUMN "USER_COUPON"."c_num" IS '������ȣ';
COMMENT ON COLUMN "USER_COUPON"."uc_date" IS '���� �߱���';
COMMENT ON COLUMN "USER_COUPON"."uc_state" IS '0:�̻��, 1:���Ϸ�, -1:�Ⱓ����';


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


COMMENT ON COLUMN "QNA"."q_no" IS 'QNA �۹�ȣ';
COMMENT ON COLUMN "QNA"."q_title" IS 'QNA ����';
COMMENT ON COLUMN "QNA"."q_content" IS 'QNA ����';
COMMENT ON COLUMN "QNA"."q_regdate" IS 'QNA �����';
COMMENT ON COLUMN "QNA"."q_update" IS 'QNA ������';
COMMENT ON COLUMN "QNA"."q_reply" IS 'QNA �亯';
COMMENT ON COLUMN "QNA"."u_id" IS 'ȸ�� ���̵�';
COMMENT ON COLUMN "QNA"."s_num" IS '���� ��ȣ';


--QNA ���
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


COMMENT ON COLUMN "QNA_REPLY"."q_no" IS 'QA �۹�ȣ';
COMMENT ON COLUMN "QNA_REPLY"."q_r_no" IS '�亯 �۹�ȣ';
COMMENT ON COLUMN "QNA_REPLY"."q_r_content" IS '�亯 ����';
COMMENT ON COLUMN "QNA_REPLY"."q_r_regdate" IS '�亯 �����';
COMMENT ON COLUMN "QNA_REPLY"."q_r_update" IS '�亯 ������';
COMMENT ON COLUMN "QNA_REPLY"."u_id" IS 'ȸ�� ���̵�';

-------------------------------------------------------------------------------------------------------------------
--������


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

COMMENT ON COLUMN "SEAT"."seat_num" IS '�¼���ȣ';

COMMENT ON COLUMN "SEAT"."hall_id" IS '����������ID';

COMMENT ON COLUMN "SEAT"."seat_status" IS '�¼� Ȱ��/��Ȱ��ȭ';

COMMENT ON COLUMN "SEAT"."seat_age" IS '����/�Ƶ�';

COMMENT ON COLUMN "SEAT"."seat_regdate" IS '�¼� ������ �����';

COMMENT ON COLUMN "SEAT"."seat_update" IS '�¼� ������ ������';

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

COMMENT ON COLUMN "HALL"."hall_id" IS '����������ID';

COMMENT ON COLUMN "HALL"."hall_place" IS '������';

COMMENT ON COLUMN "HALL"."hall_turn" IS '��ȸ��';

COMMENT ON COLUMN "HALL"."hall_regdate" IS '����Ȧ ������ �����';

COMMENT ON COLUMN "HALL"."hall_update" IS '����Ȧ ������ ������';

COMMENT ON COLUMN "HALL"."th_num" IS '������ ��ȣ';

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

COMMENT ON COLUMN "STATISTICS"."st_date" IS '�ְ� ��¥ ������';

COMMENT ON COLUMN "STATISTICS"."s_num" IS '���� ��ȣ';

COMMENT ON COLUMN "STATISTICS"."ti_num" IS '���Ź�ȣ';

COMMENT ON COLUMN "STATISTICS"."st_cash" IS '�ְ��� ����� ������ ��';

COMMENT ON COLUMN "STATISTICS"."st_per" IS '�ְ��� ����� ������';

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

COMMENT ON COLUMN "PAY"."ti_num" IS '���Ź�ȣ';

COMMENT ON COLUMN "PAY"."pay_name" IS '������ �̸�';

COMMENT ON COLUMN "PAY"."pay_phone" IS '������ ��ȭ��ȣ';

COMMENT ON COLUMN "PAY"."pay_amount" IS '�����ݾ�';

COMMENT ON COLUMN "PAY"."pay_virtual_num" IS '������¹�ȣ';

COMMENT ON COLUMN "PAY"."pay_cardNum" IS 'ī���ȣ';

COMMENT ON COLUMN "PAY"."pay_cardPwd" IS 'ī���й�ȣ';

COMMENT ON COLUMN "PAY"."pay_status" IS '��������';

COMMENT ON COLUMN "PAY"."pay_regdate" IS '���� ������ �����';

COMMENT ON COLUMN "PAY"."pay_update" IS '���� ������ ������';

COMMENT ON COLUMN "PAY"."c_num" IS '������ȣ';

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

COMMENT ON COLUMN "TICKET_SEAT"."ti_num" IS '���Ź�ȣ';

COMMENT ON COLUMN "TICKET_SEAT"."seat_num" IS '�¼���ȣ';

COMMENT ON COLUMN "TICKET_SEAT"."hall_id" IS '����������ID';

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

COMMENT ON COLUMN "TICKET"."ti_num" IS '���Ź�ȣ';

COMMENT ON COLUMN "TICKET"."seat_date" IS '������ �ð�/��¥';

COMMENT ON COLUMN "TICKET"."ti_status" IS '���Ż���';

COMMENT ON COLUMN "TICKET"."u_id" IS 'ȸ�� ���̵�';

COMMENT ON COLUMN "TICKET"."ti_regdate" IS '���� ������ �����';

COMMENT ON COLUMN "TICKET"."ti_update" IS '���� ������ ������';



-------------------------------------------------------------------------------------------------------------------


