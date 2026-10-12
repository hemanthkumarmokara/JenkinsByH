# Jenkins CI/CD Portfolio

A static developer portfolio used to learn Git, GitHub, Jenkins Declarative Pipelines, and Docker.

## Pipeline stages
1. Checkout source from SCM
2. Validate required files
3. Run basic shell tests
4. Package and archive website files
5. Build a Docker image
6. Deploy the container locally on port 8081
7. Run an HTTP smoke test

## Run locally
```bash
./tests/test-site.sh
docker build -t jenkins-portfolio:local .
docker run --rm -p 8081:80 --name jenkins-portfolio-local jenkins-portfolio:local
```
Visit http://localhost:8081.

## Jenkins requirements
The Jenkins agent needs `git`, `sh`, `curl`, and Docker CLI access to a running Docker daemon. The Jenkins service account must have permission to use Docker. Membership in the Docker group is effectively root-level access, so only grant it to a trusted Jenkins installation.

Create a Jenkins Pipeline job and choose **Pipeline script from SCM**, SCM **Git**, your repository URL, branch `*/main`, and script path `Jenkinsfile`.

## Before publishing
Replace `Your Name` and sample profile links in `site/index.html` with your own details. This pipeline deploys only to the local machine; it does not publish the site to the public internet.
