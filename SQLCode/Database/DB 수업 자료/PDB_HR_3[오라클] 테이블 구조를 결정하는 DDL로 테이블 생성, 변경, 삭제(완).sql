---------테이블 문제221028----------------------------------------------------------------------------------------------
--3[오라클] 테이블 구조를 결정하는 DDL로 테이블 생성, 변경, 삭제(완료)
--Table1. 테이블 생성
CREATE TABLE EMP01(
    EMPNO NUMBER(4), --숫자형 데이터 타입(정수)
    ENAME VARCHAR2(20), --20byte 문자형 데이터 타입(가변길이)
    SAL NUMBER(7,2) -- 숫자형 데이터 타입(실수)
    );
--
SELECT * FROM TAB;
--
DESC EMP01;
--Table2. 기존 테이블 복사
CREATE TABLE EMPLOYEES02
AS
SELECT * FROM EMPLOYEES;
--
SELECT * FROM TAB;
--
SELECT * FROM employees02;
--Table3-1. ALTER TABLE로 테이블 구조 변경
--<예> EMP01 테이블에 문자 타입의 직급(JOB) 칼럼을 추가
SELECT * FROM EMP01;
--
ALTER TABLE EMP01
ADD(JOB VARCHAR2(9));
--
DESC EMP01;
--문제 (이미 존재하는 EMP01 테이블에 입사일 칼럼(CREDATE)를 날짜형으로 추가하라
ALTER TABLE EMP01
ADD(CREDATE DATE);
--Table3-2. ALTER TABLE로 기존 칼럼 설정
--<예> 직급을 최대 30자까지 입력할 수 있도록 크기 수정
ALTER TABLE EMP01
MODIFY(JOB VARCHAR2(30));
DESC EMP01;
--ALTER TABLE EMP01
--MODIFY(JOB VARCHAR2(9)); 더 작은 크기로 변경 됨. 칼럼에 자료가 없기때문
--<예> 직급을 최대 30자까지 입력할 수 있도록 크기 수정
--Table3-3. ALTER TABLE로 기존 칼럼명 변겯
--<예> 입사일 컬럼의 이름을 CREDATE에서 REGDATE로 컬럼명을 변경.
ALTER TABLE emp01
RENAME COLUMN credate TO regdate;
DESC emp01;
--Table3-4. ALTER TABLE로 기존 칼럼 삭제
--<예> 직급(JOB) 칼럼을 삭제
ALTER TABLE emp01
DROP COLUMN job;
DESC emp01;
--Table4. DROP TABLE로 테이블 구조 삭제
--<예> EMP01 테이블을 삭제
DROP TABLE EMP01;
--삭제 확인
SELECT * FROM TAB;
--recyclebin 구조 확인
desc recyclebin;
--휴지통(recyclebin)보기
SELECT * FROM recyclebin;
--휴지통 비우기
purge recyclebin;
--실수로 지운 테이블이라 삭제를 취소하려면 다음과 같은 명령으로 다시 복구하면 된다.
--flashback table table_name to before drop;
FLASHBACK TABLE emp01 TO BEFORE DROP;
--새로운 이름으로 복원하는 방법
FLASHBACK TABLE emp01 TO BEFORE DROP
RENAME TO emp02;
--휴지통에 넣지 않고 바로 테이블을 삭제하려면 다음과 같은 명령으로 휴지통에 넣지 않고 삭제를 할 수 있다.
--drop table table_name purge;
drop table emp01 purge;
--Table5. 테이블 명을 변경하는 RENAME 문
--<예> EMPLOYEES02 테이블의 이름을 EMPLOYEES01으로 변경
RENAME EMPLOYEES02 TO EMPLOYEES01;
SELECT * FROM TAB;
--Table6. 테이블의 모든 로우를 제거해 TRUNCATE문
-- <예> EMPLOYEES01 테이블의 모든 로우를 제거
SELECT * FROM employees01;
TRUNCATE TABLE employees01;
SELECT * FROM employees01;
--Table Make-----------------------
--고객 테이블 구조( 테이블 생성은 이번 장을 배운 후 진행.)
-- 테이블명: TB_CUSTOMER. 기본키 설정방법: 컬럼명 자료형 PRIMARY KEY
CREATE TABLE TB_CUSTOMER(
    CUSTOMER_CD CHAR(7) NOT NULL PRIMARY KEY,
    CUSTOMER_NM VARCHAR2(15) NOT NULL,
    MW_FLG CHAR(1) NOT NULL,
    BIRTH_DAY CHAR(8) NOT NULL,
    PHONE_NUMBER VARCHAR2(16),
    EMAIL VARCHAR2(50),
    TOTAL_POINT NUMBER(10),
    REG_DTTM CHAR(14)
);
SELECT * FROM tb_customer;
DESC tb_customer;