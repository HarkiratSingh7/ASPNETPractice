<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Response.Redirect("~/Departments/Index.aspx");
    }

    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
            Response.Redirect("~/Departments/Index.aspx");
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateInsertButton="True" OnModeChanging="DetailsView1_ModeChanging" OnItemInserted="DetailsView1_ItemInserted" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Fields>
            </asp:DetailsView>

        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="EmpManagement.App_Code.Models.Department" InsertMethod="Insert" SelectMethod="GetAll" TypeName="EmpManagement.App_Code.Services.DepartmentService"></asp:ObjectDataSource>
    </form>
</body>
</html>
