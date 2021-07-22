-- 2021.07. 21
-- ����� �� �����ͺ��̽� Ȯ��
select user(), database();

-- utf8 Ȯ��
show variables 
	like '%character%';

/*
SQL 
	1. DDL
		��. CREATE   (���� ����, ������ ���̽�, ���̺�)
		��. ALTER    (���� ����)
		��. DROP     (���� ����)
	2. DML
		��. SELECT   (������ �˻�)
		��. INSERT   (������ ����)
		��. UPADATE  (������ ����)
		��. DELETE   (������ ����)
	3. DCL
	    ��. ROLLBACK (���)
	    ��. COMMIT   (����)
	    ��. GRANT    (���� �ο�)
 */

-- �����ͺ��̽� ����
show databases 
	like '%coffee%';
drop database 
	if exists coffee;
create database 
	if not exists coffee;

use coffee;

select user(), database();

show tables;

-- ���̺� ����
/*
���̺�� : product(��ǰ)
�Ӽ���  : code(�ڵ�), name(��ǰ��)
*/

create 
	table 
		if not exists 
			product (
						code varchar(4) primary key,
						name varchar(20) not null
					);

-- ���̺� ���� Ȯ��
show tables;
desc product;

-- ������ �߰�(DML . INSERT)
insert 
	into product(name, code) 
		values
			('����Ǫġ��','A005');

insert 
	into product 
		values 
			('A006','���̽�Ƽ');

insert 
	into product 
		values
			('ī��Ḷ���ƶ�','A007');  -- Error (���� �� ���� ���� ����)
			
insert 
	into product 
		values 
			('A006','���̽�Ƽ');	   -- Error (�ߺ� �Է� �Ұ� <�⺻Ű ����>)
			
insert 
	into product
		values
			(null, '�Ƹ޸�ī��');     -- Error (null �Է� �Ұ� <�⺻Ű ����>)
			
insert 
	into product(name)
		values
			('�Ƹ޸�ī��');		       -- Error (�Է°� ���� <�⺻Ű ����>)
 
-- block insert 
insert 
	into product(code, name) 
		values
			('A001', '�Ƹ޸�ī��'),
			('AOO2', 'īǪġ��'),
			('A003', '�������'),
			('A004', '����������'),
			('B001', '���⽦��ũ'),
			('B002', '�ĸ�������'),
			('B003', '�Ϻ���'),
			('B004', '���̽�����');

-- ������ (��� ���� ����) �˻�
select * 
	from product;

-- ������ �˻�(DML . SELECT)
select 
	code, name 
		from product;

-- ������ ����(DML . UPDATE)
update 
	product 
		set code = 'A002' 
			where code = 'AOO2';

-- ������ ����(DML . DELETE)
delete 
	from product 
		where code = 'AOO2';
	
-- 2021.07. 22
-- Sale ���̺� ����
create 
	table 
		sale(
			no 			int auto_increment,   -- �ڵ� ���� �÷�
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

-- ����(join)
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
	code '�ڵ�', 
	name '��ǰ��', 
	price '����', 
	sale_cnt '�Ǹ� ����', 
	margin_rate '������', 
	price * sale_cnt '�Ǹ� �ݾ�'
		from product p left outer join sale s 
			on p.code = s.p_code
				where price * sale_cnt >= 500000 
					order by price * sale_cnt desc;     -- desc: ��������  vs  ���� �Ǵ� asc: ��������
insert 
	into sale(p_code, price, sale_cnt, margin_rate)
		values
			('A002', 3800, 140, 15);

select 
	code '�ڵ�', 
	name '��ǰ��', 
	price '����', 
	sum(sale_cnt) '�Ǹ� ����', 
	margin_rate '������', 
	price * sum(sale_cnt) '�Ǹ� �ݾ�'
		from product p join sale s 
			on p.code = s.p_code
				group by p.code	
					order by price * sum(sale_cnt) desc;

						

