--2022-11-08
--[오라클] 서브 쿼리(Sub Query)
--1)서브 쿼리의 기본 개념
SELECT DEPARTMENT_ID FROM EMPLOYEES
WHERE FIRST_NAME = 'Susan';
--
SELECT DEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 40;
--서브 쿼리로 변경
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID =  (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Susan');
--EMPLOYEE 테이블에서 Lex와 같은 부서에 있는 모든 사원의 이름과 입사일자(형식: 2003-01-13)를 출력하는 SELECT문을 작성하시오.
SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Lex';
--
SELECT FIRST_NAME, TO_CHAR(HIRE_DATE,'YYYY-MM-DD')AS HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;
--서브 쿼리 작성
SELECT FIRST_NAME, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')AS HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Lex');
--<문제> EMPLOYEES 테이블에서 CEO에게 보고하는 직원의 모든 정보를 출력하는 SELECT 문을 작성하시오.
SELECT * 
FROM EMPLOYEES
WHERE MANAGER_ID = (SELECT MANAGER_ID
                    FROM EMPLOYEES
                    WHERE MANAGER_ID IS NOT NULL);
--2) 단일 행 서브 쿼리 / 단일 행 서브쿼리(single row)는 내부 SELECT 문장으로부터 오직 하나의 로우(행)
--만을 반환 받으며, 단일 행 비교 연산자를 사용한다.
--Guy와 같은 부서에서 근무하는 사원의 정보를 출력하는 예
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, NVL(COMMISSION_PCT,0)COMMISSION_PCT,
TO_CHAR(HIRE_DATE, 'YYYY.MM.DD')HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Guy');
--①서브 쿼리에서 그룹 함수의 사용
--서브 쿼리를 사용하여 평균 급여보다 더 많은 급여를 받는 사원을 검색하는 쿼리
SELECT AVG(SALARY)
FROM EMPLOYEES;
--
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES);
--3)다중 행 서브 쿼리 / 서브 쿼리에서 반환되는 결과가 하나 이상의 행일 때 사용하는 서브쿼리
--①IN 연산자 
--급여를 15000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원을 출력하라.
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT DISTINCT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE SALARY >= 15000)
ORDER BY DEPARTMENT_ID;
--이름에 "z"가 있는 직원이 근무하는 부서에서 근무하는 모든 직원에 대해 직원번호, 이름,급여 출력하는
--SELECT문을 작성. 단 부서번호순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME LIKE '%z%')
ORDER BY DEPARTMENT_ID;
--EMPLOYEES테이블에서 Susan 또는 Lex와 월급이 같은 직원의 이름, 업무, 급여를 출력하는 SELECT문을 작성
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY IN(SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME IN('Susan','Lex')) 
                AND FIRST_NAME NOT IN('Susan','Lex');
--EMPLOYEES 테이블에서 적어도 한 명 이상으로부터 보고를 받을 수 있는 직원의 직원번호, 이름, 업무,
--부서번호를 출력하는 SELECT문을 작성하시오.(다른 직원을 관리하는 직원)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN(SELECT DISTINCT MANAGER_ID
                    FROM EMPLOYEES);
--<문제> EMPLOYEES 테이블에서 Accounting 부서에서 근무하는 직원과 같은 업무를 하는 직원의 이름,
--업무명을 출력하는 SELECT 문을 작성하시오.
SELECT FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                FROM DEPARTMENTS
                WHERE DEPARTMENT_NAME = 'Accounting');
--②ALL연산 / 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참이다.
--30번 소속 직원들 중에서 급여를 가장 많이 받은 사원보다 더 많은 급여를 받은 사람의 이름, 급여
--를 출력하는 쿼리문 작성(30번 부서 직원 급여들 모두에 대해서 커야 하므로 최대값보다 큰 급여만)
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ALL(SELECT SALARY
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 30);
--③ANY연산자(찾아진 값에 대해서 하나라도 크면 참이 되는 셈이 된다.)
--부서 번호가 110번인 사원들의 급여 중 가장 작은 값(8300)보다 많은 급여를 받는 사원의 이름, 급여를 출력
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ANY(SELECT SALARY
                    FROM EMPLOYEES
                    WHERE DEPARTMENT_ID = 110);
--④EXISTS연산자 / 서브 쿼리문에서 주로 사용하며 서브 쿼리의 결과 값이 참이 나오기만 하면 바로 
-- 메인 쿼리의 결과 값을 리턴한다.
--4)서브 쿼리로 테이블 작성하기
--①서브 쿼리로 테이블 복사하기
DROP TABLE EMP01;
CREATE TABLE EMP01
AS
SELECT * FROM EMPLOYEES;
--
DROP TABLE EMP02;
CREATE TABLE EMP02
AS
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;
--②테이블의 구조만 복사하기
DROP TABLE EMP03;
CREATE TABLE EMP03
AS
SELECT *
FROM EMPLOYEES
WHERE 1=0;
SELECT * FROM EMP03;
--5)서브 쿼리를 이용한 데이터 추가
DROP TABLE DEPT02;

CREATE TABLE DEPT02
AS
SELECT *
FROM DEPARTMENTS
WHERE 1=0;

SELECT * FROM DEPT02;
INSERT INTO DEPT02
SELECT * FROM DEPARTMENTS;
--6) 서브 쿼리를 이용한 데이터 수정
UPDATE DEPT02
SET LOCATION_ID = (SELECT LOCATION_ID
                    FROM DEPARTMENTS
                    WHERE DEPARTMENT_ID = 40)
WHERE DEPARTMENT_ID = 10;
SELECT * FROM DEPT02;
--7) 서브 쿼리를 이용한 두 개 이상의 칼럼에 대한 값 변경
--20번 부서의 부서명과 지역명을 30번 부서의 부서명과 지역명으로 수정
UPDATE DEPT02
SET DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME
                        FROM DEPT02
                        WHERE DEPARTMENT_ID = 30),
    LOCATION_ID = (SELECT LOCATION_ID
                    FROM DEPT02
                    WHERE DEPARTMENT_ID = 30)
WHERE DEPARTMENT_ID = 20;
SELECT * FROM DEPT02;
--
UPDATE DEPT02
SET(DEPARTMENT_NAME, LOCATION_ID) = (SELECT DEPARTMENT_NAME, LOCATION_ID
                                    FROM DEPT02
                                    WHERE DEPARTMENT_ID = 30)
WHERE DEPARTMENT_ID = 20;
--8)서브 쿼리를 이용한 데이터 삭제
DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT *
FROM EMPLOYEES;
--
DELETE FROM EMP01
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Sales');
SELECT * FROM EMP01;