<%@ Page Language="C#" %>

<%@ Import Namespace="EmpManagement.App_Code.Services" %>
<!DOCTYPE html>
<script runat="server">

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Response.Redirect("~/Employees/Index.aspx");
    }

    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
            Response.Redirect("~/Employees/Index.aspx");
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        var id = Convert.ToInt32(e.Values["Department"]);
        var dptId = DepartmentService.GetDepartmentById(id);
        e.Values["Department"] = dptId;
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DetailsView ID="DetailsView1" runat="server" OnItemInserting="DetailsView1_ItemInserting" OnItemInserted="DetailsView1_ItemInserted" OnModeChanging="DetailsView1_ModeChanging" AutoGenerateInsertButton="True" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Joined" HeaderText="Joined" SortExpression="Joined" />
                    <asp:TemplateField HeaderText="Department" SortExpression="Department">
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DepartmentDropdown" runat="server" DataSourceId="ObjectDataSource2"
                                DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("Department") %>'></asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <%#Eval("Name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="EmpManagement.App_Code.Models.Employee" InsertMethod="Insert" SelectMethod="GetAll" TypeName="EmpManagement.App_Code.Services.EmployeeService"></asp:ObjectDataSource>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAll" TypeName="EmpManagement.App_Code.Services.DepartmentService"></asp:ObjectDataSource>
    </form>
</body>
</html>
