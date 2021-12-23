using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FirstStudDb.Manage
{
    public partial class Edit : System.Web.UI.Page
    {

        private int min_age = 13, max_age = 50;
        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            DateTime newDOB = DateTime.ParseExact(e.NewValues["DOB"] as string, "dd-MM-yyyy hh:mm:ss", null);
            //DateTime newDOB = (DateTime)e.NewValues["DOB"];
            if (newDOB < DateTime.Now.AddYears(-max_age))
            {
                Label1.Text = "Student must be less than " + max_age.ToString() + " years old";
                e.Cancel = true;
            }
            else if (newDOB > DateTime.Now.AddYears(-min_age))
            {
                Label1.Text = "Student must be at least " + min_age.ToString() + " years old";
                e.Cancel = true;
            }
            else
            {
                Label1.Text = "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}