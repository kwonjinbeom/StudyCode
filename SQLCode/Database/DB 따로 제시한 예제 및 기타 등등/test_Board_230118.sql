--���� �ڵ� (������� ��)
--create table board(
--    boardnum number,
--    boardwriter varchar2(20) not null,
--    boardtitle varchar2(50) not null,
--    boardcontent varchar2(2000) not null,
--    boarddate date default sysdate,
--    constraint board_pk primary key(boardnum)
--);
--
--comment on table board is '�Խ���';
--comment on column board.boardnum is '�Խ��� ��ȣ';
--comment on column board.boardwriter is '�Խ��� �ۼ���';
--comment on column board.boardtitle is '�Խ��� ����';
--comment on column board.boardcontent is '�Խ��� ����';
--comment on column board.boarddate is '�Խ��� �ۼ���';
drop table board;

-- board �Խ��� ���̺�
create table board(
   num number(4)          not null,
   author varchar2(20)    not null,
   title  varchar2(500)   not null,
   content varchar2(4000) not null,
   writeday date  default sysdate,
   readcnt  number(4) default 0,
   reproot  number(4),
   repstep  number(4),
   repindent number(4),
   passwd varchar2(12)    not null,
   constraint board_pk primary key(num)
 );
 
-- �亯 �Խ����� ���� �÷� �߰� 
alter table board
add(reproot number(4));

alter table board
add(repstep number(4));

alter table board
add(repindent number(4));

-- drop table board;
comment on table  board is '�Խ��� ���̺�';
comment on column board.num is '�Խ��� ��ȣ';
comment on column board.author is '�Խ��� �ۼ���';
comment on column board.title is '�Խ��� ����';    
comment on column board.content is '�Խ��� ����';
comment on column board.writeday is '�Խ��� �����';     
comment on column board.readcnt is '�Խ��� ��ȸ��';     
comment on column board.reproot is '�Խ��� �亯��(�������� ��ȣ ���� - �׷��ȣ)';
comment on column board.repstep is '�Խ��� �亯��(�亯���� ��ġ��ȣ ����)';
comment on column board.repindent is '�Խ��� �亯��(�亯���� ������ȣ ����)';
comment on column board.passwd is '�Խ��� ��й�ȣ';

-- board �Խ��� ���̺� ������ �۹�ȣ ������ (������: ��������.nextval / ���簪: ��������.currval)
create sequence board_seq start with 1
increment by 1
minvalue 1
nocycle
cache 2;

-- drop sequence board_seq; 

-- �Ϲ� �Խñ� �Է� �� reproot: num�� ��. repstep/repindent : 0���� �Է��ϸ� �ȴ�.
insert into board( num, author, title, content, reproot, repstep, repindent, passwd )
values ( board_seq.nextval , 'ȫ�浿', 'mvc �Խ��� �ۼ�' , 'mvc �Խ��� �ۼ��ϱ� �����Դϴ�.', board_seq.currval, 0,0,'1234' );


select * from board;

insert into board( num, author, title, content, reproot, repstep, repindent, passwd )
values ( board_seq.nextval , 'ȫ�浿', '��¿� ���õ� ���' , 
'�߿��� ���� ��ǥ�� �̷�� ���� �ƴ϶� �� �������� ������ ���� �󸶳� �����ߴ����̴� - �ص�� ��Ʃ��' ,board_seq.currval, 0,0, '1234' );