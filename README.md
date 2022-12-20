# A Multi-Cloud Application

## Getting Started

This folder contains the scaffolding Terraform code to deploy your project. Once you select the appropriate cloud providers, you will need to research specific Terraform modules for your select service and add those modules to the provided Terraform scaffolding. 

### Resources
See the documentation here:
- For [Azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- For [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

### Dependencies

```
- Terraform
- Azure access
- AWS access
```

### Installation

**NOTE:** This project assumes you have already completed earlier labs and setup your personal Azure and AWS accounts as well as create your personal git copies of the repositories:

1. Open the AWS portal
    1. Open AWS CloudShell
    2. Clone your git repo: https://github.com/udacity/cd11573-multicloud-computing-project
2. Open the Azure portal
    1. Open the Azure Cloud Shell
    2. Clone your git repo: https://github.com/udacity/cd11573-multicloud-computing-project


## Project Instructions

### Requirements
Your goal is to select a cloud provider for each of the 4 required services - SQL server, S3 storage, web app and NoSQL database. Also don't forget to consider cost and flexibility of pricing options.

1. Select a cloud provider for SQL server
    1. Must utilize at least 2 vCPU
    2. 150GB of storage
    3. We will be migrating an existing SQL server instance
    4. We would like to bring our own SQL licensing
2. Select a cloud provider for S3 storage
    1.  Must have full S3 API capability
    2.  Global replication
3. Select a cloud provider for the NoSQL database
    1. Global availability
    2. Highly scalable pricing
4. Select a cloud provider for the Web app
    1. Existing dotnet application
5. Create a diagram of your architecture
    1. Show connectivity between the 2 cloud services. Don't worry about getting the cloud-specifics right with the template. The key is to show the components in each cloud

**NOTE:** There are container groups contained here in the scaffolding for both AWS and Azure. They are not part of the design itself. They are there to test your functionality once you have deployed your work.

### Instructions
1. Using the give requirements, select the appropriate cloud providers for each of the 4 app components. Use what we have learned in this course and research.
2. Create a diagram based on your design.
3. Using the [above linked](#resources) references, add the appropriate modules to the given cloud provider Terraform scafolding files:
    1. AWS - `starter/aws/main.tf`
    2. Azure - `starter/azure/main.tf`
4. Edit the appropriate environment variables for the containers to test your install
    1. Find the following environment variables in the Terraform scaffolding and change their values to reflect your name:
        1. AWS_S3_BUCKET: `udacity-<your_name>-aws-s3-bucket`
        2. AWS_DYNAMO_INSTANCE: `udacity-<your_name>-aws-dynamodb`
        3. AZURE_SQL: `udacity-<your_name>-azure-sql`
        4. AZURE_DOTNET_APP: `udacity-<your_name>-azure-dotnet-app`
5. Edit the Azure DNS for the container. Find this line in `starter/azure/main.tf` and replace `<your_name>` with your name:
    ```
      dns_name_label      = "udacity-tscotto-azure"
    ```
6. After you have added the modules, applies the changes to the files and push your changes to your github repositories
7. Pull a fresh copy of your github repository into your AWS and Azure Cloud Shells
8. In each shell, run the following:

    For AWS:
    ```
    cd cd11573-multicloud-computing-project/starter/aws
    terraform apply
    ```

    For Azure:
    ```
    cd cd11573-multicloud-computing-project/starter/azure
    terraform apply
    ```

    And type `y` when asked if you want to apply the changes
9. Wait for the changes to apply. This can take up to 20 min.
10. Verify the changes took effect:

    For Azure:
    1. In Azure go the search bar and type `container-instances` and click the icon that comes up
    2. Click `udacity-continst`
    3. Copy the URL from the field FQDN
    4. Paste that URL into another tab in your browser and add `:3000` onto the end of the URL. It will look something like this: `udacity-tscottoazure.westeurope.azurecontainer.io:3000`. Go to that URL. You should see this text in your browser (note the name will be yours):

                This is my app running on Azure accessing an S3 bucket in AWS: udacity-tscotto-s3-bucket

                And also accessing a dynamodb instance in AWS: udacity-tscotto-aws-dynamodb
    
    For AWS:
    1. In AWS go the search bar and type `load balancer` and click Load Balancers under the EC2 heading
    2. Click `udacity-lb`
    3. Copy the URL from the field DNS
    4. Paste that URL into another tab in your browser. It will look something like this: `udacity-lb-266017657.us-east-2.elb.amazonaws.com`. Go to that URL. You should see this text in your browser (note the name will be yours):

                This is my app running on AWS accessing an Azure SQL instance: tscotto-udacity-sql

                And also a dotnet app in Azure: udacity-tscotto-azure-dotnet-app
11. Complete!
12. Cleanup resources

    For AWS:
    ```
    cd cd11573-multicloud-computing-project/starter/aws
    terraform destroy
    ```

    For Azure:
    ```
    cd cd11573-multicloud-computing-project/starter/azure
    terraform destroy
    ```

    And type `y` when asked if you want to destroy the resources

## License

[License](LICENSE.txt)