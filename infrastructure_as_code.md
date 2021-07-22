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














