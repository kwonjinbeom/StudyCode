-- SELECT 함수
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID = 30;

CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    SAL NUMBER(7,2)
);
SELECT * FROM EMP01;

CREATE TABLE EMPLOYEES02
AS
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES02;

ALTER TABLE EMP01
ADD(JOB VARCHAR2(9));
DESC EMP01;

ALTER TABLE EMP01
MODIFY(JOB VARCHAR2(30));
DESC EMP01;

ALTER TABLE EMP01
DROP COLUMN JOB;

CREATE TABLE EMPLOYEES03
AS
SELECT * FROM EMPLOYEES02;

TRUNCATE TABLE EMPLOYEES03;
DESC EMPLOYEES03;
SELECT * FROM EMPLOYEES03;

CREATE TABLE DEPT(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

DESC DEPT;
SELECT * FROM DEPT;

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK'); -- 모든 열에 값을 대입하는 경우 DEPT후에 컬럼명을 명시하지 않아도 된다.(생략가능)
SELECT * FROM DEPT;

INSERT INTO DEPT(DEPTNO, DNAME)
VALUES(30 , 'SALES');

INSERT INTO DEPT
VALUES(40, 'OPERATIONS', NULL);

ALTER TABLE DEPT MODIFY (DEPTNO NUMBER(4), DNAME VARCHAR2(30));

CREATE TABLE EMP AS SELECT * FROM EMPLOYEES;
SELECT * FROM EMP;

UPDATE EMP SET DEPARTMENT_ID = 30;

UPDATE EMP SET SALARY = SALARY * 1.1;

DROP TABLE EMP;
CREATE TABLE EMP AS SELECT * FROM EMPLOYEES;

UPDATE EMP
SET DEPARTMENT_ID = 30
WHERE DEPARTMENT_ID = 10;

SELECT FIRST_NAME, MIN(SALARY) 
FROM EMPLOYEES
GROUP BY FIRST_NAME;

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 5000
ORDER BY DEPARTMENT_ID;

--
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;
--
SELECT department_id, null job_id, count(*), sum(salary) -- 부서별 급여의 합과 사원수
from employees
group by department_id;
--
SELECT null department_id, null job_id, count(*), sum(salary) -- 전체 사원의 급여의 합과 사원 수
from employees
order by department_id, job_id;

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;

select employee_id, first_name, department_id
from employees;

select department_id, department_name
from departments;

select first_name, department_name, e.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;

select first_name, department_name, e.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;

-- 서브쿼리
select department_id from employees
where first_name = 'Susan';

select department_name from departments
where department_id = 40;

select department_name
from departments
where department_id = (select department_id
                        from employees
                        where first_name ='Susan');
                        
select first_name, salary
from employees
where salary > (select avg(salary)
                from employees);
                
select avg(salary) from employees;

select first_name, salary
from employees
where salary > any(select salary
                from employees
                where department_id =110);
                
select salary
from employees
where department_id =110;