--[����Ŭ] ������ �Լ� ���� ����
--����1) �� ����� ��(last_name)�� 's'�� ������ ����� �̸�(�̸� ��������)�� ������ �Ʒ��� 
--���� ���� ����ϰ��� �Ѵ�. ��� �� ���� �̸��� ù ���ڰ� �빮��, ������ ��� �ҹ��ڷ� ����ϰ�
--�Ӹ����� Employee JOBs�� ǥ���Ͻÿ�.
SELECT INITCAP(first_name) || ' ' || INITCAP(last_name) || ' is a ' || LOWER(job_id) AS "Employee JOBs"
FROM employees
WHERE last_name LIKE '%s'
ORDER BY last_name;
--����2) EMPLOYEES Table���� �̸�, �޿�, Ŀ�̼�, �ݾ�, �Ѿ�(�޿� + Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ����϶�.
--��, Ŀ�̼��� NULL�� ����� �����Ѵ�.
SELECT first_name �̸�, salary �޿�, commission_pct Ŀ�̼�, (salary+commission_pct) �Ѿ� --�ݾ�(?), 
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 4 DESC;
--����3)�̹� �б⿡ 60�� IT �μ����� �ű� ���α׷��� �����ϰ� �����Ͽ� ȸ�翡 �����Ͽ���. �̿� �ش� �μ��� ���
--�޿��� 12.3% �λ��ϱ�� �Ͽ���. 60�� IT�μ� ����� �޿��� 12.3% �λ��Ͽ� ������(�ݿø�) ǥ���ϴ� ������ �ۼ��Ͻÿ�.
--��� ������ ���, �̸��� ��(Name���� ��Ī), �޿�, �λ�� �޿�(Increased Salary�� ��Ī)������ ����Ѵ�.
SELECT department_id, first_name || ' ' || last_name AS Name, salary, ROUND((salary + (salary * 0.123))) AS "Increased Salary"
FROM employees
WHERE department_id = 60;
--����4) �޿��� $1,500���� $3,000 ������ ����� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���.
--�̸� �̸�, �޿�, ȸ��(�Ҽ������� �ݿø�)�� ����϶�.
SELECT first_name �̸�, salary �޿�,
    CASE WHEN (salary > 1500 AND salary < 3000) THEN ROUND(salary * 0.15)
        ELSE salary
        END ȸ��
FROM employees
ORDER BY salary;
--����5) ��� ����� �Ǽ��ɾ��� ����Ͽ� ����϶�. ��, �޿��� ���� ������ �̸�, �޿�, �Ǽ��ɾ��� ����϶�.
--(�Ǽ��ɾ��� �޿��� ���� 10%�� ������ �� �ݾ�)
SELECT first_name �̸�, salary �޿�, salary - (salary * 0.1) �Ǽ��ɾ�
FROM employees
ORDER BY salary DESC;
--����6) ��� ����� ������ ǥ���ϴ� ������ �ۼ��Ϸ��� �Ѵ�.
--������ ����� ���� �̸�(Name���� ��Ī), �޿�, ���翩�ο� ���� ������ �����Ͽ� ����Ͻÿ�.
--���翩�δ� ������ ������ "Salary + Commission", ������ ������ "Salary only"��� ǥ���ϰ�,
--��Ī�� ������ ���δ�. ���� ��� �� ������ ���� ������ �����Ѵ�.

--���1(DECODE �Լ��� SQL���� ����Ŭ���� ���Ǵ� �����̶� CASE WHEN�� �ǵ��� ����Ϸ��� �Ѵ�.)
SELECT first_name || ' ' || last_name Name, salary �޿�,
    CASE WHEN commission_pct IS NOT NULL THEN salary + (salary*commission_pct)ELSE salary END "���翩�ο� ���� ����",
    CASE WHEN commission_pct IS NOT NULL THEN 'Salary + Commission'ELSE 'Salary only' END ���翩��
FROM employees
ORDER BY salary DESC;

--���2
SELECT first_name || ' ' || last_name Name, salary �޿�,
    NVL2(commission_pct,salary + (salary*commission_pct),salary) "���翩�ο� ���� ����",
    NVL2(commission_pct,'Salary + Commission','Salary only') ���翩��
FROM employees
ORDER BY salary DESC;
