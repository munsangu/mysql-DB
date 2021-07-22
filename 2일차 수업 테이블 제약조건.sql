-- department
-- �⺻Ű �������� �߰� 
alter table department add constraint primary key(deptno);

-- �⺻Ű �������� ����
-- alter table department drop primary key;

-- employee
-- �⺻Ű(primary key) �߰�
alter table employee add constraint primary key(empno);
-- �ܷ�Ű(foreign key) �߰�
alter table employee add constraint fk_employee_manager
	foreign key (manager) references employee(empno);
alter table employee add constraint fk_employee_dno
	foreign key (dno) references department(deptno)
	on delete no action   /* department(deptno)�� ���� ��, �ش� ������ �ҼӵǾ� ���� ��� ���� ���� */
	on update cascade;    /* department(deptno)�� ������ ��, ���������� �ش� ������ �μ���ȣ�� ���������� ���� */
-- alter table employee drop foreign key fk_employee_dno;
desc department;
desc employee;




