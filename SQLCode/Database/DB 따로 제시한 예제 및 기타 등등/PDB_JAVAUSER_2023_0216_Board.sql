-- 테이블 생성
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


-- spring_board 테이블 상세설명
COMMENT ON TABLE spring_board is '게시판 정보';
COMMENT ON COLUMN spring_board.b_num IS '게시판 번호';
COMMENT ON COLUMN spring_board.b_name IS '게시판 작성자';
COMMENT ON COLUMN spring_board.b_title IS '게시판 제목';
COMMENT ON COLUMN spring_board.b_content IS '게시판 내용';
COMMENT ON COLUMN spring_board.b_pwd IS '게시판 비밀번호';
COMMENT ON COLUMN spring_board.b_date IS '게시판 등록일';


-- BOARD 게시판 테이블에 저장할 글번호 시퀀스 (증가값: 시퀀스명.nextval / 현재값: 시퀀스명.currval)
CREATE SEQUENCE SPRING_BOARD_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;

INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
VALUES(spring_board_seq.nextval, '홍길동', '힘들 때 힘이 되는 명언', '조금해 하지 말고 조바심내지 말고, 할 수 있는 만큼 최선을 다하자.', '1234');

select * from spring_board order by b_num desc;

COMMIT;