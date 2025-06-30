# DevOps Assignment Setup Guide

## Prerequisites

Before starting, ensure you have the following installed on your system:

### Required Software:
1. **Git** - https://git-scm.com/
2. **Docker Desktop** - https://www.docker.com/products/docker-desktop/
3. **Jenkins** - https://www.jenkins.io/download/
4. **JMeter** - https://jmeter.apache.org/download_jmeter.cgi
5. **Java JDK 11+** (required for Jenkins and JMeter)
6. **Python 3.x** (for local testing)

### Online Accounts:
1. **GitHub Account** - https://github.com/
2. **Jira Cloud Account** - https://www.atlassian.com/software/jira
3. **Docker Hub Account** - https://hub.docker.com/

## Step-by-Step Setup Instructions

### Step 1: Jira Setup
1. Go to https://www.atlassian.com/software/jira
2. Click "Get started for free"
3. Create your account and verify email
4. Create a new project:
   - Choose "Scrum" template
   - Project name: "DevOps Assignment"
   - Project key: "DAP"
5. Invite team members:
   - Go to Project settings → People
   - Click "Add people to project"
   - Enter team member emails
   - Assign roles (Admin/Member)

### Step 2: GitHub Repository Setup
1. Go to https://github.com
2. Click "New repository"
3. Repository name: "devops-assignment"
4. Make it public
5. Initialize with README
6. Clone this repository you've created locally
7. Copy all files from this workspace to your GitHub repository
8. Invite collaborators:
   - Go to repository Settings → Manage access
   - Click "Invite a collaborator"
   - Add team member emails

### Step 3: Jenkins Installation & Configuration

#### Install Jenkins:
```powershell
# Download Jenkins installer for Windows
# Run the installer and follow setup wizard
# Access Jenkins at http://localhost:8080
```

#### Configure Jenkins:
1. **Initial Setup**:
   - Unlock Jenkins with the initial admin password
   - Install suggested plugins
   - Create first admin user

2. **Install Required Plugins**:
   - Go to Manage Jenkins → Manage Plugins
   - Install these plugins:
     - Jira Integration Plugin
     - GitHub Integration Plugin
     - Performance Plugin
     - Docker Pipeline Plugin
     - HTML Publisher Plugin

3. **Configure Credentials**:
   - Go to Manage Jenkins → Manage Credentials
   - Add these credentials:
     - GitHub credentials (username/token)
     - Docker Hub credentials
     - Jira API token

### Step 4: Docker Hub Setup
1. Create account at https://hub.docker.com/
2. Create a new repository:
   - Repository name: "devops-assignment"
   - Make it public
3. Get your Docker Hub username for the Jenkins pipeline

### Step 5: JMeter Installation
1. Download JMeter from https://jmeter.apache.org/download_jmeter.cgi
2. Extract to a folder (e.g., C:\jmeter)
3. Add JMeter bin folder to your PATH environment variable
4. Test installation: `jmeter --version`

### Step 6: Create Jira Issue
1. Go to your Jira project
2. Click "Create Issue"
3. Issue Type: Task
4. Summary: "Build and Deploy DevOps Assignment Application"
5. Description: "Implement complete CI/CD pipeline with GitHub, Jenkins, JMeter, and Docker"
6. Note the issue key (e.g., DAP-1)

### Step 7: Configure Jenkins Pipeline
1. **Create New Pipeline Job**:
   - Go to Jenkins Dashboard
   - Click "New Item"
   - Enter name: "DevOps-Assignment-Pipeline"
   - Select "Pipeline"
   - Click OK

2. **Configure Pipeline**:
   - In "Pipeline" section, select "Pipeline script from SCM"
   - SCM: Git
   - Repository URL: Your GitHub repository URL
   - Credentials: Select your GitHub credentials
   - Script Path: `jenkins/Jenkinsfile`

3. **Update Pipeline Variables**:
   Edit the Jenkinsfile and update these variables:
   ```groovy
   DOCKER_HUB_REPO = 'your-dockerhub-username/devops-assignment'
   JIRA_SITE = 'your-jira-site.atlassian.net'
   ```

### Step 8: Push Code to GitHub
```powershell
# Navigate to your project directory
cd "path-to-your-project"

# Initialize git repository
git init

# Add all files
git add .

# Commit files
git commit -m "Initial commit: DevOps assignment setup"

# Add remote origin
git remote add origin https://github.com/your-username/devops-assignment.git

# Push to GitHub
git push -u origin main
```

### Step 9: Run Jenkins Pipeline
1. Go to your Jenkins pipeline job
2. Click "Build Now"
3. Monitor the build progress
4. Check each stage:
   - Checkout
   - Build
   - Test
   - Performance Testing
   - Docker Build
   - Docker Push
   - Deploy

### Step 10: Verify Results
1. **Check Jira**: Verify comments were added to your issue
2. **Check Docker Hub**: Verify your image was pushed
3. **Check Jenkins**: Review build artifacts and JMeter reports
4. **Test Application**: Access http://localhost to see running app

### Step 11: Team Member Docker Pull
Each team member should:
```powershell
# Pull the Docker image
docker pull your-dockerhub-username/devops-assignment:latest

# Run the container
docker run -d --name my-devops-app -p 8080:80 your-dockerhub-username/devops-assignment:latest

# Access the application
# Open browser to http://localhost:8080
```

## Troubleshooting

### Common Issues:
1. **Jenkins Plugin Issues**: Restart Jenkins after installing plugins
2. **Docker Permission Issues**: Ensure Docker Desktop is running and user has permissions
3. **JMeter Path Issues**: Verify JMeter is in system PATH
4. **Jira Authentication**: Use API token instead of password
5. **GitHub Authentication**: Use personal access token for HTTPS

### Useful Commands:
```powershell
# Check Docker status
docker version

# Check JMeter installation
jmeter --version

# Check running containers
docker ps

# View container logs
docker logs container-name

# Stop all containers
docker stop $(docker ps -q)
```

## Recording Your Work

Document each step with:
1. Screenshots of configurations
2. Pipeline execution logs
3. Test results and reports
4. Docker images and containers
5. Jira issue updates
6. Team collaboration evidence

## Submission Checklist

- [ ] Jira project created with team members invited
- [ ] GitHub repository created with collaborators
- [ ] Jenkins installed with all required plugins
- [ ] Jenkins pipeline configured and running successfully
- [ ] Jira issues created and linked to Jenkins builds
- [ ] Code committed and pushed to GitHub
- [ ] JMeter performance tests executed and reports generated
- [ ] Docker image built and pushed to Docker Hub
- [ ] Team members successfully pulled and ran Docker image
- [ ] All steps documented with screenshots and recordings

## Support Resources

- Jenkins Documentation: https://www.jenkins.io/doc/
- Docker Documentation: https://docs.docker.com/
- JMeter Documentation: https://jmeter.apache.org/usermanual/
- Jira Documentation: https://support.atlassian.com/jira/
- GitHub Documentation: https://docs.github.com/
