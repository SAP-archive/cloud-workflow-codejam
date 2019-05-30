# Exercise 09 - Adding a User Task to the workflow definition

In this exercise you'll enhance the workflow definition by adding a User Task to it, so that a decision point can be presented to a person in the My Inbox app.

## Steps

After completing these steps you'll have a User Task in your workflow definition that presents information from the workflow instance context, and asks for a decision.

### 1. Open up the workflow definition in the SAP Web IDE Full-Stack

:point_right: Open up the SAP Web IDE Full-Stack that you enabled and used in [Exercise 05](../05). Once the IDE has started up, open the `orderprocess.workflow` workflow definition that should show your definition with the Service Task between the start and end events.

### 2. Add a User Task to the definition

:point_right: In a similar way to how you added a Service Task in [Exercise 08](../08/),  use the Tasks menu in the graphical workflow editor to add a User Task, and place it after the Service Task, and before the end event.

_Note: You can make use of the "Arrange Vertically" and "Arrange Horizontally" buttons in the editor to tidy up the graphical flow after adding items to the definition._

![arrangement buttons](arrangementbuttons.png)

The User Task requires certain settings. First though, let's change the name of the User Task, as well as the Service Task, so they are more meaningful in the editor.

:point_right: Select the User Task and in the "General" tab of the "User Task Properties" on the right hand side, specify the value "Approval Descision". Then select the Service Task and make a similar change, changing the current value of "ServiceTask1" to "Retrieve Product Info". Don't forget to save.

Now it's time to specify the settings.

:point_right: In the "Details" tab of the "User Task Properties", specify the following values:

| Property     | Value          |
| ------------ | -------------- |
| Priority     | (keep at "Medium" or change if you wish) |
| Subject      | `Request for ${context.productInfo.d.Name}` |
| Description  | `Please review this request for ${context.request.Quantity} items.` |
| Users        | \<your SAP Cloud Platform trial account username\> |
| Group        | (leave blank)  |
| Configure Due Date | (leave unchecked) |

_Note: The user assignment is case sensitive, so it's important that you specify your username with a capital letter at the beginning, for example `P2001351149` not `p2001351149`._

_Note: Within the context of the trial account you are using (with only a single user - you - available), it makes sense to specify yourself as a recipient of the user task items.In other situations this could be a calculated value, or the "Group" property could be used instead._

### 3. Create a new workflow instance and check the User Task

Even though you've only configured the minimum, you can still see the raw results of your work. You'll have to specify a couple more dummy values, but then you can save the workflow definition, redeploy it, create a new instance and have a look at what happens.

:point_right: In the "User Interface" tab of the "User Task Properties", the properties "HTML5 App Name" and "SAPUI5 Component" are required, relating to the default "Type" that is pre-selected ("SAPUI5 Component"). Specify the dummy value "x" for each of them.

_Note: This is the place where you'd normally specify details of a custom UI5 component that is to be used to represent the details of the user task in the My Inbox app. Building a custom UI5 component for this is beyond the scope of these CodeJam excercises, but we can take advantage of the settings required by providing dummy values for both the properties. The result will be the ability to deploy the modified workflow definition (because the validity of the component details is only an issue at runtime), and a half-empty but understandable user task entry in the My Inbox app, which will be fine for us for now._

![user interface details](uidetails.png)

:point_right: Save the workflow definition, and then deploy it again as you have done before (using the context menu on the `orderprocess.workflow` file).

:point_right: Now create a new instance using the Collection Runner in Postman, as you have [done before in Exercise 08](../08#4-create-a-new-instance-of-the-workflow-definition).

:point_right: Switch to your Fiori launchpad site, and you should now see that there is a task waiting for you in the My Inbox app:

![task in My Inbox](taskinmyinbox.png)

:point_right: Go ahead and select the My Inbox tile, to view the item. It should look something like this:

![My Inbox item](myinboxitem.png)

You should see that the user task is there, with the correct name ("Approval Decision"),  subject ("Request for ...") and description ("Please review this request ..."). But there is not much else, and no action buttons for you to select to mark your decision.

_Note: The "Show Log" and "Claim" buttons are not decision related, they are generic features available in all user tasks._

Because this is only a half-baked user task, you won't be able to complete it here, you'll have to do it as an administrator, in the "Monitor Workflow - Workflow Instances" app.

:point_right: Switch to the "Monitor Workflow - Workflow Instances" app and find the instance of the "orderprocess" definition that relates to this user task. You should be able to find it quite easily, as it will still be in the status "Running":

![running instance](runninginstance.png)

:point_right: Select the "Execution Log" and have a look at what's been happening - you should be able to see the step by step progress of this workflow instance, from start, through the Service Task, to the User Task becoming available.

:point_right: To keep things clean and tidy, it's worth removing this from the default filtered list of instances, so use the "Terminate" button to end the instance. It should disappear from the list.

### 4. Add a Form to the User Task in the workflow definition

You can build custom UI5 components to be used within the My Inbox app to display user task information and offer user interaction, or you can use a zero-code form builder facility within the SAP Web IDE workflow editor toolset to create a form that can surface and collect data, and offer decision buttons.

For the majority of simple decision tasks, a form is likely to be a good choice as they're easy and fast to create and don't require programming knowledge.

In this step you'll add a form to be used in the User Task you created earlier in this exercise.

:point_right: Go back to editing the workflow definition in the SAP Web IDE Full-Stack, and select the User Task. In the "User Interface" tab of the "User Task Properties", switch from type "SAPUI5 Component" to "Form", and then select the "Create File" link to open up a dialog where you can specify the basic form information:

![New Form dialog](newformdialog.png)

:point_right: Specify the following property values before selecting the "Create" button:

| Property     | Value             |
| ------------ | ----------------- |
| Name         | `RequestDecision` |
| ID           | `requestdecision` |
| Revision     | `1`               |

_Note: This form will be created as a file inside your workflow project directory structure, specifically within the `forms/` directory._






## Summary

You've now ...

## Questions

1. When looking at the "Execution Log" details of the first instance you created with a User Task, there was an "Instance ID" link. What did that lead you to, and what does it represent?

1. When you terminated the instance in Step 3, what status did it end up in?


