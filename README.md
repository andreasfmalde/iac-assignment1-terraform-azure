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
- **Azure Resource Group** - Contains all resources related to the key vault.
- **Hashicorp Random String** - Used to generate a random string used as part of the name of the key vault to make it globally unique.
- **Azure Key Vault** - Used to store secrets as mentioned above. Access policies are set up to allow this app registration to access the key vault.
- **Azure Key Vault Secret** - One secret used for the login credentials for the virtual machine and one secret used for the access key for the storage account as mentioned above.

The keyvault folder contains four files. The **main.tf** file are used to provision and manage the resources mentioned above. The **variables.tf** file contains all the variables used in the module. The **outputs.tf** file contains the output of the key vault id and the name of the secret holding the login credentials which is used by the VM module. The **locals.tf** file are used to combine the username and the password for the VM into a map/object.

### Network
The network moudle is responsible for setting up a network making it possible for the different resources to communicate with each other. The following azure resources are provisioned and managed by the network module:
- **Azure Resource Group** - Contains all resources related to the network.  
- **Azure Virtual Network** - Used to create a private network allowing the resources in the network to communicate with each other.
- **Azure Subnet** - Used to divide the virtual network into smaller networks. In this project the subnet is used to create a smaller network for communication between the resources. There is also a network security group connected to the subnet defining rules for inbound and outbound traffic.
- **Azure Network Security Group** - Used to define rules for inbound and outbound traffic as explained above. The security group conains a security rule allowing for inboud traffic on port 22 from a specific IP which can be provided through the tfvars file.
- There is also a last resource which is called **azurerm_subnet_network_security_group_association**. This resource is used by terraform and azurerm to associate the subnet with the network security group and will not be shown as a resource in Azure. 

The network folder contains three files. The **main.tf** provision and manages the resources mentioned above. The **variables.tf** file contains the variables used in the module, and the **outputs.tf** contains the subnet id which is used by  the VM module to connect the VM to the subnet.

### Storage Account
This module is responsible for setting up a storage account and a storage container which can be used to store other files. The following resources are provisioned and managed by the storage account module:
- **Azure Resource Group** - Contains all resources related to the storage account.
- **Hashicorp Random String** - Used to generate a random string as part of the name of the storage account to make it globally unique.
- **Azure Storage Account** - Contains a storage container which can be used to store files.
- **Azure Storage Container** - Can be used to store files.

The storageaccount folder contains three files as well. THe main.tf file is used to provision and manage the resources mentioned above, while the variables.tf is where all the modules variables are defined. The outputs.tf file contains a single output which is the storage account primary access key. This values is sent to the Keyvault module and stored as a secret.

### Virtual Machine
The virtual machine module is responsible for setting up a virtual machine and connecting it to the virtual network as well as providing a public IP making it accessible from the public internet. The following resources are provisioned and managed by the vm module:
- **Azure Resource Group** - Contains all resources related to the virtual machine.
- **Azure public IP** - Used to retrieve a public IP from Azure which makes it possible to access the virtual machine from the public internet.
- **Azure Network Interface** - Used to connect the virtual machine to the subnet using the subnet id from the network module as well as connecting the public IP to the machine.
- **Azure Linux Virtual Machine** - Used to create a linux virtual machine with the admin credentials retrieved from the key vault using the "azurerm_key_vault_secret" data source. 

The vm folder only contains two files. The main.tf file contains the source code to provision the resources mentioned above. There is also an output in the main file, which outputs the public IP to the terminal, so there is no need to go to Azure Portal to see the IP address. The variables.tf file contains all the variables used in the module.

## The use of Terraform scripts
When working with Terraform, the primary goal is to create, modify and/or destroy infrastructure and make the state match what is defined in the .tf source files. This is done using three commands, ```plan```, ```apply``` and ```destroy```.
- ```terraform plan``` - This command lets us see what changes will be made to the infrastructure before actually making the changes. It will look at the source files and create a desired state. It will then compare the desired state with the current state of the infrastructure, and give information of what changes will be made, what is going to be added, changed or destroyed. The key idea is that the plan command will not make any changes to the infrastructure, it will only show what changes will be made. When one is ready to make the changes, the ```apply``` command is used.
- ```terraform apply``` - This command works in the same way that the plan does, but isntead of just showing the changes, it will acutally make the changes to the infrastructure as well. ```terraform apply``` can be used without running ```terraform plan``` first. In that case the changes will be presented first, and the user will be asked to verify that the changes shall be made. Another way is to add the name of the plan file made by the ```terraform plan``` command after the apply command.
- ```terraform destroy``` - This command is used to destroy the infrastructure that has been created. The command uses state data to determine what real world objects correspond to the resources defined in the configuration files and will be destroyed. The number of objects that will be deleted is presented to the user, and the user is asked to verify that the destroy shall be made.

## Prerequisites and/or dependencies
To run this project and successfully deploy the infrastructure to Azure, there are some prerequisites that needs to be met. One need to have an Azure account and a subscription making it poosible to create resources in Azure. Azure works on the basis of pay-as-you-go, meaning that one only pay for what is used of resources. 

Another prerequisite is to have a connection between the local computer and the azure account. For this to work, one need to have the Azure CLI installed on the local computer. The Azure CLI is a command-line tool that can be used to manage Azure resources. After it is installed on the computer, one need to create a service principal/ app registration on Azure which authenticates the CLI to the Azure account.

The last but most important prerequisite is to have Terraform installed on the local computer. 