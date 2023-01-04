DROP TABLE EMP06 PURGE; -- emp06 ����
---------����Day1(22.10.27)-----------------------------------------------
-- ctrl + enter: ��ü����, F9: Ŀ���� �� ���� ����
-- NOT NULL: null�� ������� ����. ���� ������ ������ٴ� ��.
-- hr ������� ��ü ���̺� ��� Ȯ��
select * from tab;
-- desc ���̺� : ���̺��� ������ Ȯ��
desc departments;
-- �μ� ���̺�κ��� ��� ���̺��� ��ȸ�ض�.
select * from departments; 

desc employees;

select * from employees;
--1. �����͸� ��ȸ�ϱ� ���� SELECT/(departments ���̺��� ��� ���� ���)
SELECT * FROM DEPARTMENTS;
--1.���� employees ���̺��� ��� ���� ���
SELECT * FROM EMPLOYEES;
--2. Į�� �̸��� ����ؼ� Ư�� Į���� ����/(departments ���̺��� �μ���ȣ�� �μ��� ���)
SELECT department_id, department_name FROM departments;
--2.���� (����� �̸��� �޿��� �Ի����ڸ��� ����ϴ� SQL���� �ۼ��غ���.)
SELECT first_name, last_name, salary, hire_date FROM employees;
--3_1. Į�� �̸��� ��Ī �����ϱ�, AS�� �÷��� ��Ī �ο��ϱ�
SELECT department_id AS DepartmentNo, department_name AS DepartmentName FROM Departments;
--3_2. AS ���� �÷��� ��Ī �ο��ϱ�/(#����Ŭ�� ���ڴ� ' ' ���ڴ� �״�� ��Ī�� �ƹ��͵� ���ų�, ""(������ �� ��, Ư������, ��ҹ��� �����ϰ� ����.))
SELECT department_id "DepartmentNO", department_name "DepatmentName" FROM departments;
--3_3. ��Ī���� �ѱ� ����� �����ϴ�.(#�ѱ��� ""�� �ʿ������)
SELECT department_id �μ���ȣ, department_name �μ��� FROM departments;
--4. Concatenation �������� ���ǿ� ���(���� ������)/(employees ���̺��� ���� �÷��� �ϳ��� ���ڿ��� ����ϱ�
SELECT first_name || '�� ������' ||job_id||'�Դϴ�' AS ���� FROM employees;
--
SELECT first_name || ' ' ||last_name �̸�, salary �޿�, hire_date �Ի��� FROM employees;
--5. �ߺ��� �����͸� �ѹ��� �� ����ϰ� �ϴ� DISTINCT
SELECT job_id FROM employees;
-- employees ���̺��� Į�� job_id�� ǥ���ϵ� �ߺ��� ���� �ѹ��� ǥ���ض�
SELECT DISTINCT job_id FROM employees;
SELECT DISTINCT first_name, job_id FROM employees;-- �̷��� �Ǹ� job_id�� �ߺ����Ű� �ȵ�.
--5.���� (�������� � �μ��� �ҼӵǾ� �ִ��� �Ҽ� �μ���ȣ(department_id)����ϵ� �ߺ����� �ʰ� �ѹ��� ����ϴ� �������� �ۼ�����.
SELECT DISTINCT department_id FROM departments;
--6_1. WHERE ���ǰ� �� ������
SELECT employee_id, first_name, salary FROM employees;
-- <��> �޿��� 3000�̻� �޴� ������ ���
SELECT employee_id, first_name, salary FROM employees WHERE salary >= 3000;
-- <��> �޿��� 3000�̸� �޴� ������ ���
SELECT employee_id, first_name, salary FROM employees WHERE salary < 3000;
--6_1. ���� (EMPLOYEES ���̺��� �μ���ȣ�� 110���� ������ ���� ��� ������ ����϶�.
SELECT * FROM employees WHERE department_id = 110;
--6_1. ���� (EMPLOYEES ���̺��� �޿��� 5000�̸��� �Ǵ� ������ ���� �߿��� ����� �̸�, �޿��� ����϶�.
SELECT manager_id,first_name || ' ' || last_name, salary FROM employees WHERE salary < 5000;
--6_2. ���� ������ ��ȸ, ���� �����ʹ� �ݵ�� ���� ����ǥ �ȿ� ǥ���ϰ�, ��ҹ��ڸ� �����Ѵ�.<��> �̸��� 'Lex'�� ����
SELECT employee_id, first_name, last_name, salary FROM employees WHERE first_name = 'Lex';
--6_2. ���� (�̸��� John�� ����� �����ȣ�� ������� ���� ID�� ����϶�.)
SELECT department_id, first_name || ' ' || last_name, employee_id FROM employees WHERE first_name = 'John';
-- ���⼭ john�� j�� ��ҹ��ڸ� �������� ������ �˻� ����� �ȳ��´�. ' '�� ��ҹ��ڸ� �����ϱ� ����
--6_3. ��¥ ������ ��ȸ, �ݵ�� ���� ����ǥ �ȿ� ǥ���Ѵ�. ��/��/�� �������� ����Ѵ�.<��> 2008�� ���Ŀ� �Ի��� ����
SELECT first_name, hire_date FROM employees WHERE hire_date >= '2008/01/01';
--7_1. ��������, AND������: ���� ������ ��� �����ؾ� �� ��� <��> �μ���ȣ�� 100���̰� ������ FI_MGR�� ����
SELECT employee_id, first_name, phone_number, department_id, job_id 
FROM employees
WHERE department_id = 100 AND job_id = 'FI_MGR';
--7_1. ���� (�޿��� 5000���� 10000���� ���� ���� ���)
SELECT *
FROM employees
WHERE salary >= 5000 AND salary <= 10000;
--7_2. OR������, �� ���� ���� �߿��� �Ѱ����� �����ϴ��� <��> �μ���ȣ�� 100���̰ų� ������ FI_MGR�� ����
SELECT employee_id, first_name, phone_number, department_id, job_id
FROM employees
WHERE department_id = 100 OR job_id = 'FI_MGR';
--7_2. ���� (�����ȣ�� 134�̰ų� 201�̰ų� 107�� ���� ���� ���
SELECT *
FROM employees
WHERE employee_id = 134 OR employee_id = 201 OR employee_id = 107;
--7_3. NOT ������, �ݴ�Ǵ� �� <��> �μ���ȣ�� 100���� �ƴ� ����
SELECT employee_id, first_name, phone_number, department_id, job_id
FROM employees
WHERE NOT department_id = 100;
--7_3. ���� (���� ID�� FI_MGR�� �ƴ� ����)
SELECT *
FROM employees
WHERE NOT job_id = 'FI_MGR';
--7_4. BETWEEN AND ������, Ư�� ���� ���� ���ϴ� �����͸� �˾ƺ����� �� ��
-- <��> �޿��� 2000�������� 3000������ ������ ���� ���
SELECT employee_id, first_name, salary
FROM employees
WHERE salary BETWEEN 2000 AND 3000;
--7_4. ���� (�޿��� 2500���� 4500������ ������ ���� ������ ������ȣ, �̸�, �޿��� ����϶�.
--(AND�����ڿ� BETWEEN AND ������ ���)
SELECT employee_id, first_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 4500;
-- WHERE salary >=2500 AND salary <4500;
--7_5. IN������, ������ Į���� ���� ���� �� �߿� �ϳ������� ���캸�� ����
--<��> ������ȣ�� 177�̰ų� 101�̰ų� 184�� ���
SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 177 OR employee_id = 101 OR employee_id = 184;
---------------��
SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id IN(177,101,184);
--7_5. ���� (�μ���ȣ�� 10, 20, 30 �� �ϳ��� �Ҽӵ� ������ ������ȣ, �̸�, �޿��� ����϶�
-- OR�����ڿ� IN������ ���
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE department_id IN(10,20,30);
------���� IN �Ʒ��� OR
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE department_id = 10 OR department_id = 20 OR department_id = 30;
--8_1. LIKE ������, �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ���ϵ�ī��� �Բ� ����Ͽ� ���ϴ� ������ �˻��ϴ� ������.
--%: ���ڰ� ���ų�, �ϳ� �̻��� ���ڰ� � ���� ���� �������. -: �ϳ��� ���ڰ� � ���� ���� �������.
--8_1. <��> (K�� �����ϴ� ���)
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'K%';
--8_1. <��> (�̸� �߿� k�� �����ϴ� ���)
SELECT employee_id, first_name
FROM employees
WHERE LOWER(first_name) LIKE '%k%';
-- LOWER �� �ҹ��� ��ȯ, LIKE '%k%'�� �빮�ڸ� ��ã�Ƽ� �ҹ��ڷ� ��ȯ�ϴ� �� 
--8_1. <��> (�̸��� k�� ������ ���
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE '%k';
--8_2. ���ϵ�ī��(_) ����ϱ�, _�� �� ���ڸ� ����ؼ� ����� �� <��> �̸��� �� ���� ���ڰ� d�� ���
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE '_d%';
--8_2. ���� (�̸��� a�� �������� ���� ������ ������ȣ, �̸��� ����϶�.)
SELECT employee_id, first_name
FROM employees
WHERE NOT LOWER(first_name) LIKE '%a%';
---------20201031 LIKE ������ �߰� ����
--ESCAPE / LIKE �������� '%' �� '_' �� ���Ե� ���ڸ� �˻��ϰ��� �� �� ���ȴ�.
-- '%'�� '_' �տ� ESCAPE�� Ư�����ڸ� �����ϸ� �˻��� �� �ִ�. / Ư�����ڴ� �ƹ��ų� ������� ��� �����ϴ�.
-- ���� �������� ESCAPE�� ����� ���ڿ��� �������ָ� '_' �� '%' �� �˻��� ����� �� �ְ� �����ش�.
-- ������̺�(EMPLOYEES)���� ����ID�� 3��° _�� �����ϰ� 4��° �ڸ��� ���� P�� ���ڵ带 ��ȸ�ϰ��� �Ѵ�.
SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '__\_P%' ESCAPE '\'; --  '\'��� ���������ϱ�  \�� ���� �� 

SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '__@_P%' ESCAPE '@';
--9-1. NULL�� ���� ������, ����Ŭ������ �÷��� NULL���� ����Ǵ� ���� ����Ѵ�. NULL�� ��Ȯ��, �� �� ���� ���� �ǹ�. 0(Zero)�� �� ������ �ƴ� � ���� �����ϱ�� ������ � �������� �˾Ƴ� �� ���� ���� �ǹ��Ѵ�.
--NULL�� ����, �Ҵ�, �񱳰� �Ұ����ϴ�. <��> 100 + NULL = NULL
--9-1. <��> (Ŀ�̼��� ���� �ʴ� ����� ���� �˻�)
SELECT employee_id, first_name, commission_pct, job_id
FROM employees
WHERE commission_pct = NULL; --NULL�� ����Ǿ� �ִ� ��쿡�� = �����ڷ� �Ǵ��� �� ����.
--9_2. IS NULL�� IS NOT NULL, Ư�� Į�� �������� ���� ��쿡�� �񱳿�����(=)�� ������� �ʰ�
-- IS NULL �����ڸ� NULL ���� �ƴ����� �˾ƺ����� �񱳿�����(<>)�� ������� �ʰ� IS NOT NULL
-- �����ڸ� ����Ѵ�. <��> (Ŀ�̼��� ���� �ʴ� ���)
SELECT employee_id, first_name, commission_pct, job_id
FROM employees
WHERE commission_pct IS NULL;
--9_2. <��> (Ŀ�̼��� �޴� ���)
SELECT employee_id, first_name, commission_pct, job_id
FROM employees
WHERE commission_pct IS NOT NULL;
--9_2. ���� (�ڽ��� ���ӻ���� ���� ������ ��ü �̸��� ������ȣ, ����ID�� ����϶�
SELECT first_name || ' ' || last_name, employee_id,job_id
FROM employees
WHERE manager_id IS NULL;
--10_1. ������ ���� ORDER BY��, ORDER BY ���� �ο�(��)�� �����ϴµ� ����ϸ� ������ �� �ڿ� ����ؾ���.
--�������� ������ ���� ASC, <��> ����� �������� ������������ ����
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id ASC;
--�Ǵ� ORDER BY employee_id; --default�� ASC �ΰ���  
--10_2. �������� ������ ���� DESC <��> �����ȣ�� �������� ������������ ����
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id DESC;
--10_2. ���� (������ȣ, �̸�, �޿�, �μ���ȣ�� �޿��� ���� ������ ����϶�.)
SELECT employee_id, first_name, salary, department_id
FROM employees
ORDER BY salary DESC;
--10_2. ���� (�Ի����� ���� �ֱ��� ���� ������ ������ȣ, �̸�, �Ի����� ����϶�.)
SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date DESC;

---------����221027-----------------------------------------------
--[���� 1] EMPLOYEES ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ, �̸�, ������, �޿��� ����϶�.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary>=3000;
--[���� 2] EMPLOYEES ���̺��� ��� ������ ST_MAN�� ����� ������ �����ȣ, �̸�, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE job_id = 'ST_MAN';
--[���� 3] EMPLOYEES ���̺��� �Ի����ڰ� 2006�� 1�� 1�� ���Ŀ� �Ի��� ����� ������ �����ȣ, �̸�, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, salary, hire_date, department_id
FROM employees
WHERE hire_date > '2006.01.01';
-- [���� 4] EMPLOYEES ���̺��� �޿��� 3000���� 5000������ ������ �̸�, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE salary BETWEEN 3000 AND 5000;
-- [���� 5] EMPLOYEES ���̺��� �Ի����ڰ� 05�⵵�� �Ի��� ����� ������ �����ȣ, �̸�, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date BETWEEN '2005.01.01' AND '2005.12.31';
--[���� 6] �������(EMPLOYEES) ���̺��� �����ȣ, �̸�, �޿�, ������ȣ, �Ի���, ����� �����ȣ�� ����Ͻÿ�. �̶� �̸��� ���� �̸��� �����Ͽ� Name�̶�� ��Ī���� ����Ͻÿ�
SELECT employee_id, first_name || ' ' || last_name AS Name, salary, phone_number, hire_date, manager_id
FROM employees;
-- [���� 7] �������(EMPLOYEES) ���̺��� ����� ���� �̸��� Name, ������ȣ�� Job, �޿��� Salary, ������ $100 ���ʽ��� �߰��Ͽ� ����� ���� Increased Ann_Salary, �޿��� $100 ���ʽ��� �߰��Ͽ� ����� ������ Increased Salary��� ��Ī���� ����Ͻÿ�.
SELECT first_name || ' ' || last_name AS Name, phone_number AS Job, salary As Salary, (salary*12)+100 AS "Increased Ann_Salary", salary+100 AS "Increased Salary"
FROM employees;
-- [���� 8] �������(EMPLOYEES) ���̺��� ��� ����� �̸�(FIRST_NAME)�� ������ ���̸�: 1 Year Salary = $������ �������� ����ϰ�, 1 Year Salary��� ��Ī�� �ٿ� ����Ͻÿ�.
-- (����) King: 1 Year Salary = $288000
SELECT first_name || ': 1 Year Salary = $' || salary AS "1 Year Salary "
FROM employees;
--[���� 9] �μ����� ����ϴ� ����ID�� �� ������ ����Ͻÿ�
SELECT DISTINCT job_id
FROM employees;
--
--[���� 10] �μ����� ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�. �������(EMPLOYEES) ���̺��� �޿���
-- $7,000~$10,000���� �̿��� ����� ���� �̸�(Name���� ��Ī) �� �޿��� �޿��� ���� ������ ����Ͻÿ�.
SELECT first_name || ' ' || last_name AS Name, salary
FROM employees
WHERE salary BETWEEN 7000 AND 10000
ORDER BY 2 ASC;
---------����Day2(22.10.28)----------------------------------------------------------------------------------------------
---------����� ���⹮��221028----------------------------------------------------------------------------------------------
--3. ������ȣ, �̸�, �޿�, �μ���ȣ�� �޿��� ���� ������ ����϶�.
-- ��, �޿��� ���� ������ �� ����� �� ���� ����� ���� ���� ����϶�.
SELECT employee_id ���, first_name || ' ' || last_name �̸�, salary �޿�, department_id �μ���ȣ
FROM employees
ORDER BY salary DESC, employee_id DESC; --�̷��� ������ �� �ɾ��� �� ����. �տ� �ִ� �� ù��° ������ �ٰ�> �ι�° ����> .. ������ ���ĵ�

--4. �Ի����� ���� �ֱ��� ���������� ���, �̸�, �Ի����� ����϶�
SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date DESC;
--
select employee_id ���, first_name|| ' '|| last_name �̸�, hire_date �Ի���
from employees
order by 3 desc, 1 desc ; --�������ε� ��� ����

--5. �μ���ȣ�� 20,50�� �μ����� �ٹ��ϴ� ��� ������� �̸�(first_name), �μ���ȣ, �޿��� ���ĺ� ������ ����϶�
SELECT first_name, department_id, salary
FROM employees
WHERE department_id IN(20,50)
ORDER BY first_name ASC;
--
select first_name, department_id, salary
from employees
where department_id in(20,50)
order by 1 asc; --����: asc(���� ������ ����), desc(���� �ݴ� ������ ����)

---------���̺� ����221028----------------------------------------------------------------------------------------------
--Table1. ���̺� ����
CREATE TABLE EMP01(
    EMPNO NUMBER(4), --������ ������ Ÿ��(����)
    ENAME VARCHAR2(20), --20byte ������ ������ Ÿ��(��������)
    SAL NUMBER(7,2) -- ������ ������ Ÿ��(�Ǽ�)
    );
--
SELECT * FROM TAB;
--
DESC EMP01;
--Table2. ���� ���̺� ����
CREATE TABLE EMPLOYEES02
AS
SELECT * FROM EMPLOYEES;
--
SELECT * FROM TAB;
--
SELECT * FROM employees02;
--Table3-1. ALTER TABLE�� ���̺� ���� ����
--<��> EMP01 ���̺� ���� Ÿ���� ����(JOB) Į���� �߰�
SELECT * FROM EMP01;
--
ALTER TABLE EMP01
ADD(JOB VARCHAR2(9));
--
DESC EMP01;
--���� (�̹� �����ϴ� EMP01 ���̺� �Ի��� Į��(CREDATE)�� ��¥������ �߰��϶�
ALTER TABLE EMP01
ADD(CREDATE DATE);
--Table3-2. ALTER TABLE�� ���� Į�� ����
--<��> ������ �ִ� 30�ڱ��� �Է��� �� �ֵ��� ũ�� ����
ALTER TABLE EMP01
MODIFY(JOB VARCHAR2(30));
DESC EMP01;
--ALTER TABLE EMP01
--MODIFY(JOB VARCHAR2(9)); �� ���� ũ��� ���� ��. Į���� �ڷᰡ ���⶧��
--<��> ������ �ִ� 30�ڱ��� �Է��� �� �ֵ��� ũ�� ����
--Table3-3. ALTER TABLE�� ���� Į���� ����
--<��> �Ի��� �÷��� �̸��� CREDATE���� REGDATE�� �÷����� ����.
ALTER TABLE emp01
RENAME COLUMN credate TO regdate;
DESC emp01;
--Table3-4. ALTER TABLE�� ���� Į�� ����
--<��> ����(JOB) Į���� ����
ALTER TABLE emp01
DROP COLUMN job;
DESC emp01;
--Table4. DROP TABLE�� ���̺� ���� ����
--<��> EMP01 ���̺��� ����
DROP TABLE EMP01;
--���� Ȯ��
SELECT * FROM TAB;
--recyclebin ���� Ȯ��
desc recyclebin;
--������(recyclebin)����
SELECT * FROM recyclebin;
--������ ����
purge recyclebin;
--�Ǽ��� ���� ���̺��̶� ������ ����Ϸ��� ������ ���� ������� �ٽ� �����ϸ� �ȴ�.
--flashback table table_name to before drop;
FLASHBACK TABLE emp01 TO BEFORE DROP;
--���ο� �̸����� �����ϴ� ���
FLASHBACK TABLE emp01 TO BEFORE DROP
RENAME TO emp02;
--�����뿡 ���� �ʰ� �ٷ� ���̺��� �����Ϸ��� ������ ���� ������� �����뿡 ���� �ʰ� ������ �� �� �ִ�.
--drop table table_name purge;
drop table emp01 purge;
--Table5. ���̺� ���� �����ϴ� RENAME ��
--<��> EMPLOYEES02 ���̺��� �̸��� EMPLOYEES01���� ����
RENAME EMPLOYEES02 TO EMPLOYEES01;
SELECT * FROM TAB;
--Table6. ���̺��� ��� �ο츦 ������ TRUNCATE��
-- <��> EMPLOYEES01 ���̺��� ��� �ο츦 ����
SELECT * FROM employees01;
TRUNCATE TABLE employees01;
SELECT * FROM employees01;
--Table Make-----------------------
--�� ���̺� ����( ���̺� ������ �̹� ���� ��� �� ����.)
-- ���̺��: TB_CUSTOMER. �⺻Ű �������: �÷��� �ڷ��� PRIMARY KEY
CREATE TABLE TB_CUSTOMER(
    CUSTOMER_CD CHAR(7) NOT NULL PRIMARY KEY,
    CUSTOMER_NM VARCHAR2(15) NOT NULL,
    MW_FLG CHAR(1) NOT NULL,
    BIRTH_DAY CHAR(8) NOT NULL,
    PHONE_NUMBER VARCHAR2(16),
    EMAIL VARCHAR2(50),
    TOTAL_POINT NUMBER(10),
    REG_DTTM CHAR(14)
);
SELECT * FROM tb_customer;
DESC tb_customer;
-------------------Table ����221028-------------------------------------------------------
--1.
CREATE TABLE MEMBER(
    ID VARCHAR2(20) NOT NULL PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    REGNO VARCHAR2(8) NOT NULL,
    HP VARCHAR2(13),
    ADDRESS VARCHAR2(100)
);
SELECT * FROM MEMBER; -- MEMBER table ������ ��ȸ
DESC MEMBER; -- MEMBER table ��ȸ
SELECT * FROM TAB; --PDB_HR �� ������ table ��ȸ
--2.
CREATE TABLE BOOK(
    CODE NUMBER(4) NOT NULL PRIMARY KEY,
    TITLE VARCHAR2(50) NOT NULL,
    COUNT NUMBER(6),
    PRICE NUMBER(10),
    PUBLISH VARCHAR2(50)
);
SELECT * FROM BOOK;
DESC BOOK;
SELECT * FROM TAB;
--3.
CREATE TABLE BOOK_ORDER(
    NO VARCHAR2(10) NOT NULL PRIMARY KEY,
    ID VARCHAR2(20) NOT NULL,
    CODE NUMBER(4) NOT NULL,
    COUNT NUMBER(6),
    OR_DATE DATE
);
SELECT * FROM BOOK_ORDER;
DESC BOOK_ORDER;
SELECT * FROM TAB;
---------select ����221028----------------------------------------------------------------------------------------------
--1-1. DUAL ���̺�� SQL �Լ� �з�
-- �Լ��� ���� ���� �� ������ ����� ����ϱ� ���� ���̺��� DUAL ���̺�
SELECT 24*60*60
FROM departments;
--
SELECT 24*60*60
FROM DUAL; --FROM�� �� �ʿ������� ���� �� table�� �ʿ�����Ƿ� �̷� �� ���� �� DUAL�ΰ� ��.
-- DUAL ���̺��� ��� �����̳� ���� Į�� ���� ���� �ѹ��� ����ϰ� ���� �� ���� ����ϴ�
-- ���� ������ ���̺�μ� DUMMY��� �� �� �� Į������ �����Ǿ� �ִ�.
DESC DUAL;
--
SELECT*
FROM dual;
--1-2. ���� �� �Լ��� �׷��Լ��� SQL �Լ��� �з�
-- �Լ��� �̿��Ͽ� ������ ���Ǹ� �����ϰ� ǥ���� �� �ִ�.
--<��> 30�� �μ� �Ҽ� ����� �޿��� ����ϴ� ������
SELECT department_id, salary
FROM employees
WHERE department_id = 30;
--<��> �׷��Լ��� �̿��ؼ� 30�� �μ� �Ҽ� ����� �� �޿��� ���ϴ� ������

---------����Day3(22.10.31)----------------------------------------------------------------------------------------------
---------DB�����ڷ�/[����Ŭ] ���Ἲ ���� ����----------------------------------------------------------------------------------------------
-- 1. NOT NULL ��������
CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DEPTNO NUMBER(4)
);
--
INSERT INTO EMP01
VALUES(NULL,NULL,'SALESMAN',30);
--
SELECT * FROM EMP01;
--NOT NULL ����
DROP TABLE EMP01 PURGE; -- emp01 ����
CREATE TABLE EMP01(
    EMPNO NUMBER(4) NOT NULL,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(4)
);
--
--INSERT INTO emp01
--VALUES(null,null,'salesman',30); -- not null�� �����Ͽ��� ������ null�� �����
--
INSERT INTO EMP01
VALUES(7499,'allen','salesman',30);
--
SELECT*FROM EMP01;
-- 2. UNIQUE �������� /�̶� Ư�� Į���� ���� �ڷᰡ �ߺ����� �ʰ� �ϴ� ���̴�.
DROP TABLE EMP02;
CREATE TABLE EMP02(
    EMPNO NUMBER(4) UNIQUE,
    ename VARCHAR(10) NOT NULL,
    job VARCHAR2(9),
    deptno NUMBER(4)
);
--
INSERT INTO EMP02(empno, ename, job, deptno)
VALUES(7499, 'allen', 'salesman', 30);
--
--INSERT INTO emp02(empno, ename, job, deptno)
--VALUES(7499, 'allen', 'salesman', 30);
--7499�� UNIQUE�� �����Ǿ��� ������ ���Ἲ ���� ���ǿ� ����˴ϴ�. ��� ������ �߻��Ѵ�.
INSERT INTO EMP02(empno, ename, job, deptno)
VALUES(NULL, 'jones', 'manager', 20);
--
INSERT INTO EMP02(empno, ename, job, deptno)
VALUES(NULL, 'jones', 'salesman', 10); -- null�� ���Ἲ ���� ���ǿ� ������� �ʴ´�.
SELECT * FROM EMP02;
--3. ������ ��ųʸ� / �����ͺ��̽� �ڿ��� ȿ�������� �����ϱ� ���� �پ��� ������ �����ϴ� �ý��� ���̺���
-- ������ ��ųʸ���� �Ѵ�.
SELECT table_name FROM user_tables
ORDER BY table_name DESC; --HR ����ڰ� ������ ���̺��� �̸��� ��ȸ�Ѵ�.
--4. �������� Ȯ���ϱ�
SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name = 'EMP02';
--
SELECT owner, constraint_name, table_name, column_name FROM user_cons_columns
WHERE table_name = 'EMP02';
--5. �������� ������ ���� PRIMARY KEY ��������
DROP TABLE EMP03;
CREATE TABLE EMP03(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    job VARCHAR(9),
    petino NUMBER(4)
);
--
INSERT INTO EMP03
VALUES(7499,'allen','salesman',30);
--
SELECT * FROM EMP03;
--
--INSERT INTO EMP03
--VALUES(7499,'jones','manager',20); --���Ἲ ���� ���� ����
--
--INSERT INTO EMP03
--VALUES(null,'jones','manager',20); -- null �� ���� �Ұ�
SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name = 'EMP03';
--6. ���� ���Ἲ�� ���� FOREIGN KEY ���� ����
CREATE TABLE DEPT01(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(14) NOT NULL,
    LOC VARCHAR2(13)
);
INSERT INTO DEPT01 (DEPTNO,DNAME,LOC)VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT01 (DEPTNO,DNAME,LOC)VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT01 (DEPTNO,DNAME,LOC)VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT01 (DEPTNO,DNAME,LOC)VALUES(40,'OPERATIONS','BOSTON');
-- �ܷ� Ű ���� ���ǿ� �������� ���� EMP03���̺� �μ� ���̺� �������� ���� 50�� �μ���ȣ ����
INSERT INTO EMP03
VALUES(7566,'JONES','MANAGER',50);
SELECT * FROM EMP03;
SELECT * FROM DEPT01;
--�ܷ�Ű ����
CREATE TABLE EMP04(
    EMPNO NUMBER(2) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO)
);
ALTER TABLE EMP04 MODIFY EMPNO NUMBER(4);--���� EMPNO NUMBER4�� 2�� ��Ÿ�ļ� �����ؾߵ���
--
INSERT INTO EMP04
VALUES(7499,'ALLEN','SALESMAN',30);
SELECT*FROM EMP04;
--
INSERT INTO EMP04
VALUES(7566,'JONES','MANAGER',50); --50�� ������ 50���� �������� �ʱ� ������ ��������� �߰� �ȵǰ� ���� �߻�
INSERT INTO EMP04
VALUES(7566,'JONES','MANAGER',30);
--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP04';
--7. CHECK ���� ���� / �ԷµǴ� ���� üũ�Ͽ� ������ �� �̿��� ���� ������ ���� �޽����� �Բ�
-- ����� ������� ���ϰ� �Ǵ� �� �̴�.
CREATE TABLE EMP05(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    GENDER VARCHAR2(1) CHECK (GENDER IN('M','F'))
);
--
INSERT INTO EMP05(EMPNO, ENAME,GENDER)
VALUES(7566, 'JONES', 'M');
SELECT * FROM EMP05;
--
--INSERT INTO EMP05(EMPNO, ENAME, GENDER) VALUES(7566,'JONES','A');
--üũ �������ǿ� ����Ǿ����ϴ�. ���� �߻�
DROP TABLE EMP06 PURGE; -- emp06 ����
--5-2. ���� ���Ǹ� �����ϱ�
CREATE TABLE EMP06(
    EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
    JOB VARCHAR2(9) CONSTRAINT EMP06_JOB_UK UNIQUE,
    DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT01(DEPTNO)
);
--
INSERT INTO EMP06
VALUES(7499,'ALLEN','SALESMAN',30);
SELECT*FROM EMP06;
SELECT*FROM DEPT01;
--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP06';
--
INSERT INTO EMP06 VALUES(7499,'ALLEN','SALESMAN',30);
--������ ���� ������ �����ߴµ� �⺻Ű ����7499�� �ߺ������ �ȵǰ� ����Ű�� SALESMAN�� �ߺ���� �ȵ�.
SELECT * FROM DEPT01;
INSERT INTO EMP06 VALUES(7499,NULL,'SALESMAN',50);
--ENAME���� NOT NULL ��������� �ɷ��ִ�.
INSERT INTO EMP06 VALUES(7499,'ALLEN','SALESMAN',50);
--�θ� Ű�� DEPT�� 50�� ����. �갡 ���� ���̱� ������ ������ ���� �Ǿ����
INSERT INTO EMP06 VALUES(7500,'ALLEN','SALESMAN',50);
INSERT INTO EMP06 VALUES(7500,'ALLEN','MANAGER',50);
--50�� ������ ������ OK
--�� TEST
CREATE TABLE JB01(
    EMPNO NUMBER(4) CONSTRAINT JB01_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT JB01_ENAME_NN NOT NULL,
    JOB VARCHAR2(9) CONSTRAINT JB01_JOB_UK UNIQUE,
    EYE NUMBER(1) CONSTRAINT JB01_EYE_UK UNIQUE,
    --NOSE NUMBER(1) CONSTRAINT JB01_NOSE_UK PRIMARY KEY, -- �ϳ��� �⺻Ű�� ���� �� �����Ƿ� ����
    DEPTNO NUMBER(2) CONSTRAINT JB01_DEPTNO_FK REFERENCES DEPT01(DEPTNO)
);
--3.���̺� ���� ���� ����� �⺻ ����
--�÷� ������ ���� ������ �����ϴ� ���
CREATE TABLE EMP07(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) UNIQUE,
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO)
);
--���̺� ������ ���� ������ �����ϴ� ���
CREATE TABLE EMP08(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2),
    PRIMARY KEY(EMPNO),
    UNIQUE(JOB),
    FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO)
);
--���� ���� Ȯ��
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP08';
--4.�������� �����ϱ�
CREATE TABLE EMP09(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    DEPTNO NUMBER(4)
);
--���� ���� �����ϱ�
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP09';
-- EMP09 ���̺��� EMPNO Į���� �⺻Ű�� �����ϰ� DEPTNO Į���� �ܷ�Ű�� �����Ѵ�.
ALTER TABLE EMP09
ADD PRIMARY KEY(EMPNO);
--
ALTER TABLE EMP09
ADD CONSTRAINT EMP09_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO);
--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP09';
--���� ���� �����ϱ�
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP06';
--
SELECT * FROM EMP06;
--INSERT INTO EMP06
--VALUES(7499,'ALLEN','MANAGER',50);
--
ALTER TABLE EMP06
DROP CONSTRAINT EMP06_EMPNO_PK;
--
ALTER TABLE EMP06
DROP CONSTRAINT EMP06_DEPTNO_FK;
--5.�ܷ�Ű�� ������ ������ ����
CREATE TABLE DEPT02(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13),
    CONSTRAINT DEPT02_DEPTNO_PK PRIMARY KEY(DEPTNO)
);
--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT02';
--
INSERT INTO DEPT02 VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT02 VALUES(20,'RESEARCH', 'DALLAS');

SELECT * FROM DEPT02;

DROP TABLE EMP02;

CREATE TABLE EMP02(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2),
    CONSTRAINT EMP02_EMPNO_PK PRIMARY KEY(EMPNO),
    CONSTRAINT EMP02_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT02(DEPTNO)
);
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP02';
--
INSERT INTO EMP02 VALUES(7499,'ALLEN','SALESMAN',10);
INSERT INTO EMP02 VALUES(7369,'SMITH','CLERK',20);
SELECT * FROM EMP02;
--
--DELETE FROM DEPT02 WHERE DEPTNO=10; �ڽ� ���ڵ� �߰�
---------����Day3(22.11.01)-----------------------------------------------
--�÷� ����
DROP TABLE TREATMENT;
DROP TABLE DOCTOR;
CREATE TABLE TREATMENT(
    T_NO NUMBER(4) NOT NULL PRIMARY KEY,
    T_COURSE_ABBR VARCHAR2(3) NOT NULL UNIQUE,
    T_COURSE VARCHAR2(30) NOT NULL,
    T_TEL VARCHAR2(15) NOT NULL
);
SELECT * FROM TREATMENT;
-- ���̺� ����
DROP TABLE TREATMENT;
CREATE TABLE TREATMENT(
    T_NO NUMBER(4) NOT NULL,
    T_COURSE_ABBR VARCHAR2(3) NOT NULL,
    T_COURSE VARCHAR2(30) NOT NULL,
    T_TEL VARCHAR2(15) NOT NULL,
    CONSTRAINT TREATMENT_T_NO_PK PRIMARY KEY(T_NO),--PRIMARY KEY(T_NO),
    CONSTRAINT TREATMENT_T_COURSE_ABBR_UK UNIQUE(T_COURSE_ABBR)--UNIQUE T_COURSE_ABBR
);
INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1001, 'NS', '�Ű�ܰ�', '02-3452-1009');
INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1002, 'OS', '�����ܰ�', '02-3452-2009');
INSERT INTO TREATMENT(T_NO, T_COURSE_ABBR, T_COURSE, T_TEL)
VALUES(1003, 'C', '��ȯ�⳻��', '02-3452-3009');

SELECT * FROM TREATMENT;

CREATE TABLE DOCTOR(
    D_NO NUMBER(4) NOT NULL,
    D_NAME VARCHAR2(20) NOT NULL,
    D_SSN CHAR(14) NOT NULL,
    D_EMAIL VARCHAR2(80) NOT NULL,
    D_MAJOR VARCHAR2(50) NOT NULL,
    T_NO NUMBER(4),
    CONSTRAINT DOCTOR_D_NO_PK PRIMARY KEY(D_NO)
);
ALTER TABLE DOCTOR
ADD CONSTRAINT DOCTOR_T_NO FOREIGN KEY(T_NO) REFERENCES TREATMENT(T_NO)
ON DELETE CASCADE;

INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN, D_EMAIL, D_MAJOR, T_NO)
VALUES(1,'ȫ�浿','660606-1234561','javauser@naver.com','ô�߽Ű�ܰ�',1001);
INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN, D_EMAIL, D_MAJOR, T_NO)
VALUES(2,'����ȯ','690724-1674536','jaehwan@naver.com','������,�������ܰ�',1003);
INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN, D_EMAIL, D_MAJOR, T_NO)
VALUES(3,'����ȯ','700129-1328962','sheep1209@naver.com','�ΰ�����,������',1002);
INSERT INTO DOCTOR(D_NO, D_NAME, D_SSN, D_EMAIL, D_MAJOR, T_NO)
VALUES(4,'�����','720901-1348940','seunghyeon@naver.com','����ܰ�,�ܻ�����',1002);

DELETE FROM TREATMENT WHERE T_NO = 1002;
SELECT * FROM TREATMENT;
SELECT * FROM DOCTOR;

ROLLBACK;
ALTER TABLE DOCTOR
DROP CONSTRAINT DOCTOR_T_NO;

ALTER TABLE DOCTOR
ADD CONSTRAINT DOCTOR_T_NO FOREIGN KEY(T_NO) REFERENCES TREATMENT(T_NO)
ON DELETE SET NULL;

DELETE FROM TREATMENT WHERE T_NO = 1002;
SELECT * FROM TREATEMENT;
SELECT * FROM DOCTOR;
