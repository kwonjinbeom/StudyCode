--2022-11-08
--[����Ŭ] ���� ����(Sub Query)
--1)���� ������ �⺻ ����
SELECT DEPARTMENT_ID FROM EMPLOYEES
WHERE FIRST_NAME = 'Susan';
--
SELECT DEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 40;
--���� ������ ����
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID =  (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Susan');
--EMPLOYEE ���̺��� Lex�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����(����: 2003-01-13)�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Lex';
--
SELECT FIRST_NAME, TO_CHAR(HIRE_DATE,'YYYY-MM-DD')AS HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;
--���� ���� �ۼ�
SELECT FIRST_NAME, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')AS HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Lex');
--<����> EMPLOYEES ���̺��� CEO���� �����ϴ� ������ ��� ������ ����ϴ� SELECT ���� �ۼ��Ͻÿ�.
SELECT * 
FROM EMPLOYEES
WHERE MANAGER_ID = (SELECT MANAGER_ID
                    FROM EMPLOYEES
                    WHERE MANAGER_ID IS NOT NULL);
--2) ���� �� ���� ���� / ���� �� ��������(single row)�� ���� SELECT �������κ��� ���� �ϳ��� �ο�(��)
--���� ��ȯ ������, ���� �� �� �����ڸ� ����Ѵ�.
--Guy�� ���� �μ����� �ٹ��ϴ� ����� ������ ����ϴ� ��
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, NVL(COMMISSION_PCT,0)COMMISSION_PCT,
TO_CHAR(HIRE_DATE, 'YYYY.MM.DD')HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Guy');
--�缭�� �������� �׷� �Լ��� ���
--���� ������ ����Ͽ� ��� �޿����� �� ���� �޿��� �޴� ����� �˻��ϴ� ����
SELECT AVG(SALARY)
FROM EMPLOYEES;
--
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES);
--3)���� �� ���� ���� / ���� �������� ��ȯ�Ǵ� ����� �ϳ� �̻��� ���� �� ����ϴ� ��������
--��IN ������ 
--�޿��� 15000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ����� ����϶�.
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT DISTINCT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE SALARY >= 15000)
ORDER BY DEPARTMENT_ID;
--�̸��� "z"�� �ִ� ������ �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ������ ���� ������ȣ, �̸�,�޿� ����ϴ�
--SELECT���� �ۼ�. �� �μ���ȣ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME LIKE '%z%')
ORDER BY DEPARTMENT_ID;
--EMPLOYEES���̺��� Susan �Ǵ� Lex�� ������ ���� ������ �̸�, ����, �޿��� ����ϴ� SELECT���� �ۼ�
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY IN(SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME IN('Susan','Lex')) 
                AND FIRST_NAME NOT IN('Susan','Lex');
--EMPLOYEES ���̺��� ��� �� �� �̻����κ��� ���� ���� �� �ִ� ������ ������ȣ, �̸�, ����,
--�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.(�ٸ� ������ �����ϴ� ����)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN(SELECT DISTINCT MANAGER_ID
                    FROM EMPLOYEES);
--<����> EMPLOYEES ���̺��� Accounting �μ����� �ٹ��ϴ� ������ ���� ������ �ϴ� ������ �̸�,
--�������� ����ϴ� SELECT ���� �ۼ��Ͻÿ�.
SELECT FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                FROM DEPARTMENTS
                WHERE DEPARTMENT_NAME = 'Accounting');
--��ALL���� / ���� ������ �� ������ ���� ������ �˻� ����� ��� ���� ��ġ�ϸ� ���̴�.
--30�� �Ҽ� ������ �߿��� �޿��� ���� ���� ���� ������� �� ���� �޿��� ���� ����� �̸�, �޿�
--�� ����ϴ� ������ �ۼ�(30�� �μ� ���� �޿��� ��ο� ���ؼ� Ŀ�� �ϹǷ� �ִ밪���� ū �޿���)
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ALL(SELECT SALARY
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 30);
--��ANY������(ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �Ǵ� ���� �ȴ�.)
--�μ� ��ȣ�� 110���� ������� �޿� �� ���� ���� ��(8300)���� ���� �޿��� �޴� ����� �̸�, �޿��� ���
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ANY(SELECT SALARY
                    FROM EMPLOYEES
                    WHERE DEPARTMENT_ID = 110);
--��EXISTS������ / ���� ���������� �ַ� ����ϸ� ���� ������ ��� ���� ���� �����⸸ �ϸ� �ٷ� 
-- ���� ������ ��� ���� �����Ѵ�.
--4)���� ������ ���̺� �ۼ��ϱ�
--�缭�� ������ ���̺� �����ϱ�
DROP TABLE EMP01;
CREATE TABLE EMP01
AS
SELECT * FROM EMPLOYEES;
--
DROP TABLE EMP02;
CREATE TABLE EMP02
AS
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;
--�����̺��� ������ �����ϱ�
DROP TABLE EMP03;
CREATE TABLE EMP03
AS
SELECT *
FROM EMPLOYEES
WHERE 1=0;
SELECT * FROM EMP03;
--5)���� ������ �̿��� ������ �߰�
DROP TABLE DEPT02;

CREATE TABLE DEPT02
AS
SELECT *
FROM DEPARTMENTS
WHERE 1=0;

SELECT * FROM DEPT02;
INSERT INTO DEPT02
SELECT * FROM DEPARTMENTS;
--6) ���� ������ �̿��� ������ ����
UPDATE DEPT02
SET LOCATION_ID = (SELECT LOCATION_ID
                    FROM DEPARTMENTS
                    WHERE DEPARTMENT_ID = 40)
WHERE DEPARTMENT_ID = 10;
SELECT * FROM DEPT02;
--7) ���� ������ �̿��� �� �� �̻��� Į���� ���� �� ����
--20�� �μ��� �μ���� �������� 30�� �μ��� �μ���� ���������� ����
UPDATE DEPT02
SET DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME
                        FROM DEPT02
                        WHERE DEPARTMENT_ID = 30),
    LOCATION_ID = (SELECT LOCATION_ID
                    FROM DEPT02
                    WHERE DEPARTMENT_ID = 30)
WHERE DEPARTMENT_ID = 20;
SELECT * FROM DEPT02;
--
UPDATE DEPT02
SET(DEPARTMENT_NAME, LOCATION_ID) = (SELECT DEPARTMENT_NAME, LOCATION_ID
                                    FROM DEPT02
                                    WHERE DEPARTMENT_ID = 30)
WHERE DEPARTMENT_ID = 20;
--8)���� ������ �̿��� ������ ����
DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT *
FROM EMPLOYEES;
--
DELETE FROM EMP01
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Sales');
SELECT * FROM EMP01;