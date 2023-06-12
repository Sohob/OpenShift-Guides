# How to push you binary container image to OpenShift

### Load the binary image

`docker load -i <Image Location>`

### Tag the image with the OpenShift internal registry tag

```
docker tag <Local Image> \
<Local OpenShift Registry>/<Namespace>/<imagestream>:<Version>
```
### Login with oc login command using the token on OpenShift

### Then login to the OpenShift registry using docker

`docker login -u $(oc whoami) -p $(oc whoami --show-token) <Local OpenShift Registry>`

### Create the imagestream that the image will be pushed to

`oc create imagestream <imagestream>`

### Push the local image to the registry

`docker push <Local OpenShift Registry>/<Namespace>/<imagestream>:<Version>`

### References
https://all.docs.genesys.com/PrivateEdition/Current/PEGuide/OCR
https://cookbook.openshift.org/image-registry-and-image-streams/how-do-i-push-an-image-to-the-internal-image-registry.html

> Written by [Mostafa Abdelnasser](https://linkedin.com/in/mostafa-abdelnasser)
