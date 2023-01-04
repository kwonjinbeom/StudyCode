--[오라클] PL/SQL(Oracle's Procedural Language extension to SQL)
--SQL 문장에서 변수정의, 조건처리(IF), 반복처리(LOOP, WHILE, FRO) 등을 지원한다.
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
END;
/
--① 변수의 값 대입
DECLARE
    val_num NUMBER;
BEGIN
    val_num := 100;
    DBMS_OUTPUT.PUT_LINE(val_num);
END;
/
--
DECLARE
    num NUMBER := 24*60*60;
BEGIN
    DBMS_OUTPUT.PUT_LINE('num = ' || TO_CHAR(num));
END;
/
--
DECLARE
    VEMPLOYEE_ID NUMBER(6);
    VFIRST_NAME VARCHAR2(20);
BEGIN
    VEMPLOYEE_ID := 105;
    VFIRST_NAME := 'David';
    
    DBMS_OUTPUT.PUT_LINE('사번 / 이름');
    DBMS_OUTPUT.PUT_LINE('----------');
    DBMS_OUTPUT.PUT_LINE(VEMPLOYEE_ID||' / '||VFIRST_NAME);
END;
/
--②스칼라 변수/레퍼런스 변수 
--스칼라(변수명에 자료형을 주는 게 스칼라 변수)
VEMPLOYEE_ID NUMBER(6);
VFIRST_NAME VARCHAR2(20);
--레퍼런스 %TYPE 속성과 %POWTYPE 속성 사용한다.
VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
--%ROWTYPE은 로우 단위로 참조한다.
VEMPLOYEES EMPLOYEES%ROWTYPE;
--③PL/SQL에서 SQL 문장
--조회된 컬럼의 결과를 변수에 대입 시 INTO절을 사용하면 된다.

DECLARE
    --%TYPE 속성으로 칼럼 단위로 데이터를 저장할 수 있는 레퍼런스 변수 선언
    vemployee_id employees.employee_id%TYPE;
    vfirst_name employees.first_name%TYPE; --%TYPE 레퍼런스 변수, 참조한다는 뜻
BEGIN
    DBMS_OUTPUT.PUT_LINE('사번 / 이름');
    DBMS_OUTPUT.PUT_LINE('----------');
    -- SELECT 문을 수행한 결과 값이 INTO 뒤에 기술한 변수에 저장된다.
    SELECT employee_id, first_name INTO vemployee_id, vfirst_name
    FROM employees
    WHERE first_name = 'Susan';
    --레퍼런스 변수에 저장된 값을 출력한다.
    DBMS_OUTPUT.PUT_LINE(veMployee_id||'/'||vfirst_name);
END;
/
--전체 레코드를 참조하기 위해서는 %rowtype으로 선언하면 된다.
DECLARE
    -- 레코드로 변수 선언
    vemployees employees%rowtype;
BEGIN
    -- JONES 사원의 정보를 레코드 변수에 저장
    SELECT *
    INTO vemployees
    FROM employees
    WHERE first_name = 'Lisa';
    
    --레코드 변수에 저장된 사원 정보를 출력
    DBMS_OUTPUT.PUT_LINE('사원번호 :' || TO_CHAR(vemployees.employee_id));
    DBMS_OUTPUT.PUT_LINE('이  름 :' ||  vemployees.first_name);
    DBMS_OUTPUT.PUT_LINE('급  여 :' || vemployees.salary);
    DBMS_OUTPUT.PUT_LINE('입사일자:' || TO_CHAR(vemployees.hire_date,'YYYY-MM-DD'));
END;
/
--<예제> employees 테이블에 등록된 총사원의 수와 급여의 합, 급여의 평균을 변수에 대입하여 출력하여 보자.
DECLARE
    VEMPLOYEE_COUNT_NUM VARCHAR2(20);
    VEMPLOYEE_SUM_SALARY NUMBER(10);
    VEMPLOYEE_AVG_SALARY NUMBER(10);

BEGIN
    SELECT COUNT(employee_id),SUM(salary),AVG(salary)
    INTO VEMPLOYEE_COUNT_NUM, VEMPLOYEE_SUM_SALARY, VEMPLOYEE_AVG_SALARY
    FROM employees;
    DBMS_OUTPUT.PUT_LINE('총사원의 수:' ||VEMPLOYEE_COUNT_NUM);
    DBMS_OUTPUT.PUT_LINE('급여의 합:' || VEMPLOYEE_SUM_SALARY);
    DBMS_OUTPUT.PUT_LINE('급여의 평균:' || VEMPLOYEE_AVG_SALARY);
END;
/
--강사님 답
DECLARE
    vcnt number;
    vsum number;
    vavg number(10,2);
BEGIN
    SELECT COUNT(*), SUM(salary), AVG(salary) INTO vcnt, vsum, vavg
    FROM employees;
    
    DBMS_OUTPUT.PUT_LINE('총사원의 수:' || vcnt);
    DBMS_OUTPUT.PUT_LINE('급여의 합:' || vsum);
    DBMS_OUTPUT.PUT_LINE('급여의 평균:' || vavg);
END;
/
--<예제> Jack 사원의 직무, 급여, 입사일자, 부서명을 변수에 대입하여 출력하여 보자.
DECLARE
    VEMPLOYEE_JOB_ID VARCHAR2(20);
    VEMPLOYEE_SALARY NUMBER(6);
    VEMPLOYEE_HIRE_DATE DATE;
    VDEPARTMENT_NAME VARCHAR2(40);
BEGIN
    SELECT JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_NAME
    INTO VEMPLOYEE_JOB_ID, VEMPLOYEE_SALARY, VEMPLOYEE_HIRE_DATE, VDEPARTMENT_NAME
    FROM employees e, departments d
    WHERE e.department_id = d.department_id AND first_name = 'Jack';
    
    DBMS_OUTPUT.PUT_LINE('직무:' || VEMPLOYEE_JOB_ID);
    DBMS_OUTPUT.PUT_LINE('급여:' || VEMPLOYEE_SALARY);
    DBMS_OUTPUT.PUT_LINE('입사일자:' || VEMPLOYEE_HIRE_DATE);
    DBMS_OUTPUT.PUT_LINE('부서명:' || VDEPARTMENT_NAME);
END;
/
--강사님답
DECLARE
    vemployees employees%rowType;
    vdepartments departments%rowType;
BEGIN
    SELECT job_id, salary, hire_date, department_name
    INTO vemployees.job_id, vemployees.salary, vemployees.hire_date, vdepartments.department_name
    FROM employees e INNER JOIN departments d
    ON e.department_id = d.department_id
    WHERE first_name = 'Jack';
END;
/
--사원 테이블(employees01)에서 사원번호가 제일 큰 사원을 찾아낸 뒤, 이 번호 +3번으로
--아래의 사원을 사원테이블에 신규 입력하는 PL/SQL을 만들어 보자.
select * from employees01;
drop table employees01;
--복사
create table employees01
as
select * from employees;

select * from employees01;

SELECT max(ROWNUM)
from employees;
group by employee_id;

DECLARE
    vemployees employees01%rowType;
BEGIN
    SELECT ROWNUM
     INSERT INTO first_name,last_name,email,salary,hire_date,manager_id,job_id,department_id
     values('Olivia','Gee','Spring',2800,SYSDATE,100,'PR_REP',20)
     WHERE(SELECT max(ROWNUM)
            from employees;)






--⑧커서 / 오라클 서버에서는 SQL 문을 실행할 때마다 처리(Parse, Execution)를 위한 메모리공간(이 공간을
--이후부터 SQL 커서로 지칭)을 사용한다. 즉 사용자가 요청하는 데이터를 데이터베이스 버퍼 캐쉬에서 커서
--로 복사 해 온 후 커서에서 원하는 데이터를 추출하여(Fetch)원하는 작업을 하게 된다는 뜻인데 이 공간을 Private SQL aREA 라고도 부른다.
--다시말해 커서란 특정 SQL 문장을 처리한 결과를 담고 있는 영역을 가리키는 일종의 포인터
DECLARE
    vdepartments departments%ROWTYPE;
    CURSOR C1 -- 커서의 이름
    IS
    SELECT department_id, department_name, location_id
    FROM departments; -- 부서 테이블의 전체 네용을 조회한다.
BEGIN
    DBMS_OUTPUT.PUT_LINE('부서번호/부서명/지역명');
    DBMS_OUTPUT.PUT_LINE('------------------------');
    
    OPEN C1; -- 오픈한 C1 커서가 SELECT 문에 의해 검색된 한개의 행의 정보를 읽어온다.
    LOOP -- 익어온 정보는 INTO 뒤에 기술한 변수에 저장
    FETCH C1 INTO vdepart