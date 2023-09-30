# Infrastructure as Code - Assignment 1
This is the submission of assignment 1 in IIKG3005 - Infrastructure as Code 2023 for Andreas Follevaag Malde. 
It is a Terraform project for building and deploying infrastructure to Azure. The use of modules in the project help provision and manage different Azure resources like Virtual Network, Key Vault, Virtual Machines etc. 
This project is made to be easily customizable and maintainable and works as a foundation for deploying similar infrastructure for multiple clients.

## Overview
- Project structure
- Module description
- The use of Terraform scripts (plan,apply,destroy)
- Prerequisites and/or dependencies
- Images of deployment


## Project structue
The sturctre of the project can be seen in the tree view below. 
```
.
├── images
|   └── **.png
├── keyvault
│   ├── locals.tf
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── network
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── storageaccount
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── vm
│   ├── main.tf
│   └── variables.tf
├── main.tf
├── providers.tf
├── variables.tf
├── terraform.tfvars
└── README.md
```