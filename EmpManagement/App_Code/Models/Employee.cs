using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmpManagement.App_Code.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Role Role { get; set; }
        public string Address { get; set; }
        public DateTime Joined { get; set; }
        public Department Department { get; set; }
    }

    public enum Role
    {
        Manager,
        Employee,
        Admin
    }
}