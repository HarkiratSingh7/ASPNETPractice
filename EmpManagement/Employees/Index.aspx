<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" %>

<%@ Import Namespace="EmpManagement.App_Code.Services" %>
<script runat="server">

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (!e.NewValues.Contains("Department.Id"))
            return;

        var id = Convert.ToInt32(e.NewValues["Department.Id"]);
        var dptId = DepartmentService.GetDepartmentById(id);
        e.NewValues.Remove("Department.Id");
        e.OldValues.Remove("Department.Id");
        e.NewValues.Add("Department", dptId);
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormBodyContent" runat="server">
            <asp:GridView ID="GridView1" OnRowUpdating="GridView1_RowUpdating" 
                DataKeyNames="Id" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Joined" HeaderText="Joined" SortExpression="Joined" DataFormatString="{0:dd-MMMM-yyyy}" />
                    <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Department" SortExpression="Department">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DepartmentDropdown" runat="server" DataSourceID="ObjectDataSource2"
                                DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("Department.Id") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# Eval("Department.Name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Create.aspx">New</asp:HyperLink>
            <br />
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DataObjectTypeName="EmpManagement.App_Code.Models.Employee" DeleteMethod="Delete" 
                InsertMethod="Insert" SelectMethod="GetAll" 
                TypeName="EmpManagement.App_Code.Services.EmployeeService" UpdateMethod="Update">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                SelectMethod="GetAll" TypeName="EmpManagement.App_Code.Services.DepartmentService"></asp:ObjectDataSource>
</asp:Content>