---------����Day1(22.10.27)-----------------------------------------------
--[����Ŭ] �⺻ SELECT��
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