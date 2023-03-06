--파일 업로드시 서버에 저장한 파일명
alter table spring_board
add(b_thumb varchar2(500));

alter table spring_board
add(b_file varchar2(500));

comment on column spring_board.b_thumb is '게시판 썸네일 이미지 경로 및 파일명';
comment on column spring_board.b_file is '게시판 이미지 경로 및 파일명';

-- drop table spring_board;
-- drop sequence spring_board_seq;

INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
VALUES(spring_board_seq.nextval, '박선우', '힘들때 힘이되는 명언',
'조급해 하지 말고 조바심내지 말고, 할 수 있는 만큼 최선을 다하자.', '1234');

INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
VALUES(spring_board_seq.nextval, '김철수', '힘들때 힘이안되는 언명',
'최선을 다하자.', '1234');

SELECT * FROM spring_board order by b_num desc;

-- 테이블 생성
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

comment on table spring_reply is '댓글 정보';
comment on column spring_reply.r_num is '댓글번호';
comment on column spring_reply.b_num is '게시판 글번호';
comment on column spring_reply.r_name is '댓글 작성자' ;
comment on column spring_reply.r_content is '댓글 내용';
comment on column spring_reply.r_pwd is '댓글 비밀번호';
comment on column spring_reply.r_date is '댓글 등록일';

create sequence spring_reply_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

-- drop sequence spring_reply_seq;
select * from spring_reply;
--spring_reply 테이블에 2개 이상의 레코드를 입력해주세요.
INSERT INTO spring_reply(r_num, b_num, r_name, r_content, r_pwd)
VALUES(spring_reply_seq.nextval, 1, '늘한봄', '멈추지 말고 목표에 매진하라. 그것이 성공의 비결이다.', '1234');

INSERT INTO spring_reply(r_num, b_num, r_name, r_content, r_pwd)
VALUES(spring_reply_seq.nextval, 1, '김철수', '물방울이 바위를 뚫을 수 있는 그 힘이 아니라 그 꾸준함이다. 모든 일 중에서
가장 어려운 것은 꾸준히 할 수 있다는 것이다.', '1234');

select * from spring_reply;
select count(r_num) from spring_reply where b_num = 1 ;

commit;
--SELECT b_num, b_name, b_title to
--(select count(r_num) from spring_
--from spring_board boardlist;
--
---- 댓글 갯수를 저장할 컬럼 추가
--alter table spring_board
--add( r_cnt number default 0);
--
--update spring_board
--set r_cnt = (select count(r_num)
--where b_num = spring_board.b_num)

-- 2023.03.06

-- 테이블 생성
create table spring_admin(
    a_id varchar2(15) not null,
    a_pwd varchar2(20) not null,
    a_name varchar2(21) not null,
    a_phone varchar2(15) not null,
    a_email varchar2(100) not null,
    a_date date default sysdate,
    constraint spring_admin_pk primary key(a_id)
);

comment on table spring_admin is '관리자 테이블 정보';
comment on column spring_admin.a_id is '관리자 아이디';
comment on column spring_admin.a_pwd is '관리자 비밀번호';
comment on column spring_admin.a_name is '관리자 이름' ;
comment on column spring_admin.a_phone is '관리자 핸드폰번호';
comment on column spring_admin.a_email is '관리자 이메일';
comment on column spring_admin.a_date is '관리자 등록일';

-- spring_admin 테이블에 레코드 1을 입력해주세요
insert into spring_admin(a_id, a_pwd, a_name, a_phone, a_email)
values('manager', '1234', '관리자', '010-1234-5678', 'manager@naver.com');