Modules make it easier to navigate, understand, and update your configuration by keeping related parts of your configuration together. 

Another benefit of using modules is to encapsulate configuration into distinct logical components. 

Re-use configuration

A Terraform module is a set of Terraform configuration files in a single directory. 
```
$ tree minimal-module/
.
├── LICENSE
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
```

In this case, when you run Terraform commands from within the minimal-module directory, the contents of that directory are considered the root module.

Terraform commands will only directly use the configuration files in one directory, which is usually the current working directory. 

However, your configuration can use module blocks to call modules in other directories. 

When Terraform encounters a module block, it loads and processes that module's configuration files.

A module that is called by another configuration is sometimes referred to as a "child module" of that configuration.

Modules can be loaded from either the local filesystem or a remote source. 

Use the public Terraform Registry to find useful modules. 

#### Task 1. Use modules from the Registry
When you call a module, the source argument is required. 

You could also use a URL or local file path for the source of your modules. 

##### Create a Terraform configuration
This configuration includes a few important blocks:
* provider "google" defines your provider.
* locals are the names of your three subnets. 
* module "test-vpc-module" defines a Virtual Private Cloud (VPC), which will provide networking services for the rest of your infrastructure.

##### Set values for module input variables
Some input variables are required, which means that the module doesn't provide a default value; an explicit value must be provided in order for Terraform to run correctly.

The required inputs for this module are:
* network_name: The name of the network being created
* project_id: The ID of the project where this VPC will be created
* subnets: The list of subnets being created

The configuration that calls a module is responsible for setting its input values, which are passed as arguments to the module block. 

##### Define root input variables
Using input variables with modules is very similar to how you use variables in any Terraform configuration. 

A common pattern is to identify which module input variables you might want to change in the future, and then create matching variables in your configuration's variables.tf file with sensible default values. 

Those variables can then be passed to the module block as arguments.

To retrieve your Project ID, run the following command in Cloud Shell:

	gcloud config list --format 'value(core.project)'

##### Define root output values
Modules also have output values, which are defined within the module with the output keyword. 

You can access them by referring to module.\<MODULE NAME\>.\<OUTPUT NAME\>

Module outputs are usually either passed to other parts of your configuration or defined as outputs in your root module. 

##### Provision infrastructure

##### Understand how modules work
When using a new module for the first time, you must run either terraform init or terraform get to install the module. 

When either of these commands is run, Terraform will install any new modules in the .terraform/modules directory within your configuration's working directory. 

For local modules, Terraform will create a symlink to the module's directory. 

Because of this, any changes to local modules will be effective immediately, without your having to re-run terraform get.

##### Clean up your infrastructure

	terraform destroy

#### Task 2. Build a module
As you may already know, Terraform treats every configuration as a module. 

When you run terraform commands, or use Terraform Cloud or Terraform Enterprise to remotely run Terraform, the target directory containing Terraform configuration is treated as the root module.

##### Module structure
Terraform treats any local directory referenced in the source argument of a module block as a module. 

main.tf contains the main set of configurations for your module.  

You can also create other configuration files and organize them in a way that makes sense for your project.

variables.tf contains the variable definitions for your module.  

When your module is used by others, the variables will be configured as arguments in the module block. 

Because all Terraform values must be defined, any variables that don't have a default value will become required arguments. 

A variable with a default value can also be provided as a module argument, thus overriding the default value.

outputs.tf contains the output definitions for your module. 

Module outputs are made available to the configuration using the module, so they are often used to pass information about the parts of your infrastructure defined by the module to other parts of your configuration.

terraform.tfstate and terraform.tfstate.backup files contain your Terraform state and are how Terraform keeps track of the relationship between your configuration and the infrastructure provisioned by it.

The .terraform directory contains the modules and plugins used to provision your infrastructure. 

*.tfvarsfiles don't need to be distributed with your module unless you are also using it as a standalone Terraform configuration because module input variables are set via arguments to the module block in your configuration.

If you are tracking changes to your module in a version control system such as Git, you will want to configure your version control system to ignore these files. 

##### Create a module
Your current module directory structure should now look like this:

```
modules/
└── gcs-static-website-bucket
    ├── LICENSE
    ├── README.md
    ├── website.tf
    ├── outputs.tf
    └── variables.tf
```
Like variables, outputs in modules perform the same function as they do in the root module but are accessed in a different way. 

A module's outputs can be accessed as read-only attributes on the module object, which is available within the configuration that calls the module.

##### Install the local module
Whenever you add a new module to a configuration, Terraform must install the module before it can be used. 

Both the terraform get and terraform init commands will install and update modules. 

The terraform init command will also initialize backends and install plugins.

##### Upload files to the bucket
```
cd ~

curl https://raw.githubusercontent.com/hashicorp/learn-terraform-modules/ 
	master/modules/aws-s3-static-website-bucket/www/index.html > index.html
curl https://raw.githubusercontent.com/hashicorp/learn-terraform-modules/  		
	blob/master/modules/aws-s3-static-website-bucket/www/error.html > error.html

gsutil cp *.html gs://YOUR-BUCKET-NAME
```


##### Clean up the website and infrastructure

	terraform destroy














