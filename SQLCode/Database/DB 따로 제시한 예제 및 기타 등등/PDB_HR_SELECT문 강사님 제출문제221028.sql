---------����Day2(22.10.28)----------------------------------------------------------------------------------------------
---------����� ���⹮��221028----------------------------------------------------------------------------------------------
--SELECT��
--3. ������ȣ, �̸�, �޿�, �μ���ȣ�� �޿��� ���� ������ ����϶�.
-- ��, �޿��� ���� ������ �� ����� �� ���� ����� ���� ���� ����϶�.
SELECT employee_id ���, first_name || ' ' || last_name �̸�, salary �޿�, department_id �μ���ȣ
FROM employees
ORDER BY salary DESC, employee_id DESC; --�̷��� ������ �� �ɾ��� �� ����. �տ� �ִ� �� ù��° ������ �ٰ�> �ι�° ����> .. ������ ���ĵ�

--4. �Ի����� ���� �ֱ��� ���������� ���, �̸�, �Ի����� ����϶�
SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date DESC;
--
select employee_id ���, first_name|| ' '|| last_name �̸�, hire_date �Ի���
from employees
order by 3 desc, 1 desc ; --�������ε� ��� ����

--5. �μ���ȣ�� 20,50�� �μ����� �ٹ��ϴ� ��� ������� �̸�(first_name), �μ���ȣ, �޿��� ���ĺ� ������ ����϶�
SELECT first_name, department_id, salary
FROM employees
WHERE department_id IN(20,50)
ORDER BY first_name ASC;
--
select first_name, department_id, salary
from employees
where department_id in(20,50)
order by 1 asc; --����: asc(���� ������ ����), desc(���� �ݴ� ������ ����)