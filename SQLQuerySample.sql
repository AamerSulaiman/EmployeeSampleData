--Select all data
Select * 
From EmployeeSampleData..Emp

--Select Name, Job title, Department, Business Unit, Age and sort by Department, Business Unit, Age
Select Full_name, Job_title, Department, Business_Unit, Age From EmployeeSampleData..Emp 
Order by 3,4,5


--Determine number of employees by country, then sort in descending order
Select Count(Full_Name) as TotalPeople, Country,
	Round (Count(Full_Name) * 100.0 / (select count(Full_Name) from EmployeeSampleData..Emp ), 2 ) as Percentage_of_Total_Employees

From EmployeeSampleData..Emp 
Group by Country
Order by 1 desc

--Select everyone that is aged 33 and under working in the Accounting Department
Select Full_name, Job_Title, Department, Business_Unit, Age From EmployeeSampleData..Emp 
Where Age <= 33 and Department like 'Accounting' 

--Based on Job Title, determine the number of employees, the average age and the average salary of the position (Using temp table)

Drop table if exists #temp_empdata
Create table #temp_empdata (
Job_Title varchar(100),
EmployeesPerPosition int,
AvgAge int,
AvgSalary int 
)

Insert into #temp_empdata
SELECT Job_Title, Count(Job_Title), Avg(Age), AVG(Annual_salary)
from EmployeeSampleData..Emp
Group by Job_Title

Select * from #temp_empdata
