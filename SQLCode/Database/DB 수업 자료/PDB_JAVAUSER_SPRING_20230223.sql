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

-- ���̺� ����
create table spring_reply(
    r_num number not null,
    b_num number not null,
    r_name varchar2(15) not null,
    r_content varchar2(2000) not null,
    r_pwd varchar2(18) not null,
    r_date date default sysdate,
    constraint spring_reply_pk primary key(r_num),
    constraint spring_reply_fk foreign key(b_num)
        references spring_board(b_num)
);

comment on table spring_reply is '��� ����';
comment on column spring_reply.r_num is '��۹�ȣ';
comment on column spring_reply.b_num is '�Խ��� �۹�ȣ';
comment on column spring_reply.r_name is '��� �ۼ���' ;
comment on column spring_reply.r_content is '��� ����';
comment on column spring_reply.r_pwd is '��� ��й�ȣ';
comment on column spring_reply.r_date is '��� �����';

create sequence spring_reply_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

-- drop sequence spring_reply_seq;
select * from spring_reply;
--spring_reply ���̺� 2�� �̻��� ���ڵ带 �Է����ּ���.
INSERT INTO spring_reply(r_num, b_num, r_name, r_content, r_pwd)
VALUES(spring_reply_seq.nextval, 1, '���Ѻ�', '������ ���� ��ǥ�� �����϶�. �װ��� ������ ����̴�.', '1234');

INSERT INTO spring_reply(r_num, b_num, r_name, r_content, r_pwd)
VALUES(spring_reply_seq.nextval, 1, '��ö��', '������� ������ ���� �� �ִ� �� ���� �ƴ϶� �� �������̴�. ��� �� �߿���
���� ����� ���� ������ �� �� �ִٴ� ���̴�.', '1234');

select * from spring_reply;
select count(r_num) from spring_reply where b_num = 1 ;

commit;
--SELECT b_num, b_name, b_title to
--(select count(r_num) from spring_
--from spring_board boardlist;
--
---- ��� ������ ������ �÷� �߰�
--alter table spring_board
--add( r_cnt number default 0);
--
--update spring_board
--set r_cnt = (select count(r_num)
--where b_num = spring_board.b_num)

-- 2023.03.06

-- ���̺� ����
create table spring_admin(
    a_id varchar2(15) not null,
    a_pwd varchar2(20) not null,
    a_name varchar2(21) not null,
    a_phone varchar2(15) not null,
    a_email varchar2(100) not null,
    a_date date default sysdate,
    constraint spring_admin_pk primary key(a_id)
);

comment on table spring_admin is '������ ���̺� ����';
comment on column spring_admin.a_id is '������ ���̵�';
comment on column spring_admin.a_pwd is '������ ��й�ȣ';
comment on column spring_admin.a_name is '������ �̸�' ;
comment on column spring_admin.a_phone is '������ �ڵ�����ȣ';
comment on column spring_admin.a_email is '������ �̸���';
comment on column spring_admin.a_date is '������ �����';

-- spring_admin ���̺� ���ڵ� 1�� �Է����ּ���
insert into spring_admin(a_id, a_pwd, a_name, a_phone, a_email)
values('manager', '1234', '������', '010-1234-5678', 'manager@naver.com');