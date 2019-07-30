

--[Ʈ����� Transaction]
--> ���ÿ� �ټ��� �۾��� ���������� �����ϰ� ó���ϱ� ����
--��ȣ�ۿ� �����̴�
--> �� ó�� ����
--> ������ �� ���� �ּҴ���
--> ���� : ������ �ŷ��� ����


--[Ʈ������� Ư¡]
--> ���ڼ� : Ʈ������� �Ѳ����� �Ϸ�ǰų� �Ѳ����� ��� �Ǿ�� ��
--> �ϰ���
--> ����
--> ���Ӽ�



--[TCL ��ɾ�]
--> COMMIT : �ŷ� ������ Ȯ����
--> ROLLBACK : �ŷ� ������ �����
--> CHECKPOINT : ROLLBACK�� ��ġ�� ������


--[�ǽ�]
--> sqlplus���� �׽�Ʈ
--> ����->���������Ʈ->sqlplus ���̵�/���

--[cmd���� �ǽ�]

--���̺� ����
CREATE TABLE dep(
    id  VARCHAR2(20)    PRIMARY KEY
    ,name   VARCHAR2(15)    NOT NULL
    ,location   VARCHAR2(50)
);
--���̺� ���� Ȯ��
DESC dep;
--���߰�
INSERT INTO dep VALUES('10','������','���� ������');
INSERT INTO dep VALUES('20','���ߺ�','�λ� ������');
INSERT INTO dep VALUES('30','ȸ���','��õ ��籸');
--�హ��
SELECT COUNT(*) FROM dep; -->3

--���� �Ѳ����� ��� �� ���
ROLLBACK;
-->�హ�� ī��Ʈ �غ��� 0�̵� > SELECT COUNT(*) FROM dep;
-->������� �ߴ�, 15�� �������� �ߴ� ��� �۾����� ����ϴ°�
-->��ɾ� �Ѳ����� ���


--COMMIT ���� �ʰ� �׳� cmdâ�� ���������� �ٽ� �హ���� 0�� �ȴ�!!!
--��Ŭ������ �ܺ� ���α׷��� �����ؼ� ������ �ڵ�Ŀ���� �Ǵµ�. �̷��� ���� �� ���� �ڵ� ������� �ʴ´�.
--��ɾ� �Ϸ� �� Ȯ��
COMMIT;
--sqlplus���� �׳� â�ݱ� �ϸ� �ڵ� ROLLBACK�ǹǷ� ����

--CHECKPOINT : �ѹ���� ����
INSERT INTO dep VALUES('40','������','���� ���α�');

SAVEPOINT a; --ROLLBACK TO a;  �ϸ� ���� ���ĺ��� ���

INSERT INTO dep VALUES('50','���ߺ�','���� �߱�');

SAVEPOINT b;

INSERT INTO dep VALUES('60','������','���� ������');
-->��������ϸ� ī��Ʈ 6��

--�ѹ� ���
ROLLBACK TO a; -->4��

------------------------------------------------------------------------------------------------------------------------


--[Ŀ���� �ڷ��� ���� ���]

--���ڰ� ���
SQL>COL NAME FOR a20;
COL TYPE FOR a10;
COL VALUE FOR a10;

SQL> SHOW PARAMETER UNDO;
--undo_retention
--delete , update�Ŀ� Ŀ���� ���� ���
--�Ӽ����� �ð�(��)������ ����Ŭ���� �ӽ÷� ������
--�����ͷ� ������ �� �ִ�.
--default �Ӽ����� 900��(15������->���氡�� ->commit�� ���� ��� 15�а��� ���� ��������)
--�ð��� 1500��(25��)���� �ø�����
ALTER SYSTEM SET undo_retention=1500;

--undo_retention����� �̿��� ������ ���� ���

--15�� �̳��� dep���̺��� Ŀ�Ե� ������ ���
SELECT *
FROM dep
AS OF TIMESTAMP(SYSTIMESTAMP-INTERVAL '15' minute);
-->�Ͻ����̰� �ǽð�����

--Ŀ�Ե����� Ȯ��
DELETE FROM dep; --�� ��� ����
COMMIT;--�Ϸ�

--�����ϰ� Ŀ������ 15�� ���� �����͸� ����
INSERT INTO dep SELECT * FROM dep
                            AS OF TIMESTAMP(SYSTIMESTAMP-INTERVAL '15' minute);
COMMIT;
-->�� ī��Ʈ �ϸ� �ٽ� 3��




