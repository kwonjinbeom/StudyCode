-- ���̺� ����
DROP TABLE SPRING_BOARD;

CREATE TABLE spring_board(
    b_num NUMBER NOT NULL,        
    b_name VARCHAR2(15) NOT NULL,
    b_title VARCHAR2(1000) NOT NULL,
    b_content clob,
    b_pwd VARCHAR2(18) NOT NULL,
    b_date DATE DEFAULT SYSDATE,
    CONSTRAINT spring_board_pk PRIMARY KEY(b_num)
);

alter table spring_board
add constraint spring_board_pk primary key(b_num);


-- spring_board ���̺� �󼼼���
COMMENT ON TABLE spring_board is '�Խ��� ����';
COMMENT ON COLUMN spring_board.b_num IS '�Խ��� ��ȣ';
COMMENT ON COLUMN spring_board.b_name IS '�Խ��� �ۼ���';
COMMENT ON COLUMN spring_board.b_title IS '�Խ��� ����';
COMMENT ON COLUMN spring_board.b_content IS '�Խ��� ����';
COMMENT ON COLUMN spring_board.b_pwd IS '�Խ��� ��й�ȣ';
COMMENT ON COLUMN spring_board.b_date IS '�Խ��� �����';


-- BOARD �Խ��� ���̺� ������ �۹�ȣ ������ (������: ��������.nextval / ���簪: ��������.currval)
CREATE SEQUENCE SPRING_BOARD_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;

INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
VALUES(spring_board_seq.nextval, 'ȫ�浿', '���� �� ���� �Ǵ� ���', '������ ���� ���� ���ٽɳ��� ����, �� �� �ִ� ��ŭ �ּ��� ������.', '1234');

select * from spring_board order by b_num desc;

COMMIT;