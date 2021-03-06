-- 2021.07. 21
-- 사용자 및 데이터베이스 확인
select user(), database();

-- utf8 확인
show variables 
	like '%character%';

/*
SQL 
	1. DDL
		가. CREATE   (구조 생성, 데이터 베이스, 케이블)
		나. ALTER    (구조 수정)
		다. DROP     (구조 삭제)
	2. DML
		가. SELECT   (데이터 검색)
		나. INSERT   (데이터 삽입)
		다. UPADATE  (데이터 수정)
		라. DELETE   (데이터 삭제)
	3. DCL
	    가. ROLLBACK (취소)
	    나. COMMIT   (적용)
	    다. GRANT    (권한 부여)
 */

-- 데이터베이스 생성
show databases 
	like '%coffee%';
drop database 
	if exists coffee;
create database 
	if not exists coffee;

use coffee;

select user(), database();

show tables;

-- 테이블 생성
/*
테이블명 : product(제품)
속성명  : code(코드), name(제품명)
*/

create 
	table 
		if not exists 
			product (
						code varchar(4) primary key,
						name varchar(20) not null
					);

-- 테이블 생성 확인
show tables;
desc product;

-- 데이터 추가(DML . INSERT)
insert 
	into product(name, code) 
		values
			('프라푸치노','A005');

insert 
	into product 
		values 
			('A006','아이스티');

insert 
	into product 
		values
			('카라멜마끼아또','A007');  -- Error (생성 시 만든 조건 위반)
			
insert 
	into product 
		values 
			('A006','아이스티');	   -- Error (중복 입력 불가 <기본키 조건>)
			
insert 
	into product
		values
			(null, '아메리카노');     -- Error (null 입력 불가 <기본키 조건>)
			
insert 
	into product(name)
		values
			('아메리카노');		       -- Error (입력값 부재 <기본키 조건>)
 
-- block insert 
insert 
	into product(code, name) 
		values
			('A001', '아메리카노'),
			('AOO2', '카푸치노'),
			('A003', '헤이즐넛'),
			('A004', '에스프레소'),
			('B001', '딸기쉐이크'),
			('B002', '후르츠와인'),
			('B003', '팥빙수'),
			('B004', '아이스초코');

-- 데이터 (모든 열에 대해) 검색
select * 
	from product;

-- 데이터 검색(DML . SELECT)
select 
	code, name 
		from product;

-- 데이터 수정(DML . UPDATE)
update 
	product 
		set code = 'A002' 
			where code = 'AOO2';

-- 데이터 삭제(DML . DELETE)
delete 
	from product 
		where code = 'AOO2';
	
-- 2021.07. 22
-- Sale 테이블 생성
create 
	table 
		sale(
			no 			int auto_increment,   -- 자동 증가 컬럼
			p_code 		varchar(4) not null,
			price 		int not null,
			sale_cnt 	int not null,
		    margin_rate int not null,
		   	primary key(no),
		    foreign key(p_code) references product(code)
	  	    );
	 
show tables;
desc sale;

insert 
	into sale(p_code, price, sale_cnt, margin_rate)
		values
			('A001', 4500, 150, 10),
			('A002', 3800, 140, 15),
			('B001', 5200, 250, 12),
			('B002', 4300, 110, 11);
			
select * from sale;

-- 조인(join)
select * 
	from product as p join sale s 
		on p.code = s.p_code; 
	
select *
	from product p left outer join sale s 
		on p.code = s.p_code;
	
select code, name, price, sale_cnt, margin_rate
	from product p left outer join sale s 
		on p.code = s.p_code;

select 
	code '코드', 
	name '제품명', 
	price '가격', 
	sale_cnt '판매 수량', 
	margin_rate '마진율', 
	price * sale_cnt '판매 금액'
		from product p left outer join sale s 
			on p.code = s.p_code
				where price * sale_cnt >= 500000 
					order by price * sale_cnt desc;     -- desc: 내림차순  vs  생략 또는 asc: 오름차순
insert 
	into sale(p_code, price, sale_cnt, margin_rate)
		values
			('A002', 3800, 140, 15);

select 
	code '코드', 
	name '제품명', 
	price '가격', 
	sum(sale_cnt) '판매 수량', 
	margin_rate '마진율', 
	price * sum(sale_cnt) '판매 금액'
		from product p join sale s 
			on p.code = s.p_code
				group by p.code	
					order by price * sum(sale_cnt) desc;

						

