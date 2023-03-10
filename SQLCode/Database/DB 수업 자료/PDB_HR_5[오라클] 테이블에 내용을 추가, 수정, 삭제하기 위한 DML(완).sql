-----[오라클] 테이블에 내용을 추가, 수정, 삭제하기 위한 DML
--1) 테이블에 새로운 행을 추가하는 INSERT문
CREATE TABLE DEPT(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);
DESC DEPT;
SELECT * FROM DEPT;
--
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10,'ACCOUNTING','NEW YORK');
SELECT * FROM DEPT;
--①INSERT 구문에서 오류 발생의 예
--칼럼명에 기술된 목록의 수보다 VALUES 다음에 나오는 괄호 안에 기술한 값의 개수가 적으면 에러가 발생한다.
INSERT INTO DEPT(DEPTNO,DNAME,LOC)
VALUES(10,'ACCOUNTING');
--칼럼명에 기술된 목록의 수보다 VALUES다음에 나오는 괄호에 기술한 값을 개수가 많으면 에러가 발생한다.
INSERT INTO DEPT(DEPTNO,DNAME)
VALUES(10,'ACCOUNTING','NEW YORK', 20);
--칼럼명이 잘못 입력되었을 때에도 에러가 발생한다.
INSERT INTO DEPT(NUM, DNAME, LOC)
VALUES(10,'ACCOUNTING', 'NEW YORK');
--칼럼과 입력할 값의 데이터 타입이 서로 맞지 않을 경우에도 에러가 발생한다.
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10,ACCOUNTING, 'NEW YORK');
--②칼럼명을 생략한 INSERT 구문
INSERT INTO DEPT
VALUES(20,'RESEARCH','DALLAS');
SELECT * FROM DEPT;
--③NULL값의 삽입
DESC DEPT; --널? 밑에 아무것도 없으면 허용 NOT NULL이면 비허용
--④암시적으로 NULL값 삽입
INSERT INTO DEPT(DEPTNO, DNAME) VALUES(30,'SALES');
SELECT * FROM DEPT;
--⑤명시적으로 NULL값의 삽입
INSERT INTO DEPT
VALUES(40,'OPERATIONS');--오류
--
INSERT INTO DEPT
VALUES(40,'OPERATIONS',NULL);
SELECT * FROM DEPT;
--
INSERT INTO DEPT
VALUES(50,'','CHICAGO');
SELECT * FROM DEPT;
--
DELETE FROM DEPT;
--
ALTER TABLE DEPT MODIFY(DEPTNO NUMBER(4), DNAME VARCHAR2(30));
INSERT INTO DEPT
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID FROM DEPARTMENTS;
--
SELECT * FROM DEPT;
--<문제> TB_CUSTOMER 테이블에 아래 데이터를 추가하라
DROP TABLE TB_CUSTOMER;
CREATE TABLE TB_CUSTOMER(
    CUSTOMER_CD NUMBER(7),
    CUSTOMER_NM VARCHAR2(20),
    MW_FLG CHAR(2),
    BIRTH_DAY NUMBER(8)
);
INSERT INTO TB_CUSTOMER VALUES(2017042,'강원진','M',19810603);
INSERT INTO TB_CUSTOMER VALUES(2017053,'나경숙','W',19891225);
INSERT INTO TB_CUSTOMER VALUES(2017108,'박승대','M',19711430);
SELECT * FROM TB_CUSTOMER;
--두번째 문제 생략
--2)테이블의 내용을 수정하기 위한 UPDATE문
--①테이블의 모든 행 변경: WHERE절을 추가하지 않으면 테이블의 모든 행이 변경된다.
CREATE TABLE EMP 
AS
SELECT * FROM EMPLOYEES;
SELECT * FROM EMP;
--
UPDATE EMP
SET DEPARTMENT_ID = 30;
SELECT * FROM EMP;
--
UPDATE EMP
SET SALARY = SALARY * 1.1;
SELECT * FROM EMP;
--
UPDATE EMP
SET HIRE_DATE = SYSDATE;
SELECT * FROM EMP01;
--②테이블의 특정 행만 변경 / UPDATE문에 WHERE 절을 추가하면 조건을 만족하는 테이블의 특정 행만 변경할 수 있다.
DROP TABLE EMP;
CREATE TABLE EMP
AS
SELECT * FROM EMPLOYEES;
SELECT * FROM EMP;
--
UPDATE EMP
SET DEPARTMENT_ID = 30
WHERE DEPARTMENT_ID = 10;
SELECT * FROM EMP;
--급여가 3000 이상인 사원만 급여를 10%인상
UPDATE EMP
SET SALARY = SALARY * 1.1
WHERE SALARY >= 3000;
SELECT * FROM EMP;
--2007년에 입사한 사원의 입사일이 오늘로 수정한다
UPDATE EMP
SET HIRE_DATE = SYSDATE
WHERE SUBSTR(HIRE_DATE, 1, 2) = '07';
SELECT * FROM EMP;
--③테이블에서 2개 이상의 칼럼 값 변경 / 테이블에서 하나의 컬럼이 아닌 복수 개의 칼럼 값을
--변경하려면 기존 SET절에 콤마를 추가하고 칼럼=값을 추가 기술하면 된다.
DROP TABLE EMP;
CREATE TABLE EMP
AS
SELECT * FROM EMPLOYEES;
SELECT * FROM EMP WHERE FIRST_NAME = 'Susan';
--Susan의 부서번호는 20번으로, 직급은 FI_MGR
UPDATE EMP
SET DEPARTMENT_ID = 20, JOB_ID = 'FI_MGR'
WHERE FIRST_NAME = 'Susan';
SELECT * FROM EMP WHERE FIRST_NAME = 'Susan';
--LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다.
SELECT * FROM EMP WHERE LAST_NAME = 'Russell';
UPDATE EMP
SET SALARY = 17000, COMMISSION_PCT = 0.45
WHERE LAST_NAME = 'Russell';
--<문제> TB_CUSTOMER 테이블에서 박승대 고객의 생년월일을  19711230인데 잘못 입력하여 19711430을
--입력하였다. 생년월일을 수정해주세요,
SELECT * FROM TB_CUSTOMER
WHERE CUSTOMER_NM = '박승대';
UPDATE TB_CUSTOMER
SET BIRTH_DAY = 19711230;
--3) 테이블에 불필요한 행(레코드)을 삭제하기 위한 DELETE문
SELECT * FROM DEPT;
DELETE FROM DEPT;
DELETE FROM DEPT WHERE DEPTNO = 30;
--4)MERGE 문
CREATE TABLE TB_ADD_CUSTOMER(
    CUSTOMER_CD CHAR(7 BYTE)      NOT NULL,
    CUSTOMER_NM VARCHAR2(10 BYTE) NOT NULL,
    MW_FLG      CHAR(1 BYTE)      NOT NULL,
    BIRTH_DAY   CHAR(8 BYTE)      NOT NULL,
    PHONE_NUMBER VARCHAR2(16 BYTE),
    CONSTRAINT TB_ADD_CUSTOMER_CUSTOMER_CD_PK PRIMARY KEY(CUSTOMER_CD)
);
--
INSERT INTO TB_ADD_CUSTOMER(customer_cd, customer_nm, mw_flg, birth_day, phone_number)
VALUES('2017108','박승대','M','19711230','010-2580-9919');
INSERT INTO TB_ADD_CUSTOMER(customer_cd, customer_nm, mw_flg, birth_day, phone_number)
VALUES('2019302','전미래','W','19740812','010-8864-0232');
SELECT * FROM TB_ADD_CUSTOMER;
--
SELECT * FROM TB_CUSTOMER;
--
MERGE INTO TB_CUSTOMER CU
    USING TB_ADD_CUSTOMER NC
    ON (CU.CUSTOMER_CD = NC.CUSTOMER_CD)
    WHEN MATCHED THEN
        UPDATE SET CU.CUSTOMER_NM = NC.CUSTOMER_NM,
            CU.MW_FLG = NC.MW_FLG,
            CU.BIRTH_DAY = NC.BIRTH_DAY
            
    WHEN NOT MATCHED THEN
        INSERT (CU.CUSTOMER_CD, CU.CUSTOMER_NM, CU.MW_FLG, CU.BIRTH_DAY)
        VALUES(NC.CUSTOMER_CD, NC.CUSTOMER_NM, NC.MW_FLG, NC.BIRTH_DAY);
