create table board(
    boardnum number,
    boardwriter varchar2(20) not null,
    boardtitle varchar2(50) not null,
    boardcontent varchar2(2000) not null,
    boarddate date default sysdate,
    constraint board_pk primary key(boardnum)
);

comment on table board is '게시판';
comment on column board.boardnum is '게시판 번호';
comment on column board.boardwriter is '게시판 작성자';
comment on column board.boardtitle is '게시판 제목';
comment on column board.boardcontent is '게시판 내용';
comment on column board.boarddate is '게시판 작성일';