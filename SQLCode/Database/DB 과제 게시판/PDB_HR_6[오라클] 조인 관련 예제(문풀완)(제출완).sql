--6[����Ŭ] ���� ���� ����
--1. Sales �μ� �Ҽ� ����� �̸��� �Ի����� ����϶�.
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Sales');
--2. Ŀ�̼��� �޴� ����� �̸�, Ŀ�̼� ������ �װ� ���� �μ����� ����϶�.
SELECT first_name, commission_pct, department_name
FROM employees E INNER JOIN departments D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE commission_pct is not null;
--3. IT�μ����� �ٹ��ϰ� �ִ� �����ȣ, �̸�, ����, �μ����� ����϶�.
SELECT employee_id, first_name, job_id, department_name
FROM employees e INNER JOIN departments d -- e, d �� ���� ��ҹ��ڸ� �������� ����
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE department_name = 'IT';
--4.EMPLOYEES, DEPARTMENTS ���̺��� ������ �ľ��� �� ������� 5�� �̻��� �μ��� �μ����
--������� ����Ͻÿ�. �̶� ������� ���� ������ �����Ͻÿ�.
SELECT department_name, COUNT(e.department_id)
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name
HAVING COUNT(e.department_id) >= 5
ORDER BY 2 DESC;

SELECT * FROM employees ;
SELECT * FROM departments;