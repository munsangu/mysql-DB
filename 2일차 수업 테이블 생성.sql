/* ���̺� ���� */

-- drop table employee;
-- drop table department;

/* ���̺� ���� */

-- department
create table department(
	deptno int(11),
	deptname varchar(20) not null,
	floor int(11) default 10
);

-- employee
-- utf-8: �ѱ� = 3Byte / ���� = 1Byte
create table employee(
	empno int not null,
	empname varchar(20) not null,        
	title varchar(20) default '���',
	manager int,
	salary int,
	dno int
 );

desc department;
desc employee;




