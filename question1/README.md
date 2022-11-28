## Setting up the Infrastructure

`terraform init`
`terraform plan`
`terraform apply --auto-approve`

Would create the Infrascture

* Assumption is that you have configured your az cli on your machine and have access to a valid azure portal account.
this can be easily done by running the `az login` from your cli to authenticate to azure before running the commands.

If you run into error with any of the terraform plan command for registering provider then you would need to register some of the providers
below is an error i faced while trying to get this up

'''
    If Error registing Microsoft.Storage then run  
    `az provider register --namespace Microsoft.Storage`
'''
