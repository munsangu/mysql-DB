/* 테이블 삭제 */

-- drop table employee;
-- drop table department;

/* 테이블 생성 */

-- department
create table department(
	deptno int(11),
	deptname varchar(20) not null,
	floor int(11) default 10
);

-- employee
-- utf-8: 한글 = 3Byte / 영어 = 1Byte
create table employee(
	empno int not null,
	empname varchar(20) not null,        
	title varchar(20) default '사원',
	manager int,
	salary int,
	dno int
 );

desc department;
desc employee;




