









--3)FUNCTION�̶�? / ���� ��ȯ�ϴ� ���� PL/SQL BLOCK���� ����Ŭ ���� �Լ��� ���� SQL ǥ������
--�Ϻη� ����Ͽ� ������ SQL���� ������ ���·� ����� �� �ִ�. ���� ��ȯ�ϴ� RETURN�� �ݵ�� ���ԵǸ�
--�ݵ�� �ϳ��� ���� ��ȯ�Ѵ�.
--�μ� ��ȣ�� �μ� �̸��� ��ȯ�ϴ� �Լ��� ��������.(ù��° ���)
CREATE OR REPLACE FUNCTION GETDNAME(vdepartment_id IN departments.department_id%TYPE)
RETURN VARCHAR2
IS
    vdepartment_name departments.department_name%TYPE;
    vcount NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO vcount FROM DEPARTMENTS
    WHERE department_id = vdepartment_id;
     
    IF vcount = 0 THEN
        vdepartment_name := '�ش� �μ� ����';
    ELSE
        SELECT department_name INTO vdepartment_name FROM departments
        WHERE department_id = vdepartment_id;
    END IF;
    RETURN vdepartment_name;
END;
/

--
SELECT first_name, job_id, NVL(commission_pct, 0) commission_pct, salary,
GETDNAME(department_id) DNAME
FROM employees
WHERE first_name = 'Lisa';
--
SELECT GETDNAME(500) FROM DUAL;
-- �ι�° ���
CREATE OR REPLACE FUNCTION GETDNAME(vdepartment_id IN departments.department_id%TYPE)
RETURN VARCHAR2
IS
    vdepartment_name departments.department_name%TYPE;
BEGIN
    SELECT department_name INTO vdepartment_name FROM departments
    WHERE department_id = vdepartment_id;
    RETURN vdepartment_name;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        vdepartment_name := '�ش� �μ� ����';
RETURN vdepartment_name;
END;
/
--
SELECT employee_id, first_name, TO_CHAR(hire_date, 'YYYY-MM-DD') HIREDATE,
    GETDNAME(department_id) department_name
FROM employees;
--
SELECT GETDNAME(400) FROM DUAL;
--�μ���ȣ�� �Ű������� �ش� �μ��� ��� �޿��� ��ȯ�ϴ� �Լ��� ��������.
CREATE OR REPLACE FUNCTION GETAVGDEPT(vdepartment_id IN departments.department_id%TYPE)
RETURN VARCHAR2
IS
    vavgsalary VARCHAR2(50);
BEGIN
    SELECT NVL(TO_CHAR(ROUND(AVG(salary)),'9999999'),'�ش� �μ� ����') into vavgsalary
    FROM employees
    WHERE department_id = vdepartment_id;
    RETURN vavgsalary;
END;
/
--�����ȣ�� �������� ����� �̸�, �޿�, �μ��� �� �μ� ��� �޿��� ���
SELECT first_name, salary, department_id, GETDNAME(department_id) department_name,
GETAVGDEPT(department_id) avgsalary
FROM employees
WHERE employee_id = 100;
--
SELECT first_name, salary, department_id, GETDNAME(department_id) department_name, 
GETAVGDEPT(department_id) avgsalary
FROM employees
WHERE employee_id = 178;