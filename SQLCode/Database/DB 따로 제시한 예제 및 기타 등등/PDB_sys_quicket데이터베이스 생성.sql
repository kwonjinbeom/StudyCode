-- ����� ���� ����
-- ����� ������ DBA(DBAdmin) �� �� �� �ִ�. �׷��� �ְ������(SYSDBA)�� SYS�� �����ؾ��Ѵ�.
--create user ����ڸ� identified by ��й�ȣ(��й�ȣ�� ��ҹ��� ������);
create user quicket identified by quicket1234;

--����� ���� �ο�
--����Ŭ�� �ܼ��� ����ڸ� �����ϸ� �ƹ� ���ѵ� ���� ���� �ʱ� ������ ���Ѻο��� ����� �Ѵ�.
--grant ���� to ����ڸ�

grant create session to quicket;

--connect�� ������ �ѷ� ���� �� ����
grant connect, resource to quicket;

alter user quicket
default tablespace users quota unlimited on users;
--����� ���� ����--


--CONNECT �ѿ� ���Ե� ����: create sesstion ������ ������ �ش� ������ ���ӵ��� ����
select * from role_sys_privs
where role = 'CONNECT';

--RESOURCE �ѿ� ���Ե� ����
select * from role_sys_privs
where rol = 'RESOURCE';
-- create Ʈ����, ������, Ÿ��, ���ν��� , ���̺� �� 8���� ������ �ο��Ǿ� ����

--���� javauser���� �ο��� ��(����) Ȯ��
--����Ŭ ������ �����͸� �빮�ڷ� �����ؼ� �˻��Ҷ��� �빮�ڷ� �������.
select * from dba_role_privs
where GRANTEE = 'quicket';

-- Ȥ�� ������ ���� �Ǹ� Ȯ���ϱ� ���� ������
select username, account_status, lock_date
from dba_users 
where username ='quicket';

--��� ���� ���� �ְ�����ڷ� �����ؾ���
alter user quicket
account unlock;

--��й�ȣ ����
alter user quicket identified by quicket1234;