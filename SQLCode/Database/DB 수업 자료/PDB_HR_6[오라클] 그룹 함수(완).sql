--2022.11.03
--[����Ŭ] �׷� �Լ�
--<��> ������ �� �޿� ���ϱ�(SUM �Լ�)
SELECT SUM(SALARY)
FROM EMPLOYEES;
SELECT TO_CHAR(SUM(SALARY), '$999,9999')AS TOTAL
FROM EMPLOYEES;
--<��> ������ ��� �޿� ���ϱ�(AVG�Լ�)
SELECT AVG(SALARY) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY),1) FROM EMPLOYEES;
--<��> �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ������ �Ի��� ����ϱ�(MAX/MIN �Լ�)
SELECT TO_CHAR(MAX(HIRE_DATE), 'YYYY-MM-DD'), TO_CHAR(MIN(HIRE_DATE), 'YYYY-MM-DD')
FROM EMPLOYEES;
--<��> ��ü ����� ���� Ŀ�̼��� �޴� ����� ��
SELECT COUNT(*), COUNT(COMMISSION_PCT)
FROM EMPLOYEES;
--<����> JOB�� ������ �� ������ ��, �ߺ����� ���� ������ ������ ���غ���
SELECT COUNT(DISTINCT JOB_ID)
FROM EMPLOYEES;
--GROUP BY ���� �׳� Ȱ���غ���
SELECT COUNT(DISTINCT JOB_ID), JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID;
--���÷��� �׷� �Լ��� ���� ����� �� ������ ��
--2. GROUP BY ���� ����� Ư�� �������� �������� �׷�ȭ�ϱ�
SELECT FIRST_NAME, MIN(SALARY) FROM EMPLOYEES; --���� �߻�(���� �׷��� �׷� �Լ��� �ƴմϴ�.)
--������� �μ���ȣ�� ��������
SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--<��> �μ��� �ִ� �޿��� �ּ� �޿� ���ϱ�
SELECT DEPARTMENT_ID, MAX(SALARY)"�ִ� �޿�", MIN(SALARY)"�ּ� �޿�"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
--
SELECT DEPARTMENT_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, SALARY DESC;
--
SELECT DEPARTMENT_ID, MAX(SALARY)"�ִ� �޿�", MIN(SALARY)"�ּ� �޿�"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--<��> �Ҽ� �μ��� �޿��� �հ� �޿��� ��� ���ϱ�
SELECT DEPARTMENT_ID, SUM(SALARY) " �޿��� ��", AVG(SALARY) "�޿��� ���"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID,
        SUM(SALARY),
        FLOOR(AVG(SALARY)),
        ROUND(AVG(SALARY)),
        ROUND(AVG(SALARY),1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--<����> �μ����� ������ ���� Ŀ�̼��� �޴� ������ ���� ī��Ʈ�� ����
SELECT DEPARTMENT_ID, COUNT(*) AS "������ ��", COUNT(COMMISSION_PCT) AS "Ŀ�̼��� �޴� ������ ��"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
SELECT * FROM EMPLOYEES;
--<�߰� ����> �޿��� 8000�̻��� ����鸸 ī��Ʈ �� ����.
SELECT DEPARTMENT_ID, COUNT(*), COUNT(COMMISSION_PCT)
FROM EMPLOYEES
WHERE SALARY >= 8000
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--������� �ֽ� <����> 30�� �μ��� ���� ���� �Ⱓ �ٹ��� ����� �Ի����� ����϶�.
SELECT MAX(HIRE_DATE), DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=30
GROUP BY DEPARTMENT_ID;
--������� �ֽ� <����> �μ��� ���� ������ ����ϴ� ��� ���� ���϶�.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID, JOB_ID;
--3)HAVING ����
--SELECT ���� ������ ����Ͽ� ����� ������ ���� WHERE���� ���������, �׷��� �����
--������ ���� HAVING���� ����Ѵ�.
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 5000
ORDER BY DEPARTMENT_ID;
--
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 5000
ORDER BY DEPARTMENT_ID;
--����� <����>�μ��� �޿��� ����� ���Ͽ� �� ����� 5000�̻��� �μ��� ��ȸ�ϵ��� ������ �ۼ�.
SELECT DEPARTMENT_ID, FLOOR(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING FLOOR(AVG(SALARY)) >= 5000
ORDER BY DEPARTMENT_ID;
-- �μ��� �ο����� ���Ͽ� �� �ο����� 4�� �ʰ��ϴ� �μ��� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�.
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
HAVING COUNT(EMPLOYEE_ID) > 4
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--�μ������� ���� ����(����)�� ����ϴ� ����� �޿��� �հ� �����
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) --�μ��� ������ �޿��� �� �� �����
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;
UNION ALL 
--�μ��� �޿��� �հ� ��� ��
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
UNION ALL
--��ü ����� �޿��� �հ� �����
SELECT NULL DEPARTMENT_ID, NULL JOB_ID, COUNT(SALARY)
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID;

--�μ������� ���� ����(����)�� ����ϴ� ����� �޿��� �հ� �����
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) --�μ��� ������ �޿��� �� �� �����
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
UNION ALL
SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
UNION ALL
SELECT NULL DEPARTMENT_ID, NULL JOB_ID, COUNT(SALARY)
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, JOB_ID;

--4)�� ���غ� �Ұ踦 ����ؼ� �����ִ� ROLLUP�Լ�
--ROLLUP()�� ������ �÷����� �Ұ�(��ü�� �ƴ� ��� �� �κи��� ���� �հ�)�� ������ �Ǵ� �÷����̴�.
--�μ��� ������ �޿��� �� �� ������� �μ��� �޿��� �հ� �����, ��ü ����� �޿��� �հ� ������� ���ϼ���
-- -�μ��� ������ �޿��� �� �� �����, -�μ��� �޿��� �հ� �����, -��ü ����� �޿��� �հ� �����
--(�μ��ڵ尡 �ٲ𶧸��� �μ��� ���谡 ��µǰ� ��� �μ��� ��µǸ� ��ü ���������� ��µȴ�.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;
--
SELECT JOB_ID, DEPARTMENT_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY ROLLUP(JOB_ID, DEPARTMENT_ID) ORDER BY JOB_ID;
--5)CUBE(exp1, exp2, ...) - �Ұ�� ��ü �հ���� ����ϴ� �Լ�
--CUBE()�� ����� ǥ���� ������ ���� ������ ��� ���պ��� ������ ����� ��ȯ�Ѵ�.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY CUBE(DEPARTMENT_ID,JOB_ID);

--6)���� ������
CREATE TABLE exp_goods_asia ( --�ѱ��� �Ϻ��� 10�� ����ǰ ���̺�
    country VARCHAR2(10), -- �����
    seq NUMBER, --��ȣ
    goods VARCHAR2(80) -- ��ǰ��
);
INSERT INTO exp_goods_asia VALUES('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 6, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 7, '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 8, 'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 9, '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES('�ѱ�', 10, 'ö �Ǵ� ���ձݰ�');

INSERT INTO exp_goods_asia VALUES('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES('�Ϻ�', 10, '����');
SELECT * FROM EXP_GOODS_ASIA;
--
SELECT * FROM EXP_GOODS_ASIA WHERE COUNTRY = '�ѱ�';
SELECT * FROM EXP_GOODS_ASIA WHERE COUNTRY = '�Ϻ�';
--
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�ѱ�'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�Ϻ�';

--20221104
--[����] hr ��Ű���� �ִ� JOB_HISTROY ���̺��� ������� ���� ���� �̷��� ��Ÿ���� ���̺��̴�.
--�� ������ �̿��Ͽ� ��� ����� ���� �� ������ ���� �̷� ������ ����ϰ��� �Ѵ�. �ߺ��� ���
--������ ���� ��� �� ���� ǥ���Ͽ� ����Ͻÿ�.
SELECT employee_id, job_id
FROM employees
UNION 
SELECT employee_id, job_id
FROM job_history;
--[����] �� ����� �̿��Ͽ� ��µ� 176�� ����� ���� �̷��� ���� ��¥ �̷��� ��ȸ�Ͻÿ�.
SELECT employee_id, job_id, NULL AS "Strat Date", NULL AS "End Date"
FROM employees
WHERE employee_id = 176
UNION
SELECT employee_id, job_id, start_date, end_date
FROM job_history
WHERE employee_id = 176;
--
UNION ALL
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�ѱ�'
UNION ALL
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�Ϻ�';
--<����> �� �������� �� ����� ���� �̷� ������ Ȯ���Ͽ���. ������ ��� ����� ���� �̷� ��ü��
--������ ���ߴ�. ���⿡���� ��� ����� ���� �̷� ���� ���� �� ���� ���濡 ���� �μ� ������
--����� ������� ����Ͻÿ�.
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id;
-- ��INTERSECT ������
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�ѱ�'
INTERSECT
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�Ϻ�';
--<����> ������� ���̺� JOB_ID�� ����� ���� ������ ���ϰ�, JOB_HISTORY�� JOB_ID�� �����
--���� ������ ���Ѵ�. �� �� ���̺��� �����غ��� ������ ����� ����� ������ �� �� ������ ������
--�� �� �ߴ� ���� ������ �״�� �ϰ� �ִ� ����� ������ �� �� �ִ�. ������ �� �� �ߴ�
-- ���� ������ ���� �ִ� ����� ����� ������ ����Ͻÿ�.
SELECT JOB_ID, EMPLOYEE_ID
FROM EMPLOYEES
INTERSECT
SELECT JOB_ID, EMPLOYEE_ID
FROM JOB_HISTORY;
--��MINUS ������
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�ѱ�'
MINUS
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�Ϻ�';
--<����> �츮 ȸ��� 1�⿡ �� �� ������ �����Ͽ� ��ü���� ȸ�� ������ ������� �������� �ϴ�
--Role change ��å�� �����ϰ� �ִ�. �̹� �λ��̵� �� ���� ������ ����� ���� ���� ������� ����
--�� ������ �̵���Ű���� �Ѵ�. HR�μ��� ������� ���̺�� �����̷����� ���̺��� �̿��Ͽ� �� ����
--������ ������� ���� ����� ����� ����Ͻÿ�.
SELECT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
MINUS
SELECT JOB_ID, DEPARTMENT_ID
FROM JOB_HISTORY;
--������ �������� ���� ����
--ORA-01789:���� ����� ����Ȯ�� ���� ��� ���� ������ �ֽ��ϴ�.
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�ѱ�'
UNION
SELECT SEQ, GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�Ϻ�';
--ORA-01790: �����ϴ� �İ� ���� ������ �����̾�� �մϴ�.
SELECT SEQ
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�ѱ�'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�Ϻ�';
--���� �����ڷ� SELECT���� ������ �� ORDER BY ���� �� ������ ���忡���� ����� �� �ִ�.
-- ORA--00933: SQL ��ɾ �ùٸ��� ������� �ʾҽ��ϴ�.
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�ѱ�'
ORDER BY GOODS
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�Ϻ�';
--�ùٸ��� ����
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�ѱ�'
UNION
SELECT GOODS
FROM EXP_GOODS_ASIA
WHERE COUNTRY = '�Ϻ�'
ORDER BY GOODS;
-- ��GROUPING SETS��/ GROUP SETS�� ROLLUP�̳� CUBEó�� GROUP BY ���� ����ؼ� �׷� ������ ���
--�Ǵ� ���̴�. GROUPING SETS�� �׷� �����̱� �ϳ� UNION ALL ������ ���� �ֱ� �����̴�.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY GROUPING SETS(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;
--�� �μ��� ������ ���� ����� ���
SELECT DEPARTMENT_ID, JOB_ID--, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
--GROUP BY GROUPING SETS(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;
--���� ������ ���� ����� ���´�.
SELECT DEPARTMENT_ID, JOB_ID--, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID;
--���� ������ ���� ����� ���� �� �� �޿��� ���ġ ��� ����
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID;
--���� ������ ���� ����� ���� �� �� �޿��� ���ġ�� ���ش�.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY GROUPING SETS(DEPARTMENT_ID, JOB_ID)
ORDER BY DEPARTMENT_ID;