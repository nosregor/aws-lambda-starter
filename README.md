# aws-lambda-starter

Setup for deploying a lambda function. A playground to play with aws _API GateWay_, _Lambda_ and _dynamoDb_.

## Requirements

- aws account
- terrform installed on your machine ([howto](https://learn.hashicorp.com/terraform/getting-started/install.html))
- https://github.com/gruntwork-io/intro-to-terraform
- some ambient relaxing music to bear the terraform surprises

## Steps to do

After installing terraform and setting up an aws account (_HINT: not the root account_) and clonning the repo,
go to the folder of repo and run `terraform init`. This will initialize the working directory. During this you will probably be asked to enter your aws credentials: `AWS_ACCESS_KEY_ID` and `SECRET_AWS_ACCESS_KEY`. These you will get from your aws non-root account IAM settings.

Afterwards you can run either `terraform plan` to see what resources will be created or directy `terraform apply` again to see the resources and to create them in your aws account.

In the end an URL will be printed in terminal with which you can make a _POST_ request to see your beautiful lambda function's work. Don't forget to add the `path_part` from your `aws_api_gateway_resource` in the end of your URL.
