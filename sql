--- query 1 List the employee number, last name, first name, sex, and salary of each employee.

select emp.emp_no 
, emp.last_name
, emp.first_name
, emp.sex
, sal.salary
from employees emp
left join salaries sal
on sal.emp_no = emp.emp_no

--- query 2 List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name
, last_name
, hire_date 
from employees 
where extract(year from hire_date) = 1986

--- query 3 List the manager of each department along with their department number, department name, employee number, last name, and first name.

select depmgr.emp_no
, dep.dept_no
, dep.dept_name
, emp.last_name
, emp.first_name
from dept_manager depmgr
left join departments dep on dep.dept_no = depmgr.dept_no
left join employees emp on emp.emp_no = depmgr.emp_no

--- query 4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

with dat as
(
select dep.dept_no
, dept_emp.emp_no
, dep.dept_name
from dept_emp
left join departments dep on dep.dept_no = dept_emp.dept_no
	)

select dat.dept_no
, dat.emp_no
, emp.last_name
, emp.first_name
, dat.dept_name
from dat
left join employees emp on emp.emp_no = dat.emp_no

--- query 5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name
, last_name
, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--- query 6 List each employee in the Sales department, including their employee number, last name, and first name.

with dis as
(
select * 
from departments
where dept_name = 'Sales'
)
,
dat as
(
select dept_emp.emp_no
, dis.dept_name
from dis
left join dept_emp on dis.dept_no = dept_emp.dept_no
	)

select dat.emp_no
, emp.last_name
, emp.first_name
from dat
left join employees emp on emp.emp_no = dat.emp_no

--- query 7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

with dis as
(
select * 
from departments
where dept_name = 'Sales' OR dept_name = 'Development'
)
,
dat as
(
select dept_emp.emp_no
, dis.dept_name
from dis
left join dept_emp on dis.dept_no = dept_emp.dept_no
	)

select dat.emp_no
, emp.last_name
, emp.first_name
, dat.dept_name
from dat
left join employees emp on emp.emp_no = dat.emp_no

--- query 8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name
, count(last_name) as count_of_emp
from employees
group by last_name
order by count_of_emp desc