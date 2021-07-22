-- department
-- 기본키 제약조건 추가 
alter table department add constraint primary key(deptno);

-- 기본키 제약조건 삭제
-- alter table department drop primary key;

-- employee
-- 기본키(primary key) 추가
alter table employee add constraint primary key(empno);
-- 외래키(foreign key) 추가
alter table employee add constraint fk_employee_manager
	foreign key (manager) references employee(empno);
alter table employee add constraint fk_employee_dno
	foreign key (dno) references department(deptno)
	on delete no action   /* department(deptno)가 삭제 시, 해당 직원이 소속되어 있을 경우 삭제 금지 */
	on update cascade;    /* department(deptno)가 수정될 시, 연쇄적으로 해당 직원의 부서번호도 연쇄적으로 변경 */
-- alter table employee drop foreign key fk_employee_dno;
desc department;
desc employee;




