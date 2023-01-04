---------���̺� ����221028----------------------------------------------------------------------------------------------
--3[����Ŭ] ���̺� ������ �����ϴ� DDL�� ���̺� ����, ����, ����(�Ϸ�)
--Table1. ���̺� ����
CREATE TABLE EMP01(
    EMPNO NUMBER(4), --������ ������ Ÿ��(����)
    ENAME VARCHAR2(20), --20byte ������ ������ Ÿ��(��������)
    SAL NUMBER(7,2) -- ������ ������ Ÿ��(�Ǽ�)
    );
--
SELECT * FROM TAB;
--
DESC EMP01;
--Table2. ���� ���̺� ����
CREATE TABLE EMPLOYEES02
AS
SELECT * FROM EMPLOYEES;
--
SELECT * FROM TAB;
--
SELECT * FROM employees02;
--Table3-1. ALTER TABLE�� ���̺� ���� ����
--<��> EMP01 ���̺� ���� Ÿ���� ����(JOB) Į���� �߰�
SELECT * FROM EMP01;
--
ALTER TABLE EMP01
ADD(JOB VARCHAR2(9));
--
DESC EMP01;
--���� (�̹� �����ϴ� EMP01 ���̺� �Ի��� Į��(CREDATE)�� ��¥������ �߰��϶�
ALTER TABLE EMP01
ADD(CREDATE DATE);
--Table3-2. ALTER TABLE�� ���� Į�� ����
--<��> ������ �ִ� 30�ڱ��� �Է��� �� �ֵ��� ũ�� ����
ALTER TABLE EMP01
MODIFY(JOB VARCHAR2(30));
DESC EMP01;
--ALTER TABLE EMP01
--MODIFY(JOB VARCHAR2(9)); �� ���� ũ��� ���� ��. Į���� �ڷᰡ ���⶧��
--<��> ������ �ִ� 30�ڱ��� �Է��� �� �ֵ��� ũ�� ����
--Table3-3. ALTER TABLE�� ���� Į���� ����
--<��> �Ի��� �÷��� �̸��� CREDATE���� REGDATE�� �÷����� ����.
ALTER TABLE emp01
RENAME COLUMN credate TO regdate;
DESC emp01;
--Table3-4. ALTER TABLE�� ���� Į�� ����
--<��> ����(JOB) Į���� ����
ALTER TABLE emp01
DROP COLUMN job;
DESC emp01;
--Table4. DROP TABLE�� ���̺� ���� ����
--<��> EMP01 ���̺��� ����
DROP TABLE EMP01;
--���� Ȯ��
SELECT * FROM TAB;
--recyclebin ���� Ȯ��
desc recyclebin;
--������(recyclebin)����
SELECT * FROM recyclebin;
--������ ����
purge recyclebin;
--�Ǽ��� ���� ���̺��̶� ������ ����Ϸ��� ������ ���� ������� �ٽ� �����ϸ� �ȴ�.
--flashback table table_name to before drop;
FLASHBACK TABLE emp01 TO BEFORE DROP;
--���ο� �̸����� �����ϴ� ���
FLASHBACK TABLE emp01 TO BEFORE DROP
RENAME TO emp02;
--�����뿡 ���� �ʰ� �ٷ� ���̺��� �����Ϸ��� ������ ���� ������� �����뿡 ���� �ʰ� ������ �� �� �ִ�.
--drop table table_name purge;
drop table emp01 purge;
--Table5. ���̺� ���� �����ϴ� RENAME ��
--<��> EMPLOYEES02 ���̺��� �̸��� EMPLOYEES01���� ����
RENAME EMPLOYEES02 TO EMPLOYEES01;
SELECT * FROM TAB;
--Table6. ���̺��� ��� �ο츦 ������ TRUNCATE��
-- <��> EMPLOYEES01 ���̺��� ��� �ο츦 ����
SELECT * FROM employees01;
TRUNCATE TABLE employees01;
SELECT * FROM employees01;
--Table Make-----------------------
--�� ���̺� ����( ���̺� ������ �̹� ���� ��� �� ����.)
-- ���̺��: TB_CUSTOMER. �⺻Ű �������: �÷��� �ڷ��� PRIMARY KEY
CREATE TABLE TB_CUSTOMER(
    CUSTOMER_CD CHAR(7) NOT NULL PRIMARY KEY,
    CUSTOMER_NM VARCHAR2(15) NOT NULL,
    MW_FLG CHAR(1) NOT NULL,
    BIRTH_DAY CHAR(8) NOT NULL,
    PHONE_NUMBER VARCHAR2(16),
    EMAIL VARCHAR2(50),
    TOTAL_POINT NUMBER(10),
    REG_DTTM CHAR(14)
);
SELECT * FROM tb_customer;
DESC tb_customer;