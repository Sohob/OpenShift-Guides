# Jenkins on OCP
In this document, I will go through the steps to integrate Jenkins with OCP. I will use a demo GitHub repository: https://github.com/Sohob/openshift-jee-sample
The demo should have a simple Maven application. We will also create a pipeline with only three stages; clone, build, and deploy. 

## Setup
### 1. Create Jenkins
From developer view > + Add > Developer Catalog > All Services. Search for Jenkins and pick the Ephemeral template in case of testing. This stores no data on reboot.

Next, instantiate the template and check the configs. For now, the default settings should do.

![Example](https://imgur.com/6HEOVMm)
### 2. Jenkins Startup
After the pod is up and running, you can click the route URL that was created for the application. You should see the Jenkins setup asking you to log in. If it is not working, make sure that the route is configured on port 8080, not 50000.

The password for logging in is found in a directory on the running container, or simply, you can find it in the logs of the pod.

![First login password](https://imgur.com/itz9YzE)

After logging in, you'll be asked to create a user. Fill in the credentials you want, and then create. After that, you'll be able to install the plugins you want to use. Select all plugins that you want to install. Finally, you'll be asked to confirm the URL for Jenkins. You can continue with the default. After this step, you should be seeing Jenkins dashboard.

### 3. Create a Pipeline
Click on New Item from the dashboard, and create a Pipeline. In General, select GitHub project, and enter the GitHub repo URL: https://github.com/Sohob/openshift-jee-sample

Under Build Triggers, check GitHub hook trigger for GITScm polling. Finally, under pipeline, set the definition to be Pipeline script from SCM, and add the GitHub repo.

![Linking a repo](https://imgur.com/kB5XF2S)

Now we have created a pipeline that is connected to our repo, and gets the pipeline script from there. You can check the Jenkinsfile in the repo for more info.

When we push to the repo, Jenkins detects and starts executing the pipline stages autonomously. Or you can just build manually by clicking build now.

