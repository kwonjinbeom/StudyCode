--[����Ŭ] PL/SQL(Oracle's Procedural Language extension to SQL)
--SQL ���忡�� ��������, ����ó��(IF), �ݺ�ó��(LOOP, WHILE, FRO) ���� �����Ѵ�.
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
END;
/
--�� ������ �� ����
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
    
    DBMS_OUTPUT.PUT_LINE('��� / �̸�');
    DBMS_OUTPUT.PUT_LINE('----------');
    DBMS_OUTPUT.PUT_LINE(VEMPLOYEE_ID||' / '||VFIRST_NAME);
END;
/
--�轺Į�� ����/���۷��� ���� 
--��Į��(������ �ڷ����� �ִ� �� ��Į�� ����)
VEMPLOYEE_ID NUMBER(6);
VFIRST_NAME VARCHAR2(20);
--���۷��� %TYPE �Ӽ��� %POWTYPE �Ӽ� ����Ѵ�.
VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
--%ROWTYPE�� �ο� ������ �����Ѵ�.
VEMPLOYEES EMPLOYEES%ROWTYPE;
--��PL/SQL���� SQL ����
--��ȸ�� �÷��� ����� ������ ���� �� INTO���� ����ϸ� �ȴ�.

DECLARE
    --%TYPE �Ӽ����� Į�� ������ �����͸� ������ �� �ִ� ���۷��� ���� ����
    vemployee_id employees.employee_id%TYPE;
    vfirst_name employees.first_name%TYPE; --%TYPE ���۷��� ����, �����Ѵٴ� ��
BEGIN
    DBMS_OUTPUT.PUT_LINE('��� / �̸�');
    DBMS_OUTPUT.PUT_LINE('----------');
    -- SELECT ���� ������ ��� ���� INTO �ڿ� ����� ������ ����ȴ�.
    SELECT employee_id, first_name INTO vemployee_id, vfirst_name
    FROM employees
    WHERE first_name = 'Susan';
    --���۷��� ������ ����� ���� ����Ѵ�.
    DBMS_OUTPUT.PUT_LINE(veMployee_id||'/'||vfirst_name);
END;
/
--��ü ���ڵ带 �����ϱ� ���ؼ��� %rowtype���� �����ϸ� �ȴ�.
DECLARE
    -- ���ڵ�� ���� ����
    vemployees employees%rowtype;
BEGIN
    -- JONES ����� ������ ���ڵ� ������ ����
    SELECT *
    INTO vemployees
    FROM employees
    WHERE first_name = 'Lisa';
    
    --���ڵ� ������ ����� ��� ������ ���
    DBMS_OUTPUT.PUT_LINE('�����ȣ :' || TO_CHAR(vemployees.employee_id));
    DBMS_OUTPUT.PUT_LINE('��  �� :' ||  vemployees.first_name);
    DBMS_OUTPUT.PUT_LINE('��  �� :' || vemployees.salary);
    DBMS_OUTPUT.PUT_LINE('�Ի�����:' || TO_CHAR(vemployees.hire_date,'YYYY-MM-DD'));
END;
/
--<����> employees ���̺� ��ϵ� �ѻ���� ���� �޿��� ��, �޿��� ����� ������ �����Ͽ� ����Ͽ� ����.
DECLARE
    VEMPLOYEE_COUNT_NUM VARCHAR2(20);
    VEMPLOYEE_SUM_SALARY NUMBER(10);
    VEMPLOYEE_AVG_SALARY NUMBER(10);

BEGIN
    SELECT COUNT(employee_id),SUM(salary),AVG(salary)
    INTO VEMPLOYEE_COUNT_NUM, VEMPLOYEE_SUM_SALARY, VEMPLOYEE_AVG_SALARY
    FROM employees;
    DBMS_OUTPUT.PUT_LINE('�ѻ���� ��:' ||VEMPLOYEE_COUNT_NUM);
    DBMS_OUTPUT.PUT_LINE('�޿��� ��:' || VEMPLOYEE_SUM_SALARY);
    DBMS_OUTPUT.PUT_LINE('�޿��� ���:' || VEMPLOYEE_AVG_SALARY);
END;
/
--����� ��
DECLARE
    vcnt number;
    vsum number;
    vavg number(10,2);
BEGIN
    SELECT COUNT(*), SUM(salary), AVG(salary) INTO vcnt, vsum, vavg
    FROM employees;
    
    DBMS_OUTPUT.PUT_LINE('�ѻ���� ��:' || vcnt);
    DBMS_OUTPUT.PUT_LINE('�޿��� ��:' || vsum);
    DBMS_OUTPUT.PUT_LINE('�޿��� ���:' || vavg);
END;
/
--<����> Jack ����� ����, �޿�, �Ի�����, �μ����� ������ �����Ͽ� ����Ͽ� ����.
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
    
    DBMS_OUTPUT.PUT_LINE('����:' || VEMPLOYEE_JOB_ID);
    DBMS_OUTPUT.PUT_LINE('�޿�:' || VEMPLOYEE_SALARY);
    DBMS_OUTPUT.PUT_LINE('�Ի�����:' || VEMPLOYEE_HIRE_DATE);
    DBMS_OUTPUT.PUT_LINE('�μ���:' || VDEPARTMENT_NAME);
END;
/
--����Դ�
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
--��� ���̺�(employees01)���� �����ȣ�� ���� ū ����� ã�Ƴ� ��, �� ��ȣ +3������
--�Ʒ��� ����� ������̺� �ű� �Է��ϴ� PL/SQL�� ����� ����.
select * from employees01;
drop table employees01;
--����
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






--��Ŀ�� / ����Ŭ ���������� SQL ���� ������ ������ ó��(Parse, Execution)�� ���� �޸𸮰���(�� ������
--���ĺ��� SQL Ŀ���� ��Ī)�� ����Ѵ�. �� ����ڰ� ��û�ϴ� �����͸� �����ͺ��̽� ���� ĳ������ Ŀ��
--�� ���� �� �� �� Ŀ������ ���ϴ� �����͸� �����Ͽ�(Fetch)���ϴ� �۾��� �ϰ� �ȴٴ� ���ε� �� ������ Private SQL aREA ��� �θ���.
--�ٽø��� Ŀ���� Ư�� SQL ������ ó���� ����� ��� �ִ� ������ ����Ű�� ������ ������
DECLARE
    vdepartments departments%ROWTYPE;
    CURSOR C1 -- Ŀ���� �̸�
    IS
    SELECT department_id, department_name, location_id
    FROM departments; -- �μ� ���̺��� ��ü �׿��� ��ȸ�Ѵ�.
BEGIN
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ/�μ���/������');
    DBMS_OUTPUT.PUT_LINE('------------------------');
    
    OPEN C1; -- ������ C1 Ŀ���� SELECT ���� ���� �˻��� �Ѱ��� ���� ������ �о�´�.
    LOOP -- �;�� ������ INTO �ڿ� ����� ������ ����
    FETCH C1 INTO vdepart