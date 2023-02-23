-- 인덱스(색인)
-- create [UNIQUE] INDEXX 인덱스명 on 테이블명 ( 컬럼1, 컬럼2....);

select * from spring_reply order by b_num desc;
select * from spring_board order by b_num desc;

--페이징 처리를 위한 데이터 입력 처리
create or replace procedure board_paging_insert
is
begin
    for cnt in 1..120 loop
    insert into spring_board(b_num, b_name, b_title, b_content, b_pwd)
    values(spring_board_seq.nextval,
    '홍길동'||cnt,
    '힘들때 힏이 되는 명언'||cnt,
    '조급해 하지 말고 조바심내지 말고, 할 수 있는 만큼 최선을 다하자.',
    '1234');
    end loop;
    commit;
end;
/
show error;

-- 10개의 레코드 얻기(1~10까지)
select /*+ INDEX_DESC(spring_board spring_board_pk) */
    row num, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board where rownum <= 10;

-- 10개의 레코드 얻기(11 ~ 20까지) 결과? => 출력 레코드가 존재하지 않는다
select /*+ INDEX_DESC(spring_board spring_board_pk) */
    rownum, b_num, b_name, b_title, to_char(b_date,'YYYY-MM-DD') as b_date
from spring_board where rownum > 10 and rownum <= 20;

select /* INDEX_DESC(spring_board spring_board_pk) */
    rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board where rownum <= 20; -- 반드시 1이 포함되도록 해야 한다.

-- 인라인 뷰를 이용하여 원하는 레코드 얻기
select rnum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from (
    select /* INDEX_DESC(spring_board spring_board_pk) */
        rownum as rnum, b_num, b_name, b_title, b_date
    from spring_board
    where rownum <= 20
) boardlist
where rnum > 10;

