--[����Ŭ] ���Ἲ ���� ���� ����
CREATE TABLE subject(
    no NUMBER(4),
    s_num CHAR(2) NOT NULL,
    s_name VARCHAR(40)NOT NULL,
    CONSTRAINT subject_no_PK PRIMARY KEY(no),
    CONSTRAINT subject_s_num_UK UNIQUE(s_num)
);
INSERT INTO subject VALUES(1,'01','��ǻ���а�');
INSERT INTO subject VALUES(2,'02','�����а�');
INSERT INTO subject VALUES(3,'03','�Ź�����а�');
INSERT INTO subject VALUES(4,'04','���ͳݺ���Ͻ���');
INSERT INTO subject VALUES(5,'05','����濵��');

CREATE TABLE student(
    no NUMBER(4),
    sd_num CHAR(8) NOT NULL,
    sd_name VARCHAR2(20) NOT NULL,
    sd_id VARCHAR2(20) NOT NULL,
    sd_passwd VARCHAR2(20) NOT NULL,
    s_num CHAR(2) NOT NULL,
    sd_birth DATE NOT NULL,
    sd_phone VARCHAR2(20) NOT NULL,
    sd_address VARCHAR2(40) NOT NULL,
    sd_email VARCHAR2(40) NOT NULL,
    sd_date date default sysdate,
    CONSTRAINT student_no_PK PRIMARY KEY(no),
    CONSTRAINT student_sd_num_UK UNIQUE(sd_num),
    CONSTRAINT student_sd_id_UK UNIQUE(sd_id),
    CONSTRAINT student_s_num_FK FOREIGN KEY(s_num) REFERENCES subject(s_num) --�θ� ���̺� ���� unique���� foreign key�� ��ϵ�.
);
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(1,'06010001','������','javajsp','javasjp1234','01','95/02/11','010-1111-1111','����� ���빮�� â����',
'javajsp@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(2,'95010002','�����','jdbcmania','jdbcmania1234','02','00/03/19','010-2222-2222','����� ���ʱ� ���絿',
'jdbcmania@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(3,'98040001','������','gonji','gonji1234','03','02/07/13','010-3333-3333','�λ걤���� �ؿ�뱸 �ݼ۵�',
'gonji@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(4,'02050001','������','water','water1234','04','97/05/02','010-4444-4444','���������� �߱� ���ൿ',
'water@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(5,'94040002','�ְ��','novel','novel1234','05','03/01/21','010-5555-5555','��⵵ ������ ��ȱ� �̸�',
'novel@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(6,'08020001','������','korea','korea1234','03','05/11/28','010-6666-6666','����� ���Ǳ� ��õ��',
'korea@naver.com');

CREATE TABLE lesson(
    no NUMBER(4),
    l_abbre CHAR(2) NOT NULL,
    l_name VARCHAR2(20) NOT NULL,
    CONSTRAINT lesson_no_PK PRIMARY KEY(no),
    CONSTRAINT lesson_l_abbre_UK UNIQUE(l_abbre)
);
INSERT INTO lesson VALUES(1,'K','����');
INSERT INTO lesson VALUES(2,'M','����');
INSERT INTO lesson VALUES(3,'E','����');
INSERT INTO lesson VALUES(4,'H','����');
INSERT INTO lesson VALUES(5,'P','���α׷���');
INSERT INTO lesson VALUES(6,'D','�����ͺ��̽�');
INSERT INTO lesson VALUES(7,'ED','�������̷�');

CREATE TABLE trainee(
    no NUMBER(4),
    sd_num CHAR(8) NOT NULL,
    l_abbre CHAR(2) NOT NULL,
    t_section VARCHAR2(20) NOT NULL,
    t_date date default sysdate,
    CONSTRAINT trainee_no_PK PRIMARY KEY(no),
    CONSTRAINT trainee_l_abbre_FK FOREIGN KEY(l_abbre) REFERENCES lesson(l_abbre),
    CONSTRAINT trainee_sd_num_FK FOREIGN KEY(sd_num) REFERENCES student(sd_num)
);
INSERT INTO trainee(no,sd_num,l_abbre,t_section) VALUES(1,'08020001','K','culture');
INSERT INTO trainee(no,sd_num,l_abbre,t_section) VALUES(2,'95010002','M','culture');
INSERT INTO trainee(no,sd_num,l_abbre,t_section) VALUES(3,'94040002','D','major');
INSERT INTO trainee(no,sd_num,l_abbre,t_section) VALUES(4,'98040001','ED','minor');
INSERT INTO trainee(no,sd_num,l_abbre,t_section) VALUES(5,'06010001','H','culture');

drop table subject;
drop table student;
drop table lesson;
drop table trainee;
SELECT * FROM subject;
SELECT * FROM student;
SELECT * FROM lesson;
SELECT * FROM trainee;