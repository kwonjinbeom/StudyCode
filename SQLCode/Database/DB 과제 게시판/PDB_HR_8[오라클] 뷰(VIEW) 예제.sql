--8[����Ŭ] ��(VIEW) ����
--������� ������ �����ϽŰǰ�? �ƹ�ư �ܿ� ����� �ẽ
--1. �й�, �л���, �а����� ����ϴ� �並 �ۼ��϶�
--2. ������û�� �л��� �а���, �й�, �л���, ��ȭ��ȣ, �̸���, �ּ�, ������û����,
-- ������û��(2021-03-01����)�� ����ϴ� �並 �ۼ��϶�.

--������ ����
--�а� ���̺� �Ϸù�ȣ�� �ڵ� �����ϱ� ���� ������ ������ �ֽð� ���ڵ� 2������ �Է��ϼż� �׽�Ʈ���ּ���.
--�л� ���̺� �Ϸù�ȣ�� ���� ������ ����(���̺��_seq �Ǵ� seq ���̺��)
--�������̺��� �Ϸù�ȣ�� ���� 

--1. ��� ��ȣ�� ������ �μ���� �μ��� ��ġ�� ����ϴ� ��(VIEW_LOC)�� �ۼ��϶�.
drop table view_loc;
CREATE OR REPLACE VIEW VIEW_LOC
AS
SELECT employee_id , FIRST_NAME, DEPARTMENT_NAME, LOCATION_ID
FROM EMPLOYEES e INNER JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id;
-- employees, departments ���� �̷��� , �� īƼ�� �� ��� �� ��� �����͸� ����ϱ� ����
-- �ش� ����� ���þ��� �μ����� ��� ����Ѵ�.
SELECT * FROM view_loc;
--2.30�� �μ� �Ҽ� ����� �̸��� �Ի��ϰ� �μ����� ����ϴ� ��(VIEW_DEPT30)�� �ۼ��϶�.
DROP table VIEW_DEPT30;
CREATE OR REPLACE VIEW VIEW_DEPT30
AS
SELECT FIRST_NAME, DEPARTMENT_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID = 30;

SELECT * FROM VIEW_DEPT30;
--3.�μ��� �ִ� �޿� ������ ������ ��(VIEW_DEPT_MAXSAL)�� �����϶�.
DROP TABLE VIEW_DEPT_MAXSAL;
CREATE OR REPLACE VIEW VIEW_DEPT_MAXSAL
AS
SELECT DEPARTMENT_NAME "�μ��̸�", MAX(SALARY) "�ִ� �޿�"
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME;

SELECT * FROM VIEW_DEPT_MAXSAL;