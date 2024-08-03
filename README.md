[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

[![terraform-azure.png](https://i.postimg.cc/Nf45HtZR/terraform-azure.png)](https://postimg.cc/VdJYxxfN)

These artefacts are intented to help you provision a Databricks cluster on Azure using Infrastructure As Code (IaC).

<hr>

The testing and GitHub documentation were technically performed by Isaac Arnault, EMEA Managing Director for Data, AI and Analytics at HUBIA (Consulting IT firm for Data, AI, BI and Analytics) in France. This gist is mainly dedicated to HUBIA's Clients' teams and its prospective customers. Follow Isaac Arnault on GitHub: https://isaacarnault.github.io/.

<hr>

Without any further due let's get started.
The below files (main.tf, variables.tf, terraform.tfvars) will provision a Databricks workspace, secret scope, and a cluster with specified configurations in your Azure subscription. Adjust the configurations as per your requirements.

<hr>

The Azure architecture for the provisioned Databricks cluster would typically include the following components:

• Resource Group: This is the container for all resources associated with the Databricks workspace and cluster.

• Databricks Workspace: This is the Databricks environment where you can create and manage clusters, notebooks, libraries, jobs, and dashboards. It's a managed Spark environment.

• Databricks Cluster: This is the compute layer where your Spark jobs will run. It consists of multiple VMs (in this case, a 3-node cluster) of the specified size and autoscaling configuration.

• Virtual Network (VNet): You might have a VNet where your Databricks cluster is deployed for network isolation and security. It might include subnets for different purposes, such as cluster nodes, management, and gateway.

• Network Security Group (NSG): NSGs can be associated with subnets to control inbound and outbound traffic to the Databricks cluster. You may have rules to allow traffic only from specific sources, ports, or protocols.

• Managed Identity: Optionally, you might assign a managed identity to the Databricks cluster to authenticate with other Azure services securely.

• Storage Account: Databricks clusters often use Azure Storage for storing cluster logs, audit logs, and other metadata.

• Key Vault: You might use Azure Key Vault to securely store and manage secrets, such as Databricks access tokens or database connection strings.

• Azure Active Directory (AAD): Azure AD might be integrated with the Databricks workspace for user authentication and access control.

• Load Balancer (Optional): If your cluster is accessed by external clients or services, you might use Azure Load Balancer to distribute incoming traffic across the cluster nodes.

<hr>
Below are some technical parameters you can pass within your Azure infrastructure with respect to the items above.

• Azure Storage Account
Purpose: Azure Storage can be used as a data lake or as a storage solution for various data processing tasks in Databricks, such as storing input data, intermediate results, or output data.
Configuration: In Terraform, you can use the azurerm_storage_account resource to provision a storage account. You can specify parameters such as storage account name, resource group, location, and account kind (e.g., StorageV2 for general-purpose storage).
Additional Resources: You may also want to provision containers or file shares within the storage account using Terraform's azurerm_storage_container or azurerm_storage_share resources.

• Virtual Network (VNet) and Subnet
Purpose: Deploying Databricks within a VNet provides network isolation and enables better control over network traffic and security.
Configuration: You can use Terraform's azurerm_virtual_network resource to create a VNet and azurerm_subnet resource to define subnets within the VNet. Specify parameters such as address space, subnet CIDR block, and association with the Databricks cluster.
Additional Considerations: Consider configuring network security groups (NSGs) and route tables for controlling inbound and outbound traffic between subnets and other network resources.

• Network Security Group (NSG):
Purpose: NSGs allow you to filter network traffic to and from Azure resources in a VNet, providing an additional layer of security.
Configuration: Use Terraform's azurerm_network_security_group resource to create an NSG. Define inbound and outbound security rules to allow or deny traffic based on source and destination IP addresses, ports, and protocols.
Association: Associate the NSG with subnets using the network_security_group_id attribute in the azurerm_subnet resource.

• Azure Key Vault:
Purpose: Azure Key Vault provides a secure way to store and manage sensitive information such as passwords, cryptographic keys, and secrets.
Configuration: Use Terraform's azurerm_key_vault resource to create a Key Vault. Define access policies to specify who can access and manage secrets stored in the Key Vault.
Secret Management: Use Terraform's azurerm_key_vault_secret resource to manage secrets within the Key Vault, such as Databricks access tokens or database connection strings.

• Azure Active Directory (AAD) Integration:
Purpose: Integrating with Azure AD allows you to enforce authentication and access control policies based on user identities and group memberships.
Configuration: Configure Azure AD integration in the Databricks workspace settings. You can enable single sign-on (SSO) and role-based access control (RBAC) to manage user access.
Service Principal: You'll likely need to create a service principal in Azure AD and grant appropriate permissions to the Databricks workspace for accessing Azure resources.

• Monitoring and Logging:
Purpose: Monitoring and logging solutions help track the performance, health, and usage of the Databricks cluster, enabling proactive troubleshooting and optimization.
Configuration: Configure Azure Monitor to collect metrics and logs from the Databricks cluster. You can use Log Analytics to centralize log data and create custom queries and dashboards for monitoring.
Integration: Databricks provides integration with Azure Monitor and Log Analytics, allowing you to send cluster metrics, application logs, and audit logs to Azure Monitor for analysis and visualization.

<hr>
Best architecting practictes related to Azure Databricks include :

• Use a layered architecture: A layered architecture separates your data and workloads into different layers, such as a landing zone, a data lake, and a data warehouse. This makes it easier to manage your data and workloads, and it also improves performance and security.

• Use Delta Lake: Delta Lake is an open-source storage format that provides ACID transactions and other features that make it ideal for storing data in Azure Databricks. It is also compatible with Spark, so you can use existing Spark code to process and transform your data.

• Use autoscaling: Autoscaling allows Azure Databricks to automatically scale your clusters up or down based on the demand. This can help you to save money on compute costs.

• Use managed services: Azure Databricks provides a variety of managed services, such as managed notebooks and managed streaming. These services can help you to reduce the operational overhead of managing your Azure Databricks environment.
Use security features: Azure Databricks provides a variety of security features, such as role-based access control (RBAC) and encryption. These features can help you to protect your data and workloads from unauthorized access.


## Author

* **Isaac Arnault** - Suggesting a way to deploy a databricks cluster on [Azure](https://azure.microsoft.com)

## License

All public gists https://gist.github.com/aiPhD<br>
Copyright 2024, Isaac Arnault<br>
MIT License, http://www.opensource.org/licenses/mit-license.php

All public gists https://gist.github.com/aiPhD<br>
Copyright 2024, Isaac Arnault<br>
MIT License, http://www.opensource.org/licenses/mit-license.php
