# Exercise 07 - Calling the Workflow API from Postman

In the previous exercise you used the SAP API Business Hub to explore and use the Workflow API. With the confidence gained in those steps, it's now time to make similar calls, to create a new workflow instance, from a 3rd party API client - Postman.

Postman is a very capable HTTP client with many features. In this exercise you'll use some of them:

- Collections and the Collection Runner
- Environments & variables

Using these features, you can achieve a semi-automated mechanism for creating new instances of your "orderprocess" workflow definition.

## Steps

After completing these steps you'll know how to instantiate new workflows from Postman (and, by inference, from other API clients and tools).

### 1. Open Postman and import the Workflow CodeJam collection

The two API calls you made in a previous exercise have been encapsulated into a small Postman collection that you can import and use.

:point_right: Launch Postman and get ready to import a collection using the "Import From Link" feature in this dialog box that you get when you select the "Import" button at the top left of the Postman UI:

![import collection](import-collection.png)

:point_right: In the dialog, specify the URL to this [workflowcodejamcollection.json](https://raw.githubusercontent.com/SAP/cloud-workflow-codejam/master/exercises/07/workflowcodejamcollection.json) resource, and use the "Import" button to complete the process.

### 2. Create a new Postman environment

Postman offers the facility to manage collections of settings that pertain to different contexts, for example you might have a couple of development contexts and system endpoints, and a production context. These are called "environments" in Postman and in this step you will create one to store the details of your specific SAP Cloud Platform trial account context.

Within environments you can use variables, and the environment-specific values for these are substituted at runtime.

:point_right: Examine how these variables are used, by looking at the first of the two requests in the collection you imported in the previous step. Expand the hierarchy of the "Workflow CodeJam" collection and select the first request:

```
GET - Get CSRF Token
```

You should see something like this:

![first request detail](firstrequest.png)

:point_right: Notice the use of the `{{workflowapi}}` variable in the URL, and the fact also that currently there is "No Environment" set.

:point_right: Use the "Manage Environments" button (the cog) in the top right to open up a dialog where you can add an environment - use the "Add" button and specify the following values in the "Add Environment" form that follows:

| Property               | Value                   |
| -------------          | ----------------------- |
| Environment Name       | My CodeJam Environment  |
| Variable               | `workflowapi`           |
| Initial Value          | \<the Workflow service API root\> |
| Current Value          | (_this will take the value of what you specify for the "Initial Value" property_) |




## Summary

You've now ...

## Questions

1. ...

