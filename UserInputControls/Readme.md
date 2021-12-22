### Input Controls, Post Backs and View States
This project demonstrates the use of the following features of ASP.NET.
1. User Input Controls like TextBoxes, CheckBoxes, RadioButtons and Buttons.
2. Custom View States and C# Properties.
3. Auto Post Backs
4. Cross Page Post Backs

#### User Controls
![ss1.png](https://github.com/HarkiratSingh7/ASPNETPractice/blob/17588ff2840b70b41502cdc9e889fb0bb8d301a5/UserInputControls/Screenshots/ss1.png)
User Input Controls like TextBoxes, CheckBoxes, RadioButtons and Buttons are used in
this page.

![ss2.png](https://github.com/HarkiratSingh7/ASPNETPractice/blob/17588ff2840b70b41502cdc9e889fb0bb8d301a5/UserInputControls/Screenshots/ss2.png)
Auto Post Back is made after the contents of the Description Text Box are modified
and focus is shifted away from it.

![ss3.png](https://github.com/HarkiratSingh7/ASPNETPractice/blob/17588ff2840b70b41502cdc9e889fb0bb8d301a5/UserInputControls/Screenshots/ss3.png)
The user controls can be disabled and enabled using the respective button.

#### Cross Page Post Back
To allow cross post back, first the auto post back should be disabled with the 
respective button.

![ss4.png](https://github.com/HarkiratSingh7/ASPNETPractice/blob/17588ff2840b70b41502cdc9e889fb0bb8d301a5/UserInputControls/Screenshots/ss4.png)<br/>
After that the **Go to final page** button is enabled. And on clicking that, cross 
page post back is made.

![ss5.png](https://github.com/HarkiratSingh7/ASPNETPractice/blob/17588ff2840b70b41502cdc9e889fb0bb8d301a5/UserInputControls/Screenshots/ss5.png)<br/>
Result displayed on another page.

![ss6.png](https://github.com/HarkiratSingh7/ASPNETPractice/blob/17588ff2840b70b41502cdc9e889fb0bb8d301a5/UserInputControls/Screenshots/ss6.png)<br/>
If the form was disabled and cross page post back was made, then it can handle it 
by making use of a property.

### Project Structure
The main file of this project is [Default.aspx](Default.aspx). And the second file 
to which cross page post back is made is [FinalPage.aspx](FinalPage.aspx)

The Code Behind File of Default.aspx page is [Default.aspx.cs](Default.aspx.cs). And 
the Code Behind File of FinalPage.aspx page is [FinalPage.aspx.cs](FinalPage.aspx.cs).

