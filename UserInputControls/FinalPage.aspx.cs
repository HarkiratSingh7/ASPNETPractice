using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInputControls
{
    public partial class FinalPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PreviousPage != null)
            {
                if (PreviousPage.form_enabled)
                {
                    var name = (PreviousPage.FindControl("UserNameTextBox") as TextBox).Text;
                    var secret = (PreviousPage.FindControl("UserSecretTextBox") as TextBox).Text;
                    var job = string.Empty;
                    {
                        // Job determination
                        var studentCtrl = PreviousPage.FindControl("rdStudent") as RadioButton;
                        var engineerCtrl = PreviousPage.FindControl("rdEngineer") as RadioButton;
                        var unemployeedCtrl = PreviousPage.FindControl("rdUnemployed") as RadioButton;
                        if (studentCtrl.Checked)
                            job = studentCtrl.Text;
                        else if (engineerCtrl.Checked)
                            job = engineerCtrl.Text;
                        else if (unemployeedCtrl.Checked)
                            job = unemployeedCtrl.Text;
                    }
                    var desc = (PreviousPage.FindControl("UserDescription") as TextBox).Text;

                    NameMsg.Text = name;
                    SecretMsg.Text = secret;
                    JobMsg.Text = job;
                    DescMsg.Text = desc;
                }
                else
                {
                    Response.Write("Form was disabled in previous page");
                }
                
            }
        }

        protected void GoBackBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}