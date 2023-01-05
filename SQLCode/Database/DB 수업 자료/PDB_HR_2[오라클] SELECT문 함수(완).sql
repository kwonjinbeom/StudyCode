--2022-11-03
--[����Ŭ]SELECT�� �Լ�
--1. DULAL ���̺�� SQL �Լ� �з�
--�� DAUL ���̺�
--<��> DEPARTMENTS ���̺�� 1���� �ʷ� ȯ���ϴ� ��� ������ �ۼ��ϸ� ������ ����.
SELECT 24*60*60
FROM DEPARTMENTS;
--
SELECT 24*60*60
FROM DUAL;
--
DESC DUAL;
--
SELECT*FROM DUAL;
-- �Լ��� ����Ͽ� ����� Ȯ���ϰ� ���� �� SELECT �÷� FROM DUAL;�� ����ϸ� �ȴ�.
--�� ���� �� �Լ��� �׷��Լ��� SQL �Լ� �з�
-- �Լ��� �̿��Ͽ� ������ ���Ǹ� �����ϰ� ǥ���� �� �ִ�.
--<��> 30�� �μ� �Ҽ� ����� �޿��� ����ϴ� ������
SELECT DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--<��> �׷��Լ��� �̿��ؼ� 30�� �μ� �Ҽ� ����� �� �޿��� ���ϴ� ������
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID = 30;
--2) �����Լ� / �������� ���� �����Ͽ� ��ȯ�� ���� ���� ��ȯ�Ѵ�.
--�� �ҹ��ڷ� ��ȯ�ϴ� LOWER �Լ�: �Է��� ���� ���� �ҹ��ڷ� ��ȯ�ϴ� �Լ�.
SELECT 'DataBase', LOWER('DastaBase')
FROM DUAL;
--<��> ��� ���̺��� �μ���ȣ�� 20���� ������� ��� �ҹ��ڷ� ��ȯ
SELECT FIRST_NAME, LOWER(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;
--�� �빮�ڷ� ��ȯ�ϴ� UPPER �Լ�
SELECT 'DataBase', UPPER('DataBase')
FROM DUAL;
--<��> job_id �� 'it_prog'�� ����� �˻�
SELECT EMPLOYEE_ID, FIRST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

SELECT EMPLOYEE_ID, FIRST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = UPPER('it_prog');

SELECT EMPLOYEE_ID, FIRST_NAME ,JOB_ID
FROM EMPLOYEES
WHERE LOWER(JOB_ID) = 'it_prog';
--�� ù ���ڸ� �빮�ڷ� �������� �ҹ��ڷ� ��ȯ�ϴ� INITCAP �Լ�
SELECT INITCAP('DATA BASE PROGRAM')
FROM DUAL;
--<��> ��� ���̺��� 30�� �μ��� �Ҽӵ� ����̸��� ù ���ڸ� �빮�ڷ�
SELECT EMPLOYEE_ID, FIRST_NAME, INITCAP(EMAIL)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--<����> 'jking'�̶� �̸����� ���� ������ �̸��� �޿��� Ŀ�̼��� ����϶�. (INITCAP, UPPER ���)
SELECT FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE EMAIL = UPPER('jking');
--�� �� ���ڸ� �����ϴ� CONCAT �Լ�
SELECT CONCAT('Data','Base')
FROM DUAL;
--
SELECT CONCAT(FIRST_NAME, '($' || SALARY || ')') AS "��� ����"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--�� ���� ���̸� ���ϴ� LENGTH/LENGTHB �Լ�
--���� �����, Į���� ����� ������ ���� �� ���� ���ڷ� �����Ǿ����� ���̸� �˷��ִ� �Լ�
SELECT LENGTH('DataBase'), LENGTH('�����ͺ��̽�')
FROM DUAL;
--�޸𸮿� �����ϴ� ����Ʈ ���� ���Ѵ�.
SELECT LENGTHB('DataBase'), LENGTHB('�����ͺ��̽�')
FROM DUAL;
--<��> 20�� �μ� �Ҽ� ������� �̸��� ���̸� ����ϱ�
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;
--<��> ���� �� �̸��� 4������ ������ �̸��� �ҹ��ڷ� ���
SELECT DEPARTMENT_ID, EMPLOYEE_ID, LOWER(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 4;
--<����> �̸��� 6���� �̻��� ������ ������ȣ�� �̸��� �޿��� ����϶�.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 6;
--�� ���ڿ� �Ϻθ� �����ϴ� SUBSTR/SUBSTRB �Լ�
SELECT SUBSTR('DataBase', 1, 3)
FROM DUAL;
--<��> 20�� �μ� ����� ���� �Ի� �⵵ �˾Ƴ���
SELECT FIRST_NAME, HIRE_DATE, SUBSTR(HIRE_DATE,1,2)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;
--<����> 03�⵵�� �Ի��� ��� �˾Ƴ���(�� �����ڿ� AND������, BETWEEN AND������, SUBSTR�Լ�)
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE,1,2) = '03';
SELECT * FROM EMPLOYEES;
--<����> �̸��� k�� ������ ������ �˻�
--LIKE�����ڿ� ���ϵ� ī�� (%) SUBSTR�Լ�
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%k';
--�� Ư�� ������ ��ġ�� ���ϴ� INSTR/INSTRB �Լ�
--��� ���ڿ��̳� Į������ Ư�� ���ڰ� ��Ÿ���� ��ġ�� �˷��ش�.
--<��> 30�� �μ� �Ҽ� ����̸��� e �ڰ� ��� ��ġ�ϴ��� �˷��ִ� ������
SELECT DEPARTMENT_ID, FIRST_NAME, INSTR(FIRST_NAME,'e')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--�� Ư�� ��ȣ�� ä��� LPAD/RPAD �Լ�
SELECT LPAD('DataBase',10,'$') FROM DUAL;
SELECT RPAD('DataBase',12,'@') FROM DUAL;
--�� Ư�� ���ڸ� �߶󳻴� TRIM �Լ�
SELECT TRIM('a' FROM 'aaaaDataBase programingaaaa') FROM DUAL;
--<��> Lisa�� ����� �̸����� L�� a�� �߶���.
SELECT FIRST_NAME, TRIM('L' FROM FIRST_NAME), TRIM('a' FROM FIRST_NAME)
FROM EMPLOYEES
WHERE LOWER(FIRST_NAME) = 'lisa';
--3) �����Լ�
--�� ABS �Լ�/ CEIL �Լ�/ FLOOR �Լ�
SELECT ABS(-15) FROM DUAL;
-- CEIL(n) �Լ��� �Ҽ��� �Ʒ��� �ø���. FLOOR(n) �Լ� �Ҽ��� �Ʒ��� �߶󳽴�.
SELECT CEIL(10.123), FLOOR(34.5678) FROM DUAL;
--�� Ư�� �ڸ������� �ݿø��ϴ� ROUND �Լ�
SELECT ROUND(12.345,2), ROUND(34.567,0), ROUND(56.789), ROUND(78.901,-1) FROM DUAL;
--�� Ư�� �ڸ������� �߶󳻴� TRUNC �Լ�
SELECT TRUNC(12.345,2), TRUNC(34.567,0), TRUNC(56.789), TRUNC(78.901,-1) FROM DUAL;
--�� ������ ���� ��ȯ�ϴ� MOD �Լ�
SELECT MOD(34,2), MOD(34,5), MOD(34,7) FROM DUAL;
--<����> ���� ��ȣ�� ¦���� �������� ������ȣ�� �̸��� ������ ����϶�.
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID,2) = 0;
--4)��¥�Լ�
--�� ���� ��¥�� ��ȯ�ϴ� SYSDATE 
SELECT SYSDATE FROM DUAL;
--
SELECT SYSDATE -1 ����, SYSDATE ����, SYSDATE + 1 ����
FROM DUAL;
--�� �� ��¥ ���� ������ ����ϴ� MONTHS_BETWEEN �Լ�
--<��> ��¥ ������ ���� �� ���ϱ�
SELECT FIRST_NAME, SYSDATE ����, TO_CHAR(HIRE_DATE,'YYYY/MM/DD')�Ի���,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) �ٹ��޼�
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--�� ���� ���� ���ϴ� ADD_MONTHS �Լ�
--<��> �Ի��Ͽ��� 3������ ���� ��¥�� ���϶�.
SELECT FIRST_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE,3)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--�� �ش� ������ ���� ����� ��¥�� ��ȯ�ϴ� NEXT_DAY �Լ�
SELECT SYSDATE, NEXT_DAY(SYSDATE,'������')
FROM DUAL;
--
SELECT SYSDATE, NEXT_DAY(SYSDATE,'��'), NEXT_DAY(SYSDATE,4)
FROM DUAL;
--
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
--
SELECT SYSDATE, NEXT_DAY(SYSDATE,'WEDNESDAY') FROM DUAL;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'������')
FROM DUAL;
--�� �ش� ���� ������ ��¥�� ��ȯ�ϴ� LAST_DAY�Լ�
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;
--�� ROUND �Լ��� �پ��� ����
SELECT HIRE_DATE, ROUND(HIRE_DATE, 'MONTH')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--�� TRUNC �Լ��� �پ��� ����
SELECT HIRE_DATE, TRUNC(HIRE_DATE, 'MONTH')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--5) ��ȯ�Լ�
--�� ���������� ��ȯ�ϴ� TO_CHAR �Լ�
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD'),TO_CHAR(SYSDATE,'DL') FROM DUAL;
--<��> �������� �Ի����� ����ϵ� ���ϱ��� �Բ� ����ϱ�
SELECT TO_CHAR(HIRE_DATE, 'YYYY/MM/DD DAY')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--
SELECT TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��" DAY')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

--
SELECT TO_CHAR(HIRE_DATE, 'YYYY/MON/DD DY')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD, HH24:MI:SS')
FROM DUAL;
--<��> �������
SELECT FIRST_NAME, SALARY, TO_CHAR(SALARY, '$999,999')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--
SELECT FIRST_NAME, SALARY, TO_CHAR(123456, '999,999,999')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--�� ��¥������ ��ȯ�ϴ� TO_DATE �Լ�
--<��> 2005�� 12�� 24�� �Ի��� ������ �˻�
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = TO_DATE(20051224, 'YYYYMMDD');
--<��> ���� ��ĥ�� �������� ��¥ ���
SELECT SYSDATE - '2015/12/24' FROM DUAL; --����
--<��> ���� ��ĥ�� �������� ��¥ ��� -- ���� �ذ�
SELECT TRUNC(SYSDATE - TO_DATE('2015/12/24','YYYY/MM/DD')) FROM DUAL;
--�� ���������� ��ȯ�ϴ� TO_NUMBER �Լ�
--<��> ��ġ ������ ���� ���� �� ���ϱ� -- ���� �߻�
SELECT '10,000' + '20,000' FROM DUAL;
--<��> ��ġ ������ ���� ���� �� ���ϱ� -- ���� �ذ�
SELECT TO_NUMBER('10,000','999,999') + TO_NUMBER('20,000','999,999') FROM DUAL;
--6)�Ϲ� �Լ�
--��NULL�� �ٸ� ������ ��ȯ�ϴ� NVL�Լ�/NULL�� 0 �Ǵ� �ٸ� ������ ��ȯ�ϱ� ���ؼ� ����ϴ� �Լ�
SELECT FIRST_NAME, COMMISSION_PCT, JOB_ID
FROM EMPLOYEES
ORDER BY JOB_ID; --COMISSION_PCT�� ���� NULL��
--
SELECT FIRST_NAME, SALARY, NVL(COMMISSION_PCT, 0), JOB_ID
FROM EMPLOYEES
ORDER BY JOB_ID; -- COMMISSION_PCT�� NULL���� 0���� ��ü�ߴ�.
-- <��> �޿��� Ŀ�̼��� ���� �ݾ� ���ϱ�
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*COMMISSION_PCT AS COMMISSION,
SALARY+(SALARY*COMMISSION_PCT) AS TOTAL, JOB_ID
FROM EMPLOYEES
ORDER BY JOB_ID; -- �� null������ ��
--
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*NVL(COMMISSION_PCT,0) AS COMMISSION,
SALARY+(SALARY*NVL(COMMISSION_PCT,0)) AS TOTAL, JOB_ID
FROM EMPLOYEES
ORDER BY JOB_ID; -- commission, total�� ���� ����.
-- NVL2 �Լ� 
--<��> Ŀ�̼��� NULL�� �ƴϸ� �޿� + Ŀ�̼���, NULL�̸� �޿��� ���
SELECT FIRST_NAME, SALARY, COMMISSION_PCT,
NVL2(COMMISSION_PCT,SALARY+(SALARY * COMMISSION_PCT),SALARY)TOTAL_SAL
FROM EMPLOYEES;
--<����>��� ������ �ڽ��� ���(MANAGER_ID)�� �ִ�. ������ EMPLOYEES ���̺� 
--�����ϰ� ����� ���� �ο찡 �ִµ� �� ����� MANAGER_ID Į�� ���� NULL�̴�.
--����� ���� ��ǥ�̻縸 ����ϵ� MANAGER_ID Į�� �� NULL ��� CEO�� ����Ѵ�.
SELECT EMPLOYEE_ID, FIRST_NAME, NVL(TO_CHAR(MANAGER_ID),'CEO')
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;
--��������׸� �ִ� <����> Ŀ�̼� ������ ���� �����鵵 �ִµ� Ŀ�̼��� ���� ���� �׷��� 
--'<Ŀ�̼� ����>' �� ��µǰ� �Ѵ�.
SELECT NVL(TO_CHAR(COMMISSION_PCT), '<Ŀ�̼Ǿ���>') AS COMMISSION
FROM EMPLOYEES;
--�輱���� ���� DECODE�Լ�
--SWITCH CASE ���� ���� ���� ���� ��쿡 ���ؼ� ������ �� �ִ� �Լ�
--<��> �μ��� ���ϱ�
SELECT * FROM DEPARTMENTS;
--
SELECT DEPARTMENT_ID, DECODE(DEPARTMENT_ID, 10, 'Administration',
                                            20, 'Marketing',
                                            30,'Purchasing', 
                                            40, 'Human Resources', 
                                            50, 'Shipping',
                                            60,'IT') AS DEPARTMENTS
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
--�� ���ǿ� ���� ���� �ٸ� ó���� ������ CASE �Լ�
--<��> �μ��� ���ϱ�
SELECT FIRST_NAME, DEPARTMENT_ID,
    CASE WHEN DEPARTMENT_ID = 10 THEN 'Administration'
        WHEN DEPARTMENT_ID = 20 THEN 'Marketing'
        WHEN DEPARTMENT_ID=30 THEN 'Purchasing' 
        WHEN DEPARTMENT_ID=40 THEN 'Human Resources'
        WHEN DEPARTMENT_ID=50 THEN 'Shipping'
        WHEN DEPARTMENT_ID=60 THEN 'IT'
    END DEPARTMENT_NAME
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

SELECT FIRST_NAME, DEPARTMENT_ID,
    CASE DEPARTMENT_ID  WHEN 10 THEN 'Administration'
                        WHEN 20 THEN 'Marketing'
                        WHEN 30 THEN 'Purchasing' 
                        WHEN 40 THEN 'Human Resources'
                        WHEN 50 THEN 'Shipping'
                        WHEN 60 THEN 'IT'
    END DEPARTMENT_NAME
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;
--<����> �μ����� ���� �޿��� �λ��ϵ��� ����. (������ȣ, ������, ����, �޿�)
--�μ����� 'Marketing'�� ������ 5%, 'Purchasing'�� ����� 10%,
--'Human Resources'�� ����� 15%, 'IT'�� ������ 20%�� �λ��Ѵ�.
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, JOB_ID , SALARY,
        DECODE(DEPARTMENT_ID, 20, SALARY*1.05,
                            30, SALARY * 1.10,
                            40, SALARY * 1.15,
                            60, SALARY * 1.20, SALARY) UPSAL
FROM EMPLOYEES;
--�μ������� ���� �ο�
SELECT EMPLOYEE_ID, FIRST_NAME, E.DEPARTMENT_ID, JOB_ID, SALARY,
    CASE WHEN DEPARTMENT_NAME = 'Marketing' THEN SALARY*1.05
         WHEN DEPARTMENT_NAME = 'Purchasing' THEN SALARY*1.10
         WHEN DEPARTMENT_NAME = 'Human Resources' THEN SALARY*1.15
         WHEN DEPARTMENT_NAME = 'IT' THEN SALARY*1.20
            ELSE SALARY
    END UPSAL
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;
--��GREATEST �Ű������� ǥ������ ����ϰ� ���� ū���� ��ȯ�ϴ� �Լ�, LEAST �ݴ�
SELECT GREATEST(1,4,2,5,3,9) , LEAST(1,4,2,5,3,9)
FROM DUAL;
--
SELECT GREATEST('�����','������','ȫ�浿'), LEAST('�����','������','ȫ�浿')
FROM DUAL;