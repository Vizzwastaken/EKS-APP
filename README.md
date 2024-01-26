# EKS-APP
- **This repo contains the index.html and the Dockerfile, also the workflow to update the pipeline**
- **The pipeline does basics checks like if the docker file exists or not and lints HTML and YAML files.**
- **After the basic checks it builds and pushes the Docker image to Docker Hub**
- **After its pushed the pipeline then updates the image tag in the Deployment file in ARGO-APP repo**
