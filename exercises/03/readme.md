# Exercise 03 - Installing the SAP Cloud Connector in a container

The scenario upon which this CodeJam is based includes access to an on-prem SAP system, for which the SAP Cloud Connector is required.

_Note: The SAP system we'll be using is not actually on-prem, it's the [public SAP NetWeaver Gateway Demo system](https://blogs.sap.com/2017/06/16/netweaver-gateway-demo-es5-now-in-beta/), known by its System ID "ES5". But for the purposes of understanding and configuring the SAP Cloud Connector, we will treat it as if it's on-prem._

In this exercise you'll set up SAP Cloud Connector, to provide the connection between an on-prem SAP system (ES5) and your subaccount on the SAP Cloud Platform, enabling services and apps running in that subaccount to access specific system endpoints in ES5.

The setup will be done in a container, to isolate SAP Cloud Connector and the software upon which it relies. This is a good approach not only for CodeJam scenarios like this where attendees' machines are all different, but also for use within work environments. Docker will be used as the container system.

_Note: The following instructions are based in part on the [nzamani/sap-cloud-connector-docker](https://github.com/nzamani/sap-cloud-connector-docker) repository on GitHub. If you want to find out more, check out the blog post "[Installing SAP Cloud Connector into Docker and connecting it to SAP Cloud Platform](https://blogs.sap.com/2018/05/22/installing-sap-cloud-connector-into-docker-and-connecting-it-to-sap-cloud-platform/)" by [Nabi Zamani](https://people.sap.com/pars.man#overview)._

_Note: Before proceeding with this exercise, please ensure there are no processes on your machine already listening on port 8443._

## Steps

After completing these steps you'll have a running SAP Cloud Connector system running in a container on your machine.

### 1. Prepare the environment for the Docker image

:point_right: Create a new directory called `container-scc/` (for example, in your home directory) and within that directory create a subdirectory called `sapdownloads/`.

The `container-scc/` directory will contain the build instructions for the Docker image that the container will be based upon, and the appropriate software to run the SAP Cloud Connector within it.

:point_right: Go to the [cloud section of the SAP Development Tools website](https://tools.hana.ondemand.com/#cloud) and download the latest Cloud Connector component, placing it into the `sapdownloads/` directory. Regardless of your local machine's operating system, you will need to download for Linux, as that is what the container will be running. At the time of writing the version is 2.12.0.1 - make sure you download the ZIP file for Linux as indicated:

![SAP Cloud Connector download](sccdownload.png)

:point_right: From the same page, now download the latest SAP Java Virtual Machine (JVM) into the `sapdownloads/` directory, again for Linux, and specifically the `.rpm` component, as indicated:

![SAP JVM download](jvmdownload.png)

:point_right: Finally in this step, create a new file in the `container-scc/` directory called `Dockerfile` (noting the capitalization and lack of extension).

Into this file, copy the contents of the [`Dockerfile`](Dockerfile) in this repository.

### 2. Build the Docker image

Now you have everything ready to build the Docker image that will enable you to instantiate a Linux-based container running the SAP Cloud Connector. The `Dockerfile` contains instructions to build that image, and are briefly as follows:

- base the image on the [CentOS](https://www.centos.org) Linux distribution (which has a reasonably small footprint)
- on top of the base image install some core tools
- copy across, from the host (your machine) to the image, the two files you downloaded (the SAP JVM and the SAP Cloud Connector component)
- unpack and install the SAP JVM and SAP Cloud Connector
- set up a shell & user (`sccadmin`) and instructions to start up the SAP Cloud Connector for when a container is created

So now you must build the image, and after that you can instantiate a container from that image.

:point_right: Build the image as follows:

```bash
docker build -t scc .
```

(don't forget the period at the end, denoting "this directory".)

You can look for the image that's produced, with the following command:

```bash
docker image ls
```

The output will look something like this (you may have fewer entries):

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
scc                 latest              acb6d16f23da        9 seconds ago       863MB
cap                 latest              35042912625f        2 weeks ago         365MB
debiancap           latest              a8fd0c3eb330        2 weeks ago         293MB
node                10                  64c810caf95a        8 weeks ago         899MB
node                lts                 64c810caf95a        8 weeks ago         899MB
centos              7                   9f38484d220f        2 months ago        202MB
debian              latest              a0bd3e1c8f9e        3 months ago        101MB
```

:point_right: Instantiate a container as follows:

```bash
docker run -p 8443:8443 --name myscc -d scc
```

Briefly, the parameters you pass here do the following:

- `-p 8443:8443`: make port 8443 in the container available on the host machine (remember, SAP Cloud Connector listens by default on port 8443 and you want to be able to connect to it with your browser on your host machine)
- `--name myscc`: this gives a human-friendly name to the container that can be used to refer to it in subsequent commands
- `-d`: run the container in "detached" mode, i.e. in the background
- `scc`: this is the name of the image from which the container is to be created

Because the container is started in the background, the output from this command is the ID that container.

## Summary

You've now ...

## Questions

1. ...

