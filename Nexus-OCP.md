

# Nexus installation

Quickstart installation for Nexus image on OpenShift. The guide can be used to install any container image available on DockerHub as well.

## Create the app

 1. From the developer view, deploy an application from the image.
 2. Enter the image name for Nexus: `atlassian/nexus`
 3. Name it 'nexus'
 4. Select Deployment
 5. Select 'No Application Group'
 6. Create

## Volume
To attach a PersistentVolumeClaim to the deployment:

 1. Create PVC from Administrator view
 2. Name it 'nexus' and set it to 10GB
 3. In the DeploymentConfig yaml, replace the existing volume mount and volume configs with these

```
volumeMounts:
	-name: nexus-data
	mountPath: /nexus-data


volumes:
- name: nexus-data
	persistentVolumeClaim:
		claimName: nexus
```
OR
```
$ oc set volume deployment nexus --add \
	--name 'nexus' \
	--type 'pvc' \
	--mount-path '/nexus-data' \
	--claim-name 'nexus-data' \
	--claim-size '10G' \
	--overwrite
```
OPTIONAL

```
$ oc set probe dc/nexus \
	--liveness \
	--failure-threshold 3 \
	--initial-delay-seconds 30 \
	-- echo ok
$ oc set probe dc/nexus \
	--readiness \
	--failure-threshold 3 \
	--initial-delay-seconds 30 \
	--get-url=http://:8081/nexus/content/groups/public
```
## Configure
After the pod is running, go through the initial setup of your Nexus server. There's nothing required, but if you want to set up your admin: 

 1. Click Sign in. You will be prompted to enter the initial password in the given location
 2. Switch to OpenShift and go to the terminal tab on the running pod
 3. Run `cat /nexus-data/admin.password`
 4. Copy the password and paste it
 5. Finish setting up

### And that's it!

#### References:
https://docs.openshift.com/container-platform/3.11/dev_guide/dev_tutorials/maven_tutorial.html

> Written by [Mostafa Abdelnasser](https://linkedin.com/in/mostafa-abdelnasser)
