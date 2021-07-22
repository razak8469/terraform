#### build infrastructure
##### initialization
	terraform init 

##### creating resources
	terraform apply

###### check progress
- verify if VPC network has been provisioned 

##### inspect current state
	terraform show

#### change infrastructure
##### adding resources
- add a compute instance resource
- The presence of the `access_config` block, even without any arguments, ensures that the instance will be accessible over the internet.

##### changing resources
- add a tags argument to the vm instance

	The prefix ~ means that Terraform will update the resource in-place. 
###### check progress
- verify the addition and the update to the infrastructure

##### destructive changes
A destructive change is a change that requires the provider to replace the existing resource rather than updating it. 

This usually happens because the cloud provider doesn't support updating the resource in the way described by your configuration.


The prefix -/+ means that Terraform will destroy and recreate the resource, rather than updating it in-place. 

While some attributes can be updated in-place (which are shown with the ~ prefix), changing the boot disk image for an instance requires recreating it. 

##### Destroy Infrastructure
	terraform destroy

The - prefix indicates that the instance and the network will be destroyed. 

#### create resource dependencies
##### assign a static ip address
- create a resoure that allocates a reserved ip address
- attach the ip address to the instance

The access_config block has several optional arguments, and in this case you'll set nat_ip to be the static IP address. 

	terraform plan -out static_ip

Saving the plan this way ensures that you can apply exactly the same plan in the future. 

	terraform apply "static_ip"
















