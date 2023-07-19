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

--Insert 
