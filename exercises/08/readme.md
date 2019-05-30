# Exercise 08 - Adding a Service Task to the Workflow definition

In this exercise you'll go back to the workflow definition you created in a previous exercise and add a Service Task to it to retrieve product information for the product ID specified when workflow instances are created.

## Steps

After completing these steps you'll have a workflow definition with a service task configured, and have deployed and tested it.

### 1. Open up the workflow definition in the SAP Web IDE Full-Stack

:point_right: Open up the SAP Web IDE Full-Stack that you enabled and used in [Exercise 05](../05). Once the IDE has started up, open the `orderprocess.workflow` workflow definition that should show your simple definition with only a start event and an end event.

### 2. Add a Service Task

:point_right: Use the Tasks menu in the graphical workflow editor to add a Service Task, and place it between the start event and the end event.

![Service Task selection](servicetaskselection.png)

It should look like this once you've added it:

![Service Task added](servicetaskadded.png)

You may notice a warning triangle decorating the Service Task in your workflow - this signifies that there is some configuration missing.

:point_right: While the Service Task is selected, go to the "Details" tab of the "Service Task Properties" on the right hand side, and specify the following values:

| Property              | Value              |
| --------------        | ------------------ |
| Destination           | `shopinfo`         |
| Choose a Service from | \<leave as "Others"\> |
| Path                  | `Products('${context.request.Id}')?sap-client=002` |
| HTTP Method           | GET                |
| Response Variable     | `${context.productInfo}` |
| Principal Propagation | (leave unchecked)  |

_Note: The "shopinfo" value is the name of the destination you created in [Exercise 04](../04)._

_Note: The "sap-client=002" query parameter is needed here despite the additional property setting in the destination definition as currently the Workflow service does not support that property._

### 3. Deploy the workflow definition

Now it's time to redeploy to the Workflow service, so that this addition of a Service Task is live.

:point_right: Use the context menu on the `orderprocess.workflow` file and select "Deploy -> Deploy to SAP Cloud Platform Workflow". Check in the console to see the detailed message which includes which version the definition now has.

_Note: To open the console in the SAP Web IDE Full-Stack, use menu path "View -> Console"._


## Summary

You've now ...

## Questions

1. When you switched from HTTP Method POST to GET when setting the Service Task properties, the "Path to XSRF Token" property disappeared. Why was that?

