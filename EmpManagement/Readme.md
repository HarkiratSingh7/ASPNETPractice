### Employee Management Web Forms
This project demonstrates how to use System.Data.SqlClient namespace to interact with 
a database and perform basic Create, Read, Update and Delete operations using ADO.NET 
Framework.

### The Project Structure
#### 1. Models
The Models are defined in the [Models](/EmpManagement/App_Code/Models/) folder. There 
are two models [Employee](/EmpManagement/App_Code/Models/Employee.cs) and 
[Department](/EmpManagement/App_Code/Models/Department.cs) in that directory.

#### 2. Interaction with Database
Each model has a corresponding class in the [Services](/EmpManagement/App_Code/Services/) folder. 
There are two static classes [EmployeeService](/EmpManagement/App_Code/Services/EmployeeService.cs) 
and [DepartmentService](/EmpManagement/App_Code/Services/DepartmentService.cs) in that directory.

#### 3. User Interface
There are two folders in this project which contains webforms capable of performing basic operations 
on their corresponding entities.
1. [Employees](/EmpManagement/Employees/)
2. [Departments](/EmpManagement/Departments/)

[Screenshots can be found.](/EmpManagement/Screenshots/)