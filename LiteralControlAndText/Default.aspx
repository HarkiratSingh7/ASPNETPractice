<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LiteralControlAndText.Default" Trace="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><asp:Literal ID="ltlTitle" runat="server" /></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" ID="Label1" Font-Size="X-Large" Font-Bold="true">
                Literal Text, Literal Control and the Label Control
            </asp:Label>
            <div>
                Each HTML control not using the runat="server" attribute and each text appearing without any tags is considered as Literal Control and Literal Text respectively.
                For example the title of this html document will be treated as a Literal Text if not wrapped inside Literal Control, otherwise it is a LiteralControl.
                <br /><br />
                <asp:Literal runat="server" Mode="Encode">
                    <b>Literal Control with Encode Mode</b><br />
                    On the other hand Literal Control can dynamically modify the text.
                    For example, in this file, the title element has a Literal Control, and the text is assigned to it dynamically in the Code Behind File
                    (in the Page_Load method).
                    However, Literal Control is rendered in the same manner as Literal Text (Non Server side html text and elements), i.e. without any 
                    <span style="color:red;">Spanning</span> tags.<br />
                    This mode actually encodes the html tags into simple text. It displays the tags as text.
                </asp:Literal><br /><br />
                <asp:Literal runat="server" Mode="PassThrough">
                    <b>Literal Control with PassThrough Mode</b><br />
                    On the other hand Literal Control can dynamically modify the text.
                    For example, in this file, the title element has a Literal Control, and the text is assigned to it dynamically in the Code Behind File
                    (in the Page_Load method).
                    However, Literal Control is rendered in the same manner as Literal Text (Non Server side html text and elements), i.e. without any 
                    <span style="color:red;">Spanning</span> tags.<br />
                    This mode does nothing, it passes its contents to the html interpreter without any modification or encoding. Therefore any tags 
                    occuring inside this control will be processed.
                </asp:Literal><br /><br />
                <asp:Literal runat="server" Mode="Transform">
                    <b>Literal Control with Transform Mode</b><br />
                    On the other hand Literal Control can dynamically modify the text.
                    For example, in this file, the title element has a Literal Control, and the text is assigned to it dynamically in the Code Behind File
                    (in the Page_Load method).
                    However, Literal Control is rendered in the same manner as Literal Text (Non Server side html text and elements), i.e. without any 
                    <span style="color:red;">Spanning</span> tags.<br />
                    This mode removes the tags which are not supported by the client and then passes the contents to the html interpreter without any
                    modification or encoding. Therefore any supported tags occuring inside this control will be processed.
                </asp:Literal><br /><br />
                <asp:Label runat="server" Font-Bold="true" Font-Names="Cambria, Verdana, Calibri" Font-Underline="true">
                    On the other hand, label control supports content (not just text) formatting. It wraps the content inside the 
                    <asp:Literal runat="server" Mode="Encode" Text="<span></span>" /> tags.<br />
                    If AssociatedControlID Property is specified (the ID of an User Input Form Field), then the contents will be rendered inside the
                    <asp:Literal runat="server" Mode="Encode" Text="<label></label>" /> tags.
                </asp:Label><br /><br />
                <b>Note: This page was processed with tracing enabled. Therefore LiteralControls and other controls are spotted in the Control Tree Section
                    of the following Trace information.
                </b><br /><br />
            </div>
        </div>
    </form>
</body>
</html>
