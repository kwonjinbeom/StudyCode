--2022.11.03
--[오라클] 그룹 함수
--<예> 직원의 총 급여 구하기(SUM 함수)
SELECT SUM(SALARY)
FROM EMPLOYEES;
SELECT TO_CHAR(SUM(SALARY), '$999,9999')AS TOTAL
FROM EMPLOYEES;
--<예> 직원의 평균 급여 구하기(AVG함수)
SELECT AVG(SALARY) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY),1) FROM EMPLOYEES;
--<예> 최근에 입사한 사원과 가장 오래전에 입사한 직원의 입사일 출력하기(MAX/MIN 함수)
SELECT TO_CHAR(MAX(HIRE_DATE), 'YYYY-MM-DD'), TO_CHAR(MIN(HIRE_DATE), 'YYYY-MM-DD')
FROM EMPLOYEES;
--<예> 전체 사원의 수와 커미션을 받는 사원의 수
SELECT COUNT(*), COUNT(COMMISSION_PCT)
FROM EMPLOYEES;
--<문제> JOB의 종류가 몇 개인지 즉, 중복되지 않은 직업의 개수를 구해보자
SELECT COUNT(DISTINCT JOB_ID)
FROM EMPLOYEES;
--GROUP BY 내가 그냥 활용해본거
SELECT COUNT(DISTINCT JOB_ID), JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID;
--※컬럼과 그룹 함수를 같이 사용할 때 유의할 점
--2. GROUP BY 절을 사용해 특정 조건으로 세부적인 그룹화하기
SELECT FIRST_NAME, MIN(SALARY) FROM EMPLOYEES; --오류 발생(단일 그룹의 그룹 함수가 아닙니다.)
--사원들을 부서번호를 기준으로
SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--<예> 부서별 최대 급여와 최소 급여 구하기
SELECT DEPARTMENT_ID, MAX(SALARY)"최대 급여", MIN(SALARY)"최소 급여"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
--
SELECT DEPARTMENT_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, SALARY DESC;
--
SELECT DEPARTMENT_ID, MAX(SALARY)"최대 급여", MIN(SALARY)"최소 급여"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--<예> 소속 부서별 급여의 합과 급여의 평균 구하기
SELECT DEPARTMENT_ID, SUM(SALARY) " 급여의 합", AVG(SALARY) "급여의 평균"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID,
        SUM(SALARY),
        FLOOR(AVG(SALARY)),
        ROUND(AVG(SALARY)),
        ROUND(AVG(SALARY),1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--<문제> 부서별로 직원의 수와 커미션을 받는 직원의 수를 카운트해 보자
SELECT DEPARTMENT_ID, COUNT(*) AS "직원의 수", COUNT(COMMISSION_PCT) AS "커미션을 받는 직원의 수"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
SELECT * FROM EMPLOYEES;
--<추가 질문> 급여가 8000이상인 사원들만 카운트 해 보자.
SELECT DEPARTMENT_ID, COUNT(*), COUNT(COMMISSION_PCT)
FROM EMPLOYEES
WHERE SALARY >= 8000
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--강사님이 주신 <문제> 30번 부서에 가장 오랜 기간 근무한 사원의 입사일을 출력하라.
SELECT MAX(HIRE_DATE), DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=30
GROUP BY DEPARTMENT_ID;
--강사님이 주신 <문제> 부서별 같은 업무를 담당하는 사원 수를 구하라.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID, JOB_ID;
--3)HAVING 조건
--SELECT 절에 조건을 사용하여 결과를 제한할 때는 WHERE절을 사용하지만, 그룹의 결과를
--제한할 떄는 HAVING절을 사용한다.
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 5000
ORDER BY DEPARTMENT_ID;
--
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 5000
ORDER BY DEPARTMENT_ID;
--강사님 <문제>부서별 급여의 평균을 구하여 그 평균이 5000이상인 부서만 조회하도록 쿼리문 작성.
SELECT DEPARTMENT_ID, FLOOR(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING FLOOR(AVG(SALARY)) >= 5000
ORDER BY DEPARTMENT_ID;
-- 부서별 인원수를 구하여 그 인원수가 4명 초과하는 부서를 조회하는 쿼리문을 작성하시오.
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
HAVING COUNT(EMPLOYEE_ID) > 4
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--부서내에서 같은 업무(직무)를 담당하는 사원의 급여의 합과 사원수
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) --부서와 직무별 급여의 합 및 사원수
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;
UNION ALL 
--부서별 급여의 합과 사원 수
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
UNION ALL
--전체 사원의 급여의 합과 사원수
SELECT NULL DEPARTMENT_ID, NULL JOB_ID, COUNT(SALARY)
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID;

--부서내에서 같은 업무(직무)를 담당하는 사원의 급여의 합과 사원수
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) --부서와 직무별 급여의 합 및 사원수
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
UNION ALL
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
UNION ALL
SELECT NULL DEPARTMENT_ID, NULL JOB_ID, COUNT(SALARY)
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID;

--4)각 기준별 소계를 요약해서 보여주는 ROLLUP함수
--ROLLUP()에 지정된 컬럼들은 소계(전체가 아닌 어느 한 부분만을 셈한 합계)의 기준이 되는 컬럼들이다.
--부서와 직무별 급여의 합 및 사원수와 부서별 급여의 합과 사원수, 전체 사원의 급여의 합과 사원수를 구하세요
-- -부서와 직무별 급여의 합 및 사원수, -부서별 급여의 합과 사원수, -전체 사원의 급여의 합과 사원수
--(부서코드가 바뀔때마다 부서별 집계가 출력되고 모든 부서가 출력되면 전체 집계정보가 출력된다.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;
--
SELECT JOB_ID, DEPARTMENT_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(JOB_ID, DEPARTMENT_ID) ORDER BY JOB_ID;
--5)CUBE(exp1, exp2, ...) - 소계와 전체 합계까지 출력하는 함수
--CUBE()는 명시한 표현식 개수에 따라 가능한 모든 조합별로 집계한 결과를 반환한다.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY CUBE(DEPARTMENT_ID,JOB_ID);

--6)집합 연산자
CREATE TABLE exp_goods_asia ( --한국과 일본의 10대 수출품 테이블
    country VARCHAR2(10), -- 나라명
    seq NUMBER, --번호
    goods VARCHAR2(80) -- 상품명
);
INSERT INTO exp_goods_asia VALUES('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES('한국', 3, '전자직접회로');
INSERT INTO exp_goods_asia VALUES('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES('한국', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES('한국', 6, '자동차부품');
INSERT INTO exp_goods_asia VALUES('한국', 7, '휴대전화');
INSERT INTO exp_goods_asia VALUES('한국', 8, '환식탄화수소');
INSERT INTO exp_goods_asia VALUES('한국', 9, '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES('한국', 10, '철 또는 비합금강');

INSERT INTO exp_goods_asia VALUES('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES('일본', 3, '전자직접회로');
INSERT INTO exp_goods_asia VALUES('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES('일본', 10, '기계류');
SELECT * FROM EXP_GOODS_ASIA;
--
SELECT * FROM EXP_GOODS_ASIA WHERE COUNTRY = '한국';
SELECT * FROM EXP_GOODS_ASIA WHERE COUNTRY = '일본';
--
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '한국'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '일본';

--20221104
--[예제] hr 스키마에 있는 JOB_HISTROY 테이블은 사원들의 업무 변경 이력을 나타내는 테이블이다.
--이 정보를 이용하여 모든 사원의 현재 및 이전의 업무 이력 정보를 출력하고자 한다. 중복된 사원
--정보가 있을 경우 한 번만 표시하여 출력하시오.
SELECT employee_id, job_id
FROM employees
UNION 
SELECT employee_id, job_id
FROM job_history;
--[예제] 위 결과를 이용하여 출력된 176번 사원의 업무 이력의 변경 날짜 이력을 조회하시오.
SELECT employee_id, job_id, NULL AS "Strat Date", NULL AS "End Date"
FROM employees
WHERE employee_id = 176
UNION
SELECT employee_id, job_id, start_date, end_date
FROM job_history
WHERE employee_id = 176;
--
UNION ALL
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '한국'
UNION ALL
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '일본';
--<문제> 위 예제에서 각 사원의 업무 이력 정보를 확인하였다. 하지만 모든 사원의 업부 이력 전체를
--보지는 못했다. 여기에서는 모든 사원의 업무 이력 변경 정보 및 업무 변경에 따른 부서 정보를
--사번이 빠른대로 출력하시오.
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id;
-- ③INTERSECT 교집합
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '한국'
INTERSECT
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '일본';
--<문제> 사원정보 테이블에 JOB_ID는 사원의 현재 업무를 뜻하고, JOB_HISTORY에 JOB_ID는 사원의
--이전 업무를 뜻한다. 이 두 테이블을 교차해보면 업무가 변경된 사원의 정보도 볼 수 있지만 이전에
--한 번 했던 같은 업무를 그대로 하고 있는 사원의 정보도 볼 수 있다. 이전에 한 번 했던
-- 같은 업무를 보고 있는 사원의 사번과 업무를 출력하시오.
SELECT JOB_ID, EMPLOYEE_ID
FROM EMPLOYEES
INTERSECT
SELECT JOB_ID, EMPLOYEE_ID
FROM JOB_HISTORY;
--④MINUS 차집합
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '한국'
MINUS
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '일본';
--<문제> 우리 회사는 1년에 한 번 업무를 변경하여 전체적인 회사 업무를 사원들이 익히도록 하는
--Role change 정책을 시행하고 있다. 이번 인사이동 때 아직 업무가 변경된 적이 없는 사원들을 적합
--한 업무로 이동시키려고 한다. HR부서의 사원정보 테이블과 업무이력정보 테이블을 이용하여 한 번도
--업무가 변경되지 않은 사원의 사번을 출력하시오.
SELECT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
MINUS
SELECT JOB_ID, DEPARTMENT_ID
FROM JOB_HISTORY;
--⑤집합 연산자의 제한 사항
--ORA-01789:질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '한국'
UNION
SELECT SEQ, GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '일본';
--ORA-01790: 대응하는 식과 같은 데이터 유형이어야 합니다.
SELECT SEQ
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '한국'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '일본';
--집합 연산자로 SELECT문을 연결할 때 ORDER BY 절은 맨 마지막 문장에서만 사용할 수 있다.
-- ORA--00933: SQL 명령어가 올바르게 종료되지 않았습니다.
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '한국'
ORDER BY GOODS
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '일본';
--올바르게 수정
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '한국'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '일본'
ORDER BY GOODS;
-- ⑥GROUPING SETS절/ GROUP SETS은 ROLLUP이나 CUBE처럼 GROUP BY 절에 명시해서 그룹 쿼리에 사용
--되는 절이다. GROUPING SETS은 그룹 쿼리이긴 하나 UNION ALL 개념이 섞여 있기 때문이다.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY GROUPING SETS(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;
--각 부서와 업무를 보는 사람을 출력
SELECT DEPARTMENT_ID, JOB_ID--, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
--GROUP BY GROUPING SETS(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;
--같은 업무를 보는 사람을 묶는다.
SELECT DEPARTMENT_ID, JOB_ID--, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID;
--같은 업무를 보는 사람의 직원 수 와 급여를 통계치 계산 이전
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID;
--같은 업무를 보는 사람의 직원 수 와 급여를 통계치를 내준다.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY GROUPING SETS(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;