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