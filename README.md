# Dream Vacation Destinations

This application allows users to create a list of countries they'd like to visit, providing basic information about each country. The project is structured to mimic a real-life production environment, employing best practices in software development, deployment, and continuous integration/continuous delivery (CI/CD). The application structure and deployment pipeline are designed for maintainability, scalability and ease of team collaboration in real-world DevOps environments.


##  Project Structure
```bash

Dream-Vacation-App/
├── backend/ # Node.js + Express API
├── frontend/ # React UI
├── docker-compose.yml
├── README.md
└── .env
```

## Setup

### Backend
1. Navigate to the `backend` directory.
2. Run `npm install` to install dependencies.
3. Set up your PostgreSQL database and update the `.env` file with your database URL.
4. Run `npm start` to start the server.

### Frontend
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
- **CI/CD**: To be implemented with [CI/CD tools, e.g., GitHub Actions, Jenkins, or Azure DevOps]
- **Infrastructure as Code**: To be implemented with tools like Terraform or Helm
- **Containerization**: Docker, Docker Compose

## Best Practices
- **Version Control**: All changes are tracked in Git for collaboration and history management.
- **Environment Management**: Separate configurations for different environments (development, staging, production) using environment variables.
- **Security**: Sensitive information is managed using environment variables and Kubernetes Secrets.
- **Documentation**: The project is well-documented to facilitate onboarding and maintenance.
