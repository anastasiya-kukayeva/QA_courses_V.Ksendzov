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
		(80, 13),
		(23, 4),
		(11, 2),
		(53, 10),
		(15, 13),
		(26, 6),
		(16, 1),
		(33, 7),
		(2, 7),
		(6, 15),
		(7, 9),
		(86, 3),
		(24, 4),
		(77, 2),
		(85, 10),
		(92, 12),
		(100, 3),
		(17, 1),
		(9, 7),
		(10, 4),
		(39, 9),
		(38, 13),
		(36, 4),
		(30, 4),
		(37, 10),
		(87, 13),
		(27, 4),
		(25, 1),
		(99, 7),
		(13, 4),
		(14, 9),
		(88, 11),
		(29, 4),
		(12, 3),
		(93, 10),
		(18, 12),
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
		
create table roles_employee (
		id serial primary key,
		employee_id int not null unique,
		role_id int not null 
		);
	
--Наполнить таблицу roles_employee 40 строками:

	insert into roles_employee(employee_id, role_id)
	values 	(7,16),
		   	(20,11),
			(3,1),
			(5,3),
			(23,17),
			(11,2),
			(10,9),
			(22,13),
			(24,3),
			(34,4),
			(6,7),
			(1,10),
			(4,12),
			(12,15),
			(8,2),
		   	(27,12),
			(37,16),
			(33,19),
			(29,5),
			(14,17),
			(38,4),
			(39,13),
			(21,3),
			(36,8),
			(16,2),
		   	(26,12),
			(9,20),
			(2,13),
			(25,6),
			(15,2),
			(18,11),
			(31,13),
			(32,3),
			(35,8),
			(17,20),
		   	(30,21),
			(40,16),
			(13,13),
			(28,12),
			(19,14);								
	
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;

--SQL HomeWork 2. Joins
--
--Подключится к 
--Host: 159.69.151.133
--Port: 5056
--DB: подключение к той таблице где делали DDL операции
--User: подключение к тем пользователем каким делали DDL операции
--Pass: 123

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employees.emloyee_name, salary.monthly_salary 
from employees 
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employees.emloyee_name, salary.monthly_salary 
from employees 
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select salary.monthly_salary, employees.emloyee_name
from employee_salary
join employees
on employee_salary.employee_id=employees.id
right join salary 
on employee_salary.salary_id=salary.id
where employees.emloyee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select salary.monthly_salary, employees.emloyee_name
from employee_salary
join employees
on employee_salary.employee_id=employees.id
right join salary 
on employee_salary.salary_id=salary.id
where employees.emloyee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employees.emloyee_name, salary.monthly_salary 
from employee_salary
right join employees
on employee_salary.employee_id=employees.id
left join salary 
on employee_salary.salary_id=salary.id
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.

select employees.emloyee_name, roles.role_name 
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id;

-- 7. Вывести имена и должность только Java разработчиков.

select employees.emloyee_name, roles.role_name 
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
where roles.role_name like'%Java%';
 
-- 8. Вывести имена и должность только Python разработчиков.

select employees.emloyee_name, roles.role_name 
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
where roles.role_name like'%Python%';

-- 9. Вывести имена и должность всех QA инженеров.

select employees.emloyee_name, roles.role_name 
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
where roles.role_name like'%QA%';

--10. Вывести имена и должность ручных QA инженеров.

select employees.emloyee_name, roles.role_name 
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
where roles.role_name like'%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA

select employees.emloyee_name, roles.role_name 
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
where roles.role_name like'%Automation QA%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where roles.role_name like'%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where roles.role_name like'%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where roles.role_name like'%Senior%';

-- 15. Вывести зарплаты Java разработчиков

create table roles_salary (
	id serial primary key,
	role_id int not null unique,
	salary_id int not null
);
insert into roles_salary(role_id, salary_id)
values 	(1, 5),
		(2, 7),
		(3, 14),
		(4, 5),
		(5, 7),
		(6, 14),
		(7, 5),
		(8, 7),
		(9, 14),
		(10, 1),
		(11, 3),
		(12, 6),
		(13, 13),
		(14, 15),
		(15, 10),
		(16, 12),
		(17, 11),
		(18, 2),
		(19, 4),
		(20, 8);
	
	drop table roles_salary 
	
-- 15. Вывести зарплаты Java разработчиков
	
select roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where roles.role_name like'%Java dev%';

-- 16. Вывести зарплаты Python разработчиков

select roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where roles.role_name like'%Python dev%';

--17. Вывести имена и зарплаты Junior Python разработчиков

select employees.emloyee_name,salary.monthly_salary, roles.role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where roles.role_name like'%Junior Python dev%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employees.emloyee_name,salary.monthly_salary, roles.role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where role_name like ('%Middle JavaScript%');

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employees.emloyee_name,salary.monthly_salary, roles.role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where role_name like ('%Senior Java%');

-- 20. Вывести зарплаты Junior QA инженеров

select employees.emloyee_name,salary.monthly_salary, roles.role_name
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where role_name like ('%Junior% QA%');

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(salary.monthly_salary) as avg_jun_sal
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where role_name like ('%Junior%');

-- 22. Вывести сумму зарплат JS разработчиков

select sum(salary.monthly_salary) as sum_js_s
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where role_name like ('%JavaScript%');

-- 23. Вывести минимальную ЗП QA инженеров

select min(salary.monthly_salary) as min_qa_s
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where role_name like ('%QA%');

-- 24. Вывести максимальную ЗП QA инженеров

select max(salary.monthly_salary) as max_qa_s
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where role_name like ('%QA%');

--25. Вывести количество QA инженеров

select count(employees.id) as count_qa
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
where role_name like ('%QA%');

-- 26. Вывести количество Middle специалистов.

select count(employees.id) as count_mid
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
where role_name like ('%Middle%');

--27. Вывести количество разработчиков

select count(employees.id) as count_dev
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
where role_name like ('%dev%');

--28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(salary.monthly_salary) as sum__sal_dev
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where role_name like ('%dev%');

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
order by salary.monthly_salary asc;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary asc;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where salary.monthly_salary < 2300
order by salary.monthly_salary asc;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from employees
join roles_employee
on employees.id=roles_employee.employee_id
join roles
on roles.id=roles_employee.role_id
join employee_salary
on employees.id=employee_salary.employee_id
join salary 
on employee_salary.salary_id=salary.id
where salary.monthly_salary = 1100 or salary.monthly_salary = 1500 or salary.monthly_salary = 2000
order by salary.monthly_salary asc;