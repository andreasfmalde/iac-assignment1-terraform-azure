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
The files in the root folder contains the main configuration of the project. The **main.tf** file is used to configure the modules, making it possible for them to communicate. This can be done by retrieving output from one of the modules and using it as input for another module.

The **providers.tf** file is used to configure the provider for the project. In this case it is the Azure provider as well as Hashicop's random provider. Hashicop's random provider is only used some places in the project to generate random strings, while the Azure provider is used throuhout the project to provision and manage Azure resources.

The **variables.tf** file is used to declare variables that can be used in the project. This file contains all the variables from the project, which includes variables that are used in the modules. 

There are many ways to assign values to variables in Terraform. The **terraform.tfvars** file is one of the most preffered ways to assign values to the variables declared in the variables.tf file. It makes it easier to manage and change key attributes of the project.

All of the four module folders contain a similar file structure as the root folder, but the content of the files more aimed towards actual Azure resoursces and the configuration of them. A more presice description of the modules can be found in the next section.

## Module description
This section will provide more in depth information about the different modules used in the project. This includes which Azure resources they provision and manage, as well as how the file structure is set up.
### Key Vault
The keyvault module is responsible for setting up a Azure Key Vault with two secrets. The following azure resources are provisioned and managed by the keyvault module:
- **Azure Resource Group** - The resource group contains all resources related to the key vault.
- **Hashicorp Random String** - Used to generate a random string used as part of the name of the key vault to make it globally unique.
- **Azure Key Vault** - The key vault is used to store secrets as mentioned above. Access policies are set up to allow this app registration to access the key vault.
- **Azure Key Vault Secret** - One secret used for the login credentials for the virtual machine and one secret used for the access key for the storage account as mentioned above.

The keyvault folder contains four files. The **main.tf** file are used to provision and manage the resources mentioned above. The **variables.tf** file contains all the variables used in the module. The **outputs.tf** file contains the output of the key vault id and the name of the secret holding the login credentials which is used by the VM module. The **locals.tf** file are used to combine the username and the password for the VM into a map/object.

### Network
The network moudle is responsible for setting up a network making it possible for the different resources to communicate with each other. The following azure resources are provisioned and managed by the network module:
- **Azure Resource Group** - The resource group contains all resources related to the network.  
- **Azure Virtual Network** - The virtual network is used to create a private network allowing the resources in the network to communicate with each other.
- **Azure Subnet** - The subnet is used to divide the virtual network into smaller networks. In this project the subnet is used to create a smaller network for communication between the resources. There is also a network security group connected to the subnet defining rules for inbound and outbound traffic.
- **Azure Network Security Group** - The network security group is used to define rules for inbound and outbound traffic as explained above. The security group conains a security rule allowing for inboud traffic on port 22 from a specific IP which can be provided through the tfvars file.
- There is also a last resource which is called **azurerm_subnet_network_security_group_association**. This resource is used by terraform and azurerm to associate the subnet with the network security group and will not be shown as a resource in Azure. 

The network folder contains three files. The **main.tf** provision and manages the resources mentioned above. The **variables.tf** file contains the variables used in the module, and the **outputs.tf** contains the subnet id which is used by  the VM module to connect the VM to the subnet.

### Storage Account

### Virtual Machine