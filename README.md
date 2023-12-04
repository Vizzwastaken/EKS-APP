# Deploying Docker Containers with GitHub Actions and Ansible Playbook

![image](https://github.com/Vizzwastaken/Ansible-deploy/assets/91386217/850de372-947f-4f0e-8c8d-557d4e067d38)

This document outlines the process of deploying a Docker container to a set of worker nodes using GitHub Actions and Ansible Playbook. The deployment process involves the following steps:

#### Pushing the code from the local repository to the GitHub repository.
#### Triggering the GitHub Actions pipeline. 
#### Checking for code quality and required files, building a Docker image from the Dockerfile, and uploading it to Docker Hub.
#### Login to Master Node. Run the terraform file to deploy 2 worker nodes.Then run the master-playbook
#### Installing Docker and its required packages in the worker nodes using Ansible Playbook. Also installing Python. Then logging into Docker Hub and pulling the image and running the container.**

## Step 1: Pushing the code to GitHub
The first step is to push the code from the local repository to the GitHub repository. This can be done using the git push command.

## Step 2: Triggering the GitHub Actions pipeline
After the code is pushed to the GitHub repository, the GitHub Actions pipeline is triggered. The pipeline is defined in the .github/workflows directory of the repository. It consists of one or more jobs that are executed sequentially.

## Step 3: Building and uploading Docker image
The first job in the pipeline checks for code quality and required files. If the code quality is satisfactory and all required files are present, it builds a Docker image from the Dockerfile and uploads it to Docker Hub.

## Step 4: Login to Master Node
Run the terrafrom file (main.tf) to Deploy the 2 Worker nodes.Then run the Ansible-playbook. The Ansible playbook installs Docker and its required packages in the worker nodes. After that, it logs into Docker Hub and pulls the Docker image. Finally, it runs the Docker container.

### NOTE: 
Here Anisble Playbook is implemented with dynamic inventory file using boto3 library , which is grouped using the instance Tag names.
Ref: https://devopscube.com/setup-ansible-aws-dynamic-inventory/

Conclusion
This document has outlined the process of deploying a Docker container to a set of worker nodes using GitHub Actions and Ansible Playbook. By following these steps, you can easily automate the deployment of your Docker containers to your infrastructure.
