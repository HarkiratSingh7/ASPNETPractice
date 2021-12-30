<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
            </asp:GridView>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Departments/Create.aspx">New</asp:HyperLink>
            <br />

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="EmpManagement.App_Code.Models.Department" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="EmpManagement.App_Code.Services.DepartmentService" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
