insert 
	into department 
		values
			(1, '����',  8),
			(2, '��ȹ', 10),
			(3, '����',  9),
			(4, '�ѹ�',  7);
		
select * from department;

insert 
	into employee(empno, empname, title, manager, salary, dno)
		values
			(4377, '�̼���', '����', null, 5000000, 2),
			(3426, '�ڿ���', '����', 4377, 3000000, 1),
			(1003, '������', '����', 4377, 3000000, 2),
			(3011, '�̼���', '����', 4377, 4000000, 3),
			(2106, '��â��', '�븮', 1003, 2500000, 2),
			(3427, '����ö', '���', 3011, 1500000, 3);
		
insert 
	into employee(empno, empname, manager, salary, dno)
		values(1365, '����', 3426, 1500000, 1);
		
select * from employee;
