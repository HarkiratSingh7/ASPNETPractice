### Automatic View State Management in ASP.NET
View State is a feature that allows the ASP.NET Controls to remember their states (values) for each client.
Normally, in a simple web page, each time it is refreshed (or requested) then the server treats it as a request coming from a new client.
So it processes the whole page without considering the previous values of the controls. However, in case of ASP.NET,
each control has a view state. And it is enabled by default. So, when a request is sent from the client to the server (like a postback), then
the view states are also sent along with the request. Then the logic present at the backend can manipulate the values coming from the view states.

Actually a web server cannot automatically say which request is from which client, so alongwith each request, the previous state of each control (or control having view state enabled)
is sent. The whole page is rendered again, with modification that the values of the controls are copied from the view states.

In this project, the webform page has 3 labels. The first label is just a normal label with only Text attribute assigned a string "0".
The second label is using a value being assigned by Page_Load event from a static count variable.
The third label is like a first label with View State disabled.

Now if the increment is clicked, then it will try to update the values of the labels.

#### Case 1 - First Label
By default, view state is enabled. Each time the Increment button is clicked, it results in a post back event to the server. Along with this
request the view state of this label is sent. And the logic extracts the value from the view state and increments it and then assigned the value back to the control.

#### Case 2 - Second Label
By default, view state is enabled. But actually this variable is not using the value assgined to it. Each time the increment button is clicked. The logic 
on the server side will increment the static variable - count, and then assign its value to the control.
Also this variable is a static one, so it will reflect the same value to all other requests coming from any client.

#### Case 3 - Third Label
This label has view state disabled. When the increment button is clicked, it will send a post back request to the server.
Since no view state is sent for this control, therefore in the first thing server will do (InitializeComponents) will be to initialize this variable by the Text="0" (as specified in the code).
And then the event (Increment Button Clicked) is raised. So it will add 1 to 0 and then assign it back to the label.

### Project Structure
The main file of this project is [FirstPage.aspx](FirstPage.aspx). It consists of **code declaration block** and **page render block**. There is 
no separate code-behind file.

##### References
1. Stephen Walther et al, ASP.NET 4 Unleashed, First Printing, September 2010.