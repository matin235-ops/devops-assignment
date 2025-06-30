# DevOps Assignment - Quick Start Commands

## Essential Commands for Windows PowerShell

### Git Commands
```powershell
# Initialize git repository
git init

# Add all files
git add .

# Commit with message
git commit -m "Initial DevOps assignment setup"

# Add remote repository (replace with your GitHub repo URL)
git remote add origin https://github.com/your-username/devops-assignment.git

# Push to GitHub
git push -u origin main

# Check status
git status

# View commit history
git log --oneline
```

### Docker Commands
```powershell
# Build Docker image
docker build -t your-dockerhub-username/devops-assignment:latest .

# Run container locally
docker run -d --name devops-app -p 8080:80 your-dockerhub-username/devops-assignment:latest

# View running containers
docker ps

# View all containers
docker ps -a

# Stop container
docker stop devops-app

# Remove container
docker rm devops-app

# Login to Docker Hub
docker login

# Push image to Docker Hub
docker push your-dockerhub-username/devops-assignment:latest

# Pull image from Docker Hub
docker pull your-dockerhub-username/devops-assignment:latest

# View Docker images
docker images

# Remove image
docker rmi your-dockerhub-username/devops-assignment:latest
```

### JMeter Commands
```powershell
# Run JMeter test from command line
jmeter -n -t tests/performance-test.jmx -l results.jtl

# Run JMeter with HTML report generation
jmeter -n -t tests/performance-test.jmx -l results.jtl -e -o reports/

# Open JMeter GUI
jmeter

# Check JMeter version
jmeter --version
```

### Python Web Server (for testing)
```powershell
# Navigate to src directory
cd src

# Start simple HTTP server on port 8080
python -m http.server 8080

# Access the server at http://localhost:8080
```

### Jenkins CLI (if needed)
```powershell
# Download Jenkins CLI
curl -O http://localhost:8080/jnlpJars/jenkins-cli.jar

# Build a job
java -jar jenkins-cli.jar -s http://localhost:8080/ build "DevOps-Assignment-Pipeline"

# Get job status
java -jar jenkins-cli.jar -s http://localhost:8080/ get-job "DevOps-Assignment-Pipeline"
```

### Useful Verification Commands
```powershell
# Check if Docker is running
docker version

# Check if Jenkins is accessible
curl http://localhost:8080

# Check if JMeter is installed
jmeter --version

# Check if Python is installed
python --version

# Check if Git is installed
git --version

# Check Java version (needed for Jenkins and JMeter)
java -version

# List all running processes (to find Jenkins/Docker)
Get-Process | Where-Object {$_.ProcessName -like "*jenkins*" -or $_.ProcessName -like "*docker*"}

# Check open ports
netstat -an | findstr :8080
netstat -an | findstr :80
```

### File and Directory Operations
```powershell
# Create directory structure
New-Item -ItemType Directory -Force -Path "src", "tests", "docker", "jenkins", "docs"

# Copy files
Copy-Item "source-file.txt" "destination-file.txt"

# View file contents
Get-Content "filename.txt"

# Find files
Get-ChildItem -Recurse -Name "*.html"

# Check if file exists
Test-Path "src/index.html"
```

### Network and Connectivity Tests
```powershell
# Test if Jenkins is accessible
Test-NetConnection localhost -Port 8080

# Test if Docker daemon is running
Test-NetConnection localhost -Port 2375

# Test internet connectivity for Docker Hub
Test-NetConnection registry.hub.docker.com -Port 443

# Ping GitHub
Test-NetConnection github.com -Port 443
```

### Jenkins Pipeline Trigger (via webhook or manual)
```powershell
# Trigger build via curl (if webhook is set up)
curl -X POST http://localhost:8080/job/DevOps-Assignment-Pipeline/build

# With authentication token
curl -X POST http://username:token@localhost:8080/job/DevOps-Assignment-Pipeline/build
```

### Environment Variables (useful for scripts)
```powershell
# Set environment variables
$env:DOCKER_HUB_USERNAME = "your-username"
$env:DOCKER_HUB_REPO = "devops-assignment"
$env:JIRA_PROJECT_KEY = "DAP"

# Use in commands
docker build -t $env:DOCKER_HUB_USERNAME/$env:DOCKER_HUB_REPO:latest .
```

### Troubleshooting Commands
```powershell
# Check Docker logs
docker logs container-name

# Check Jenkins logs (typical Windows location)
Get-Content "C:\ProgramData\Jenkins\.jenkins\logs\jenkins.log" -Tail 50

# Kill processes if stuck
Stop-Process -Name "java" -Force
Stop-Process -Name "docker" -Force

# Restart Docker Desktop
Restart-Service com.docker.service

# Clear Docker cache
docker system prune -a

# Reset Jenkins workspace
Remove-Item -Recurse -Force "C:\ProgramData\Jenkins\.jenkins\workspace\*"
```

### Quick Health Check Script
```powershell
# Create a health check script
@"
Write-Host "=== DevOps Assignment Health Check ===" -ForegroundColor Green

Write-Host "Checking Git..." -ForegroundColor Yellow
git --version

Write-Host "Checking Docker..." -ForegroundColor Yellow
docker --version

Write-Host "Checking JMeter..." -ForegroundColor Yellow
jmeter --version

Write-Host "Checking Jenkins..." -ForegroundColor Yellow
if (Test-NetConnection localhost -Port 8080 -InformationLevel Quiet) {
    Write-Host "Jenkins is accessible on port 8080" -ForegroundColor Green
} else {
    Write-Host "Jenkins is NOT accessible on port 8080" -ForegroundColor Red
}

Write-Host "Checking Python..." -ForegroundColor Yellow
python --version

Write-Host "=== Health Check Complete ===" -ForegroundColor Green
"@ | Out-File -FilePath "health-check.ps1"

# Run the health check
.\health-check.ps1
```

## Copy these commands to run step by step:

1. **Initial Setup:**
```powershell
cd "C:\Users\sword\Desktop\ABCD"
git init
git add .
git commit -m "Initial DevOps assignment setup"
```

2. **Test Local Build:**
```powershell
docker build -t devops-assignment:test .
docker run -d --name test-app -p 8080:80 devops-assignment:test
```

3. **Verify Application:**
```powershell
Start-Process "http://localhost:8080"
```

4. **Cleanup Test:**
```powershell
docker stop test-app
docker rm test-app
docker rmi devops-assignment:test
```

Save this file and use it as a reference throughout your assignment!
