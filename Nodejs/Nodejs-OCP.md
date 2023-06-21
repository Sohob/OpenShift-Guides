# Nodejs Application Deployment on OpenShift
Steps to deploy a Nodejs application to openshift
## Fullstack deployment (FE + BE + Proxy)
### Remarks
- If you have both `package.json` & `package-lock.json`, they have to be in sync. Otherwise, just use `package.json` - Currently using only `package.json`
- You need special permissions when installing packages - Check the [Dockerfile](./Dockerfile)
- You need to install `pm2` globally - Check the [Dockerfile](./Dockerfile)
- Check pm2 configuration file `ecosystem.config.js`, make sure paths are correct

### Steps
1. Create an imageStream in OpenShift
2. Build the Dockerfile
3. [Login to the internal image registry and push the image into the imageStream](https://github.com/Sohob/OpenShift-Guides/blob/main/Pushing-Local-Image.md)
4. From OpenShift's Developer view, deploy container image
5. Select from "Image stream tag from internal registry" and pick the imageStream you pushed to
6. Create

That's it! A deployment for the application should be up with a running pod.

> Written by [Mostafa Abdelnasser](https://linkedin.com/in/mostafa-abdelnasser)