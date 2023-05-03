--- query 1
select emp.emp_no 
, emp.last_name
, emp.first_name
, emp.sex
, sal.salary
from employees emp
left join salaries sal
on sal.emp_no = emp.emp_no

--- query 2