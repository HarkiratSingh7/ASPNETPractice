### Multiple Forms, Validation Groups and Button Commands
This project demonstrates the implementation of two separate forms, made using 
Server Panel Controls and Validation Groups. A single web form page is allowed to 
have only one form tag, therefore to added more than one form to a webform page, 
validation groups can be used.

Button Commands allow us to make a generic method and then handle different use 
cases and case specific arguments inside that method. There are three attributes 
which make this possible. The first is CommandName - it needs a string which 
specifies a use case, another is CommandArgument - it needs a string which is 
treated like an argument. Finally there is OnCommand attribute - it needs a function 
of type

        void Command_Click(object sender, CommandEventArgs e)
Parameter e has two members CommandName and CommandArgument which are mapped to
their respective attributes.

### Project Structure
The main file of this project is [Default.aspx](Default.aspx).

##### References
1. Stephen Walther et al, ASP.NET 4 Unleashed, First Printing, September 2010.
