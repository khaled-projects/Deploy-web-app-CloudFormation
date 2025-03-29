# AWS CloudFormation Project: Deploying a Scalable Web Application

## 📖 Introduction
This project demonstrates deploying a scalable and resilient web application infrastructure on AWS using CloudFormation. It covers creating networking components, security configurations, a load balancer, an auto-scaling group, and custom NGINX server configuration.

---

## 📋 Project Components

### 1. Diagrams
- A visual representation of the architecture is included as `Untitled Diagram (1).drawio`.
- The diagram illustrates:
  - Networking (VPC, subnets, and routes)
  - Security Groups
  - Load balancer and web server setup
  - Auto-scaling group and instances

### 2. Templates
- **Main Template (`udagram.yml`)**: Defines all the AWS resources required for the application.
- **Parameters File (`udagram-parameter.json`)**: Enables customization for different environments.
- **Network Template (`network.yaml`) and Parameters (`network-parameters.json`)**: Sets up the foundational network infrastructure.

### 3. Scripts
- **Deployment Script (`command-script.sh`)**: Includes commands to deploy and verify the stack using AWS CLI.

---

## 📜 Instructions for Using the Project

### 1. Setting Up Prerequisites
- Ensure the following prerequisites are met:
  - A pre-existing VPC with public and private subnets.
  - AWS CLI configured on your machine.
  - IAM user or role with necessary permissions to deploy CloudFormation templates.

### 2. Understanding the Diagrams
- Open the provided diagram file `Untitled Diagram (1).drawio` using [Diagrams.net](https://app.diagrams.net/).
- Review the structure to understand the logical flow of the architecture:
  - Traffic from the internet flows through the load balancer to the web servers in a private subnet.
  - S3 bucket integration for application data storage.
  - Auto-scaling and instance roles ensure high availability.

### 3. Deploying the Network Infrastructure
- Use the `network.yaml` and `network-parameters.json` files to set up the foundational network:
  ```bash
  aws cloudformation create-stack --stack-name network-stack --template-body file://network.yaml --parameters file://network-parameters.json

  ### 4. Customizing Parameters
Edit the `udagram-parameter.json` file to match your environment:

- **Update `ProjectName`**: Provide the project name that will be used to prefix resource names.
- **Specify subnet IDs**: Ensure subnet IDs match the ones in your network environment and other required details.

### 5. Deploying the Application Stack
Use the main template (`udagram.yml`) and parameters file (`udagram-parameter.json`) to deploy the web application:

```bash
aws cloudformation create-stack --stack-name app-stack --template-body file://udagram.yml --parameters file://udagram-parameter.json --capabilities CAPABILITY_NAMED_IAM

