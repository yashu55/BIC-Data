show databases;
create database abc;
use abc;

DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL, 
    email VARCHAR(255) NOT NULL
);

CREATE TABLE contacts1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) ,
    last_name VARCHAR(50) , 
    email VARCHAR(255) 
);

select * from contacts1;
INSERT INTO contacts1 ,last_name,email
VALUES (67, 'qwerty', null,null);
      --  ('Jean','King','jean.king@me.com'),
      --  ('Peter','Fe-- rguson','peter.ferguson@google.com'),
--        ('Janine ','Labrune','janine.labrune@aol.com'),
--        ('Jonas ','Bergulfsen','jonas.bergulfsen@mac.com'),
--        ('Janine ','Labrune','janine.labrune@aol.com'),
--        ('Susan','Nelson','susan.nelson@comcast.net'),
--        ('Zbyszek ','Piestrzeniewicz','zbyszek.piestrzeniewicz@att.net'),
--        ('Roland','Keitel','roland.keitel@yahoo.com'),
--        ('Julie','Murphy','julie.murphy@yahoo.com'),
--        ('Kwai','Lee','kwai.lee@google.com'),
--        ('Jean','King','jean.king@me.com'),
--        ('Susan','Nelson','susan.nelson@comcast.net'),
--        ('Roland','Keitel','roland.keitel@yahoo.com');
       
       
SELECT 
    email, COUNT(email)
FROM
    contacts
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;
    
    
    
    CREATE TABLE contacts_temp 
LIKE contacts;

show tables;
select * from contacts_temp;
select * from contacts; -- group by email;

-- step 2
INSERT INTO contacts_temp
SELECT * 
FROM contacts 
GROUP BY email;


-- step 3
DROP TABLE contacts;

ALTER TABLE contacts_temp 
RENAME TO contacts;



SELECT 
	id, 
    email, 
    ROW_NUMBER() OVER ( 
		PARTITION BY email 
        ORDER BY email
	) AS row_num 
FROM contacts;



create table emp(
emp_id int primary key auto_increment,
emp_name varchar(20),
emp_sal int
);

select * from emp;

select min(emp_sal) from (select * from emp order by emp_sal desc limit 3) as t;

select min(emp_sal) from   
(select distinct emp_sal from emp order by emp_sal desc)  as t 
where rownum < 3; 



show databases;

use abc;

show tables;

create table Employees(
EmpId int auto_increment primary key,
Email varchar(50) unique,
name varchar(50)
);
select * from Employees;

select Distinct Email  from Employees;
 
create table Employees2(
EmpId int auto_increment primary key,
Email varchar(50),
Name varchar(50),
unique(Email, Name)
); 
 
 select * from Employees2;
 
 
 select emp_id from emp order by emp_name;
 
 select instr("CALIFORNIA", "A", 1, 2);
 
 
 select ifnull(null, 'yash') from dual;
 
 
show databases; 
 drop database patterngrid;
 create database patternGrid;
 use patternGrid;
 show tables;
 select * from Config;
 select * from user_table;
 select * from pattern_type;
 select * from login_transaction;
 commit;
 select now() from dual;
 INSERT INTO login_transaction (Login_Time, Logut_Time, Session_Id, Status, User_Id) VALUES (now(), now(),2,true,'akshay');
 UPDATE login_transaction SET Logut_Time = ? WHERE (User_Id = ? and Session_Id = ?);

create database tbl_customer;
use tbl_customer;
show tables;

select * from hibernate_sequence;
select * from customer;
commit;

create view viewUser4
as select Login_Time, Logut_Time from login_transaction;











create database demoDb;

use demoDb;

DROP TABLE IF EXISTS emp;

CREATE TABLE emp (
  empno decimal(4,0) primary key,
  ename varchar(10) default NULL,
  job varchar(9) default NULL,
  mgr decimal(4,0) default NULL,
  hiredate date default NULL,
  sal decimal(7,2) default NULL,
  comm decimal(7,2) default NULL,
  deptno decimal(2,0) default NULL,
  constraint fk_key foreign key(deptno) references dept(deptno)
);

DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  deptno decimal(2,0) primary key,
  dname varchar(14) default NULL,
  loc varchar(13) default NULL
);

INSERT INTO emp VALUES ('8880','SMITH','CLERK','7902','1980-12-17','800.00',NULL, NULL);
INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

INSERT INTO dept VALUES ('50','ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');
INSERT INTO dept VALUES ('30','SALES','CHICAGO');
INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');


commit;
select * from dept;
select * from emp;



select max(sal)
from emp;
select * from emp order by sal desc;
select * from emp order by sal desc limit  3,1;


select * from emp as eee where eee.sal =(
select min(e.sal) from emp as e where e.sal in
(select sal from (select distinct sal from emp order by sal desc limit 3) as temp));

select max(sal) from emp where sal <
(select max(sal) from emp where sal < (select max(sal) from emp ));



select  dname from dept group by dname having count(dname) > 1;
select * from dept;
select * from dept as t1, dept as t2 where t1.dname = t2.dname and t1.deptno > t2.deptno;

delete t1 from dept as t1, dept as t2 where t1.dname = t2.dname and t1.deptno > t2.deptno;

select empno, ename, emp.deptno, dept.dname  
from emp left outer join dept
on dept.deptno = emp.deptno
union
select empno, ename, emp.deptno, dept.dname  
from emp  right outer join dept
on dept.deptno = emp.deptno;

select empno, ename, emp.deptno, dept.deptno, dept.dname  
from emp inner join dept
on dept.deptno != emp.deptno;

select empno, ename, emp.deptno as EMPDEPTCLN, dept.deptno as DEPTCLN, dept.dname  
from emp , dept;



select * from viewuser4;


insert into viewuser4 values("yash6", "sdfsdfsd");



insert into viewuser values("yasho", 2, null);

show tables;

select * from dept;

create view v2 as
select deptno, dname from dept where deptno > 20 order by deptno desc;

create view v3 as
select deptno, dname from dept where deptno > 20 order by deptno desc with check option;

select * from v2;
select * from v3;

update v3 set dname = "wwwww" where deptno = 10;
update v3 set dname = "qqqqqqqqq";

insert into v3 values(2, "qqqqq");

create temporary table abc 
as
select * from dept;

select * from dept;
select * from abc;
show tables;
update abc set dname = "SALES" where deptno = 30;
select * from v1;

update v1 set dname = "salesdept" where deptno = 30;






select * from emp;
desc emp;

show create table emp;
alter table emp add constraint uniqempSal unique(emp_sal);
alter table emp drop constraint uniqempSal;
alter table emp modify column emp_id  varchar(20);
alter table emp add  constraint pkKey  primary key(emp_id);

alter table emp drop constraint pkKey;


select max(emp_sal) from emp where emp_sal <
(select max(emp_sal) from emp where emp_sal <
(select max(emp_sal) from emp));

select findMaxfinal(4, "emp",emp_sal) from emp;



delimiter //
create function findMaxfinal( num int, emp varchar(30), emp_sal int)
returns int
deterministic
begin
	declare x int;
	declare cntr int;
	set cntr = num;
	set x = 0;
	select max(emp_sal) into x from emp;
	while cntr > 1 
	do
		select max(emp_sal) into x from emp where emp_sal < x;
		set cntr = cntr - 1;
	end while;
	return x;
end ; //
delimiter ;

select * from emp order by sal desc limit 0,1;
drop function findMaxfinal;

drop table empDemo; 
create table empDemo(
empno decimal(4,0) primary key,
  ename varchar(10) check( BINARY ename = upper(ename)),
                           
     sal decimal(7,2) check(sal > 5000)

 --  job varchar(9) default NULL,
--   mgr decimal(4,0) default NULL,
--   hiredate date default NULL,
--   comm decimal(7,2) default NULL,
--   deptno decimal(2,0) default NULL
);

insert into empDemo values (1, "YASH", 6000);

select * from empDemo
 where   ename = "yash";
show databases;
use abc;

desc flights;


create table flights(
fNo int auto_increment primary key,
fSource varchar(20),
fdest varchar(20)
);
insert into flights values(1, "mumbai", "banglore");
insert into flights values(2, "mumbai", "pune");
insert into flights values(3, "pune", "banglore");
insert into flights values(4, "banglore", "mumbai");
commit;
select * from flights for update;
select * from flights where fSource = "mumbai" and fdest = "banglore";
select * from flights a, flights b where a.fdest = b.fSource and a.fSource = "mumbai" and b.fdest = "banglore";
select * from flights;
update flights set fSource = "pqr" where fNo = 1;



create database BIC;
drop database BIC;
use BIC;
show tables;

desc user_tbl;
desc GAS_FAMILY_TBL;
desc GAS_TBL;
desc Cylinder_TBL;
drop table user_tbl;
desc Customer_tbl;
desc stock_tbl;
show create table receipt_tbl;
show create table stock_tbl;
show create table cylinder_tbl;
select * from hibernate_sequence;

CREATE TABLE t1 (t TIME(3), dt DATETIME(6));

CREATE TABLE `cylinder_tbl` (
   `cylinder_id` int NOT NULL AUTO_INCREMENT,
   `cylinder_capacity` float(5,2) NOT NULL,
   `cylinder_unit` enum('KG','LIT') NOT NULL,
   `gas_id` varchar(10) NOT NULL,
   PRIMARY KEY (`cylinder_id`),
   KEY `FKh7cn1g0nx8xifnmvejjmeuodm` (`gas_id`),
   CONSTRAINT `FKh7cn1g0nx8xifnmvejjmeuodm` FOREIGN KEY (`gas_id`) REFERENCES `gas_tbl` (`gas_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;















show tables;

select * from contacts;

select LAST_INSERT_ID() from contacts;

create table qq(
num  int unsigned auto_increment  primary key
);

CREATE TABLE `receipt_tbl` (
   `receipt_id` int NOT NULL AUTO_INCREMENT,
   `all_cylinders` varchar(500) NOT NULL,
   `date_time` datetime(6) NOT NULL,
   `delivery_person_contact` varchar(10) NOT NULL,
   `delivery_person_name` varchar(30) NOT NULL,
   `receipt_type` enum('ER','DR') NOT NULL,
   `vehicle_no` varchar(30) NOT NULL,
   `customer_id` int NOT NULL,
   PRIMARY KEY (`receipt_id`),
   KEY `FKd66bg6aiuygigx8usbou1jlp2` (`customer_id`),
   CONSTRAINT `FKd66bg6aiuygigx8usbou1jlp2` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`customer_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `stock_tbl` (
   `cylinder_stock` int NOT NULL,
   `customer_id` int NOT NULL,
   `cylinder_id` int NOT NULL,
   PRIMARY KEY (`customer_id`,`cylinder_id`),
   KEY `FK3e6q8q4jk86ipc30dwn8t7f0f` (`cylinder_id`),
   CONSTRAINT `FK3e6q8q4jk86ipc30dwn8t7f0f` FOREIGN KEY (`cylinder_id`) REFERENCES `cylinder_tbl` (`cylinder_id`),
   CONSTRAINT `FKmnbsaglbvaxk374gfciq9qm6t` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`customer_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




