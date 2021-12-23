<%@ Page Language="C#" %>

<script runat="server">

    protected void FormButton_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "FormSubmit")
            switch (e.CommandArgument)
            {
                case "Reg":
                    if (Page.IsValid)
                        lblRegResult.Text = "Registration Successful";
                    else
                        lblRegResult.Text = "Registration Failed";
                    break;
                case "Log":
                    if (Page.IsValid)
                        lblLogResult.Text = "Login Successful";
                    else
                        lblLogResult.Text = "Login Failed";
                    break;
            }
    }
</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        body {
            background-color: ghostwhite;
        }

        .middleButton {
            margin-top: 4px;
            margin-left: 45%;
            min-width: 40px;
            background-color: dodgerblue;
            color: white;
            padding: 10px;
            border: 1px solid dodgerblue;
            border-radius: 10px;
            margin-right: 30%;
        }

        div.column {
            float: left;
            margin-left: 10px;
            width: auto;
            background-color: navajowhite;
            border-radius: 18px;
            padding: 5px;
        }
    </style>
    <title>Multiple Forms in single web form page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="column">
            <asp:Panel runat="server" GroupingText="Registration Form">
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>First Name</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="regFname" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="regFname" ErrorMessage="First Name Required" Text="*" ValidationGroup="RegForm" />
                        </asp:TableCell><asp:TableCell>Last Name</asp:TableCell><asp:TableCell>
                            <asp:TextBox runat="server" ID="regLname" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="regLname" ErrorMessage="Last Name Required" Text="*" ValidationGroup="RegForm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>E-Mail ID</asp:TableCell><asp:TableCell ColumnSpan="3">
                            <asp:TextBox runat="server" TextMode="Email" ID="regEmail" Width="95%" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="regEmail"
                                ErrorMessage="Email ID Required" Text="*" ValidationGroup="RegForm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Phone Number</asp:TableCell><asp:TableCell ColumnSpan="3">
                            <asp:TextBox runat="server" TextMode="Phone" ID="regPhone" Width="95%" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="regPhone"
                                ErrorMessage="Phone Number Required" Text="*" ValidationGroup="RegForm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Password</asp:TableCell><asp:TableCell>
                            <asp:TextBox runat="server" TextMode="Password" ID="regPassword" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="regPassword"
                                ErrorMessage="Password Required" Text="*" ValidationGroup="RegForm" />
                        </asp:TableCell><asp:TableCell>Confirm Password</asp:TableCell><asp:TableCell>
                            <asp:TextBox runat="server" TextMode="Password" ID="regConfirmPassword" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="regConfirmPassword"
                                ErrorMessage="Confirm Password Required" Text="*" ValidationGroup="RegForm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="4">
                            <asp:CompareValidator runat="server" ControlToCompare="regPassword" 
                                ControlToValidate="regConfirmPassword" Text="Confirm Password does not match"
                                ValidationGroup="RegForm" /><br />
                            <asp:ValidationSummary runat="server" ValidationGroup="RegForm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="4">
                            <asp:Button CssClass="middleButton" runat="server" Text="Register" ID="regButton"
                                ValidationGroup="RegForm" CommandName="FormSubmit" CommandArgument="Reg" OnCommand="FormButton_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <br />
            <asp:Label runat="server" ID="lblRegResult" />
        </div>
        <div class="column">
            <asp:Panel runat="server" GroupingText="Login Form">
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>E-Mail ID</asp:TableCell><asp:TableCell ColumnSpan="3">
                            <asp:TextBox runat="server" TextMode="Email" ID="logEmail" Width="95%" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="logEmail"
                                ErrorMessage="Email ID Required" Text="*" ValidationGroup="LogForm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Password</asp:TableCell><asp:TableCell ColumnSpan="3">
                            <asp:TextBox runat="server" TextMode="Password" ID="logPassword" Width="95%" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="logPassword"
                                ErrorMessage="Password Required" Text="*" ValidationGroup="LogForm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <asp:ValidationSummary runat="server" ValidationGroup="LogForm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <asp:Button CssClass="middleButton" runat="server" Text="Login" ID="logButton"
                                ValidationGroup="LogForm" CommandName="FormSubmit" CommandArgument="Log" OnCommand="FormButton_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <br />
            <asp:Label runat="server" ID="lblLogResult" />
        </div>
    </form>
</body>
</html>
