--7[����Ŭ] �������� ����
--2022-11-17
--1.������ 'ST_MAN'�� ������ �޴� �޿����� �ּ� �޿����� ���� �޴� �������� �̸��� �޿��� ����ϵ�
--�μ���ȣ�� 20���� ������ �����Ѵ�.
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID IN(SELECT JOB_ID
                FROM EMPLOYEES
                WHERE JOB_ID = 'ST_MAN') AND
    DEPARTMENT_ID != '20';
--2.EMPLOYEES ���̺��� Valli��� �̸��� ���� ������ ������ �� ������ ���� ����� ��� ������
--����ϴ� SELECT���� �ۼ��Ͻÿ�.(������� Valli�� ����)
SELECT *
FROM EMPLOYEES
WHERE (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Valli') AND FIRST_NAME != 'Valli' ;
--3.EMPLOYEES���̺��� ���� ���� ����� �����ִ� �μ���ȣ�� ������� ����϶�.
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID)
FROM EMPLOYEES 
HAVING COUNT(DEPARTMENT_ID) = (SELECT MAX(COUNT(DEPARTMENT_ID))
                            FROM EMPLOYEES
                            GROUP BY DEPARTMENT_ID)
GROUP BY DEPARTMENT_ID;
--4.EMPLOYEES���̺��� ������ �ڽ��� ���� �μ��� ��� ���޺��� ���� ����� �μ���ȣ,
--�̸�,�޿��� ����ϴ� SELECT ���� �ۼ��Ͻÿ�.
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES E
WHERE SALARY > (SELECT AVG(SALARY)
                    FROM EMPLOYEES SE
                    WHERE E.DEPARTMENT_ID = SE.DEPARTMENT_ID
                    GROUP BY DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID;
--5.2001��~2005�� ���̿� �Ի��� ����鿡 ���� �� �μ��� ������� �μ���ȣ, �μ���,
--2001���Ի��ο���, 2002���Ի��ο���, 2003���Ի��ο���, 2004���Ի��ο���, 2005���Ի��ο����� ���
SELECT  E.DEPARTMENT_ID �μ���ȣ, DEPARTMENT_NAME �μ���, 
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2001' THEN 1 END) "2001���Ի��ο���",
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2002' THEN 1 END) "2002���Ի��ο���",
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2003' THEN 1 END) "2003���Ի��ο���",
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2004' THEN 1 END) "2004���Ի��ο���",
    COUNT(CASE WHEN TO_CHAR(HIRE_DATE,'YYYY')='2005' THEN 1 END) "2005���Ի��ο���"
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID, DEPARTMENT_NAME
ORDER BY E.DEPARTMENT_ID;
--6.�μ��� ���� �հ踦 ���ϰ�, �� ����� ������ ������ ���� ǥ���Ͻÿ�.
--<Hint> CASE���� ����ϴ� ���� ����� ����� ���� �ְ�, �ζ��� ��(INLINE VIEW)�� �̿��Ͽ�
--�켱 �μ��� �޿� �հ踦 ���ϰ�, ���� �����ּ� CASE ������ �̿��Ͽ� ���� ���� �񱳸� ����
--�޿� �հ迡 ���� ǥ���� �� �� �ִ�.
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