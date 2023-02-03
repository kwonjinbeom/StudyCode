drop table t_member;
create table t_member(
    M_EMAIL varchar2(40) not null,

    )
INSERT INTO t_member VALUES('javauser@naver.com');
INSERT INTO t_member VALUES('springuser@daum.net');
INSERT INTO t_member VALUES('jsp1234@naver.com');
INSERT INTO t_member VALUES('onlyone@qmail.com');
-- 홍**, 홍*동
select 
    regexp_replace(m_name, '.', '*', 2) as m_name_masking1,
    regexp_replace(m_name, '.', '*', 2, 1) as m_name_masking2
from t_member;

-- 010-****-5678
select
    regexp_replace(m_tel, '(\d{3})\-(\d{3,4})\-(\d{4})','\1-****-\3') as phone_masking
from t_member;

-- ****auser@naver.com, ******#naver.com
-- concat('', '') 두개의 인자값을 하나의 문자열로 반환하는 함수.
select m_email,
    concat('***',substr(m_email, 4, length(m_email))) as m_email_masking1,
    regexp_replace(m_email, '^([a-zA-Z0-9]+)(@[a-zA-Z0-9.]+$)', '******\2') as m_email_masking2
from t_member;

-- 아이디 / 이름 / 전화번호/ 이메일 마스킹
select
    regexp_replace(m_id, '.', '*', 4) as m_id,
    regexp_replace(m_name, '.', '*', 2, 1) as m_name,
    regexp_replace(m_tel, '(\d{3})\-(\d{3,4})\-(\d{4})','\1-****-\3') as m_tel,
    concat('***', substr(m_email, 4, length(m_email))) as m_email
from t_member;

select
regexp_replace(m_id, '.', '*', 4) as m_id,
regexp_replace(m_name, '.', '*', 2, 1) as m_name,
regexp_replace(m_tel, '(\d{3})\-(\d{3,4})\-(\d{4})','\1-****-\3') as m_tel,
concat('***', substr(e_mail, 4, length(m_email))) as m_email,
to_char(reg_date, 'yyyy-mm-dd hh24:mi:ss') reg_date
from t_member;
    
    
    
select num, author, title, reproot, repindent, repstep from board;