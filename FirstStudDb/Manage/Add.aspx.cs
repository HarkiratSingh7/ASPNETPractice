using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FirstStudDb.Manage
{
    public partial class Add : System.Web.UI.Page
    {
        private int min_age = 13, max_age = 50;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                StudentDataSource.InsertParameters.Add("DOB", System.Data.DbType.Date, DateBox.Text);
                StudentDataSource.Insert();
                Response.Redirect("~/Home.aspx");
            }
        }

        protected void StudentAgeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var date = DateTime.ParseExact(DateBox.Text, "yyyy-mm-dd", null);
            if (date < DateTime.Now.AddYears(-max_age))
            {
                StudentAgeValidator.ErrorMessage = "Student must be less than " + max_age.ToString() + " years old";
                args.IsValid = false;
            }
            else if (date > DateTime.Now.AddYears(-min_age))
            {
                StudentAgeValidator.ErrorMessage = "Student must be at least " + min_age.ToString() + " years old";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void AlreadyExists_ServerValidate(object source, ServerValidateEventArgs args)
        {
            StudentDataSource.FilterExpression = $"ROLLNO = {StudentRollNumber.Text}";
            DataView retrieved = StudentDataSource.Select(new DataSourceSelectArguments()) as DataView;
            if (retrieved.Count > 0)
                args.IsValid = false;
            else
                args.IsValid = true;
            StudentDataSource.FilterExpression = "";
        }
    }
}