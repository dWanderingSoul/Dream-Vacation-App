# 🌍 Dream Vacation App – AWS EC2 Deployment with CI/CD

## Overview

I’m sharing my process for deploying the Dream Vacation App to AWS EC2 using the AWS Management Console (ClickOps) and my existing CI/CD pipeline. This project is part of my DevOps beginner journey and I’ll walk through everything step by step—from setting up networking to launching the app and verifying it in the browser.

## Objectives

This is my Dream Vacation App, a full-stack project that I deployed on AWS EC2 using ClickOps and my existing CI/CD pipeline.
The goal of this task was to gain hands-on experience with:

 - AWS Networking (VPC, Subnet, IGW, Route Tables).

 - EC2 instance setup.

 - Docker & Docker Compose for containerized deployment.

 - CI/CD pipelines with GitHub Actions to automate deployment.

By the end of this project, I successfully provisioned AWS resources, deployed both the frontend and backend containers and accessed my application using the EC2 public IP as well as externally.

##  🏗️ Project Structure
Here’s how my project is organized
```bash

Dream-Vacation-App/
├── backend/ 
│   ├── Other files
│   └── Dockerfile 
├── frontend/ 
│   ├── Other files
│   └── Dockerfile
├── .github/workflows
│   ├── backend.yml
│   ├── frontend.yml
│   └── deploy.yml
├── docker-compose.yml
├── README.md
├── screenshots
└── Other files
```

## Process

The processes involved in this stage were:
 - Create AWS networking manually via the AWS Console (ClickOps).
 - Launch an EC2 instance, install Docker + Docker Compose.
 - Configure CI/CD to automatically deploy to EC2
 - Run the Dream Vacation App (frontend + backend) successfully in a browser.

## Setup

### ⚡ Part 1 – Networking Setup

Before I could launch my EC2 instance, I needed to ensure the network setup was correct. Using the AWS Management Console, I created a custom Virtual Private Cloud (VPC) to isolate my application’s resources.

### Steps I Followed:
1. Created custom VPC
 - Name: `dream-vpc`
 - CIDR Block: `10.0.0.0/16`
   
2. Created Subnet
 - Name: `dream-subnet`
 - CIDR Block: `10.0.1.0/24`
 - Associated with dream-vpc.
   
3. Created Internet Gateway
 - Name: `dream-igw`
 - Attached to dream-vpc.
   
4. Created Route Table
 - Name: dream-rt.
 - Associated with dream-subnet.
 - Added route to 0.0.0.0/0 via dream-igw for internet access.
 screenshot 


### ⚡ Part 2 – EC2 Instance Setup

Launched EC2 Instance

AMI: Ubuntu 20.04

Type: t2.micro

Key Pair: Configured for SSH access.

Security Group: Allowed ports 22 (SSH), 80 (HTTP), 3000 (Frontend), 5000 (Backend).

Installed Docker & Docker Compose
I used a User Data script during launch:

#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker


Verified installation

docker --version
docker-compose --version


📸 Screenshot of running EC2 attached
1. Navigate to the `frontend` directory.
2. Run `npm install` to install dependencies.
3. Update the `.env` file with your API URL (e.g., `REACT_APP_API_URL=http://localhost:3001`).
4. Run `npm start` to start the React development server.

## Features
- **Add Countries**: Users can add countries to their dream vacation list.
- **View Country Details**: Displays capital, population, and region information for each country.
- **Remove Countries**: Users can remove countries from their list.
- **Full-stack development**: React (frontend), Node.js/Express (backend), and PostgreSQL (database)
- **Environment variable management**: Using `.env` files
- **Production-Ready Setup**: The project is designed to be scalable and maintainable, following industry-standard practices for deployment and CI/CD.
- **Dockerized Deployment and orchestration**: Uses Docker and Docker Compose for reproducible builds.

##  Local Development

### Backend (Node.js)

1. Navigate to the backend folder:
```bash
cd backend
```
2. Install dependencies:
 ```bash
 npm install
 ```
3. Create a `.env` file:
```bash
PORT=3001
DATABASE_URL=postgres://your_user:your_password@localhost:5432/your_db
```
4. Start the backend:
```bash
npm start
```

### Frontend (React)

1. Navigate to the frontend folder:
```bash
cd frontend
```
2. Install dependencies:
```bash
npm install
```
3. Create a `.env` file:
```bash
REACT_APP_API_URL=http://localhost:3001
```
4. Start the frontend:
```bash
npm start
```
## Dockerized Setup
### Prerequisites
- Docker & Docker Compose installed

### 1. Docker Build
Each service has its own Dockerfile:
- Frontend uses multi-stage builds and serves via Nginx
- Backend installs dependencies and exposes an API
- PostgreSQL uses official image

### 2. Environment Variables
Create a `.env` file at the root of the project:
```bash
POSTGRES_USER=your_user
POSTGRES_PASSWORD=your_password
POSTGRES_DB=dream_vacation
DATABASE_URL=postgres://your_user:your_password@db:5432/dream_vacation
REACT_APP_API_URL=http://localhost:3001
```
### 3. Run All Services
From the project root:
```bash
docker-compose up --build
```
This will:
- Start PostgreSQL with volume persistence
- Start backend with environment variables
- Start frontend served via Nginx

### 4. Access the App
- Frontend: http://localhost:3000
- Backend API: http://localhost:3001

## CI/CD Pipeline (GitHub Actions)
The project includes a GitHub Actions workflow to automate the build, test, and deployment process using Docker.

### Triggering
Pipelines are triggered on every push or pull request to `main` or `dev` branches.

### Workflow Files
CI/CD configuration is stored in:
```bash
.github/workflows/
├── backend.yml   # Workflow for building and pushing backend Docker image
└── frontend.yml  # Workflow for building and pushing frontend Docker image
```
### Jobs Included
- (Optional) Lint Checks
- Build frontend and backend Docker images
- Push images to Docker Hub or GitHub Container Registry
- Tag images with Git commit SHA
- Use secrets (`DOCKER_USERNAME`, `DOCKER_TOKEN`) securely from GitHub Secrets

## Roadmap
- **CI/CD Implementation**: Automate the build, test, and deployment process using industry-standard CI/CD tools.
- **Infrastructure as Code (IaC)**: Implement IaC for automated environment setup and management.
- **Scalability**: Enhance the application to support multiple environments (staging, production) with proper domain names and configurations.
- **Security**: Utilize Kubernetes Secrets and environment variables for secure data management.
- **Microservices**: Modularize the application into microservices to improve maintainability and scalability.
- **Containerization**: frontend & backend
- **Service**: PostgreSQL with Docker volume

## Technologies Used
- **Frontend**: React + Nginx
- **Backend**: Node.js + Express + PostgreSQL
- **Database**: PostgreSQL (Dockerized)
- **External API**: REST Countries API
- **CI/CD**: Implemented with [CI/CD tools, i.e GitHub Actions]
- **Infrastructure as Code**: To be implemented with tools like Terraform or Helm
- **Containerization**: Docker, Docker Compose
- **Secrets Management**: GitHub Secrets

## Best Practices
- **Version Control**: All changes are tracked in Git for collaboration and history management & GitHub.
- **Environment Management**: Separate configurations for different environments (development, staging, production) using environment variables.
- **Automated builds and deploys with CI/CD**
- **Security**: Sensitive information is managed using environment variables Secrets.
- **Documentation**: The project is well-documented to facilitate onboarding and maintenance.

