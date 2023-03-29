--SQL_DDL
--Первая часть.
--
--Таблица employees
--
--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null

create table employees (
	id serial primary key,
	emloyee_name varchar(50) not null
);

--Наполнить таблицу employee 70 строками.

insert into employees (emloyee_name)
values 	('Nastya'),
		('Pasha'),
		('Ulya'),
		('Anna'),
		('Dima'),
		('Ira'),
		('Zhorik'),
		('Zhanna'),
		('Vova'),
		('Zhenya'),
		('Marina'),
		('Tanya'),
		('Sergey'),
		('Olga'),
		('Vlad'),
		('Ludmila'),
		('Oksana'),
		('Nikita'),
		('Kirill'),
		('Eva'),
		('Katya'),
		('Sasha'),
		('Viskas'),
		('Lena'),
		('Masha'),
		('Oled'),
		('Ilya'),
		('Dasha'),
		('Amina'),
		('Ksusha'),
		('Angelina'),
		('Milana'),
		('Boris'),
		('Petya'),
		('Vasya'),
		('Maksim'),
		('Polina'),
		('Elina'),
		('Kristina'),
		('Svetlana'),
		('Karina'),
		('Misha'),
		('Mike'),
		('Victor'),
		('Zoya'),
		('Zarina'),
		('Alex'),
		('Agata'),
		('Sanya'),
		('Vitya'),
		('Andrey'),
		('Inna'),
		('Igor'),
		('Gosha'),
		('Galya'),
		('Vasilisa'),
		('Elisey'),
		('Lev'),
		('Matvey'),
		('Mityai'),
		('Natasha'),
		('Marta'),
		('Artem'),
		('Tema'),
		('Nikol'),
		('Yana'),
		('Bozhena'),
		('Yan'),
		('Philipp'),
		('Kolya')
;

--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null

create table salary (
	id serial primary key,
	monthly_salary int not null
);

--Наполнить таблицу salary 15 строками:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500

insert into salary (monthly_salary)
values 	(1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500)
;			


--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null

create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
)

--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values 	(3, 7),
		(1, 4),
		(5, 9),
		(40, 13),
		(23, 4),
		(11, 2),
		(53, 10),
		(15, 13),
		(26, 4),
		(16, 1),
		(33, 7),
		(2, 7),
		(6, 4),
		(7, 9),
		(63, 23),
		(24, 4),
		(41, 2),
		(52, 19),
		(57, 12),
		(62, 3),
		(17, 1),
		(9, 7),
		(10, 4),
		(39, 9),
		(38, 13),
		(36, 4),
		(30, 4),
		(37, 10),
		(45, 13),
		(27, 4),
		(25, 1),
		(43, 7),
		(13, 4),
		(14, 9),
		(48, 13),
		(29, 4),
		(12, 3),
		(56, 10),
		(18, 18),
		(28, 9)
	;

--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
		create table roles (
		id serial primary key,
		role_name int not null unique
);
		
--Поменять тип столба role_name с int на varchar(30)

Alter table roles alter column role_name type varchar(30)

--Наполнить таблицу roles 20 строками:
--
--id
--role_name
--1 Junior Python developer
--2 Middle Python developer
--3 Senior Python developer
--4 Junior Java developer
--5 Middle Java developer
--6 Senior Java developer
--7 Junior JavaScript developer
--8 Middle JavaScript developer
--9 Senior JavaScript developer
--10 Junior Manual QA engineer
--11 Middle Manual QA engineer
--12 Senior Manual QA engineer
--13 Project Manager
--14 Designer
--15 HR
--16 CEO
--17 Sales manager
--18 Junior Automation QA engineer
--19 Middle Automation QA engineer
--20 Senior Automation QA engineer

insert into roles (role_name)
values 	('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer')
;

--Таблица roles_employee
--
--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee (
		id serial primary key,
		employee_id int not null unique,
		role_id int not null, 
				foreign key (employee_id)
				references employees(id),
				foreign key (role_id)
				references roles(id)
		);
	
--Наполнить таблицу roles_employee 40 строками:

	insert into roles_employee
	values 	(7, 2),
		   	(20, 4),
			(3, 9),
			(5, 13),
			(23, 4),
			(11, 2),
			(10, 9),
			(22, 13),
			(24, 3),
			(34, 4),
			(6, 7),
			(1, 18),
			(4, 12),
			(12, 8),
			(8, 2),
		   	(27, 4),
			(37, 9),
			(33, 13),
			(29, 4),
			(14, 2),
			(38, 9),
			(39, 13),
			(21, 3),
			(36, 4),
			(16, 2),
		   	(26, 4),
			(9, 9),
			(2, 13),
			(25, 4),
			(15, 2),
			(18, 9),
			(31, 13),
			(32, 3),
			(35, 4),
			(17, 2),
		   	(30, 4),
			(40, 9),
			(13, 13),
			(28, 4),
			(19, 2)
;								
	
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;