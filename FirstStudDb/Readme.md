### Student Registration Web Application

This project allows the users to add, modify and delete the records of students. It makes use of a database and ASP.NET framework to accomplish the same.

Project demonstrating **SqlDataSource, GridView, DetailsView, DropDownList** controls. It demonstrates insertion, updation and deletion using **control parameters** in SqlDataSource Control. Furthermore, it also demonstrates the use of **Master Pages, Themes (Skins and CSS)** and many validation controls.

#### Connection String

A connection string is a piece of information provided to the ADO.NET SqlClient class instance which allows the client to connect to a database specified in the string.

Most of the time, a connection string which is to be used in multiple files is placed inside a [Web.config](Web.config) file.

```xml
<configuration>
  <connectionStrings>
    <add name="FirstStudentDatabaseConnectionString" 
    connectionString="Data Source=(LocalDB)\MSSQLLocalDB;
        AttachDbFilename=|DataDirectory|\FirstStudentDatabase.mdf;
        Integrated Security=True;Connect Timeout=30" 
        providerName="System.Data.SqlClient"/>
  </connectionStrings>   
    ...
</configuration>
```

#### Using the SqlDataSource Control

ASP.NET provides a data source control called **SqlDataSource** control, which helps to interact with SQL Databases. It supports selection (including advanced selection involving joins), insertion, updation and deletion. 

The following is a code example taken from [Home.aspx](Home.aspx)

```aspnet
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
ConnectionString="<%$ ConnectionStrings:FirstStudentDatabaseConnectionString %>" 
SelectCommand="SELECT DEPARTMENTS.DEPARTMENT_NAME, STUDENTS.ROLLNO, 
STUDENTS.STUDENT_NAME, STUDENTS.FATHERS_NAME, STUDENTS.DOB, 
STUDENTS.GRADE FROM STUDENTS INNER JOIN DEPARTMENTS ON 
STUDENTS.DEPARTMENT = DEPARTMENTS.DEPTID">
</asp:SqlDataSource>
```

<br/>

##### Insertion using SqlDataSource Control

Insertion Parameters can be specified inside the SqlDataSource Control. It can be a control parameter (like TextBox etc) or simple parameter (like name of data bound subcontrol).

The following code of [Add.aspx](/FirstStudDb/Manage/Add.aspx) shows the use of control parameters.

```aspnet
<asp:SqlDataSource ID="StudentDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:FirstStudentDatabaseConnectionString %>"
        InsertCommand="INSERT INTO [STUDENTS] ([ROLLNO], [STUDENT_NAME]
        , [FATHERS_NAME], [DOB], [DEPARTMENT]) VALUES (@ROLLNO
        , @STUDENT_NAME, @FATHERS_NAME, @DOB, @DEPARTMENT)"
        SelectCommand="SELECT [ROLLNO], [STUDENT_NAME], [FATHERS_NAME
        ], [DOB], [DEPARTMENT] FROM [STUDENTS]">
        <InsertParameters>
            <asp:ControlParameter ControlID="StudentRollNumber"
             Name="ROLLNO" Type="Int32" />
            <asp:ControlParameter Name="STUDENT_NAME" 
            ControlID="StudentName" Type="String" />
            <asp:ControlParameter Name="FATHERS_NAME"
             ControlID="ParentName" Type="String" />
            <asp:ControlParameter Name="DEPARTMENT"
             ControlID="DepartmentLists" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
```

The following code of [Edit.aspx](/FirstStudDb/Manage/Edit.aspx) shows the use of bound fields of a details view control as parameters.

```aspnet
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FirstStudentDatabaseConnectionString %>" 
        DeleteCommand="DELETE FROM [STUDENTS] WHERE [ROLLNO] = @ROLLNO" 
        InsertCommand="INSERT INTO [STUDENTS] ([ROLLNO], [STUDENT_NAME], 
        [FATHERS_NAME], [DOB], [DEPARTMENT], [GRADE]) VALUES (@ROLLNO, 
        @STUDENT_NAME, @FATHERS_NAME, @DOB, @DEPARTMENT, @GRADE)" 
        SelectCommand="SELECT STUDENTS.ROLLNO, STUDENTS.STUDENT_NAME, 
        STUDENTS.FATHERS_NAME, STUDENTS.DOB, STUDENTS.GRADE, 
        DEPARTMENTS.DEPARTMENT_NAME FROM STUDENTS INNER JOIN 
        DEPARTMENTS ON STUDENTS.DEPARTMENT = DEPARTMENTS.DEPTID WHERE 
        (STUDENTS.ROLLNO = @ROLLNO)" 
        UpdateCommand="UPDATE STUDENTS SET STUDENT_NAME = @STUDENT_NAME, 
        FATHERS_NAME = @FATHERS_NAME, DOB = @DOB, GRADE = @GRADE 
        WHERE (ROLLNO = @ROLLNO)">
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
```

<br/>

#### Using SqlDataSource Control in other Controls

SqlDataSource control should be used to provide data to other data controls like GridViews, ListViews, DetailsView, FormView, Repeater etc.

The following piece of code taken from [Edit.aspx](/FirstStudDb/Manage/Edit.aspx) demonstrates how to use SqlDataSource control with a DetailsView control.

```aspnet
<asp:DetailsView ID="DetailsView1" runat="server" 
    AutoGenerateRows="False" CellPadding="4" DataKeyNames="ROLLNO" 
    DataSourceID="SqlDataSource1" OnItemDeleted="DetailsView1_ItemDeleted" 
    OnItemUpdating="DetailsView1_ItemUpdating">
            <Fields>
                <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department" ReadOnly="True" SortExpression="DEPARTMENT_NAME" />
                <asp:BoundField DataField="ROLLNO" HeaderText="Roll No." ReadOnly="True" SortExpression="ROLLNO" />
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="Name" SortExpression="STUDENT_NAME" />
                <asp:BoundField DataField="FATHERS_NAME" HeaderText="Father's\Guardian's Name" SortExpression="FATHERS_NAME" />
                <asp:BoundField DataField="DOB" HeaderText="Date Of Birth" SortExpression="DOB" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="GRADE" HeaderText="CGPA" SortExpression="GRADE" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
```

Similarly, SqlDataSource control can be used for GridView control as done in [Home.aspx](Home.aspx) file.

<br/>

#### Project Structure

This project consists of three webforms **([Home.aspx](Home.aspx), [Add.aspx](/FirstStudDb/Manage/Add.aspx), [Edit.aspx](/FirstStudDb/Manage/Edit.aspx))**,

There is a theme named **[MyTheme](/FirstStudDb/App_Themes/MyTheme)**.

There is a Database folder named **[App_Data](/FirstStudDb/App_Data/)**.

Complete list of important files in the project is

1. [Home.aspx](Home.aspx)
   1. [Home.aspx.cs](Home.aspx.cs)
2. [Global.aspx.cs](Global.asax.cs)
3. [MasterPage.Master](MasterPage.Master)
4. [Web.config](Web.config)
5. [Manage Folder](/FirstStudDb/Manage/)
   1. [Add.aspx](/FirstStudDb/Manage/Add.aspx)     
      1. [Add.aspx.cs](/FirstStudDb/Manage/Add.aspx.cs)
   2. [Edit.aspx](/FirstStudDb/Manage/Edit.aspx)
      1. [Edit.aspx.cs](/FirstStudDb/Manage/Edit.aspx.cs)
6. [App_Themes/MyTheme Folder](/FirstStudDb/App_Themes/MyTheme/)
   1. [MyTheme.css](/FirstStudDb/App_Themes/MyTheme/MyTheme.css)
   2. [MyTheme.skin](/FirstStudDb/App_Themes/MyTheme/MyTheme.skin)
7. [App_Data Folder](/FirstStudDb/App_Data/)

Screenshots can be checked [here](/FirstStudDb/Screenshots).

##### Note
This project used the ASP.NET SqlDataSource control to interact with 
database. However, it can also be done programmatically. For example 
the code file [Add.aspx.cs](/FirstStudDb/Manage/Add.aspx.cs) contains the 
following method which demonstrates the programmatic usage.

```csharp
protected void Submit_Click(object sender, EventArgs e)
{
    if (this.IsValid)
    {
        StudentDataSource.InsertParameters.Add("DOB", System.Data.DbType.Date, DateBox.Text);
        StudentDataSource.Insert();
        Response.Redirect("~/Home.aspx");
    }
}
```

A project demonstrating only the programmatic sql database connection will be added to this 
repo.