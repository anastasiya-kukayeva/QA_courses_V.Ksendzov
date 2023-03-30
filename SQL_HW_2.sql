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

select employees.emloyee_name, salary.monthly_salary 
from employee_salary
full outer join employees
on employee_salary.employee_id=employees.id
full outer join salary 
on employee_salary.salary_id=salary.id
where employees.emloyee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employees.emloyee_name, salary.monthly_salary 
from employee_salary
full outer join employees
on employee_salary.employee_id=employees.id
full outer join salary 
on employee_salary.salary_id=salary.id
where employees.emloyee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employees.emloyee_name, salary.monthly_salary 
from employee_salary
full outer join employees
on employee_salary.employee_id=employees.id
full outer join salary 
on employee_salary.salary_id=salary.id
where salary.monthly_salary is null;

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
	
select roles.role_name, salary.monthly_salary
from roles
join roles_salary
on roles.id=roles_salary.role_id
join salary
on salary.id=roles_salary.salary_id
where role_name like ('%Java developer%');

-- 16. Вывести зарплаты Python разработчиков

select roles.role_name, salary.monthly_salary
from roles
join roles_salary
on roles.id=roles_salary.role_id
join salary
on salary.id=roles_salary.salary_id
where role_name like ('%Python developer%');

--17. Вывести имена и зарплаты Junior Python разработчиков

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from roles
join roles_salary
on roles.id=roles_salary.role_id
join salary
on salary.id=roles_salary.salary_id
join roles_employee
on roles.id=roles_employee.role_id
join employees
on employees.id=roles_employee.employee_id
where role_name like ('%Junior Python%');

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from roles
join roles_salary
on roles.id=roles_salary.role_id
join salary
on salary.id=roles_salary.salary_id
join roles_employee
on roles.id=roles_employee.role_id
join employees
on employees.id=roles_employee.employee_id
where role_name like ('%Middle JavaScript%');

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employees.emloyee_name, roles.role_name, salary.monthly_salary
from roles
join roles_salary
on roles.id=roles_salary.role_id
join salary
on salary.id=roles_salary.salary_id
join roles_employee
on roles.id=roles_employee.role_id
join employees
on employees.id=roles_employee.employee_id
where role_name like ('%Senior Java %');

-- 20. Вывести зарплаты Junior QA инженеров

select roles.role_name, salary.monthly_salary
from roles
join roles_salary
on roles.id=roles_salary.role_id
join salary
on salary.id=roles_salary.salary_id
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