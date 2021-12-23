<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="FirstStudDb.Manage.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormBodyContent" runat="server">
    <asp:Label ID="TitleLabel" CssClass="TitleLabel" runat="server" Text="Edit Student Details"></asp:Label>
    
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ROLLNO" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" HorizontalAlign="Center" OnItemDeleted="DetailsView1_ItemDeleted" Width="50%" OnItemUpdating="DetailsView1_ItemUpdating">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department" ReadOnly="True" SortExpression="DEPARTMENT_NAME" />
                <asp:BoundField DataField="ROLLNO" HeaderText="Roll No." ReadOnly="True" SortExpression="ROLLNO" />
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="Name" SortExpression="STUDENT_NAME" />
                <asp:BoundField DataField="FATHERS_NAME" HeaderText="Father's\Guardian's Name" SortExpression="FATHERS_NAME" />
                <asp:BoundField DataField="DOB" HeaderText="Date Of Birth" SortExpression="DOB" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="GRADE" HeaderText="CGPA" SortExpression="GRADE" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FirstStudentDatabaseConnectionString %>" DeleteCommand="DELETE FROM [STUDENTS] WHERE [ROLLNO] = @ROLLNO" InsertCommand="INSERT INTO [STUDENTS] ([ROLLNO], [STUDENT_NAME], [FATHERS_NAME], [DOB], [DEPARTMENT], [GRADE]) VALUES (@ROLLNO, @STUDENT_NAME, @FATHERS_NAME, @DOB, @DEPARTMENT, @GRADE)" SelectCommand="SELECT STUDENTS.ROLLNO, STUDENTS.STUDENT_NAME, STUDENTS.FATHERS_NAME, STUDENTS.DOB, STUDENTS.GRADE, DEPARTMENTS.DEPARTMENT_NAME FROM STUDENTS INNER JOIN DEPARTMENTS ON STUDENTS.DEPARTMENT = DEPARTMENTS.DEPTID WHERE (STUDENTS.ROLLNO = @ROLLNO)" UpdateCommand="UPDATE STUDENTS SET STUDENT_NAME = @STUDENT_NAME, FATHERS_NAME = @FATHERS_NAME, DOB = @DOB, GRADE = @GRADE WHERE (ROLLNO = @ROLLNO)">
        <DeleteParameters>
            <asp:Parameter Name="ROLLNO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ROLLNO" Type="Int32" />
            <asp:Parameter Name="STUDENT_NAME" Type="String" />
            <asp:Parameter Name="FATHERS_NAME" Type="String" />
            <asp:Parameter DbType="Date" Name="DOB" />
            <asp:Parameter Name="DEPARTMENT" Type="Int32" />
            <asp:Parameter Name="GRADE" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ROLLNO" QueryStringField="field" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="STUDENT_NAME" Type="String" />
            <asp:Parameter Name="FATHERS_NAME" Type="String" />
            <asp:Parameter DbType="Date" Name="DOB" />
            <asp:Parameter Name="GRADE" Type="Decimal" />
            <asp:Parameter Name="ROLLNO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>
