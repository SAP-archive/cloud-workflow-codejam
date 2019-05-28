# Exercise 05 - Creating, deploying & instantiating a simple workflow

In this exercise you'll create the simplest workflow definition possible, and deploy it to SAP Cloud Platform, whereupon you'll use the workflow related apps you set up in your Portal service powered Fiori launchpad site to create an instance of the definition and look at it.

## Steps

After completing these steps you'll understand the general flow of development, deployment and usage of workflows on SAP Cloud Platform.

### 1. Create a new Workflow project in the SAP Web IDE Full-Stack

:point_right: Open up the SAP Web IDE Full-Stack (you may have it already open from the previous exercise) and create a new project with menu path "File -> New -> Project from Template". In the steps that follow, make these selections:

**Template Selection**

| Property               | Value                   |
| -------------          | ----------------------- |
| Environment filter     | Neo                     |
| Category filter        | Business Process Management |
| Template selection     | Workflow Project            |

**Basic Information**

| Property               | Value                   |
| -------------          | ----------------------- |
| Project Name           | OrderFlow               |

**Workflow Details**

| Property               | Value                   |
| -------------          | ----------------------- |
| Name                   | orderprocess            |
| Description            | Simple CodeJam workflow |

_Note: the names of the project, and the workflow definition within it, are deliberately different here, to highlight that they're not the same thing - you can have multiple workflow definitions in a single workflow project._

You should end up with a very simple workflow definition, that looks like this:

![simple workflow definition](simpleworkflowdefinition.png)

Observe that the workflow definition editor is graphical, and the file that represents the definition is within a `workflows/` directory within the project.

### 2. Deploy the definition to the cloud

While this workflow definition doesn't do very much, we can still carry out an initial exploration with the apps we set up in a previous exercise. So in this step we'll deploy the definition to SAP Cloud Platform to be able to do that.

:point_right: Locate the definition file `orderprocess.workflow` and use the context menu "Deploy -> Deploy to SAP Cloud Platform Workflow". You should see a message confirming that the deployment was successful.

That's it!

_Note: here you only deployed a workflow definition; more involved workflow projects also include forms and other UI elements - these are deployed separately, as you will see in a later exercise._

### 3. Examine the workflow definition and create an instance of it

:point_right: Go to your Fiori launchpad site and start the "Monitor Workflows - Workflow Definitions" app. You should see something like this:

![orderprocess workflow definition](workflowdefinitionv1.png)



## Summary

You've now ...

## Questions

1. ...

