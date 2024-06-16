# EKS-APP
- **This repo contains the index.html and the Dockerfile, also the workflow to update the pipeline**
- **The pipeline does basics checks like if the docker file exists or not and lints HTML and YAML files.**
- **After the basic checks it builds and pushes the Docker image to Docker Hub**
- **After its pushed the pipeline then updates the image tag in the Deployment file in ARGO-APP repo**

---

# Docker Image CI Workflow

This GitHub Actions workflow automates the Continuous Integration (CI) process for a Docker-based project. It includes basic quality checks, linting, Docker image building and pushing, and updating configuration repository with the latest Docker image tag.

## Workflow Details

### Trigger

The workflow is triggered in the following scenarios:
- **Manual Dispatch:** Triggered manually from the GitHub Actions UI.
- **Push Events:** Triggered on pushes to branches `Develop` and `main`.
- **Pull Requests:** Triggered on pull requests targeting the `main` branch.

### Jobs

#### 1. **Basic-Quality-Checks**

- **Runs On:** Ubuntu-latest
- **Steps:**
  - Checks if Dockerfile exists in the repository.

#### 2. **Linting**

- **Runs On:** Ubuntu-latest
- **Steps:**
  - Runs linting using GitHub Super Linter across the codebase.

#### 3. **Push-Docker-Image**

- **Needs:** Basic-Quality-Checks (must complete successfully)
- **Runs On:** Ubuntu-latest
- **Steps:**
  - Logs into Docker Hub using Docker Login action.
  - Builds and pushes Docker image to Docker Hub with the tag `${{ github.sha }}`.

#### 4. **Edit-Config-repo**

- **Needs:** Push-Docker-Image (must complete successfully)
- **Runs On:** Ubuntu-latest
- **Steps:**
  - Updates the configuration repository (`ARGO-APP`) with the latest Docker image tag.
  - Clones the repository using provided credentials (`GH_PAT`).
  - Checks out the `main` branch, updates the `deployment.yaml` file with the new image tag, commits the changes, and pushes them back to the repository.

## Usage

1. **Setup Secrets:**
   - Ensure the following secrets are configured in your GitHub repository settings:
     - `DOCKER_PASS`: Docker Hub password/token for Docker Login.
     - `GH_PAT`: GitHub Personal Access Token (PAT) with repo access for updating the configuration repository.

2. **Run Workflow:**
   - Push changes to branches `Develop` or `main`, or manually trigger the workflow from GitHub Actions UI.
   - Monitor workflow progress and check logs for each step.

3. **Customization:**
   - Customize paths, image tags, and other variables in the workflow file (`docker-image-ci.yml`) to match your project structure and requirements.
