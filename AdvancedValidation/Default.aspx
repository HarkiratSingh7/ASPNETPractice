<%@ Page Language="C#" %>

<%@ Register Namespace="CustomControls" TagPrefix="custom" %>

<script runat="server">
    const int min_age = 13;
    const int max_age = 70;

    protected void Page_Load()
    {
        uDobValidator.MaximumValue = DateTime.Now.AddYears(-min_age).ToShortDateString();
        uDobValidator.MinimumValue = DateTime.Now.AddYears(-max_age).ToShortDateString();
    }

    protected void uDescValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length < 10 || args.Value.Length > 255)
            args.IsValid = false;
        else
            args.IsValid = true;
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
            lblResult.Text = "Request Successfully submitted.";
        else
            lblResult.Text = "";
    }
</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function clientValidate(source, args) {
            if (args.Value.length < 10 || args.Value.length > 255)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Birth Date</td>
                    <td>
                        <asp:TextBox runat="server" ID="uDob" TextMode="Date" /></td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="uDob" ErrorMessage="Required" /><br />
                        <asp:RangeValidator runat="server" ControlToValidate="uDob" ID="uDobValidator" Type="Date">
                            Person must be at least <%=min_age %> years old and at most <%=max_age %> years old.
                        </asp:RangeValidator></td>
                </tr>
                <tr>
                    <td>Complaint Description</td>
                    <td>
                        <asp:TextBox runat="server" ID="uDesc" TextMode="MultiLine" /></td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="uDesc" ErrorMessage="Required" /><br />
                        <asp:CustomValidator runat="server" ID="uDescValidator" ClientValidationFunction="clientValidate"
                            ControlToValidate="uDesc" OnServerValidate="uDescValidator_ServerValidate"
                            ErrorMessage="There must be atleast 10 characters and at most 255 characters." /><br />

                        <custom:PlainTextValidator runat="server" ControlToValidate="uDesc"
                            ErrorMessage="Your description can contain only alphabets and numbers. No special character is allowed." />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button runat="server" ID="SubmitButton" Text="Submit" OnClick="SubmitButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label runat="server" ID="lblResult" EnableViewState="false" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
