create table board(
    boardnum number,
    boardwriter varchar2(20) not null,
    boardtitle varchar2(50) not null,
    boardcontent varchar2(2000) not null,
    boarddate date default sysdate,
    constraint board_pk primary key(boardnum)
);

comment on table board is '�Խ���';
comment on column board.boardnum is '�Խ��� ��ȣ';
comment on column board.boardwriter is '�Խ��� �ۼ���';
comment on column board.boardtitle is '�Խ��� ����';
comment on column board.boardcontent is '�Խ��� ����';
comment on column board.boarddate is '�Խ��� �ۼ���';