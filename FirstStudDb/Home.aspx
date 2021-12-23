<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Home.aspx.cs" Inherits="FirstStudDb.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormBodyContent" runat="server">
    <div>
    <asp:Label ID="TitleLabel" CssClass="TitleLabel" runat="server" Text="List of Students"></asp:Label>
        <asp:GridView ID="StudentsGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="ROLLNO" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" BorderColor="#660066" BorderStyle="Solid" BorderWidth="1px" Font-Size="Larger" Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department" SortExpression="DEPARTMENT_NAME" >
                <ItemStyle BorderStyle="Dotted" />
                </asp:BoundField>
                <asp:BoundField DataField="ROLLNO" HeaderText="Roll No." ReadOnly="True" SortExpression="ROLLNO" >
                <ItemStyle BorderStyle="Dotted" />
                </asp:BoundField>
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="Name" SortExpression="STUDENT_NAME" >
                <ItemStyle BorderStyle="Dotted" />
                </asp:BoundField>
                <asp:BoundField DataField="FATHERS_NAME" HeaderText="Father's Name" SortExpression="FATHERS_NAME" >
                <ControlStyle BorderStyle="Dotted" />
                <ItemStyle BorderStyle="Dotted" />
                </asp:BoundField>
                <asp:BoundField DataField="DOB" HeaderText="Date Of Birth" SortExpression="DOB" DataFormatString="{0:dd-MM-yyyy}" >
                <ControlStyle BorderStyle="Dotted" />
                <ItemStyle BorderStyle="Dotted" />
                </asp:BoundField>
                <asp:BoundField DataField="GRADE" HeaderText="CGPA" SortExpression="GRADE" NullDisplayText="Not Uploaded" >
                <ControlStyle BorderStyle="Dotted" />
                <ItemStyle BorderStyle="Dotted" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="ROLLNO" DataNavigateUrlFormatString="Manage/Edit.aspx?field={0}" HeaderText="Edit" Text="Settings">
                <ItemStyle BorderStyle="Dotted" />
                </asp:HyperLinkField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </div>
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">New Student</asp:LinkButton>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FirstStudentDatabaseConnectionString %>" SelectCommand="SELECT DEPARTMENTS.DEPARTMENT_NAME, STUDENTS.ROLLNO, STUDENTS.STUDENT_NAME, STUDENTS.FATHERS_NAME, STUDENTS.DOB, STUDENTS.GRADE FROM STUDENTS INNER JOIN DEPARTMENTS ON STUDENTS.DEPARTMENT = DEPARTMENTS.DEPTID"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FirstStudentDatabaseConnectionString %>" SelectCommand="SELECT * FROM [DEPARTMENTS]"></asp:SqlDataSource>
</asp:Content>
