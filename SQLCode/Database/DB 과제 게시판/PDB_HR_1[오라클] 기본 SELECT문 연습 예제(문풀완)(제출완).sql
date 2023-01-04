---------����221027-----------------------------------------------
--[����Ŭ] �⺻ SELECT�� ���� ����
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