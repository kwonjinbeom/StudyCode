--2022-11-01
--[����Ŭ] �׷��Լ� ���� ����
--1. EMPLOYEES ���̺��� �μ� �ο��� 5���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����϶�.
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID), SUM(SALARY) SUM_SALARY
FROM EMPLOYEES
HAVING COUNT(DEPARTMENT_ID) > 5
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--3��, 5��, 7��
--3. EMPLOYEES ���̺��� �μ���ȣ�� 10�� ��������� �׹�ȣ�� 50�� ����������� ���� ����϶�.
SELECT 
    COUNT(CASE WHEN department_id =10 THEN employee_id END)  "10���μ��ο���",
    COUNT(CASE WHEN department_id =20 THEN 1 END)  "20���μ��ο���",
    --���� ���� ���� THEN �������� ���̴�. ������ CASE WHEN�� COUNT ���ο� ����� ��
    --THEN ���Ŀ� ���� ��Ī�ϻ� �ǹ̰� ����. �� COUNT�� ���� ���� ���� ���� �ȴ�.
    COUNT(CASE WHEN department_id =30 THEN employee_id END)  "30���μ��ο���",
    COUNT(CASE WHEN department_id =40 THEN employee_id END)  "40���μ��ο���",
    COUNT(CASE WHEN department_id =50 THEN employee_id END)  "50���μ��ο���"
FROM employees;

--5. EMPLOYEES ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT TO_CHAR(hire_date, 'YYYY') H_YEAR, COUNT(*) �����, MIN(salary) �ּұ޿�, MAX(salary) �ִ�޿�,
        ROUND(AVG(salary),2) "�޿��� ���", SUM(salary) "�޿��� ��"
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY TO_CHAR(hire_date, 'YYYY');

-- 6. �� �μ� �� ��� �޿��� 10000 �̻��̸� �ʰ�, �׷��� ������ �̸��� ����϶�. �� �μ���ȣ�� ���� ����� �����Ѵ�.
SELECT * FROM employees;
SELECT department_id �μ���ȣ, ROUND(AVG(salary)) �μ�����ձ޿�,
    CASE WHEN ROUND(AVG(salary)) >= 10000 THEN '�ʰ�'
        ELSE '�̸�'
        END ��ձ޿�
FROM employees
GROUP BY department_id
HAVING department_id IS NOT NULL
ORDER BY department_id;
-- 7. EMPLOYEES ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT COUNT(TO_CHAR(hire_date, 'YYYY')) TOTAL,
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2001' THEN 1 END) "2001�⵵",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2002' THEN 1 END) "2002�⵵",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2003' THEN 1 END) "2003�⵵",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2004' THEN 1 END) "2004�⵵",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2005' THEN 1 END) "2005�⵵",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2006' THEN 1 END) "2006�⵵",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2007' THEN 1 END) "2007�⵵",
    COUNT(CASE WHEN TO_CHAR(hire_date, 'YYYY') = '2008' THEN 1 END) "2008�⵵"
FROM employees;
-- 3�� 7�� �ΰ�����
-- COUNT, SUM, MAX ���� �׷� �Լ���� �Ҹ���. ������ ���� �׷� �Լ��� ������ �� �ʼ������� GROUP BY����
-- ����ؾ� �Ѵٰ� ���������� �׷� �Լ��� Į�����θ� �̷������ ��� ����� �ʿ䰡 ����. 
--���
-- ���� 1. ���� ���������� Į�� �� �׷� ���� ����� Į���� ����.(TOTAL Į�� ���� �׷� �Լ� Į���̱� ����)
-- �׷��Ƿ� �׷� �Լ��� Į���� �����Ѵ�.
-- ���� 2. �׷� �Լ� Į���� �Ϲ� Į���� �� ���� ������ ��� �׷� �Լ��� ����ؾ� �Ѵ�.

select sysdate from dual;
--TO_CHAR, TO_DATE ����
select TO_DATE('2018.12.28','YY.MM.DD') ����
from dual;

DROP TABLE TEST1;
CREATE TABLE TEST1(
    date_test DATE
);
INSERT INTO TEST1
VALUES('18.12.28');
SELECT * FROM TEST1;

select to_char('18/12/28','YYYYMMDD')����
from dual;

SELECT TO_CHAR(TO_DATE('2018.12.28','YY.MM.DD'),'YYYYMMDD')
from DUAL;
SELECT TO_CHAR(TO_DATE('2018.12.28','YY.MM.DD'),'YYYY-MM-DD')
from DUAL;
SELECT TO_CHAR(TO_DATE('20/10/13','YY/MM/DD'),'YYYY"-"MM"-"DD')
FROM DUAL;

    