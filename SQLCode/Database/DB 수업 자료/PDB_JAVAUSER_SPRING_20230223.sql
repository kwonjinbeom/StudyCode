--���� ���ε�� ������ ������ ���ϸ�
alter table spring_board
add(b_thumb varchar2(500));

alter table spring_board
add(b_file varchar2(500));

comment on column spring_board.b_thumb is '�Խ��� ����� �̹��� ��� �� ���ϸ�';
comment on column spring_board.b_file is '�Խ��� �̹��� ��� �� ���ϸ�';

-- drop table spring_board;
-- drop sequence spring_board_seq;

INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
VALUES(spring_board_seq.nextval, '�ڼ���', '���鶧 ���̵Ǵ� ���',
'������ ���� ���� ���ٽɳ��� ����, �� �� �ִ� ��ŭ �ּ��� ������.', '1234');

INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
VALUES(spring_board_seq.nextval, '��ö��', '���鶧 ���̾ȵǴ� ���',
'�ּ��� ������.', '1234');

SELECT * FROM spring_board order by b_num desc;