--2022-11-01
--[오라클] 그룹함수 관련 예제
--1. EMPLOYEES 테이블에서 부서 인원이 5명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하라.
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID), SUM(SALARY) SUM_SALARY
FROM EMPLOYEES
HAVING COUNT(DEPARTMENT_ID) > 5
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--3번, 5번, 7번
--3. EMPLOYEES 테이블에서 부서번호가 10인 사원수부터 붓번호가 50인 사원수까지를 각각 출력하라.
SELECT 
    COUNT(CASE WHEN department_id =10 THEN employee_id END)  "10번부서인원수",
    COUNT(CASE WHEN department_id =20 THEN 1 END)  "20번부서인원수",
    --원래 열의 값은 THEN 오른쪽의 값이다. 하지만 CASE WHEN을 COUNT 내부에 사용할 때
    --THEN 이후에 값은 별칭일뿐 의미가 없다. 즉 COUNT로 감싼 값이 열의 값이 된다.
    COUNT(CASE WHEN department_id =30 THEN employee_id END)  "30번부서인원수",
    COUNT(CASE WHEN department_id =40 THEN employee_id END)  "40번부서인원수",
    COUNT(CASE WHEN department_id =50 THEN employee_id END)  "50번부서인원수"
FROM employees;

--5. EMPLOYEES 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.
SELECT TO_CHAR(hire_date, 'YYYY') H_YEAR, COUNT(*) 사원수, MIN(salary) 최소급여, MAX(salary) 최대급여,
        ROUND(AVG(salary),2) "급여의 평균", SUM(salary) "급여의 합"
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY TO_CHAR(hire_date, 'YYYY');

-- 6. 각 부서 별 평균 급여가 10000 이상이면 초과, 그렇지 않으면 미만을 출력하라. 단 부서번호가 없는 사원은 제외한다.
SELECT * FROM employees;
SELECT department_id 부서번호, ROUND(AVG(salary)) 부서별평균급여,
    CASE WHEN ROUND(AVG(salary)) >= 10000 THEN '초과'
        ELSE '미만'
        END 평균급여
FROM employees
GROUP BY department_id
HAVING department_id IS NOT NULL
ORDER BY department_id;
-- 7. EMPLOYEES 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.
SELECT COUNT(TO_CHAR(hire_date, 'YYYY')) TOTAL,
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2001' THEN 1 END) "2001년도",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2002' THEN 1 END) "2002년도",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2003' THEN 1 END) "2003년도",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2004' THEN 1 END) "2004년도",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2005' THEN 1 END) "2005년도",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2006' THEN 1 END) "2006년도",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2007' THEN 1 END) "2007년도",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2008' THEN 1 END) "2008년도"
FROM employees;
-- 3번 7번 부가설명
-- COUNT, SUM, MAX 등은 그룹 함수라고 불린다. 기존에 나는 그룹 함수가 쓰였을 시 필수적으로 GROUP BY문을
-- 사용해야 한다고 생각했으나 그룹 함수의 칼럼으로만 이루어졌을 경우 사용할 필요가 없다. 
--요약
-- 이유 1. 현재 문제에서는 칼럼 중 그룹 지어 출력할 칼럼이 없다.(TOTAL 칼럼 또한 그룹 함수 칼럼이기 때문)
-- 그러므로 그룹 함수의 칼럼만 존재한다.
-- 이유 2. 그룹 함수 칼럼과 일반 칼럼이 한 개라도 존재할 경우 그룹 함수를 사용해야 한다.

select sysdate from dual;
--TO_CHAR, TO_DATE 연습
select TO_DATE('2018.12.28','YY.MM.DD') 수강
from dual;

DROP TABLE TEST1;
CREATE TABLE TEST1(
    date_test DATE
);
INSERT INTO TEST1
VALUES('18.12.28');
SELECT * FROM TEST1;

select to_char('18/12/28','YYYYMMDD')수강
from dual;

SELECT TO_CHAR(TO_DATE('2018.12.28','YY.MM.DD'),'YYYYMMDD')
from DUAL;
SELECT TO_CHAR(TO_DATE('2018.12.28','YY.MM.DD'),'YYYY-MM-DD')
from DUAL;
SELECT TO_CHAR(TO_DATE('20/10/13','YY/MM/DD'),'YYYY"-"MM"-"DD')
FROM DUAL;

    