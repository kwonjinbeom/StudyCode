-- ����� ���� ����
-- ����� ������ DBA(DBAdmin) �� �� �� �ִ�. �׷��� �ְ������(SYSDBA)�� SYS�� �����ؾ��Ѵ�.
--create user ����ڸ� identified by ��й�ȣ(��й�ȣ�� ��ҹ��� ������);
create user javauser identified by java1234;

--����� ���� �ο�
--����Ŭ�� �ܼ��� ����ڸ� �����ϸ� �ƹ� ���ѵ� ���� ���� �ʱ� ������ ���Ѻο��� ����� �Ѵ�.
--grant ���� to ����ڸ�

grant create session to javauser;

--connect�� ������ �ѷ� ���� �� ����
grant connect, resource to javauser;

alter user javauser
default tablespace users quota unlimited on users;
--����� ���� ����--


--CONNECT �ѿ� ���Ե� ����: create sesstion ������ ������ �ش� ������ ���ӵ��� ����
select * from role_sys_privs
where role = 'CONNECT';

--RESOURCE �ѿ� ���Ե� ����
select * from role_sys_privs
where rol = 'RESOUCE';
-- create Ʈ����, ������, Ÿ��, ���ν��� , ���̺� �� 8���� ������ �ο��Ǿ� ����

--���� javauser���� �ο��� ��(����) Ȯ��
--����Ŭ ������ �����͸� �빮�ڷ� �����ؼ� �˻��Ҷ��� �빮�ڷ� �������.
select * from dba_role_privs
where GRANTEE = 'JAVAUSER';

-- Ȥ�� ������ ���� �Ǹ� Ȯ���ϱ� ���� ������
select username, account_status, lock_date
from dba_users 
where username ='JAVAUSER';

--��� ���� ���� �ְ�����ڷ� �����ؾ���
alter user javauser
account unlock;

--��й�ȣ ����
alter user javauser identified by java1234;