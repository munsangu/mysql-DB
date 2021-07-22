select user(), database();

show databases like '%mysql_study%';

create database mysql_study;

drop database mysql_study;

use mysql_study;

show tables;

-- 테이블 명 변경 
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

-- 제약 조건 확인(기본키, 외래키)
select CONSTRAINT_SCHEMA, TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME 
	from information_schema.TABLE_CONSTRAINTS
		where CONSTRAINT_SCHEMA like '%mysql_study%';

/* 함수 */
-- 데이터 형식 변환 함수(명시적 형변환)
select  cast('200' as signed integer), 
		convert('200', decimal), 
		convert ('200' using 'euckr'), 
		cast('2000-01-01' as date)
from dual;

-- 데이터 형식 변환 함수(묵시적<암시적> 형변환)
select  '100' + '100',
		concat('100' , '100'),
		concat(100 , '100'),
		1 > '2MEGA',
		3 > '2MEGA',
		2 = '2MEGA',
		2 = 'MEGA2'
from dual;

select if (title = '과장', '조기 퇴근', '야근') ,
	title 
from employee;

select ifnull(manager, '사장'),
	manager 
from employee;

select nullif(manager, null),
	  manager
from employee;

select case title 
		when '사장' then '3시 퇴근'
		when '부장' then '4시 퇴근'
		when '과장' then '5시 퇴근'
		when '대리' then '8시 퇴근'
		else '야근'
	end '퇴근 시간',
	title, empname 
from employee;

-- 문자열 함수
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
	   bit_length('영남인'),         -- bit 길이
	   char_length('영남인'),        -- 글자 수 
	   length('영남인')              -- byte 길이
from dual;

select concat('2020', '01', '01'),
	concat_ws('/','2020','01','01'),
	elt(2, '하나', '둘', '셋'),
	field('둘','하나', '둘', '셋') 
from dual;

select empno, empname ,dno, title, elt(dno, '영업','기획','개발','총무')
from employee
order by field(title, '사장', '부장', '과장', '대리', '사원');

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