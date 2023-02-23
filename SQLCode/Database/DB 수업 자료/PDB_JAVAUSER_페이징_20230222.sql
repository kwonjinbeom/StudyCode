-- �ε���(����)
-- create [UNIQUE] INDEXX �ε����� on ���̺�� ( �÷�1, �÷�2....);

select * from spring_reply order by b_num desc;
select * from spring_board order by b_num desc;

--����¡ ó���� ���� ������ �Է� ó��
create or replace procedure board_paging_insert
is
begin
    for cnt in 1..120 loop
    insert into spring_board(b_num, b_name, b_title, b_content, b_pwd)
    values(spring_board_seq.nextval,
    'ȫ�浿'||cnt,
    '���鶧 �C�� �Ǵ� ���'||cnt,
    '������ ���� ���� ���ٽɳ��� ����, �� �� �ִ� ��ŭ �ּ��� ������.',
    '1234');
    end loop;
    commit;
end;
/
show error;

-- 10���� ���ڵ� ���(1~10����)
select /*+ INDEX_DESC(spring_board spring_board_pk) */
    row num, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board where rownum <= 10;

-- 10���� ���ڵ� ���(11 ~ 20����) ���? => ��� ���ڵ尡 �������� �ʴ´�
select /*+ INDEX_DESC(spring_board spring_board_pk) */
    rownum, b_num, b_name, b_title, to_char(b_date,'YYYY-MM-DD') as b_date
from spring_board where rownum > 10 and rownum <= 20;

select /* INDEX_DESC(spring_board spring_board_pk) */
    rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board where rownum <= 20; -- �ݵ�� 1�� ���Եǵ��� �ؾ� �Ѵ�.

-- �ζ��� �並 �̿��Ͽ� ���ϴ� ���ڵ� ���
select rnum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from (
    select /* INDEX_DESC(spring_board spring_board_pk) */
        rownum as rnum, b_num, b_name, b_title, b_date
    from spring_board
    where rownum <= 20
) boardlist
where rnum > 10;

