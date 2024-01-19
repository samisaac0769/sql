--1. From the above table return complete information about the employees.
	select *from Employees;

--2. From the table, write a SQL query to find the salaries of all employees. Return salary.

	select salary from Employees;

--3. From the table, write a SQL query to find the unique designations of the employees. Return job name.

	select DISTINCT  job_name from Employees;

--4. From the following table, write a SQL query to list the employeesâ€™ names, increase their salary by 15%, 
--and express the number of Dollars.

	Select emp_name, CONCAT('$ ' , CAST(salary+(salary*0.15) AS decimal(10,2))) as Salary from Employees;

--5. From the following table, write a SQL query to list the employee's name and job name as a format of
--"Employee & Job".

	Select CONCAT(emp_name, ' '  , job_name) as 'Employee $ job' from Employees

--6. From the following table, write a SQL query to find those employees with a hire date in the format 
--like February 22, 1991. Return employee ID, employee name, salary, hire date. 

	SELECT emp_id, emp_name, Salary, FORMAT(hire_date, 'MMMM   dd,yyyy') AS to_char FROM Employees;

--7. From the following table, write a SQL query to count the number of characters except the 
--spaces for each employee name. Return employee name length.

	Select LEN(TRIM(emp_name)) as Length from Employees;

--8. From the following table, write a SQL query to find the employee ID, salary, and commission of all the employees. 

	SELECT emp_id,salary, COALESCE(CONVERT(VARCHAR, commission), '') AS commission FROM Employees;

--9. From the following table, write a SQL query to find those employees who do not belong to the department 2001.
--Return complete information about the employees. (Using NOT IN)

	Select *from Employees Where dep_id NOT IN (2);

--10. From the following table, write a SQL query to find those employees who joined before 1991.
--Return complete information about the employees.

	Select *from Employees where YEAR(hire_date) < '1991';

--11. From the following table, write a SQL query to compute the average salary of those employees 
--who work as â€˜ANALYSTâ€™. Return average salary.

	Select AVG(salary) as average from Employees where job_name = 'Analyst';

--12. From the following table, write a SQL query to find the details of the employee â€˜isaacâ€™.

	Select *from Employees Where emp_name = 'isaac';

--13. From the following table, write a SQL query to find those employees whose salary exceeds 3000 after 
--giving a 25% increment. Return complete information about the employees.  

	Select * from Employees where salary+(salary*0.25) > '3000';

--14. From the following table, write a SQL query to find those employees who joined in the month January.
--Return complete information about the employees. 

	Select *from Employees where MONTH(hire_date) = '1';

--15. From the following table, write a SQL query to find those employees who joined before 1st April 1991. 
--Return employee ID, employee name, hire date and salary. 

	Select emp_id, emp_name, hire_date, salary from Employees where hire_date < '04-01-1991';

--16. From the following table, write a SQL query to find the name and salary of the employee jacob.

	Select emp_name, salary from Employees where emp_name = 'jacob';

--17. From the following table, write a SQL query to list all the employees except PRESIDENT and MANAGER in ascending order of salaries.
--Return complete information about the employees.  (Using Order By)

	Select *from Employees where not job_name = 'PRESIDENT' AND not job_name = 'MANAGER' order by salary asc;

--18. From the following table, write a SQL query to find the highest salary. Return the highest salary.

	Select  MAX(salary) from Employees;

--19. From the table, write a SQL query to find the average salary and average total remuneration (salary and commission) for each type of job. 
--Return name, average salary and average total remuneration. (Using GROUP BY)

	Select  job_name, AVG(salary) as 'average salary', SUM(commission+ salary)/count(job_name) as 'average commission' 
	from Employees group by job_name order by  'average salary';

--20. From the following table, write a SQL query to find those employees who work in the department ID 1 or 2.
--Return employee ID, employee name, department ID, department location, and department name.(Using IN clause)

	Select e.emp_id,e.emp_name,d.dep_id,d.dep_name,d.dep_location from Employees as e
	join Departments as d on d.dep_id = e.dep_id where e.dep_id in (1,2);

--21. From the table, write a SQL query to list the managers and number of employees work under them.
--Sort the result set in ascending order on manager. Return manager ID and number of employees under them.(Using GROUP BY & ORDER BY)


	Select manager_id, count(manager_id) as Counts from Employees group by manager_id order by manager_id;

--22. From the table, write a SQL query to find those departments where at least two employees work.
--Return department id, number of employees.(GROUP BY & HAVING)

	Select dep_id,count(dep_id) from Employees group by dep_id having count(dep_id) >2;
	
--23. From the table, write a SQL query to find those employees whose names contain the character set 'SA' together.
--Return complete information about the employees. (using â€˜likeâ€™)

	Select *from Employees where emp_name like '%SA%';

--24. Add a column for â€œGenderâ€ in the employee table and update each row accordingly. 

	Alter table employees add gender varchar(10) 
	update Employees set gender = 'male' where emp_id='6';


--25. From the above table we need to retrieve all employees except â€˜Managerâ€™ & â€™Presidentâ€™ Job name. 

	Select *from Employees where not job_name = 'PRESIDENT' AND not job_name = 'MANAGER';

<<<<<<< HEAD
--26. From the above table we need to display ‘Management Level’ - labelname for ‘President’,’Manager’,’Analyst’ jobs
--and ‘Employee Level’ - label name for ‘Salesman’,’Clerk’ job names.
=======
--26. From the above table we need to display â€˜Management Levelâ€™ - labelname for â€˜Presidentâ€™,â€™Managerâ€™,â€™Analystâ€™ jobs
--and â€˜Employee Levelâ€™ - label name for â€˜Salesmanâ€™,â€™Clerkâ€™ job names.
>>>>>>> 54b9796d6f78ca7ef03fe54ab07112668b60d801

	Select job_name,
	case 
		when job_name in ('President','Manager','Analyst') then  'Management Level'
		when job_name in ('Salesman','Clerk') then  'Employee Level'
	end as 'Job level' from Employees;

--27. Update commission field to 650.00 for job name titled as  “analyst” in “employee” table using “Exist” clauses.

	UPDATE Employees
	SET commission = '650.00'
	WHERE EXISTS (
		SELECT 1
		FROM Employees e
		WHERE e.job_name = 'analyst'
		AND Employees.emp_id = e.emp_id -- Add the appropriate condition to correlate the subquery
	);

