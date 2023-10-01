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
The outermost folder of the project is the root folder of the project. This folder contains five new folders as well as some files. Four of the folders are for each of the modules, while the last folder contain images and screenshots that will be shown further down.
The files in the root folder contains the main configuration of the project. The main.tf file is used to configure the modules, making it possible for them to communicate. This can be done by retrieving output from one of the modules and using it as input for another module.
The providers.tf file is used to configure the provider for the project. In this case it is the Azure provider as well as Hashicop's random provider. Hashicop's random provider is only used some places in the project to generate random strings, while the Azure provider is used throuhout the project to provision and manage Azure resources.

The variables.tf file is used to declare variables that can be used in the project. This file contains all the variables from the project, which includes variables that are used in the modules. 

There are many ways to assign values to variables in Terraform. The terraform.tfvars file is one of the most preffered ways to assign values to the variables declared in the variables.tf file. It makes it easier to manage and change key attributes of the project.

All of the four module folders contain a similar file structure as the root folder, but the content of the files more aimed towards actual Azure resoursces and the configuration of them. A more presice description of the modules can be found in the next section.

## Module description
This section will provide more in depth information about the different modules used in the project. This includes which Azure resources they provision and manage, as well as how the file structure is set up.
### Key Vault

### Network

### Storage Account

### Virtual Machine