
--���̺� ���� : create table
--���̺� ���� : alter table
--���̺� ���� : drop table

--���̺� ����

create table t_emp(
  id         number(5) not null  --���
  ,name      varchar2(25)        --�̸�
  ,salary    number(7,2)         --�޿�
  ,phone     varchar2(15)        --��ȭ��ȣ
  ,dept_name varchar2(25)        --�μ���
);


--���߰�
insert into t_emp values(100,'�����',2000,'010-222-2222','���ߺ�');
insert into t_emp values(101,'������',3000,'010-333-3333','�ѹ���');
insert into t_emp values(102,'�迬��',4000,'010-444-4444','������');

--����
select * from t_emp;

--���̺� �̸� ����
rename t_emp to s_emp;

--���̺� ���
select * from tab;


--���̺� ���� Ȯ��
desc t_emp;

--���̺� ����
DROP TABLE t_emp;

--�ٲ� ���̺������ ���Ȯ��
SELECT * FROM s_emp;
 
 --Į���߰� �� ���� > ���̺����忡���� ������! 
 --Į���߰�
 --alter table ���������̺� add (�ʵ�� �ڷ��);
 ALTER TABLE s_emp ADD (hire_date date);
 
 
 --���߰�
 --DATE����������� String���� ������ ��
 INSERT INTO s_emp VALUES (103,'����ȭ',5000,'010-555-5555','������','2019-07-18');
 
 --��ȭ��ȣ ������ ������ �ִ� 15���ε�, �ʰ��������� �����޼��� Ȯ���ϱ�
 --ORA-12899: value too large for column "JAVA0514"."S_EMP"."PHONE" (actual: 21, maximum: 15)
  INSERT INTO s_emp VALUES (103,'����ȭ',5000,'010123454343-555-5555','������','2019-07-18');
 
 --Į���� �ڷ��� ����
 ALTER TABLE s_emp MODIFY (phone varchar2(20));
 
 --���̺� ���� Ȯ��
 DESC s_emp;

--Į�� �̸� ����
--ALTER TABLE ���̺�� RENAME COLUMN a TO b;
ALTER TABLE s_emp RENAME COLUMN id TO t_id;

--Į�� ����
ALTER TABLE s_emp DROP COLUMN name;


SELECT * FROM s_emp;


-----------------------------------------------------------------------------------------------------------------------------------------

--������ row�� �ִ� hire_date�� �� �Է��ϱ�
--UPDATE ���̺� SET �ʵ�=�� WHERE ����

--��) t_id�� 100�� ���ڵ��� �Ի����� ���� ��¥�� ����
--�Լ� ���� ���ó�¥ SYSDATE
UPDATE s_emp SET hire_date=sysdate WHERE t_id=100;
--��) t_id�� 101�� ���ڵ带 �����ϱ� >  �Ի��� > 2019-01-01 �̸� > ���϶�
UPDATE s_emp SET hire_date='2019-01-01',name='���϶�' WHERE t_id=101;
--��) t_id�� 102�� ���ڵ带 �Ʒ� �����ͷ� ����
--�Ի��� > 2019-03-03 / �޿�> �޿�*1.1
UPDATE s_emp SET hire_date='2019-03-03',salary=salary*1.1 WHERE t_id=102;


INSERT INTO s_emp(t_id,hire_date) VALUES(400,sysdate);

-- ��) t_id�� 400�� ���ڵ带 ����
DELETE FROM s_emp
WHERE t_id=400;


--��) s_emp���̺� ���Ͽ�
--1)email�� �����ϱ� ���� mailidĮ���� 10byte�� �߰��Ͻÿ�
ALTER TABLE s_emp ADD (mailid varchar2(10));
--2)mailidĮ���� 20byte�� �����Ͻÿ� 
ALTER TABLE s_emp MODIFY (mailid varchar2(20));
--3)mailidĮ������ e_mail�� �����Ͻÿ�
ALTER TAB
LE s_emp RENAME COLUMN mailid TO e_mail;
--4)s_emp ���̺���� t_emp�� �����Ͻÿ�
RENAME s_emp TO t_emp;


SELECT * FROM tab;
SELECT * FROM t_emp;



