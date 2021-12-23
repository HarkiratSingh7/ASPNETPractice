### Advanced Validation
This project demonstrates the use of Range Validator, Custom Validator and a 
custom user defined validator named PlainTextValidator.

#### PlainTextValidator
It is a custom user control which validates that the text should only contain 
plain text (alphabets and numbers). It is a simple C# class inheriting System.Web.WebControls.BaseValidator class. 
This class should be placed inside **App_Code** folder and in the file properties 
of Visual Studio - select **Build Action** to None.

This class overrides the method 
        
        protected override bool EvaluateIsValid()

To include this custom user control the following directive was added to the 
webforms file

    <%@ Register Namespace="CustomControls" TagPrefix="custom" %>

More details can be seen in this file 
[App_Code/PlainTextValidator.cs](App_Code/PlainTextValidator.cs).

The web form file is [Default.aspx](Default.aspx).

Screenshots can be found here - [Screenshots](/AdvancedValidation/Screenshots/).