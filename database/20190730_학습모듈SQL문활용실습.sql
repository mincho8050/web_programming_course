

-�������̺�
CREATE TABLE employees(
    eid INT PRIMARY KEY     --�����ȣ
    ,name VARCHAR2(50) NOT NULL --����̸�
    ,password VARCHAR2(50) NOT NULL--��й�ȣ
    ,workplace VARCHAR2(50) NOT NULL--����
    ,address VARCHAR2(255) NOT NULL--�ּ�
    ,birthday DATE NOT NULL     --����
    ,joinday DATE NOT NULL      --�Ի���
    ,weddingday DATE --��ȥ�����
);

--�޿� ���̺� ����
CREATE TABLE salaries(
    emp_no INT NOT NULL
    ,salary INT NOT NULL
    ,from_date DATE NOT NULL
    ,to_date DATE
    ,FOREIGN KEY (emp_no) REFERENCES employees (eid) ON DELETE CASCADE
    ,PRIMARY KEY (emp_no, from_date)
);
--���� ���ڵ� ���߰�
INSERT INTO salaries (emp_no,salary,from_date)
VALUES(1002,4000000,'2017-07-01');
--�������ڵ� ���߰�
INSERT INTO salaries (emp_no,salary,from_date)
VALUES(1002,2000000,'2013-06-30'),
VALUES(1002,3000000,'2014-06-30'),
VALUES(1002,4000000,'2015-06-30');

--��������
SELECT * FROM salaries
WHERE from_date=(SELECT MAX(from_date) FROM salaries);

--���� 1�� ��ȸ
SELECT * FROM salaries
ORDER BY from_date DESC LIMIT 1;

















































