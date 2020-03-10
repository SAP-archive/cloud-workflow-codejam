# Exercise 05 - Creating, deploying & instantiating a simple workflow

In this exercise you'll create the simplest workflow definition possible, and deploy it to SAP Cloud Platform, whereupon you'll use the workflow related apps you set up in your Portal service powered Fiori launchpad site to create an instance of the definition and look at it.

## Steps

After completing these steps you'll understand the general flow of development, deployment and usage of workflows on SAP Cloud Platform, specifically in the Cloud Foundry environment.

### 1. Create a new Workflow project in the SAP Web IDE Full-Stack

:point_right: Open up the SAP Web IDE Full-Stack (you may have it already open from the previous exercise) and create a new project with menu path "File -> New -> Project from Template". In the steps that follow, make these selections:

**Template Selection**

| Property               | Value                   |
| -------------          | ----------------------- |
| Environment filter     | Cloud Foundry           |
| Category filter        | All Categories          |
| Template selection     | Multi-Target Application |

**Basic Information**

| Property               | Value                   |
| -------------          | ----------------------- |
| Project Name           | OrderFlow               |

**Template Customization**

| Property               | Value                   |
| -------------          | ----------------------- |
| Application ID         | OrderFlow (i.e. leave as-is) |
| Application Version    | 0.0.1 (i.e. leave as-is) |
| Description            | (leave blank)             |
| Use HTML Application Repository checkbox | (leave unchecked) |

**Workflow Details**

| Property               | Value                   |
| -------------          | ----------------------- |
| Name                   | orderprocess            |
| Description            | Simple CodeJam workflow |


If you expand the resulting project structure you'll see that not much has been generated - merely an `mta.yaml` file that has very little in it right now. Go on, take a look inside the file ... you're curious, right?

> If you have "Show hidden files" turned on (via the "eye" icon) in your SAP Web IDE Development perspective, you'll also see a directory called `.che/` too, but this is related to the IDE itself rather than the workflow project specifically, so you can ignore it.

The idea of a multi-target application is that it is made up from multiple parts - one or more modules, with dependencies on one or more resources. This workflow project will be no different.

:point_right: Add a module now, a workflow module specifically, by using the context menu on the `OrderFlow` project name and choosing "New -> Workflow Module". Use the following selections:

**Basic Information**

| Property               | Value                   |
| -------------          | ----------------------- |
| Module Name            | OrderProcess            |

**Workflow Details**

| Property               | Value                   |
| -------------          | ----------------------- |
| Name                   | orderprocess            |
| Description            | (leave blank)           |

_Note: the names of the module, and the workflow definition within it, are deliberately different here, to highlight that they're not the same thing - you can have multiple workflow definitions in a single workflow module._

You should end up with a very simple workflow definition, that looks like this:

![simple workflow definition](simpleworkflowdefinition.png)

Observe that the workflow definition editor is graphical (it's the one you [enabled in Exercise 01](../01#4-set-up-the-sap-web-ide)), and the file that represents the definition is within a `workflows/` directory within the project.


### 2. Deploy the definition to the cloud

While this workflow definition doesn't do very much, we can still carry out an initial exploration with the apps we made available in the Fiori launchpad in [Exercise 02](../02). So in this step we'll deploy the definition to SAP Cloud Platform to be able to do that.

:point_right: Locate the definition file `orderprocess.workflow` and use the context menu "Deploy -> Deploy to SAP Cloud Platform Workflow". You should see a message confirming that the deployment was successful.

That's it!

_Note: here you only deployed a workflow definition; more involved workflow projects also include forms and other UI elements - these are deployed separately, as you will see in a later exercise._

### 3. Examine the workflow definition and create an instance of it

:point_right: Go to your Fiori launchpad site and start the "Monitor Workflows - Workflow Definitions" app. You should see something like this:

![orderprocess workflow definition](workflowdefinitionv1.png)

You can see that this is version 1 of the definition, the first version you've deployed (the version number is incremented automatically on each new deploy).

Here you can start a new instance, which is what you should do now. Built in to the system is some simple test data that can be used to populate new instances of workflow definitions for testing purposes. You can, if you wish, modify or completely overwrite the test data.

:point_right: Use the "Start New Instance" button, and in the dialog that appears, leave the test data as it is, and continue with the "Start New Instance" button to have an instance of your workflow definition created. A message should appear briefly to confirm that.

### 4. Look at the workflow instance

:point_right: Switch to looking at the workflow instance you created, by using the "Show Instances" button.

You should see a filtered display in the master list ... but it's likely that you won't see your newly created instance. This is because the default filter is to show instances with the following status values:

- Erroneous
- Running
- Suspended

Because of the simplicity of your workflow definition right now, the instance has already completed.

:point_right: Use the filter icon at the bottom of the master list to add the status "Completed" to the status values.

You should now see your instance. There's plenty of information to examine.

:point_right: Take a couple of minutes to explore the information.

### 5. Create another workflow instance with different data

Before finishing this exercise, it's worth going through the process of manually creating a workflow instance again, this time supplying different data.

:point_right: Navigate back to the display of the workflow definition, and use the "Start New Instance" button again. This time, replace the entire test data (relating to the Hamlet book) with the following:

```json
{
  "request": {
    "Id": "HT-1001",
    "Quantity": 5
  }
}
```

Examining the completed instance this time, you should see this data in the Workflow Context section.

## Summary

You've now gone through the process of bringing a workflow definition from your development environment (the SAP Web IDE Full-Stack) to the Workflow service on the SAP Cloud Platform, and using the administration apps to create and examine instances of it. You'll find that the "Monitor Workflows" app is a very useful tool.

## Questions

1. There are two tiles to look at workflow information - definitions and instances. Are there actually two apps? How did you jump from looking at your definition to looking at instances of it? What changed in the URL when you jumped?

1. What sort of information did you find when examining the completed workflow instance? Did you understand what everything was? What was in the workflow context, and what did you see when you selected "Show Tasks"?
