# Bitbucket installation

Quickstart installation for Bitbucket image on OpenShift. The guide can be used to install any container image available on DockerHub as well.

## Create the app

 1. From the developer view, deploy an application from the image.
 2. Enter the image name for Bitbucket: `atlassian/bitbucket-server`
 3. Name it 'bitbucket-server'
 4. Select Deployment
 5. Select 'No Application Group'
 6. Create

## Volume
To attach a PersistentVolumeClaim to the deployment:

 1. Create PVC from Administrator view
 2. Name it 'bitbucket-server' and set it to 10GB
 3. In the DeploymentConfig yaml, replace the existing volume mount and volume configs with these

```
volumeMounts:
	-name: bitbucket-server-data
	mountPath: /var/atlassian/application-data/bitbucket


volumes:
- name: bitbucket-server-data
	persistentVolumeClaim:
		claimName: bitbucket-server
```
OR
```
$ oc set volume deployment bitbucket-server --add \
	--name 'bitbucket-server' \
	--type 'pvc' \
	--mount-path '/var/atlassian/application-data/bitbucket/' \
	--claim-name 'bitbucket-server-data' \
	--claim-size '10G' \
	--overwrite
```
OPTIONAL

```
$ oc set probe deployment bitbucket-server \
	--liveness \
	--failure-threshold 3 \
	--initial-delay-seconds 30 \
	-- echo ok
$ oc set probe deployment bitbucket-server \
	--readiness \
	--failure-threshold 3 \
	--initial-delay-seconds 30 \
	--get-url=http://:7990/projects
```
## Configure
After the pod is running, go through the initial setup of your Bitbucket server. It will ask for a license, and for that, you will: 

 1. Create a free Atlassian account 
 2. Login 
 3. Create a trial non-production license 
 4. Add it

### And that's it!

#### References:
https://docs.openshift.com/container-platform/3.11/dev_guide/dev_tutorials/maven_tutorial.html

> Written by [Mostafa Abdelnasser](https://linkedin.com/in/mostafa-abdelnasser)
