AWS CloudFormation Project: Deploying a Scalable Web Application
📖 Introduction
This project demonstrates deploying a scalable and resilient web application infrastructure on AWS using CloudFormation. It includes the setup of networking components, security configurations, a load balancer, an auto-scaling group, and a custom NGINX server configuration.

📋 Project Components
Diagrams:

Visual representation of the architecture is included as Untitled Diagram (1).drawio. The diagram illustrates:

Networking (VPC, subnets, and routes)

Security Groups

Load balancer and web server setup

Auto-scaling group and instances

Templates:

Main Template (udagram.yml): Defines all the AWS resources required for the application.

Parameters File (udagram-parameter.json): Enables customization for different environments.

Network Template (network.yaml) and Parameters (network-parameters.json): Sets up the foundational network infrastructure.

Scripts:

Deployment Script (command-script.sh): Includes commands to deploy and verify the stack using the AWS CLI.

📜 Instructions for Using the Project
1. Setting Up Prerequisites
Ensure the following prerequisites are met:

Pre-existing VPC with public and private subnets.

AWS CLI configured on your machine.

IAM user or role with necessary permissions to deploy CloudFormation templates.

2. Understanding the Diagrams
Open the provided diagram file Untitled Diagram (1).drawio using a tool like Diagrams.net.

Review the structure to understand the logical flow of the architecture:

Traffic from the internet flows through the load balancer to the web servers in a private subnet.

S3 bucket integration for application data storage.

Auto-scaling and instance role for high availability.

3. Deploying the Network Infrastructure
Use the network.yaml and network-parameters.json files to set up the foundational network:

bash
aws cloudformation create-stack --stack-name network-stack --template-body file://network.yaml --parameters file://network-parameters.json
4. Customizing Parameters
Edit the udagram-parameter.json file to match your environment:

Update ProjectName.

Specify subnet IDs and other details.

5. Deploying the Application Stack
Use the main template (udagram.yml) and parameters file (udagram-parameter.json) to deploy the web application:

bash
aws cloudformation create-stack --stack-name app-stack --template-body file://udagram.yml --parameters file://udagram-parameter.json --capabilities CAPABILITY_NAMED_IAM
6. Accessing the Application
After deployment, access the load balancer URL provided in the stack outputs. This URL will serve the NGINX welcome page.

🌟 Features of the Project
Scalable Infrastructure: Managed by Auto Scaling Groups to handle varying traffic loads.

Secure Networking: Security groups restrict and control access to resources.

Custom Web Server Setup: Automated NGINX server deployment using User Data in the Launch Template.

Storage Integration: S3 bucket for application data storage.
