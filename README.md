# docker-builder

A docker image for cloning a repository from github, building a docker image from it and publishing it on Docker Hub.

## To run the image:
docker run -it -v /var/run/docker.sock:/var/run/docker.sock maijahaka/  docker-builder GITHUB_USER GITHUB_REPO (DOCKERHUB_USER DOCKERHUB_REPO)

### Replace the parameters as follows:
GITHUB_USER: GitHub user whose repository is to be cloned  
GITHUB_REPO: GitHub repository that is to be cloned  
(so the repository will be cloned from https://github.com/GITHUB_USER/GITHUB_REPO)  

### Optional parameters (please note: you should include either none or both of these):
DOCKERHUB_USER: Your Docker Hub username  
DOCKERHUB_REPO: The name for the Docker Hub repository  

If the optional parameters are not included, the GitHub username and the GitHub repository name will be used for Docker Hub as well.

The GitHub repository should contain a Dockerfile.

The option "-it" is required for running interactive TTY, which will ask you to enter your Docker Hub credentials.

The container communicates with the Docker daemon on the host machine through /var/run/docker.sock.
