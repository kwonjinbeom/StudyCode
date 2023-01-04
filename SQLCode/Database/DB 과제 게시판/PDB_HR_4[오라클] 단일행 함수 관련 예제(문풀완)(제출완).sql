--[오라클] 단일행 함수 관련 예제
--문제1) 각 사원의 성(last_name)이 's'로 끝나는 사원의 이름(이름 성순으로)과 업무를 아래의 
--예와 같이 출력하고자 한다. 출력 시 성과 이름은 첫 글자가 대문자, 업무는 모두 소문자로 출력하고
--머리글은 Employee JOBs로 표시하시오.
SELECT INITCAP(first_name) || ' ' || INITCAP(last_name) || ' is a ' || LOWER(job_id) AS "Employee JOBs"
FROM employees
WHERE last_name LIKE '%s'
ORDER BY last_name;
--문제2) EMPLOYEES Table에서 이름, 급여, 커미션, 금액, 총액(급여 + 커미션)을 구하여 총액이 많은 순서로 출력하라.
--단, 커미션이 NULL인 사람은 제외한다.
SELECT first_name 이름, salary 급여, commission_pct 커미션, (salary+commission_pct) 총액 --금액(?), 
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 4 DESC;
--문제3)이번 분기에 60번 IT 부서에는 신규 프로그램을 개발하고 보급하여 회사에 공헌하였다. 이에 해당 부서의 사원
--급여를 12.3% 인상하기로 하였다. 60번 IT부서 사원의 급여를 12.3% 인상하여 정수만(반올림) 표시하는 보고서를 작성하시오.
--출력 형식은 사번, 이름과 성(Name으로 별칭), 급여, 인상된 급여(Increased Salary로 별칭)순으로 출력한다.
SELECT department_id, first_name || ' ' || last_name AS Name, salary, ROUND((salary + (salary * 0.123))) AS "Increased Salary"
FROM employees
WHERE department_id = 60;
--문제4) 급여가 $1,500부터 $3,000 사이의 사람은 급여의 15%를 회비로 지불하기로 하였다.
--이를 이름, 급여, 회비(소수점이하 반올림)를 출력하라.
SELECT first_name 이름, salary 급여,
    CASE WHEN (salary > 1500 AND salary < 3000) THEN ROUND(salary * 0.15)
        ELSE salary
        END 회비
FROM employees
ORDER BY salary;
--문제5) 모든 사원의 실수령액을 계산하여 출력하라. 단, 급여가 많은 순으로 이름, 급여, 실수령액을 출력하라.
--(실수령액은 급여에 대해 10%의 세금을 뺀 금액)
SELECT first_name 이름, salary 급여, salary - (salary * 0.1) 실수령액
FROM employees
ORDER BY salary DESC;
--문제6) 모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다.
--보고서에 사원의 성과 이름(Name으로 별칭), 급여, 수당여부에 따른 연봉을 포함하여 출력하시오.
--수당여부는 수당이 있으면 "Salary + Commission", 수당이 없으면 "Salary only"라고 표시하고,
--별칭은 적절히 붙인다. 또한 출력 시 연봉이 높은 순으로 정렬한다.

--방식1(DECODE 함수는 SQL에서 오라클에만 사용되는 문법이라 CASE WHEN을 되도록 사용하려고 한다.)
SELECT first_name || ' ' || last_name Name, salary 급여,
    CASE WHEN commission_pct IS NOT NULL THEN salary + (salary*commission_pct)ELSE salary END "수당여부에 따른 연봉",
    CASE WHEN commission_pct IS NOT NULL THEN 'Salary + Commission'ELSE 'Salary only' END 수당여부
FROM employees
ORDER BY salary DESC;

--방식2
SELECT first_name || ' ' || last_name Name, salary 급여,
    NVL2(commission_pct,salary + (salary*commission_pct),salary) "수당여부에 따른 연봉",
    NVL2(commission_pct,'Salary + Commission','Salary only') 수당여부
FROM employees
ORDER BY salary DESC;
