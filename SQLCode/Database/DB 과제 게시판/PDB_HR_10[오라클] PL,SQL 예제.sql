--2022-11-15
--[����Ŭ] PL/SQL ����
--1. ����Ŭ���� ����ó�� ���̺�(SUNG)�� �����϶�
CREATE TABLE SUNG(
    hakbun NUMBER(4) NOT NULL,
    hakname VARCHAR2(20) NOT NULL,
    kor NUMBER(4) NOT NULL,
    eng NUMBER(4) NOT NULL,
    mat NUMBER(4) NOT NULL,
    tot NUMBER(4),
    ave NUMBER(5,1),
    rank NUMBER(4),
    CONSTRAINT SUNG_hakbun_PK PRIMARY KEY(hakbun)
);
--
DROP TABLE SUNG;
--����� ���
CREATE TABLE SUNG(
    HAKBUN NUMBER(4) NOT NULL,          --�й�
    HAKNAME VARCHAR2(20) NOT NULL,      --�л���
    KOR NUMBER(4) NOT NULL,             --����
    ENG NUMBER(4) NOT NULL,             --����
    MAT NUMBER(4) NOT NULL,             --����
    TOT NUMBER(4) DEFAULT 0,            --����
    AVE NUMBER(5,1) DEFAULT 0,          --���
    RANK NUMBER(4),                     --���
    CONSTRAINT SUNG_PK PRIMARY KEY(HAKBUN)
);
--2.���̺� �й�, �̸�, ����, ����, ���� ������ �Է��ϸ� ������ ����� �ڵ� ���Ǿ� �Էµǵ���
-- ���ν���(SUNG_INPUT)�� �ۼ��϶�.
--DROP SEQUENCE SUNG_SEQ;
DROP SEQUENCE SUNG_SEQ;
--
CREATE SEQUENCE SUNG_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;
--
DROP PROCEDURE SUNG_INPUT;
--DROP PROCEDURE SUNG_INPUT
CREATE OR REPLACE PROCEDURE SUNG_INPUT
(HAKNAME IN SUNG.HAKNAME%TYPE, KOR IN SUNG.KOR%TYPE, ENG SUNG.ENG%TYPE, MAT SUNG.MAT%TYPE)
IS
BEGIN
    INSERT INTO SUNG(HAKBUN, HAKNAME, KOR, ENG, MAT, TOT, AVE)
    VALUES(SUNG_SEQ.NEXTVAL, HAKNAME, KOR, ENG, MAT, KOR+ENG+MAT, (KOR+ENG+MAT)/3 );
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('�л� ��� �Ϸ�');
END;
/

EXECUTE SUNG_INPUT('ȫ�浿', 99, 80, 85);
EXECUTE SUNG_INPUT('������', 95, 84, 79);
EXECUTE SUNG_INPUT('������', 83, 89, 99);
EXECUTE SUNG_INPUT('��ö��', 99, 83, 89);
EXECUTE SUNG_INPUT('������', 80, 75, 88);
--Ȯ��
SELECT * FROM SUNG;
-- RANK() : �ߺ� ���� ������ŭ ���� ���� ���� ���� ��Ŵ
-- ���� : RANK() OVER(ORDER BY �÷��� (ASC|DESC)) (AS ��Ī)
-- DENSE_RANK() : �ߺ� ������ �����ص� ���������� ���� ���� ���� ǥ����
-- ROW_NUMBER() OVER() : �ߺ����� ������� SEQUENCE(�������� ���� ��) ���� ��ȯ
SELECT * FROM SUNG ORDER BY TOT DESC;

SELECT HAKBUN, HAKNAME, KOR, ENG, MAT, TOT, AVE
    , RANK() OVER (ORDER BY TOT DESC)       RANK
    , DENSE_RANK() OVER (ORDER BY TOT DESC) DENSE_RANK
    , ROW_NUMBER() OVER (ORDER BY TOT DESC) ROW_NUMBER
FROM SUNG
ORDER BY TOT DESC;

--3. ���(SUNG_RANK)�� ���ϴ� �������ν����� �ۼ��ϰ� �̸� ȣ���Ͽ� ����� ����� ���������� Ȯ������.
-- ������ ����� ���ϴ� ���� ���ν��� SUNG_RANK�� ���������� �ۼ��Ǿ��ٴ� ���� �Ͽ� �ǽ��� ����̴�.
CREATE OR REPLACE PROCEDURE SUNG_RANK
IS
    VSUNG SUNG%ROWTYPE;
    CURSOR C1
    IS
    SELECT HAKBUN, HAKNAME, KOR, ENG, MAT, TOT, AVE,
    RANK() OVER (ORDER BY TOT DESC) AS RANK
    FROM SUNG ORDER BY TOT DESC;
BEGIN
    FOR VSUNG IN C1 LOOP
        UPDATE SUNG SET RANK=VSUNG.RANK
        WHERE HAKBUN=VSUNG.HAKBUN;
    END LOOP;
END;
/
EXEC SUNG_RANK;
SELECT * FROM SUNG ORDER BY RANK ASC, KOR DESC, ENG DESC, MAT DESC; --���� ���� ������
-- ���߾ ���� ù ��°�� �ִ� �� �������� �Ѵ�. �ٵ� ���� �ϴٸ� ���� ����, ���� ����...