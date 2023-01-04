---------수업Day2(22.10.28)----------------------------------------------------------------------------------------------
---------강사님 제출문제221028----------------------------------------------------------------------------------------------
--SELECT문
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