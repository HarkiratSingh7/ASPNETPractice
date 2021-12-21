<%@ Page Language="C#" %>

<script runat="server">
    static int count = 0;

    protected void Page_Load()
    {
        Lbl2.Text = count.ToString();
    }

    protected void Btn1_Click(object sender, EventArgs e)
    {
        Lbl1.Text = (int.Parse(Lbl1.Text) + 1).ToString();
        Lbl2.Text = (++count).ToString();
        Lbl3.Text = (int.Parse(Lbl3.Text) + 1).ToString();
    }

    protected void Btn2_Click(object sender, EventArgs e)
    {
        Lbl2.Text = count.ToString();
    }
</script>
<!DOCTYPE html>
<html>
<head><title>First Page - Automatic View State Demonstration</title></head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                Run the application, and use two tabs of the browser to view this page. Click on increment a number of times on first tab.
                Then Start clicking the increment on the different tab. Click Refresh Values button in both tabs. 
                The first value will be different for each page. Because it is managed by
                automatic view state. However, the second value is handled by a static variable, and this variable has the same value for each
                client.
            </p>
            <asp:Button ID="Btn1" runat="server" OnClick="Btn1_Click" Text="Increment" />
            <asp:Button ID="Btn2" runat="server" OnClick="Btn2_Click" Text="Refresh Values without modifying" />
            <br />
            Automatic View State in ASP.NET:
            <asp:Label ID="Lbl1" runat="server" Text="0" /><br />
            Static Count Variable:          
            <asp:Label ID="Lbl2" runat="server" /><br />
            Disabled View State:
            <asp:Label ID="Lbl3" runat="server" Text="0" EnableViewState="false" />
        </div>
    </form>
</body>
</html>
