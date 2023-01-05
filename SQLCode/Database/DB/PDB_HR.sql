DROP TABLE EMP06 PURGE; -- emp06 삭제
---------수업Day1(22.10.27)-----------------------------------------------
-- ctrl + enter: 전체실행, F9: 커서에 둔 라인 실행
-- NOT NULL: null을 허용하지 않음. 값이 없으면 상관없다는 거.
-- hr 사용자의 전체 테이블 목록 확인
select * from tab;
-- desc 테이블 : 테이블의 구조를 확인
desc departments;
-- 부서 테이블로부터 모든 테이블을 조회해라.
select * from departments; 

desc employees;

select * from employees;
--1. 데이터를 조회하기 위한 SELECT/(departments 테이블의 모든 내용 출력)
SELECT * FROM DEPARTMENTS;
--1.문제 employees 테이블의 모든 내용 출력
SELECT * FROM EMPLOYEES;
--2. 칼럼 이름을 명시해서 특정 칼럼만 보기/(departments 테이블에서 부서번호와 부서명만 출력)
SELECT department_id, department_name FROM departments;
--2.문제 (사원의 이름과 급여와 입사일자만을 출력하는 SQL문을 작성해보자.)
SELECT first_name, last_name, salary, hire_date FROM employees;
--3_1. 칼럼 이름에 별칭 지정하기, AS로 컬럼에 별칭 부여하기
SELECT department_id AS DepartmentNo, department_name AS DepartmentName FROM Departments;
--3_2. AS 없이 컬럼에 별칭 부여하기/(#오라클의 문자는 ' ' 숫자는 그대로 별칭은 아무것도 없거나, ""(공백이 들어갈 때, 특수문자, 대소문자 구별하고 싶음.))
SELECT department_id "DepartmentNO", department_name "DepatmentName" FROM departments;
--3_3. 별칭으로 한글 사용이 가능하다.(#한글은 ""가 필요없나봄)
SELECT department_id 부서번호, department_name 부서명 FROM departments;
--4. Concatenation 연산자의 정의와 사용(연결 연산자)/(employees 테이블에서 여러 컬럼을 하나의 문자열로 출력하기
SELECT first_name || '의 직급은' ||job_id||'입니다' AS 직급 FROM employees;
--
SELECT first_name || ' ' ||last_name 이름, salary 급여, hire_date 입사일 FROM employees;
--5. 중복된 데이터를 한번씩 만 출력하게 하는 DISTINCT
SELECT job_id FROM employees;
-- employees 테이블에서 칼럼 job_id를 표시하되 중복된 값은 한번만 표시해라
SELECT DISTINCT job_id FROM employees;
SELECT DISTINCT first_name, job_id FROM employees;-- 이렇게 되면 job_id가 중복제거가 안됨.
--5.문제 (직원들이 어떤 부서에 소속되어 있는지 소속 부서번호(department_id)출력하되 중복되지 않고 한번씩 출력하는 쿼리문을 작성하자.
SELECT DISTINCT department_id FROM departments;
--6_1. WHERE 조건과 비교 연산자
SELECT employee_id, first_name, salary FROM employees;
-- <예> 급여를 3000이상 받는 직원을 대상
SELECT employee_id, first_name, salary FROM employees WHERE salary >= 3000;
-- <예> 급여를 3000미만 받는 직원을 대상
SELECT employee_id, first_name, salary FROM employees WHERE salary < 3000;
--6_1. 문제 (EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라.
SELECT * FROM employees WHERE department_id = 110;
--6_1. 문제 (EMPLOYEES 테이블에서 급여가 5000미만이 되는 직원의 정보 중에서 사번가 이름, 급여를 출력하라.
SELECT manager_id,first_name || ' ' || last_name, salary FROM employees WHERE salary < 5000;
--6_2. 문자 데이터 조회, 문자 데이터는 반드시 단일 따옴표 안에 표시하고, 대소문자를 구분한다.<예> 이름이 'Lex'인 직원
SELECT employee_id, first_name, last_name, salary FROM employees WHERE first_name = 'Lex';
--6_2. 문제 (이름이 John인 사람의 사원번호와 직원명과 업무 ID를 출력하라.)
SELECT department_id, first_name || ' ' || last_name, employee_id FROM employees WHERE first_name = 'John';
-- 여기서 john의 j를 대소문자를 구분하지 않으면 검색 결과가 안나온다. ' '는 대소문자를 구분하기 때문
--6_3. 날짜 데이터 조회, 반드시 단일 따옴표 안에 표시한다. 년/월/일 형식으로 기술한다.<예> 2008년 이후에 입사한 직원
SELECT first_name, hire_date FROM employees WHERE hire_date >= '2008/01/01';
--7_1. 논리연산자, AND연산자: 여러 조건을 모두 만족해야 할 경우 <예> 부서번호가 100번이고 직급이 FI_MGR인 직원
SELECT employee_id, first_name, phone_number, department_id, job_id 
FROM employees
WHERE department_id = 100 AND job_id = 'FI_MGR';
--7_1. 문제 (급여가 5000에서 10000이하 직원 정보 출력)
SELECT *
FROM employees
WHERE salary >= 5000 AND salary <= 10000;
--7_2. OR연산자, 두 가지 조건 중에서 한가지만 만족하더라도 <예> 부서번호가 100번이거나 직급이 FI_MGR인 직원
SELECT employee_id, first_name, phone_number, department_id, job_id
FROM employees
WHERE department_id = 100 OR job_id = 'FI_MGR';
--7_2. 문제 (사원번호가 134이거나 201이거나 107인 직원 정보 출력
SELECT *
FROM employees
WHERE employee_id = 134 OR employee_id = 201 OR employee_id = 107;
--7_3. NOT 연산자, 반대되는 논리 <예> 부서번호가 100번이 아닌 직원
SELECT employee_id, first_name, phone_number, department_id, job_id
FROM employees
WHERE NOT department_id = 100;
--7_3. 문제 (업무 ID가 FI_MGR가 아닌 직원)
SELECT *
FROM employees
WHERE NOT job_id = 'FI_MGR';
--7_4. BETWEEN AND 연산자, 특정 범위 내에 속하는 데이터를 알아보려고 할 때
-- <예> 급여가 2000에서부터 3000까지의 범위에 속한 사원
SELECT employee_id, first_name, salary
FROM employees
WHERE salary BETWEEN 2000 AND 3000;
--7_4. 문제 (급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라.
--(AND연산자와 BETWEEN AND 연산자 사용)
SELECT employee_id, first_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 4500;
-- WHERE salary >=2500 AND salary <4500;
--7_5. IN연산자, 동일한 칼럼이 여러 개의 값 중에 하나인지를 살펴보기 위해
--<예> 직원번호가 177이거나 101이거나 184인 사원
SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 177 OR employee_id = 101 OR employee_id = 184;
---------------비교
SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id IN(177,101,184);
--7_5. 문제 (부서번호가 10, 20, 30 중 하나에 소속된 직원의 직원번호, 이름, 급여를 출력하라
-- OR연산자와 IN연산자 사용
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE department_id IN(10,20,30);
------위는 IN 아래는 OR
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE department_id = 10 OR department_id = 20 OR department_id = 30;
--8_1. LIKE 연산자, 검색하고자 하는 값을 정확히 모를 경우 와일드카드와 함께 사용하여 원하는 내용을 검색하는 연산자.
--%: 문자가 없거나, 하나 이상의 문자가 어떤 값이 오든 상관없다. -: 하나의 문자가 어떤 값이 오든 상관없다.
--8_1. <예> (K로 시작하는 사원)
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'K%';
--8_1. <예> (이름 중에 k를 포함하는 사원)
SELECT employee_id, first_name
FROM employees
WHERE LOWER(first_name) LIKE '%k%';
-- LOWER 는 소문자 변환, LIKE '%k%'가 대문자를 못찾아서 소문자로 변환하는 것 
--8_1. <예> (이름이 k로 끝나는 사원
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE '%k';
--8_2. 와일드카드(_) 사용하기, _는 한 문자를 대신해서 사용한 것 <예> 이름의 두 번재 글자가 d인 사원
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE '_d%';
--8_2. 문제 (이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라.)
SELECT employee_id, first_name
FROM employees
WHERE NOT LOWER(first_name) LIKE '%a%';
---------20201031 LIKE 연산자 추가 설명
--ESCAPE / LIKE 연산으로 '%' 나 '_' 가 포함된 문자를 검색하고자 할 때 사용된다.
-- '%'나 '_' 앞에 ESCAPE로 특수문자를 지정하면 검색할 수 있다. / 특수문자는 아무거나 상관없이 사용 가능하다.
-- 구문 마지막에 ESCAPE에 사용할 문자열만 지정해주면 '_' 나 '%' 를 검색에 사용할 수 있게 도와준다.
-- 사원테이블(EMPLOYEES)에서 직무ID에 3번째 _를 포함하고 4번째 자리의 값이 P인 레코드를 조회하고자 한다.
SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '__\_P%' ESCAPE '\'; --  '\'라고 지정했으니까  \가 나온 후 

SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '__@_P%' ESCAPE '@';
--9-1. NULL을 위한 연산자, 오라클에서는 컬럼에 NULL값이 저장되는 것을 허용한다. NULL은 미확정, 알 수 없는 값을 의미. 0(Zero)도 빈 공간도 아닌 어떤 값이 존재하기는 하지만 어떤 값인지를 알아낼 수 없는 것을 의미한다.
--NULL은 연산, 할당, 비교가 불가능하다. <예> 100 + NULL = NULL
--9-1. <예> (커미션을 받지 않는 사원에 대한 검색)
SELECT employee_id, first_name, commission_pct, job_id
FROM employees
WHERE commission_pct = NULL; --NULL이 저장되어 있는 경우에는 = 연산자로 판단할 수 없다.
--9_2. IS NULL과 IS NOT NULL, 특정 칼럼 값인지를 비교할 경우에는 비교연산자(=)를 사용하지 않고
-- IS NULL 연산자를 NULL 값이 아닌지를 알아보려면 비교연산자(<>)를 사용하지 않고 IS NOT NULL
-- 연산자를 사용한다. <예> (커미션을 받지 않는 사원)
SELECT employee_id, first_name, commission_pct, job_id
FROM employees
WHERE commission_pct IS NULL;
--9_2. <예> (커미션을 받는 사원)
SELECT employee_id, first_name, commission_pct, job_id
FROM employees
WHERE commission_pct IS NOT NULL;
--9_2. 문제 (자신의 직속상관이 없는 직원의 전체 이름과 직원번호, 업무ID를 출력하라
SELECT first_name || ' ' || last_name, employee_id,job_id
FROM employees
WHERE manager_id IS NULL;
--10_1. 정렬을 위한 ORDER BY절, ORDER BY 절은 로우(행)를 정렬하는데 사용하며 쿼리문 맨 뒤에 기술해야함.
--오름차순 정렬을 위한 ASC, <예> 사번을 기준으로 오름차순으로 정렬
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id ASC;
--또는 ORDER BY employee_id; --default가 ASC 인가봄  
--10_2. 내림차순 정렬을 위한 DESC <예> 사원번호를 기준으로 내림차순으로 정렬
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id DESC;
--10_2. 문제 (직원번호, 이름, 급여, 부서번호를 급여가 높은 순으로 출력하라.)
SELECT employee_id, first_name, salary, department_id
FROM employees
ORDER BY salary DESC;
--10_2. 문제 (입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라.)
SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date DESC;

---------예제221027-----------------------------------------------
--[문제 1] EMPLOYEES 테이블에서 급여가 3000이상인 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력하라.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary>=3000;
--[문제 2] EMPLOYEES 테이블에서 담당 업무가 ST_MAN인 사원의 정보를 사원번호, 이름, 담당업무, 급여, 부서번호를 출력하라.
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE job_id = 'ST_MAN';
--[문제 3] EMPLOYEES 테이블에서 입사일자가 2006년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 이름, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
SELECT employee_id, first_name, salary, hire_date, department_id
FROM employees
WHERE hire_date > '2006.01.01';
-- [문제 4] EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 이름, 담당업무, 급여, 부서번호를 출력하라.
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE salary BETWEEN 3000 AND 5000;
-- [문제 5] EMPLOYEES 테이블에서 입사일자가 05년도에 입사한 사원의 정보를 사원번호, 이름, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date BETWEEN '2005.01.01' AND '2005.12.31';
--[문제 6] 사원정보(EMPLOYEES) 테이블에서 사원번호, 이름, 급여, 업무번호, 입사일, 상사의 사원번호를 출력하시오. 이때 이름은 성과 이름을 연결하여 Name이라는 별칭으로 출력하시오
SELECT employee_id, first_name || ' ' || last_name AS Name, salary, phone_number, hire_date, manager_id
FROM employees;
-- [문제 7] 사원정보(EMPLOYEES) 테이블에서 사원의 성과 이름은 Name, 업무번호는 Job, 급여는 Salary, 연봉에 $100 보너스를 추가하여 계산한 값은 Increased Ann_Salary, 급여에 $100 보너스를 추가하여 계산한 연봉은 Increased Salary라는 별칭으로 출력하시오.
SELECT first_name || ' ' || last_name AS Name, phone_number AS Job, salary As Salary, (salary*12)+100 AS "Increased Ann_Salary", salary+100 AS "Increased Salary"
FROM employees;
-- [문제 8] 사원정보(EMPLOYEES) 테이블에서 모든 사원의 이름(FIRST_NAME)과 연봉을 “이름: 1 Year Salary = $연봉” 형식으로 출력하고, 1 Year Salary라는 별칭을 붙여 출력하시오.
-- (예시) King: 1 Year Salary = $288000
SELECT first_name || ': 1 Year Salary = $' || salary AS "1 Year Salary "
FROM employees;
--[문제 9] 부서별로 담당하는 업무ID를 한 번씩만 출력하시오
SELECT DISTINCT job_id
FROM employees;
--
--[문제 10] 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 사원정보(EMPLOYEES) 테이블에서 급여가
-- $7,000~$10,000범위 이외인 사람의 성과 이름(Name으로 별칭) 및 급여를 급여가 작은 순서로 출력하시오.
SELECT first_name || ' ' || last_name AS Name, salary
FROM employees
WHERE salary BETWEEN 7000 AND 10000
ORDER BY 2 ASC;
---------수업Day2(22.10.28)----------------------------------------------------------------------------------------------
---------강사님 제출문제221028----------------------------------------------------------------------------------------------
--3. 직원번호, 이름, 급여, 부서번호를 급여가 높은 순으로 출력하라.
-- 단, 급여가 같은 직원일 때 사번이 더 높은 사람이 먼저 오게 출력하라.
SELECT employee_id 사번, first_name || ' ' || last_name 이름, salary 급여, department_id 부서번호
FROM employees
ORDER BY salary DESC, employee_id DESC; --이렇게 조건을 더 걸어줄 수 있음. 앞에 있는 게 첫번째 정렬의 근거> 두번째 정렬> .. 순차적 정렬됨

--4. 입사일이 가장 최근인 직원순으로 사번, 이름, 입사일을 출력하라
SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date DESC;
--
select employee_id 사번, first_name|| ' '|| last_name 이름, hire_date 입사일
from employees
order by 3 desc, 1 desc ; --순번으로도 출력 가능

--5. 부서번호가 20,50번 부서에서 근무하는 모든 사원들의 이름(first_name), 부서번호, 급여를 알파벳 순으로 출력하라
SELECT first_name, department_id, salary
FROM employees
WHERE department_id IN(20,50)
ORDER BY first_name ASC;
--
select first_name, department_id, salary
from employees
where department_id in(20,50)
order by 1 asc; --문자: asc(사전 순서로 정렬), desc(사전 반대 순서로 정렬)

---------테이블 문제221028----------------------------------------------------------------------------------------------
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
-------------------Table 예제221028-------------------------------------------------------
--1.
CREATE TABLE MEMBER(
    ID VARCHAR2(20) NOT NULL PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    REGNO VARCHAR2(8) NOT NULL,
    HP VARCHAR2(13),
    ADDRESS VARCHAR2(100)
);
SELECT * FROM MEMBER; -- MEMBER table 데이터 조회
DESC MEMBER; -- MEMBER table 조회
SELECT * FROM TAB; --PDB_HR 에 생성된 table 조회
--2.
CREATE TABLE BOOK(
    CODE NUMBER(4) NOT NULL PRIMARY KEY,
    TITLE VARCHAR2(50) NOT NULL,
    COUNT NUMBER(6),
    PRICE NUMBER(10),
    PUBLISH VARCHAR2(50)
);
SELECT * FROM BOOK;
DESC BOOK;
SELECT * FROM TAB;
--3.
CREATE TABLE BOOK_ORDER(
    NO VARCHAR2(10) NOT NULL PRIMARY KEY,
    ID VARCHAR2(20) NOT NULL,
    CODE NUMBER(4) NOT NULL,
    COUNT NUMBER(6),
    OR_DATE DATE
);
SELECT * FROM BOOK_ORDER;
DESC BOOK_ORDER;
SELECT * FROM TAB;
---------select 문제221028----------------------------------------------------------------------------------------------
--1-1. DUAL 테이블과 SQL 함수 분류
-- 함수를 배우기 전에 한 행으로 결과를 출력하기 위한 테이블인 DUAL 테이블
SELECT 24*60*60
FROM departments;
--
SELECT 24*60*60
FROM DUAL; --FROM은 꼭 필요하지만 연산 시 table이 필요없으므로 이럴 때 쓰는 게 DUAL인가 봄.
-- DUAL 테이블은 산술 연산이나 가상 칼럼 등의 값을 한번만 출력하고 싶을 때 많이 사용하는
-- 아주 유용한 테이블로서 DUMMY라는 한 개 의 칼럼으로 구성되어 있다.
DESC DUAL;
--
SELECT*
FROM dual;
--1-2. 단일 행 함수와 그룹함수로 SQL 함수로 분류
-- 함수를 이용하여 복잡한 질의를 간결하게 표현할 수 있다.
--<예> 30번 부서 소속 사원의 급여를 출력하는 쿼리문
SELECT department_id, salary
FROM employees
WHERE department_id = 30;
--<예> 그룹함수를 이용해서 30번 부서 소속 사원의 총 급여를 구하는 쿼리문

---------수업Day3(22.10.31)----------------------------------------------------------------------------------------------
---------DB수업자료/[오라클] 무결성 제약 조건----------------------------------------------------------------------------------------------
-- 1. NOT NULL 제약조건
CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DEPTNO NUMBER(4)
);
--
INSERT INTO EMP01
VALUES(NULL,NULL,'SALESMAN',30);
--
SELECT * FROM EMP01;
--NOT NULL 구문
DROP TABLE EMP01 PURGE; -- emp01 삭제
CREATE TABLE EMP01(
    EMPNO NUMBER(4) NOT NULL,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(4)
);
--
--INSERT INTO emp01
--VALUES(null,null,'salesman',30); -- not null로 생성하였기 때문에 null값 비허용
--
INSERT INTO EMP01
VALUES(7499,'allen','salesman',30);
--
SELECT*FROM EMP01;
-- 2. UNIQUE 제약조건 /이란 특정 칼럼에 대해 자료가 중복되지 않게 하는 것이다.
DROP TABLE EMP02;
CREATE TABLE EMP02(
    EMPNO NUMBER(4) UNIQUE,
    ename VARCHAR(10) NOT NULL,
    job VARCHAR2(9),
    deptno NUMBER(4)
);
--
INSERT INTO EMP02(empno, ename, job, deptno)
VALUES(7499, 'allen', 'salesman', 30);
--
--INSERT INTO emp02(empno, ename, job, deptno)
--VALUES(7499, 'allen', 'salesman', 30);
--7499는 UNIQUE로 생성되었기 때문에 무결성 제약 조건에 위배됩니다. 라는 오류가 발생한다.
INSERT INTO EMP02(empno, ename, job, deptno)
VALUES(NULL, 'jones', 'manager', 20);
--
INSERT INTO EMP02(empno, ename, job, deptno)
VALUES(NULL, 'jones', 'salesman', 10); -- null은 무결성 제약 조건에 위배되지 않는다.
SELECT * FROM EMP02;
--3. 데이터 딕셔너리 / 데이터베이스 자원을 효율적으로 관리하기 위한 다양한 정보를 저장하는 시스템 테이블을
-- 데이터 딕셔너리라고 한다.
SELECT table_name FROM user_tables
ORDER BY table_name DESC; --HR 사용자가 생성한 테이블의 이름을 조회한다.
--4. 제약조건 확인하기
SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name = 'EMP02';
--
SELECT owner, constraint_name, table_name, column_name FROM user_cons_columns
WHERE table_name = 'EMP02';
--5. 데이터의 구분을 위한 PRIMARY KEY 제약조건
DROP TABLE EMP03;
CREATE TABLE EMP03(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    job VARCHAR(9),
    petino NUMBER(4)
);
--
INSERT INTO EMP03
VALUES(7499,'allen','salesman',30);
--
SELECT * FROM EMP03;
--
--INSERT INTO EMP03
--VALUES(7499,'jones','manager',20); --무결성 제약 조건 위배
--
--INSERT INTO EMP03
--VALUES(null,'jones','manager',20); -- null 값 삽입 불가
SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name = 'EMP03';
--6. 참조 무결성을 위한 FOREIGN KEY 제약 조건
CREATE TABLE DEPT01(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(14) NOT NULL,
    LOC VARCHAR2(13)
);
INSERT INTO DEPT01 (DEPTNO,DNAME,LOC)VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT01 (DEPTNO,DNAME,LOC)VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT01 (DEPTNO,DNAME,LOC)VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT01 (DEPTNO,DNAME,LOC)VALUES(40,'OPERATIONS','BOSTON');
-- 외래 키 제약 조건에 지정하지 않은 EMP03테이블에 부서 테이블에 존재하지 않은 50번 부서번호 저장
INSERT INTO EMP03
VALUES(7566,'JONES','MANAGER',50);
SELECT * FROM EMP03;
SELECT * FROM DEPT01;
--외래키 설정
CREATE TABLE EMP04(
    EMPNO NUMBER(2) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO)
);
ALTER TABLE EMP04 MODIFY EMPNO NUMBER(4);--내가 EMPNO NUMBER4를 2로 오타쳐서 수정해야됐음
--
INSERT INTO EMP04
VALUES(7499,'ALLEN','SALESMAN',30);
SELECT*FROM EMP04;
--
INSERT INTO EMP04
VALUES(7566,'JONES','MANAGER',50); --50일 때에는 50번이 존재하지 않기 때문에 사원정보가 추가 안되고 오류 발생
INSERT INTO EMP04
VALUES(7566,'JONES','MANAGER',30);
--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP04';
--7. CHECK 제약 조건 / 입력되는 값을 체크하여 설정된 값 이외의 값이 들어오면 오류 메시지와 함께
-- 명령이 수행되지 못하게 되는 것 이다.
CREATE TABLE EMP05(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    GENDER VARCHAR2(1) CHECK (GENDER IN('M','F'))
);
--
INSERT INTO EMP05(EMPNO, ENAME,GENDER)
VALUES(7566, 'JONES', 'M');
SELECT * FROM EMP05;
--
--INSERT INTO EMP05(EMPNO, ENAME, GENDER) VALUES(7566,'JONES','A');
--체크 제약조건에 위배되었습니다. 오류 발생
DROP TABLE EMP06 PURGE; -- emp06 삭제
--5-2. 제약 조건명 지정하기
CREATE TABLE EMP06(
    EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
    JOB VARCHAR2(9) CONSTRAINT EMP06_JOB_UK UNIQUE,
    DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT01(DEPTNO)
);
--
INSERT INTO EMP06
VALUES(7499,'ALLEN','SALESMAN',30);
SELECT*FROM EMP06;
SELECT*FROM DEPT01;
--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP06';
--
INSERT INTO EMP06 VALUES(7499,'ALLEN','SALESMAN',30);
--위에서 같은 문장을 선언했는데 기본키 값인7499가 중복허용이 안되고 고유키인 SALESMAN도 중복허용 안됨.
SELECT * FROM DEPT01;
INSERT INTO EMP06 VALUES(7499,NULL,'SALESMAN',50);
--ENAME열은 NOT NULL 제약사항이 걸려있다.
INSERT INTO EMP06 VALUES(7499,'ALLEN','SALESMAN',50);
--부모 키인 DEPT에 50은 없다. 얘가 참조 열이기 때문에 범위에 포함 되어야함
INSERT INTO EMP06 VALUES(7500,'ALLEN','SALESMAN',50);
INSERT INTO EMP06 VALUES(7500,'ALLEN','MANAGER',50);
--50만 범위에 들어오면 OK
--내 TEST
CREATE TABLE JB01(
    EMPNO NUMBER(4) CONSTRAINT JB01_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT JB01_ENAME_NN NOT NULL,
    JOB VARCHAR2(9) CONSTRAINT JB01_JOB_UK UNIQUE,
    EYE NUMBER(1) CONSTRAINT JB01_EYE_UK UNIQUE,
    --NOSE NUMBER(1) CONSTRAINT JB01_NOSE_UK PRIMARY KEY, -- 하나의 기본키만 가질 수 있으므로 오류
    DEPTNO NUMBER(2) CONSTRAINT JB01_DEPTNO_FK REFERENCES DEPT01(DEPTNO)
);
--3.테이블 레벨 정의 방식의 기본 형식
--컬럼 레벨로 제약 조건을 지정하는 방식
CREATE TABLE EMP07(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) UNIQUE,
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO)
);
--테이블 레벨로 제약 조건을 지정하는 방식
CREATE TABLE EMP08(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2),
    PRIMARY KEY(EMPNO),
    UNIQUE(JOB),
    FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO)
);
--제약 조건 확인
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP08';
--4.제약조건 변경하기
CREATE TABLE EMP09(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DEPTNO NUMBER(4)
);
--제약 조건 변경하기
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP09';
-- EMP09 테이블의 EMPNO 칼럼에 기본키를 설정하고 DEPTNO 칼럼에 외래키를 설정한다.
ALTER TABLE EMP09
ADD PRIMARY KEY(EMPNO);
--
ALTER TABLE EMP09
ADD CONSTRAINT EMP09_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO);
--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP09';
--제약 조건 제거하기
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP06';
--
SELECT * FROM EMP06;
--INSERT INTO EMP06
--VALUES(7499,'ALLEN','MANAGER',50);
--
ALTER TABLE EMP06
DROP CONSTRAINT EMP06_EMPNO_PK;
--
ALTER TABLE EMP06
DROP CONSTRAINT EMP06_DEPTNO_FK;
--5.외래키가 설정된 데이터 삭제
CREATE TABLE DEPT02(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13),
    CONSTRAINT DEPT02_DEPTNO_PK PRIMARY KEY(DEPTNO)
);
--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT02';
--
INSERT INTO DEPT02 VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT02 VALUES(20,'RESEARCH', 'DALLAS');

SELECT * FROM DEPT02;

DROP TABLE EMP02;

CREATE TABLE EMP02(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2),
    CONSTRAINT EMP02_EMPNO_PK PRIMARY KEY(EMPNO),
    CONSTRAINT EMP02_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT02(DEPTNO)
);
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP02';
--
INSERT INTO EMP02 VALUES(7499,'ALLEN','SALESMAN',10);
INSERT INTO EMP02 VALUES(7369,'SMITH','CLERK',20);
SELECT * FROM EMP02;
--
--DELETE FROM DEPT02 WHERE DEPTNO=10; 자식 레코드 발견
---------수업Day3(22.11.01)-----------------------------------------------
--컬럼 레벨
DROP TABLE TREATMENT;
DROP TABLE DOCTOR;
CREATE TABLE TREATMENT(
    T_NO NUMBER(4) NOT NULL PRIMARY KEY,
    T_COURSE_ABBR VARCHAR2(3) NOT NULL UNIQUE,
    T_COURSE VARCHAR2(30) NOT NULL,
    T_TEL VARCHAR2(15) NOT NULL
);
SELECT * FROM TREATMENT;
-- 테이블 레벨
DROP TABLE TREATMENT;
CREATE TABLE TREATMENT(
    T_NO NUMBER(4) NOT NULL,
    T_COURSE_ABBR VARCHAR2(3) NOT NULL,
    T_COURSE VARCHAR2(30) NOT NULL,
    T_TEL VARCHAR2(15) NOT NULL,
    CONSTRAINT TREATMENT_T_NO_PK PRIMARY KEY(T_NO),--PRIMARY KEY(T_NO),
    CONSTRAINT TREATMENT_T_COURSE_ABBR_UK UNIQUE(T_COURSE_ABBR)--UNIQUE T_COURSE_ABBR
);
INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1001, 'NS', '신경외과', '02-3452-1009');
INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1002, 'OS', '정형외과', '02-3452-2009');
INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1003, 'C', '순환기내과', '02-3452-3009');

SELECT * FROM TREATMENT;

CREATE TABLE DOCTOR(
    D_NO NUMBER(4) NOT NULL,
    D_NAME VARCHAR2(20) NOT NULL,
    D_SSN CHAR(14) NOT NULL,
    D_EMAIL VARCHAR2(80) NOT NULL,
    D_MAJOR VARCHAR2(50) NOT NULL,
    T_NO NUMBER(4),
    CONSTRAINT DOCTOR_D_NO_PK PRIMARY KEY(D_NO)
);
ALTER TABLE DOCTOR
ADD CONSTRAINT DOCTOR_T_NO FOREIGN KEY(T_NO) REFERENCES TREATMENT(T_NO)
ON DELETE CASCADE;

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN, D_EMAIL, D_MAJOR, T_NO)
VALUES(1,'홍길동','660606-1234561','javauser@naver.com','척추신경외과',1001);
INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN, D_EMAIL, D_MAJOR, T_NO)
VALUES(2,'이재환','690724-1674536','jaehwan@naver.com','뇌졸중,뇌혈관외과',1003);
INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN, D_EMAIL, D_MAJOR, T_NO)
VALUES(3,'양익환','700129-1328962','sheep1209@naver.com','인공관절,관절염',1002);
INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN, D_EMAIL, D_MAJOR, T_NO)
VALUES(4,'김승현','720901-1348940','seunghyeon@naver.com','종양외과,외상전문',1002);

DELETE FROM TREATMENT WHERE T_NO = 1002;
SELECT * FROM TREATMENT;
SELECT * FROM DOCTOR;

ROLLBACK;
ALTER TABLE DOCTOR
DROP CONSTRAINT DOCTOR_T_NO;

ALTER TABLE DOCTOR
ADD CONSTRAINT DOCTOR_T_NO FOREIGN KEY(T_NO) REFERENCES TREATMENT(T_NO)
ON DELETE SET NULL;

DELETE FROM TREATMENT WHERE T_NO = 1002;
SELECT * FROM TREATEMENT;
SELECT * FROM DOCTOR;
