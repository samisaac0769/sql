Create PROCEDURE selectallemployes
as
Select *from Employees
go

create procedure getEmployeeById
@emp_id int
as
Select *from Employees where emp_id = @emp_id
go

EXEC selectallemployes;

EXEC getEmployeeById @emp_id = '1';

create procedure insertEmployee
@empName varchar(50),
@jobName varchar(50),
@managerId int,
@hireDate date,
@salary decimal(10,2),
@commission decimal(10,2),
@depId int,
@gender varchar(50)
as 
insert into Employees (emp_name,job_name,manager_id,hire_date,salary,commission,dep_id,gender) 
values(@empName,@jobName,@managerId,@hireDate,@salary,@commission,@depId,@gender)
go

EXEC insertEmployee @empName = 'Sam',@jobName = 'President', @managerId = NULL, @hireDate = '1991-11-18', @salary = '6000.00', @commission =NULL, @depId = '1', @gender = 'male';

 Create procedure deleteById
 @empid int
 as 
 delete from Employees where emp_id = @empid
 go

 EXEC deleteById @empid= '1';