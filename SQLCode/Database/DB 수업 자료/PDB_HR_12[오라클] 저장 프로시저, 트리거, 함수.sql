









--3)FUNCTION이란? / 값을 반환하는 명명된 PL/SQL BLOCK으로 오라클 내장 함수와 같이 SQL 표현식의
--일부로 사용하여 복잡한 SQL문을 간단한 형태로 사용할 수 있다. 값을 반환하는 RETURN이 반드시 포함되며
--반드시 하나의 값을 반환한다.
--부서 번호를 부서 이름을 반환하는 함수를 생성하자.(첫번째 방법)
CREATE OR REPLACE FUNCTION GETDNAME(vdepartment_id IN departments.department_id%TYPE)
RETURN VARCHAR2
IS
    vdepartment_name departments.department_name%TYPE;
    vcount NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO vcount FROM DEPARTMENTS
    WHERE department_id = vdepartment_id;
     
    IF vcount = 0 THEN
        vdepartment_name := '해당 부서 없음';
    ELSE
        SELECT department_name INTO vdepartment_name FROM departments
        WHERE department_id = vdepartment_id;
    END IF;
    RETURN vdepartment_name;
END;
/

--
SELECT first_name, job_id, NVL(commission_pct, 0) commission_pct, salary,
GETDNAME(department_id) DNAME
FROM employees
WHERE first_name = 'Lisa';
--
SELECT GETDNAME(500) FROM DUAL;
-- 두번째 방법
CREATE OR REPLACE FUNCTION GETDNAME(vdepartment_id IN departments.department_id%TYPE)
RETURN VARCHAR2
IS
    vdepartment_name departments.department_name%TYPE;
BEGIN
    SELECT department_name INTO vdepartment_name FROM departments
    WHERE department_id = vdepartment_id;
    RETURN vdepartment_name;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        vdepartment_name := '해당 부서 없음';
RETURN vdepartment_name;
END;
/
--
SELECT employee_id, first_name, TO_CHAR(hire_date, 'YYYY-MM-DD') HIREDATE,
    GETDNAME(department_id) department_name
FROM employees;
--
SELECT GETDNAME(400) FROM DUAL;
--부서번호를 매개변수로 해당 부서의 평균 급여를 반환하는 함수를 생성하자.
CREATE OR REPLACE FUNCTION GETAVGDEPT(vdepartment_id IN departments.department_id%TYPE)
RETURN VARCHAR2
IS
    vavgsalary VARCHAR2(50);
BEGIN
    SELECT NVL(TO_CHAR(ROUND(AVG(salary)),'9999999'),'해당 부서 없음') into vavgsalary
    FROM employees
    WHERE department_id = vdepartment_id;
    RETURN vavgsalary;
END;
/
--사원번호를 조건으로 사원의 이름, 급여, 부서명 및 부서 평균 급여를 출력
SELECT first_name, salary, department_id, GETDNAME(department_id) department_name,
GETAVGDEPT(department_id) avgsalary
FROM employees
WHERE employee_id = 100;
--
SELECT first_name, salary, department_id, GETDNAME(department_id) department_name, 
GETAVGDEPT(department_id) avgsalary
FROM employees
WHERE employee_id = 178;