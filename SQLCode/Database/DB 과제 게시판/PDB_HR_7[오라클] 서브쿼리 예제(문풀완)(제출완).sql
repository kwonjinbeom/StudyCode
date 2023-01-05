--7[오라클] 서브쿼리 예제
--2022-11-17
--1.직급이 'ST_MAN'인 직원이 받는 급여들의 최소 급여보다 많이 받는 직원들의 이름과 급여를 출력하되
--부서번호가 20번인 직원은 제외한다.
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID IN(SELECT JOB_ID
                FROM EMPLOYEES
                WHERE JOB_ID = 'ST_MAN') AND
    DEPARTMENT_ID != '20';
--2.EMPLOYEES 테이블에서 Valli라는 이름을 가진 직원과 업무명 및 월급이 같은 사원의 모든 정보를
--출력하는 SELECT문을 작성하시오.(결과에서 Valli는 제외)
SELECT *
FROM EMPLOYEES
WHERE (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Valli') AND FIRST_NAME != 'Valli' ;
--3.EMPLOYEES테이블에서 가장 많은 사원이 속해있는 부서번호와 사원수를 출력하라.
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID)
FROM EMPLOYEES 
HAVING COUNT(DEPARTMENT_ID) = (SELECT MAX(COUNT(DEPARTMENT_ID))
                            FROM EMPLOYEES
                            GROUP BY DEPARTMENT_ID)
GROUP BY DEPARTMENT_ID;
--4.EMPLOYEES테이블에서 월급이 자신이 속한 부서의 평균 월급보다 높은 사원의 부서번호,
--이름,급여를 출력하는 SELECT 문을 작성하시오.
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES E
WHERE SALARY > (SELECT AVG(SALARY)
                    FROM EMPLOYEES SE
                    WHERE E.DEPARTMENT_ID = SE.DEPARTMENT_ID
                    GROUP BY DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID;
--5.2001년~2005년 사이에 입사한 사원들에 대해 각 부서별 사원수를 부서번호, 부서명,
--2001년입사인원수, 2002년입사인원수, 2003년입사인원수, 2004년입사인원수, 2005년입사인원수로 출력
SELECT  E.DEPARTMENT_ID 부서번호, DEPARTMENT_NAME 부서명, 
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2001' THEN 1 END) "2001년입사인원수",
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2002' THEN 1 END) "2002년입사인원수",
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2003' THEN 1 END) "2003년입사인원수",
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2004' THEN 1 END) "2004년입사인원수",
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2005' THEN 1 END) "2005년입사인원수"
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID, DEPARTMENT_NAME
ORDER BY E.DEPARTMENT_ID;
--6.부서별 급혀 합계를 구하고, 그 결과를 가지고 다음과 같이 표현하시오.
--<Hint> CASE문을 사용하는 보통 방법을 사용할 수도 있고, 인라인 뷰(INLINE VIEW)를 이용하여
--우선 부서별 급여 합계를 구하고, 상위 쿼리애서 CASE 구문을 이용하여 위의 조건 비교를 통해
--급여 합계에 따른 표현을 할 수 있다.
SELECT DEPARTMENT_ID, SUM_SAL, 
    CASE WHEN SUM_SAL > 100000 THEN 'Excellent'
        WHEN SUM_SAL > 50000 THEN 'Good'
        WHEN SUM_SAL > 10000 THEN 'Medium'
        ELSE 'Well'
        END "Department Grade Salary"
FROM (SELECT DEPARTMENT_ID, SUM(salary) SUM_SAL
      FROM employees
      GROUP BY department_id
      ORDER BY department_id);
--inline view
SELECT DEPARTMENT_ID, SUM(salary) SUM_SAL, 
    CASE WHEN SUM(salary) > 100000 THEN 'Excellent'
        WHEN SUM(salary) > 50000 THEN 'Good'
        WHEN SUM(salary) > 10000 THEN 'Medium'
        ELSE 'Well'
        END "Department Grade Salary"
FROM employees
GROUP BY department_id
ORDER BY department_id;