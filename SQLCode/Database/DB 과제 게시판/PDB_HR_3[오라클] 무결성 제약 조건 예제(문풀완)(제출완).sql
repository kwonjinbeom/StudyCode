--[오라클] 무결성 제약 조건 예제
CREATE TABLE subject(
    no NUMBER(4),
    s_num CHAR(2) NOT NULL,
    s_name VARCHAR(40)NOT NULL,
    CONSTRAINT subject_no_PK PRIMARY KEY(no),
    CONSTRAINT subject_s_num_UK UNIQUE(s_num)
);
INSERT INTO subject VALUES(1,'01','컴퓨터학과');
INSERT INTO subject VALUES(2,'02','교육학과');
INSERT INTO subject VALUES(3,'03','신문방송학과');
INSERT INTO subject VALUES(4,'04','인터넷비즈니스과');
INSERT INTO subject VALUES(5,'05','기술경영과');

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
    CONSTRAINT student_s_num_FK FOREIGN KEY(s_num) REFERENCES subject(s_num) --부모 테이블에 열이 unique여야 foreign key가 등록됨.
);
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(1,'06010001','김정수','javajsp','javasjp1234','01','95/02/11','010-1111-1111','서울시 서대문구 창전동',
'javajsp@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(2,'95010002','김수현','jdbcmania','jdbcmania1234','02','00/03/19','010-2222-2222','서울시 서초구 양재동',
'jdbcmania@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(3,'98040001','공지영','gonji','gonji1234','03','02/07/13','010-3333-3333','부산광역시 해운대구 반송동',
'gonji@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(4,'02050001','조수영','water','water1234','04','97/05/02','010-4444-4444','대전광역시 중구 은행동',
'water@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(5,'94040002','최경란','novel','novel1234','05','03/01/21','010-5555-5555','경기도 수원시 장안구 이목동',
'novel@naver.com');
INSERT INTO student(no,sd_num,sd_name,sd_id,sd_passwd,s_num,sd_birth,sd_phone,sd_address,sd_email) VALUES(6,'08020001','안익태','korea','korea1234','03','05/11/28','010-6666-6666','서울시 관악구 봉천동',
'korea@naver.com');

CREATE TABLE lesson(
    no NUMBER(4),
    l_abbre CHAR(2) NOT NULL,
    l_name VARCHAR2(20) NOT NULL,
    CONSTRAINT lesson_no_PK PRIMARY KEY(no),
    CONSTRAINT lesson_l_abbre_UK UNIQUE(l_abbre)
);
INSERT INTO lesson VALUES(1,'K','국어');
INSERT INTO lesson VALUES(2,'M','수학');
INSERT INTO lesson VALUES(3,'E','영어');
INSERT INTO lesson VALUES(4,'H','역사');
INSERT INTO lesson VALUES(5,'P','프로그래밍');
INSERT INTO lesson VALUES(6,'D','데이터베이스');
INSERT INTO lesson VALUES(7,'ED','교육학이론');

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