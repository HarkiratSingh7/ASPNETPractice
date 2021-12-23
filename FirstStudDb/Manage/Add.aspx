<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Add.aspx.cs" Inherits="FirstStudDb.Manage.Add" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormBodyContent" runat="server">
    <asp:Label ID="TitleLabel" CssClass="TitleLabel" runat="server" Text="Add New Student"></asp:Label>
    <table>
        <tr>
            <td>Roll Number</td>
            <td>
                <asp:TextBox ID="StudentRollNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Student Roll Number is Required"
                    ID="StudentRollNumberValidator" ControlToValidate="StudentRollNumber">
                </asp:RequiredFieldValidator>
                <asp:CustomValidator ID="AlreadyExists" runat="server"
                    OnServerValidate="AlreadyExists_ServerValidate"
                    ControlToValidate="StudentRollNumber" ErrorMessage="This roll number already exists">
                </asp:CustomValidator>
                <asp:RegularExpressionValidator ID="NumberDataType" runat="server" ControlToValidate="StudentRollNumber"
                    ValidationExpression="^[0-9]+$" ErrorMessage="Roll number should be a number">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Name</td>
            <td>
                <asp:TextBox ID="StudentName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Student Name is Required"
                    ID="StudentNameValidator" ControlToValidate="StudentName">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Father's/Guardian's Name</td>
            <td>
                <asp:TextBox ID="ParentName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Father's/Guardian's Name is Required"
                    ID="ParentNameValidator" ControlToValidate="ParentName">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Date Of Birth</td>
            <td>
                <asp:CustomValidator ID="StudentAgeValidator" runat="server" ValidateEmptyText="true"
                    OnServerValidate="StudentAgeValidator_ServerValidate">
                </asp:CustomValidator>
                <%--<asp:Calendar ID="DateCalendar" runat="server"></asp:Calendar>--%>
                <asp:TextBox ID="DateBox" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Department</td>
            <td>
                <asp:DropDownList ID="DepartmentLists" runat="server" DataSourceID="SqlDataSource1"
                    DataValueField="DEPTID" DataTextField="DEPARTMENT_NAME">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Student Enrollment Department is Required"
                    ID="DepartmentValidator" ControlToValidate="DepartmentLists">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:Button ID="Submit" Text="Add Student" runat="server" OnClick="Submit_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:FirstStudentDatabaseConnectionString %>"
        SelectCommand="SELECT * FROM [DEPARTMENTS]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="StudentDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:FirstStudentDatabaseConnectionString %>"
        InsertCommand="INSERT INTO [STUDENTS] ([ROLLNO], [STUDENT_NAME], [FATHERS_NAME], [DOB], [DEPARTMENT]) VALUES (@ROLLNO, @STUDENT_NAME, @FATHERS_NAME, @DOB, @DEPARTMENT)"
        SelectCommand="SELECT [ROLLNO], [STUDENT_NAME], [FATHERS_NAME], [DOB], [DEPARTMENT] FROM [STUDENTS]">
        <InsertParameters>
            <asp:ControlParameter ControlID="StudentRollNumber" Name="ROLLNO" Type="Int32" />
            <asp:ControlParameter Name="STUDENT_NAME" ControlID="StudentName" Type="String" />
            <asp:ControlParameter Name="FATHERS_NAME" ControlID="ParentName" Type="String" />
            <asp:ControlParameter Name="DEPARTMENT" ControlID="DepartmentLists" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
