--8[오라클] 뷰(VIEW) 예제
--강사님이 문제를 수정하신건가? 아무튼 줌에 띄워서 써봄
--1. 학번, 학생명, 학과명을 출력하는 뷰를 작성하라
--2. 수강신청한 학생의 학과명, 학번, 학생명, 전화번호, 이메일, 주소, 수강신청과목,
-- 수강신청일(2021-03-01형태)을 출력하는 뷰를 작성하라.

--시퀀스 생성
--학과 테이블 일련번호를 자동 증가하기 위해 시퀀스 생성해 주시고 레코드 2개정도 입력하셔서 테스트해주세요.
--학생 테이블에 일련번호를 위해 시퀀스 생성(테이블명_seq 또는 seq 테이블명)
--과목테이블의 일련번호를 위해 

--1. 사원 번호와 사원명과 부서명과 부서의 위치를 출력하는 뷰(VIEW_LOC)를 작성하라.
drop table view_loc;
CREATE OR REPLACE VIEW VIEW_LOC
AS
SELECT employee_id , FIRST_NAME, DEPARTMENT_NAME, LOCATION_ID
FROM EMPLOYEES e INNER JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id;
-- employees, departments 만약 이렇게 , 즉 카티션 곱 사용 시 모든 데이터를 출력하기 위해
-- 해당 사원과 관련없는 부서까지 모두 출력한다.
SELECT * FROM view_loc;
--2.30번 부서 소속 사원의 이름과 입사일과 부서명을 출력하는 뷰(VIEW_DEPT30)를 작성하라.
DROP table VIEW_DEPT30;
CREATE OR REPLACE VIEW VIEW_DEPT30
AS
SELECT FIRST_NAME, DEPARTMENT_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID = 30;

SELECT * FROM VIEW_DEPT30;
--3.부서별 최대 급여 정보를 가지는 뷰(VIEW_DEPT_MAXSAL)를 생성하라.
DROP TABLE VIEW_DEPT_MAXSAL;
CREATE OR REPLACE VIEW VIEW_DEPT_MAXSAL
AS
SELECT DEPARTMENT_NAME "부서이름", MAX(SALARY) "최대 급여"
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME;

SELECT * FROM VIEW_DEPT_MAXSAL;