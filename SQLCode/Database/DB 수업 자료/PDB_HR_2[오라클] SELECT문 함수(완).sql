--2022-11-03
--[오라클]SELECT문 함수
--1. DULAL 테이블과 SQL 함수 분류
--① DAUL 테이블
--<예> DEPARTMENTS 테이블로 1일을 초로 환산하는 산술 계산식을 작성하면 다음과 같다.
SELECT 24*60*60
FROM DEPARTMENTS;
--
SELECT 24*60*60
FROM DUAL;
--
DESC DUAL;
--
SELECT*FROM DUAL;
-- 함수를 사용하여 결과를 확인하고 싶을 때 SELECT 컬럼 FROM DUAL;을 사용하면 된다.
--② 단일 행 함수와 그룹함수로 SQL 함수 분류
-- 함수를 이용하여 복잡한 질의를 간결하게 표현할 수 있다.
--<예> 30번 부서 소속 사원의 급여를 출력하는 쿼리문
SELECT DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--<예> 그룹함수를 이용해서 30번 부서 소속 사원의 총 급여를 구하는 쿼리문
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID = 30;
--2) 문자함수 / 문자형의 값을 조작하여 변환된 문자 값을 반환한다.
--① 소문자로 변환하는 LOWER 함수: 입력한 문자 값을 소문자로 변환하는 함수.
SELECT 'DataBase', LOWER('DastaBase')
FROM DUAL;
--<예> 사원 테이블에서 부서번호가 20번인 사원명을 모두 소문자로 변환
SELECT FIRST_NAME, LOWER(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;
--② 대문자로 변환하는 UPPER 함수
SELECT 'DataBase', UPPER('DataBase')
FROM DUAL;
--<예> job_id 가 'it_prog'인 사원을 검색
SELECT EMPLOYEE_ID, FIRST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

SELECT EMPLOYEE_ID, FIRST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = UPPER('it_prog');

SELECT EMPLOYEE_ID, FIRST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE LOWER(JOB_ID) = 'it_prog';
--③ 첫 글자만 대문자로 나머지는 소문자로 변환하는 INITCAP 함수
SELECT INITCAP('DATA BASE PROGRAM')
FROM DUAL;
--<예> 사원 테이블의 30번 부서에 소속된 사원이름의 첫 글자만 대문자로
SELECT EMPLOYEE_ID, FIRST_NAME, INITCAP(EMAIL)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--<문제> 'jking'이란 이메일을 갖은 직원의 이름과 급여와 커미션을 출력하라. (INITCAP, UPPER 사용)
SELECT FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE EMAIL = UPPER('jking');
--④ 두 문자를 연결하는 CONCAT 함수
SELECT CONCAT('Data','Base')
FROM DUAL;
--
SELECT CONCAT(FIRST_NAME, '($' || SALARY || ')') AS "사원 정보"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--⑤ 문자 길이를 구하는 LENGTH/LENGTHB 함수
--문자 상수나, 칼럼에 저장된 데이터 값이 몇 개의 문자로 구성되었는지 길이를 알려주는 함수
SELECT LENGTH('DataBase'), LENGTH('데이터베이스')
FROM DUAL;
--메모리에 차지하는 바이트 수를 구한다.
SELECT LENGTHB('DataBase'), LENGTHB('데이터베이스')
FROM DUAL;
--<예> 20번 부서 소속 사원들의 이름의 길이를 출력하기
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;
--<예> 직원 중 이름이 4글자인 직원의 이름을 소문자로 출력
SELECT DEPARTMENT_ID, EMPLOYEE_ID, LOWER(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 4;
--<문제> 이름이 6글자 이상인 직원의 직원번호과 이름과 급여를 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 6;
--⑥ 문자열 일부만 추출하는 SUBSTR/SUBSTRB 함수
SELECT SUBSTR('DataBase', 1, 3)
FROM DUAL;
--<예> 20번 부서 사원들 중의 입사 년도 알아내기
SELECT FIRST_NAME, HIRE_DATE, SUBSTR(HIRE_DATE,1,2)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;
--<문제> 03년도에 입사한 사원 알아내기(비교 연산자와 AND연산자, BETWEEN AND연산자, SUBSTR함수)
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE,1,2) = '03';
SELECT * FROM EMPLOYEES;
--<문제> 이름이 k로 끝나는 직원을 검색
--LIKE연산자와 와일드 카드 (%) SUBSTR함수
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%k';
--⑦ 특정 문자의 위치를 구하는 INSTR/INSTRB 함수
--대상 문자열이나 칼럼에서 특정 문자가 나타나는 위치를 알려준다.
--<예> 30번 부서 소속 사원이름에 e 자가 어디에 위치하는지 알려주는 쿼리문
SELECT DEPARTMENT_ID, FIRST_NAME, INSTR(FIRST_NAME,'e')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--⑧ 특정 기호로 채우는 LPAD/RPAD 함수
SELECT LPAD('DataBase',10,'$') FROM DUAL;
SELECT RPAD('DataBase',12,'@') FROM DUAL;
--⑨ 특정 문자를 잘라내는 TRIM 함수
SELECT TRIM('a' FROM 'aaaaDataBase programingaaaa') FROM DUAL;
--<예> Lisa란 사람의 이름에서 L와 a를 잘라내자.
SELECT FIRST_NAME, TRIM('L' FROM FIRST_NAME), TRIM('a' FROM FIRST_NAME)
FROM EMPLOYEES
WHERE LOWER(FIRST_NAME) = 'lisa';
--3) 숫자함수
--① ABS 함수/ CEIL 함수/ FLOOR 함수
SELECT ABS(-15) FROM DUAL;
-- CEIL(n) 함수는 소수점 아래를 올린다. FLOOR(n) 함수 소수점 아래를 잘라낸다.
SELECT CEIL(10.123), FLOOR(34.5678) FROM DUAL;
--② 특정 자릿수에서 반올림하는 ROUND 함수
SELECT ROUND(12.345,2), ROUND(34.567,0), ROUND(56.789), ROUND(78.901,-1) FROM DUAL;
--③ 특정 자릿수에서 잘라내는 TRUNC 함수
SELECT TRUNC(12.345,2), TRUNC(34.567,0), TRUNC(56.789), TRUNC(78.901,-1) FROM DUAL;
--④ 나머지 값을 반환하는 MOD 함수
SELECT MOD(34,2), MOD(34,5), MOD(34,7) FROM DUAL;
--<문제> 직원 번호가 짝수인 직원들의 직원번호와 이름과 직급을 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID,2) = 0;
--4)날짜함수
--① 현재 날짜를 반환하는 SYSDATE 
SELECT SYSDATE FROM DUAL;
--
SELECT SYSDATE -1 어제, SYSDATE 오늘, SYSDATE + 1 내일
FROM DUAL;
--② 두 날짜 사이 간격을 계산하는 MONTHS_BETWEEN 함수
--<예> 날짜 사이의 개월 수 구하기
SELECT FIRST_NAME, SYSDATE 오늘, TO_CHAR(HIRE_DATE,'YYYY/MM/DD')입사일,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) 근무달수
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--③ 개월 수를 더하는 ADD_MONTHS 함수
--<예> 입사일에서 3개월이 지난 날짜를 구하라.
SELECT FIRST_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE,3)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--④ 해당 요일의 가장 가까운 날짜를 반환하는 NEXT_DAY 함수
SELECT SYSDATE, NEXT_DAY(SYSDATE,'수요일')
FROM DUAL;
--
SELECT SYSDATE, NEXT_DAY(SYSDATE,'수'), NEXT_DAY(SYSDATE,4)
FROM DUAL;
--
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
--
SELECT SYSDATE, NEXT_DAY(SYSDATE,'WEDNESDAY') FROM DUAL;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'수요일')
FROM DUAL;
--⑤ 해당 달의 마지막 날짜를 반환하는 LAST_DAY함수
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;
--⑥ ROUND 함수의 다양한 적용
SELECT HIRE_DATE, ROUND(HIRE_DATE, 'MONTH')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--⑦ TRUNC 함수의 다양한 적용
SELECT HIRE_DATE, TRUNC(HIRE_DATE, 'MONTH')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--5) 변환함수
--① 문자형으로 변환하는 TO_CHAR 함수
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD'),TO_CHAR(SYSDATE,'DL') FROM DUAL;
--<예> 직원들의 입사일을 출력하되 요일까지 함께 출력하기
SELECT TO_CHAR(HIRE_DATE, 'YYYY/MM/DD DAY')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--
SELECT TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일" DAY')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

--
SELECT TO_CHAR(HIRE_DATE, 'YYYY/MON/DD DY')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD, HH24:MI:SS')
FROM DUAL;
--<예> 숫자출력
SELECT FIRST_NAME, SALARY, TO_CHAR(SALARY, '$999,999')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--
SELECT FIRST_NAME, SALARY, TO_CHAR(123456, '999,999,999')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--② 날짜형으로 변환하는 TO_DATE 함수
--<예> 2005년 12월 24일 입사한 직원을 검색
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = TO_DATE(20051224, 'YYYYMMDD');
--<예> 올해 며칠이 지났는지 날짜 계산
SELECT SYSDATE - '2015/12/24' FROM DUAL; --오류
--<예> 올해 며칠이 지났는지 날짜 계산 -- 오류 해결
SELECT TRUNC(SYSDATE - TO_DATE('2015/12/24','YYYY/MM/DD')) FROM DUAL;
--③ 숫자형으로 변환하는 TO_NUMBER 함수
--<예> 수치 형태의 문자 값의 차 구하기 -- 오류 발생
SELECT '10,000' + '20,000' FROM DUAL;
--<예> 수치 형태의 문자 값의 차 구하기 -- 오류 해결
SELECT TO_NUMBER('10,000','999,999') + TO_NUMBER('20,000','999,999') FROM DUAL;
--6)일반 함수
--①NULL을 다른 값으로 변환하는 NVL함수/NULL을 0 또는 다른 값으로 변환하기 위해서 사용하는 함수
SELECT FIRST_NAME, COMMISSION_PCT, JOB_ID
FROM EMPLOYEES
ORDER BY JOB_ID; --COMISSION_PCT는 현재 NULL값
--
SELECT FIRST_NAME, SALARY, NVL(COMMISSION_PCT, 0), JOB_ID
FROM EMPLOYEES
ORDER BY JOB_ID; -- COMMISSION_PCT의 NULL값을 0으로 대체했다.
-- <예> 급여에 커미션을 더한 금액 구하기
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*COMMISSION_PCT AS COMMISSION,
SALARY+(SALARY*COMMISSION_PCT) AS TOTAL, JOB_ID
FROM EMPLOYEES
ORDER BY JOB_ID; -- 다 null값으로 뜸
--
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*NVL(COMMISSION_PCT,0) AS COMMISSION,
SALARY+(SALARY*NVL(COMMISSION_PCT,0)) AS TOTAL, JOB_ID
FROM EMPLOYEES
ORDER BY JOB_ID; -- commission, total이 값이 나옴.
-- NVL2 함수 
--<예> 커미션이 NULL이 아니면 급여 + 커미션을, NULL이면 급여만 출력
SELECT FIRST_NAME, SALARY, COMMISSION_PCT,
NVL2(COMMISSION_PCT,SALARY+(SALARY * COMMISSION_PCT),SALARY)TOTAL_SAL
FROM EMPLOYEES;
--<문제>모든 직원은 자신의 상관(MANAGER_ID)이 있다. 하지만 EMPLOYEES 테이블에 
--유일하게 상관이 없는 로우가 있는데 그 사원의 MANAGER_ID 칼럼 값이 NULL이다.
--상관이 없는 대표이사만 출력하되 MANAGER_ID 칼럼 값 NULL 대신 CEO로 출력한다.
SELECT EMPLOYEE_ID, FIRST_NAME, NVL(TO_CHAR(MANAGER_ID),'CEO')
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;
--강사님한테만 있는 <문제> 커미션 정보가 없는 직원들도 있는데 커미션이 없는 직원 그룹은 
--'<커미션 없음>' 이 출력되게 한다.
SELECT NVL(TO_CHAR(COMMISSION_PCT), '<커미션없음>') AS COMMISSION
FROM EMPLOYEES;
--②선택을 위한 DECODE함수
--SWITCH CASE 문과 같이 여러 가지 경우에 대해서 선택할 수 있는 함수
--<예> 부서명 구하기
SELECT * FROM DEPARTMENTS;
--
SELECT DEPARTMENT_ID, DECODE(DEPARTMENT_ID, 10, 'Administration',
                                            20, 'Marketing',
                                            30,'Purchasing', 
                                            40, 'Human Resources', 
                                            50, 'Shipping',
                                            60,'IT') AS DEPARTMENTS
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
--③ 조건에 따라 서로 다른 처리가 가능한 CASE 함수
--<예> 부서명 구하기
SELECT FIRST_NAME, DEPARTMENT_ID,
    CASE WHEN DEPARTMENT_ID = 10 THEN 'Administration'
        WHEN DEPARTMENT_ID = 20 THEN 'Marketing'
        WHEN DEPARTMENT_ID=30 THEN 'Purchasing' 
        WHEN DEPARTMENT_ID=40 THEN 'Human Resources'
        WHEN DEPARTMENT_ID=50 THEN 'Shipping'
        WHEN DEPARTMENT_ID=60 THEN 'IT'
    END DEPARTMENT_NAME
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

SELECT FIRST_NAME, DEPARTMENT_ID,
    CASE DEPARTMENT_ID  WHEN 10 THEN 'Administration'
                        WHEN 20 THEN 'Marketing'
                        WHEN 30 THEN 'Purchasing' 
                        WHEN 40 THEN 'Human Resources'
                        WHEN 50 THEN 'Shipping'
                        WHEN 60 THEN 'IT'
    END DEPARTMENT_NAME
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
--<문제> 부서별에 따라 급여를 인상하도록 하자. (직원번호, 직원명, 직급, 급여)
--부서명이 'Marketing'인 직원은 5%, 'Purchasing'인 사원은 10%,
--'Human Resources'인 사원은 15%, 'IT'인 직원은 20%인 인상한다.
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, JOB_ID , SALARY,
        DECODE(DEPARTMENT_ID, 20, SALARY*1.05,
                            30, SALARY * 1.10,
                            40, SALARY * 1.15,
                            60, SALARY * 1.20, SALARY) UPSAL
FROM EMPLOYEES;
--부서명으로 조건 부여
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, JOB_ID, SALARY,
    CASE WHEN DEPARTMENT_NAME = 'Marketing' THEN SALARY*1.05
         WHEN DEPARTMENT_NAME = 'Purchasing' THEN SALARY*1.10
         WHEN DEPARTMENT_NAME = 'Human Resources' THEN SALARY*1.15
         WHEN DEPARTMENT_NAME = 'IT' THEN SALARY*1.20
            ELSE SALARY
    END UPSAL
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;
--④GREATEST 매개변수로 표현식을 명시하고 가장 큰값을 반환하는 함수, LEAST 반대
SELECT GREATEST(1,4,2,5,3,9) , LEAST(1,4,2,5,3,9)
FROM DUAL;
--
SELECT GREATEST('김희수','조현수','홍길동'), LEAST('김희수','조현수','홍길동')
FROM DUAL;