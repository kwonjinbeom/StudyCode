--6[오라클] 조인 관련 예제
--1. Sales 부서 소속 사원의 이름과 입사일을 출력하라.
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Sales');
--2. 커미션을 받는 사원의 이름, 커미션 비율과 그가 속한 부서명을 출력하라.
SELECT first_name, commission_pct, department_name
FROM employees E INNER JOIN departments D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE commission_pct is not null;
--3. IT부서에서 근무하고 있는 사원번호, 이름, 업무, 부서명을 출력하라.
SELECT employee_id, first_name, job_id, department_name
FROM employees e INNER JOIN departments d -- e, d 의 약어는 대소문자를 구별하지 않음
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE department_name = 'IT';
--4.EMPLOYEES, DEPARTMENTS 테이블의 구조를 파악한 후 사원수가 5명 이상인 부서의 부서명과
--사원수를 출력하시오. 이때 사원수가 많은 순으로 정렬하시오.
SELECT department_name, COUNT(e.department_id)
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name
HAVING COUNT(e.department_id) >= 5
ORDER BY 2 DESC;

SELECT * FROM employees ;
SELECT * FROM departments;