<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/MasterPage.Master" %>

<%@ Import Namespace="EmpManagement.App_Code.Services" %>
<%@ Import Namespace="EmpManagement.App_Code.Models" %>

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



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormBodyContent" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" OnItemInserting="DetailsView1_ItemInserting"
        OnItemInserted="DetailsView1_ItemInserted" OnModeChanging="DetailsView1_ModeChanging"
        AutoGenerateInsertButton="True" AutoGenerateRows="False" DataSourceID="ObjectDataSource1"
        DefaultMode="Insert" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:TemplateField HeaderText="Role" SortExpression="Role">
                <EditItemTemplate>
                    <asp:DropDownList ID="roleBox1" runat="server" Text='<%# Bind("Role") %>'>
                        <asp:ListItem Text="Manager" Value="0" />
                        <asp:ListItem Text="Employee" Value="1" />
                        <asp:ListItem Text="Admin" Value="2" />
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="roleBox2" runat="server" Text='<%# Bind("Role") %>'>
                        <asp:ListItem Text="Manager" Value="0" />
                        <asp:ListItem Text="Employee" Value="1" />
                        <asp:ListItem Text="Admin" Value="2" />
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:TemplateField HeaderText="Joined" SortExpression="Joined">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="Date" runat="server" Text='<%# Bind("Joined") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="Date" runat="server" Text='<%# Bind("Joined") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Joined") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Department" SortExpression="Department">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DepartmentDropdown" runat="server" DataSourceID="ObjectDataSource2"
                        DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("Department") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <%#Eval("Name") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        DataObjectTypeName="EmpManagement.App_Code.Models.Employee"
        InsertMethod="Insert" SelectMethod="GetAll"
        TypeName="EmpManagement.App_Code.Services.EmployeeService" />
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAll"
        TypeName="EmpManagement.App_Code.Services.DepartmentService" />
</asp:Content>
