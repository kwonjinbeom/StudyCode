---------수업Day1(22.10.27)-----------------------------------------------
--[오라클] 기본 SELECT문
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