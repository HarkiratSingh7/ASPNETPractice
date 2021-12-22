<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinalPage.aspx.cs" Inherits="UserInputControls.FinalPage" %>

<%@ PreviousPageType VirtualPath="~/Default.aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name</td>
                    <td><asp:Literal runat="server" ID="NameMsg" /></td>
                </tr>
                <tr>
                    <td>Secret Message</td>
                    <td><asp:Literal runat="server" ID="SecretMsg" /></td>
                </tr>
                <tr>
                    <td>Job</td>
                    <td><asp:Literal runat="server" ID="JobMsg" /></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><asp:Literal runat="server" ID="DescMsg" /></td>
                </tr>
                <tr>
                    <td><asp:Button runat="server" ID="GoBackBtn" Text="Go back" OnClick="GoBackBtn_Click" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
