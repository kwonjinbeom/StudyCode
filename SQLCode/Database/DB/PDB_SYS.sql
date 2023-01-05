-- 사용자 계정 생성
-- 사용자 생성은 DBA(DBAdmin) 만 할 수 있다. 그래서 최고권한자(SYSDBA)인 SYS로 접속해야한다.
--create user 사용자명 identified by 비밀번호(비밀번호는 대소문자 구분함);
create user javauser identified by java1234;

--사용자 권한 부여
--오라클은 단순히 사용자만 생성하면 아무 권한도 갖고 있지 않기 때문에 권한부여를 해줘야 한다.
--grant 권한 to 사용자명

grant create session to javauser;

--connect에 권한을 롤로 묶을 수 있음
grant connect, resource to javauser;

alter user javauser
default tablespace users quota unlimited on users;
--사용자 생성 과정--


--CONNECT 롤에 포함된 권한: create sesstion 권한이 없으면 해당 유저로 접속되지 않음
select * from role_sys_privs
where role = 'CONNECT';

--RESOURCE 롤에 포함된 권한
select * from role_sys_privs
where rol = 'RESOUCE';
-- create 트리거, 시퀀스, 타입, 프로시저 , 테이블 등 8가지 권한이 부여되어 있음

--먼저 javauser에게 부여된 롤(권한) 확인
--오라클 서버는 데이터를 대문자로 저장해서 검색할때도 대문자로 해줘야함.
select * from dba_role_privs
where GRANTEE = 'JAVAUSER';

-- 혹시 계정이 잠기게 되면 확인하기 위한 쿼리문
select username, account_status, lock_date
from dba_users 
where username ='JAVAUSER';

--잠금 해제 또한 최고권한자로 접근해야함
alter user javauser
account unlock;

--비밀번호 변경
alter user javauser identified by java1234;