using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInputControls
{
    public partial class Default : System.Web.UI.Page
    {
        public bool form_enabled
        {
            get => (bool)ViewState["form_enabled"];
            set => ViewState["form_enabled"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                form_enabled = true;
                FormEnabler.Text = "Disable Form";
                CustomPostBackBtn.Enabled = !(UserDescription.AutoPostBack = true);
                AutoBackEnabler.Text = "Disable Auto Post Back";
            }

            UserNameTextBox.Focus();

            if (IsPostBack)
            {
                string JobType = "";
                if (rdEngineer.Checked)
                    JobType = rdEngineer.Text;
                else if (rdStudent.Checked)
                    JobType = rdStudent.Text;
                else if (rdUnemployed.Checked)
                    JobType = rdUnemployed.Text;
                else
                    JobType = "Invalid";

                lblResult.Text = $"The user '{UserNameTextBox.Text}' sent a secret message - '{UserSecretTextBox.Text}', and gave the following description" +
                    $" - '{UserDescription.Text}'. The user is {JobType}. This information was updated at {DateTime.Now.ToString()}";
                if (!UserRetainCheckBox.Checked)
                {
                    UserNameTextBox.Text = UserDescription.Text = String.Empty;
                    rdEngineer.Checked = rdStudent.Checked = rdUnemployed.Checked = false;
                }
            }
        }

        protected void ClearForm_Click(object sender, EventArgs e)
        {
            UserNameTextBox.Text = UserDescription.Text = string.Empty;
            rdEngineer.Checked = rdStudent.Checked = rdUnemployed.Checked = false;
            lblResult.Text = "No results yet";
        }

        protected void FormEnabler_Click(object sender, EventArgs e)
        {
            UserNameTextBox.Enabled = UserDescription.Enabled = UserSecretTextBox.Enabled =
                rdEngineer.Enabled = rdStudent.Enabled = rdUnemployed.Enabled = UserRetainCheckBox.Enabled = !form_enabled;
            form_enabled = !form_enabled;
            if (form_enabled)
                FormEnabler.Text = "Disable Form";
            else
                FormEnabler.Text = "Enable Form";
        }

        protected void AutoBackEnabler_Click(object sender, EventArgs e)
        {
            CustomPostBackBtn.Enabled = UserDescription.AutoPostBack;
            UserDescription.AutoPostBack = !UserDescription.AutoPostBack;
            if (UserDescription.AutoPostBack)
                AutoBackEnabler.Text = "Disable Auto Post Back";
            else
                AutoBackEnabler.Text = "Enable Auto Post Back";
        }
    }
}