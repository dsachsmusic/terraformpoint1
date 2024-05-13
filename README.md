*On local machine*
install terraform binary (from internet?  On Windows, can use command: winget terraform

*In AWS*
note: set up a budget, because the permissions set up here allow an account to do anything...meaning it could spin up a lot of resources that will bill/cost a lot of money...
- go to IAM > groups ...create a group...call it "bootstrapgroup", and, for permissions, grant it the "AdministratorAccess" policy
- go to IAM users > create a user...callit "bootstrap", and add it to the "bootstrapgroup"
-- save the Access Key ID and Secret Access Key immediately somewhere safe.  The Secret Access Key will be shown to you only this one time.  
- go to AWS Organizations > AWS Accounts, find, and take note of (copy) the id for the "Root" organization (will be r-****


*On Github*
create a github repo for your project ... like https://github.com/thesmall/ben-terraform

*On local machine*
clone the repo to your local system
in that repo, add a .gitignore file with this stuff: https://github.com/thesmall/ben-terraform/blob/main/.gitignore
Make a folder, and add a terraform.tf and a variables.tf file 
- In variables.tf, include a variable named root_id, of type, and give it the values 'type = string', and 'default = "yourrootorganizationrootID"
- In terraform.tf, add a provider block to configure the AWS provider https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

On the command line, create environment variable: AWS_ACCESS_KEY_ID, and AWS_SECRET_ACCESS_KEY (with respective values from the "bootstrap" account)
From the folder you've created, run Terraform init
Create more .tf files, with resources in them, as needed
Push your code to remote for record keeping purposes
Run terraform plan
Run terraform apply


*Notes*
If you need to completely delete, a folder, run terraform destroy?  or just comment out and then run terraform apply
Terraform state is being saved locally, without backup?
All providers, etc, are downloaded locally, to the .terraform folder

