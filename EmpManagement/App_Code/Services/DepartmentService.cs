using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using EmpManagement.App_Code.Models;

namespace EmpManagement.App_Code.Services
{
    public static class DepartmentService
    {
        private static readonly string connStr;
        
        static DepartmentService()
        {
            connStr = WebConfigurationManager.ConnectionStrings["DBConnectionStr"].ConnectionString;
        }

        public static void Delete(int id)
        {
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("DELETE FROM DEPARTMENTS WHERE ID = @ID", connection);
            command.Parameters.AddWithValue("ID", id);
            using (connection)
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public static void Update(Department department)
        {
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("UPDATE DEPARTMENTS SET NAME = @NAME, DESCRIPTION = @DESCRIPTION WHERE ID = @ID", connection);
            command.Parameters.AddWithValue("ID", department.Id);
            command.Parameters.AddWithValue("NAME", department.Name);
            command.Parameters.AddWithValue("DESCRIPTION", department.Description);
            using (connection)
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public static void Insert(Department department)
        {
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("INSERT INTO DEPARTMENTS VALUES(@ID, @NAME, @DESCRIPTION)", connection);
            command.Parameters.AddWithValue("ID", GetNumberOfDepartments() + 1);
            command.Parameters.AddWithValue("NAME", department.Name);
            command.Parameters.AddWithValue("DESCRIPTION", department.Description);
            using (connection)
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public static int GetNumberOfDepartments()
        {
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("SELECT Count(*) FROM DEPARTMENTS", connection);
            int count = 0;
            using (connection)
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                count = reader.GetInt32(0);
            }
            return count;
        }

        public static Department GetDepartmentById(int id)
        {
            Department department;
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("SELECT * FROM DEPARTMENTS WHERE ID = @ID", connection);
            command.Parameters.AddWithValue("ID", id);
            using (connection)
            {
                connection.Open();
                var reader = command.ExecuteReader();
                reader.Read();
                department = new Department()
                {
                    Id = Convert.ToInt32(reader["Id"]),
                    Name = reader["Name"].ToString(),
                    Description = reader["Description"].ToString()
                };
            }

            return department;
        }

        public static List<Department> GetAll()
        {
            var departmentList = new List<Department>();
            var connection = new SqlConnection(connStr);
            var command = new SqlCommand("SELECT * FROM DEPARTMENTS", connection);
            using (connection)
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Department department = new Department()
                    {
                        Id = Convert.ToInt32(reader["Id"]),
                        Name = reader["Name"].ToString(),
                        Description = reader["Description"].ToString()
                    };
                    departmentList.Add(department);
                }
            }
            return departmentList;
        }
    }
}