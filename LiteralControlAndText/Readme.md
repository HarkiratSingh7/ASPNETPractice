### Literal Text, Literal Control and the Label Control
Each HTML control not using the **runat="server"** attribute and each text appearing 
without any tags is considered as **Literal Control**.
For example the title of this html document is actually treated as a Literal Text 
(LiteralControl is the .NET class handling Literal Texts).
<br/><br/>On the other hand Literal Control is again the same thing as Literal Text 
***(actually Literal Control is of System.Web.UI.WebControls.Literal class and Literal Element or Text (non server side HTML) is of System.Web.UI.LiteralControl. It is quite confusing but LiteralControl belongs to Literal class and any other non server side element in html page render part of the web forms is handled by LiteralControl class.)*** with one property that it can  dynamically modify the text (i.e. using Control ID in the C# Code) according to some specified mode of operation.
However, Literal Control is rendered in the same manner as Literal Text (Non Server 
side html text and elements), i.e. without any **&lt;span&gt;&lt;/span&gt;** tag.


#### Literal Control with Encode Mode
This mode actually encodes the html tags into simple text. It displays the tags as 
text.

#### Literal Control with PassThrough Mode
This mode does nothing, it passes its contents to the html interpreter without any 
modification or encoding. Therefore any tags occuring inside this control 
will be processed.

#### Literal Control with Transform Mode
This mode removes the tags which are not supported by the client and then passes 
the contents to the html interpreter without any modification or encoding. Therefore 
any supported tags occuring inside this control will be processed.

#### Label Control
 On the other hand, label control supports content (not just text) formatting. It 
wraps the content inside the &lt;span&gt;&lt;/span&gt; tags.<br />
If **AssociatedControlID** Property is specified (the ID of an User Input Form Field), 
then the contents will be rendered inside the &lt;label&gt;&lt;/label&gt; tags.

### Project Structure
The main file of this project is [Default.aspx](Default.aspx).
##### References
1. Stephen Walther et al, ASP.NET 4 Unleashed, First Printing, September 2010.
