#!/bin/bash

# Initialize Git repository
cd monorepo
git init

# Create the monorepo base directory structure
mkdir -p services/{product-service/src,user-service/src,order-service/src} frontend/src deploy/{kubernetes,cloudformation}

# Ensure we are on the main branch
git checkout -b main 2>/dev/null || git checkout main

# Create Dockerfiles with basic content
echo "FROM python:3.8-slim
# Add your service's Dockerfile contents here" > services/product-service/Dockerfile

echo "FROM node:14
# Add your service's Dockerfile contents here" > services/user-service/Dockerfile

echo "FROM openjdk:11-jre-slim
# Add your service's Dockerfile contents here" > services/order-service/Dockerfile

echo "FROM node:14
# This Dockerfile is for the Vue.js frontend application" > frontend/Dockerfile

# Create README.md files explaining each folder
echo "This folder contains backend services for the application." > services/README.md
echo "Backend service for managing product listings." > services/product-service/README.md
echo "Source code for the product service." > services/product-service/src/README.md
echo "Backend service for user authentication and profiles." > services/user-service/README.md
echo "Source code for the user service." > services/user-service/src/README.md
echo "Backend service for order processing and tracking." > services/order-service/README.md
echo "Source code for the order service." > services/order-service/src/README.md
echo "This folder contains the frontend service, a Vue.js application." > frontend/README.md
echo "Vue.js application source code." > frontend/src/README.md
echo "This folder contains deployment scripts and configurations." > deploy/README.md
echo "Kubernetes manifests for deployment." > deploy/kubernetes/README.md
echo "AWS CloudFormation templates for infrastructure provisioning." > deploy/cloudformation/README.md

# Create a main README.md for the monorepo
echo "# Monorepo for the Microservices-Based Online Shop

This repository contains the microservices-based architecture for a simplified online shop. It includes backend services, a frontend service, and deployment configurations.

## Services
- **Product Service**: Manages product listings.
- **User Service**: Handles user authentication and profiles.
- **Order Service**: Manages order processing and tracking.

## Frontend
The frontend is a Vue.js application that interacts with the backend services.

## Deployment
Deployment scripts and configurations for Kubernetes and AWS CloudFormation are provided.

For more details, refer to the README.md files within each directory." > README.md

# Add all files to the repository and commit
git add .
git commit -m "Initial monorepo structure with services and deployment configurations"

echo "Directory structure and files created successfully. Monorepo initialized with Git."
