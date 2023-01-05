--2022-11-08
--[����Ŭ] ������(?SEQUENCE)
--(1) ������ ���� 
--�������� ����(UNIQUE)�� ���� �������ִ� ����Ŭ ��ü�̴�.
--�������� �����ϸ� �⺻ Ű�� ���� ���������� �����ϴ� Į���� �ڵ������� ������ �� �ְ� �ȴ�.
CREATE TABLE TEST(
    NO NUMBER NOT NULL PRIMARY KEY
);
-- ������ TEST_SEQ ����
CREATE SEQUENCE TEST_SEQ
START WITH 1 
INCREMENT BY 1 
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;
--
INSERT INTO TEST(NO) 
VALUES(TEST_SEQ.NEXTVAL);
--
SELECT * FROM TEST;
--
SELECT TEST_SEQ.CURRVAL FROM DUAL;