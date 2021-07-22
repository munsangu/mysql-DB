select user(), database();

show databases like '%mysql_study%';

create database mysql_study;

drop database mysql_study;

use mysql_study;

show tables;

-- ���̺� �� ���� 
alter 
	table employee 
		rename to emp;
alter 
	table emp 
		rename to employee;

alter 
	table employee 
		add column phone char(13);
alter 
	table employee 
		drop phone;
alter 
	table employee 
		add column phone char(13) first;

alter 
	table employee 
		change column empname name char(30);
alter 
	table employee 
		modify column emp;

select * from employee;
select * from department;

-- ���� ���� Ȯ��(�⺻Ű, �ܷ�Ű)
select CONSTRAINT_SCHEMA, TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME 
	from information_schema.TABLE_CONSTRAINTS
		where CONSTRAINT_SCHEMA like '%mysql_study%';

/* �Լ� */
-- ������ ���� ��ȯ �Լ�(����� ����ȯ)
select  cast('200' as signed integer), 
		convert('200', decimal), 
		convert ('200' using 'euckr'), 
		cast('2000-01-01' as date)
from dual;

-- ������ ���� ��ȯ �Լ�(������<�Ͻ���> ����ȯ)
select  '100' + '100',
		concat('100' , '100'),
		concat(100 , '100'),
		1 > '2MEGA',
		3 > '2MEGA',
		2 = '2MEGA',
		2 = 'MEGA2'
from dual;

select if (title = '����', '���� ���', '�߱�') ,
	title 
from employee;

select ifnull(manager, '����'),
	manager 
from employee;

select nullif(manager, null),
	  manager
from employee;

select case title 
		when '����' then '3�� ���'
		when '����' then '4�� ���'
		when '����' then '5�� ���'
		when '�븮' then '8�� ���'
		else '�߱�'
	end '��� �ð�',
	title, empname 
from employee;

-- ���ڿ� �Լ�
select ascii('A'),
	   char(65),
	   ascii('B'),
	   char(97),
	   ascii(0),
	   ascii(9)
from dual;
select bit_length('abc'),
	   char_length('abc'),
	   length('abc'),
	   bit_length('������'),         -- bit ����
	   char_length('������'),        -- ���� �� 
	   length('������')              -- byte ����
from dual;

select concat('2020', '01', '01'),
	concat_ws('/','2020','01','01'),
	elt(2, '�ϳ�', '��', '��'),
	field('��','�ϳ�', '��', '��') 
from dual;

select empno, empname ,dno, title, elt(dno, '����','��ȹ','����','�ѹ�')
from employee
order by field(title, '����', '����', '����', '�븮', '���');

select format(9090.90,0),
	   format(9090.90,2);
	   
select bin(10), 
       hex(18),
       oct(10);

select empno, empname, format(salary,0)
	from employee;
	
select insert('abcdefg',3,4,'####'),
	   insert('abcdefg',3,2,'@@@');
	  
select insert('123456-1234567',9,6,'******');

select left('abcdefg',3),
	   right('abcdefg',3);
	   
select left(empname,1),
	   right(empname,2),
		empname, empno
from employee;