<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserInputControls.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>User Form</h3><br /><hr />
            <table>
                <tr>
                    <td><asp:Label runat="server" AssociatedControlID="UserNameTextBox" Text="User Name" /></td>
                    <td><asp:TextBox runat="server" ID="UserNameTextBox" TabIndex="1" AccessKey="U" /></td>
                    <td>Press Alt+U for short cut</td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" AssociatedControlID="UserSecretTextBox" Text="Secret Message" ToolTip="Press S for shortcut" /></td>
                    <td><asp:TextBox runat="server" ID="UserSecretTextBox" TextMode="Password" TabIndex="2" AccessKey="S" /></td>
                    <td>Press Tab or use Alt+S for shortcut</td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" AssociatedControlID="UserRetainCheckBox" Text="Retain User Name ?" /></td>
                    <td><asp:CheckBox runat="server" ID="UserRetainCheckBox" TabIndex="3" Checked="true" AccessKey="R" /></td>
                    <td>Press Alt+R for shortcut</td>
                </tr>
                <tr>
                    <td rowspan="3">User Job</td>
                    <td><asp:RadioButton runat="server" GroupName="Job" ID="rdStudent" Text="Student" TabIndex="4" /></td>
                </tr>
                <tr>
                    <td><asp:RadioButton runat="server" GroupName="Job" ID="rdEngineer" Text="Engineer" /></td>
                </tr>
                <tr>
                    <td><asp:RadioButton runat="server" GroupName="Job" ID="rdUnemployed" Text="Unemployed" /></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" AssociatedControlID="UserDescription" Text="Description" ToolTip="Press G for shortcut" /></td>
                    <td><asp:TextBox runat="server" ID="UserDescription" TextMode="MultiLine" TabIndex="5" AccessKey="G" /></td>
                    <td>Press Tab or use Alt+G for shortcut. After entering text, press Tab or click somewhere else to release focus.</td>
                </tr>
                <tr>
                    <td><asp:LinkButton runat="server" Text="Clear User Inputs" OnClick="ClearForm_Click" /></td>
                    <td><asp:Button runat="server" ID="FormEnabler" OnClick="FormEnabler_Click" /></td>
                    <td><asp:Button runat="server" Text="Say Hello" OnClientClick="return alert('Hello sir');" /></td>
                </tr>
                <tr>
                    <td>To Perform Cross Page Post Back, Disable Auto Post Back in this page.</td>
                    <td><asp:Button runat="server" ID="AutoBackEnabler" OnClick="AutoBackEnabler_Click" /></td>
                    <td><asp:Button runat="server" ID="CustomPostBackBtn" Text="Go to Final Page" PostBackUrl="FinalPage.aspx" /></td>
                </tr>
            </table>
            <br /><hr />
            <h3>Auto Post Back Result</h3>
            <asp:Label runat="server" ID="lblResult" Text="No results yet" />
        </div>
    </form>
</body>
</html>
