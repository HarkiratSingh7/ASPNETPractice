using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using EmpManagement.App_Code.Models;

namespace EmpManagement.App_Code.Services
{
    public static class EmployeeService
    {
        private static readonly string connStr;
        
        static EmployeeService()
        {
            connStr = WebConfigurationManager.ConnectionStrings["DBConnectionStr"].ConnectionString;
        }

        public static void Delete(Employee employee)
        {
            var id = employee.Id;
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("DELETE FROM EMPLOYEES WHERE ID = @ID", connection);
            command.Parameters.AddWithValue("ID", id);
            using (connection)
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public static void Update(Employee employee)
        {
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("UPDATE EMPLOYEES SET NAME = @NAME, ROLE = @ROLE, " +
                "ADDRESS = @ADDRESS, JOINED = @JOINED, DEPARTMENT_ID = @DEPARTMENT_ID WHERE ID = @ID", connection);
            command.Parameters.AddWithValue("ID", employee.Id);
            command.Parameters.AddWithValue("NAME", employee.Name);
            command.Parameters.AddWithValue("ROLE", employee.Role);
            command.Parameters.AddWithValue("ADDRESS", employee.Address);
            command.Parameters.AddWithValue("JOINED", employee.Joined);
            command.Parameters.AddWithValue("DEPARTMENT_ID", employee.Department.Id);
            using (connection)
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public static void Insert(Employee employee)
        {
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("INSERT INTO EMPLOYEES(NAME, ROLE, ADDRESS, JOINED, DEPARTMENT_ID) " +
                "VALUES(@NAME, @ROLE, @ADDRESS, @JOINED, @DEPARTMENT_ID)", connection);
            command.Parameters.AddWithValue("NAME", employee.Name);
            command.Parameters.AddWithValue("ROLE", employee.Role);
            command.Parameters.AddWithValue("ADDRESS", employee.Address);
            command.Parameters.AddWithValue("JOINED", employee.Joined);
            command.Parameters.AddWithValue("DEPARTMENT_ID", employee.Department.Id);
            using (connection)
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public static List<Employee> GetAll()
        {
            var employees = new List<Employee>();
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("SELECT * FROM EMPLOYEES", connection);
            using (connection)
            {
                connection.Open();
                var reader = command.ExecuteReader();
                while (reader.Read())
                {
                    var employee = new Employee() 
                    {
                        Id = Convert.ToInt32(reader["ID"]),
                        Name = reader["Name"].ToString(),
                        Address = reader["Address"].ToString(),
                        Department = DepartmentService.GetDepartmentById(Convert.ToInt32(reader["Department_Id"])),
                        Joined = DateTime.Parse(reader["Joined"].ToString()),
                        Role = (Role)Convert.ToInt32(reader["Role"])
                    };
                    employees.Add(employee);
                }
            }
            return employees;
        }
    }
}