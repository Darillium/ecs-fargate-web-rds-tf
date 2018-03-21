# ecs-fargate-web-rds-tf
a terraform template to create a web app backed by rds (mysqldb) running in AWS ECS [Fargate].
we are using [darillium petclinic](https://github.com/Darillium/petclinic) with my sql db as an example.

# Work In Progress - try on your own risk!

## Pre-Requisites
- [terraform](https://www.terraform.io/).
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html).
- pwgen - a utility to generate passwords and random alpha-numeric strings.
- ssh-keygen - a utility to generate ssh keys.
- a working AWS Account

## Steps (all the tests were done on Ubuntu 16.04).
Open a terminal window (I'm using bash), you can use your favorite shell.
`$ git clone https://github.com/Darillium/ecs-fargate-web-rds-tf.git`
`$ cd ecs-fargate-web-rds-tf/staging`
`$ ../scripts/generate_key.sh` - this will generate staging_key and staging_key.pub files in the current directory.
Set the AWS Credentials in environment variables - DO NOT insert your creds in the files that are in git.
```
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
```
To setup few terraform variables, run 
`$ source ../scripts/set_env.sh`
`$ terraform init`
Run `terraform plan` command to make sure that you have all the pre-requisites set, if successful run `terraform apply` and don't forget to confirm by typing 'yes' when asked.
Now it's time for your favorite bevarage, check your emails, do something - it will take few minutes...
When finished successfully, you should see the following output:
```
Apply complete! Resources: 37 added, 0 changed, 0 destroyed.

Outputs:

alb_dns_name = staging-alb-petclinic-2077884371.us-east-1.elb.amazonaws.com
cluster_name = staging-ecs-cluster
db_access_sg_id = sg-f1bfff87
db_init_task_definition_name = staging_db_init
default_sg_id = sg-d1adeda7
private_subnets_id = [
    subnet-fdf9cad2,
    subnet-6d3cf927
]
public_subnets_id = [
    subnet-6cf7c443,
    subnet-ae31f4e4
]
rds_sg = sg-53b1f125
security_group_id = sg-76b5f500
security_groups_ids = [
    sg-d1adeda7
]
service_name = staging-web
```
Now we have all the needed infrastructure provisioned.

Next step is to run a database initialisation task.
`$../scripts/running_the_task.sh`

Login to your AWS console, go to the ECS service, under the 'staging-ecs-cluster' cluster you should see "Pending Tasks Count" equals 1.
You will notice that the STATUS will change from PENDING->RUNNING->STOPPED. At this point the mysql db for petclinic should be provisioned.

Next we need to start the application itself:
`../scripts/update_service.sh`

Switch to AWS Console to verify that the service 'staging_web' has been changed and the desired count is not 1, hence the ECS will start 1 (one) instance of the container that will be running darillium petclinic.

To check that Petclinic is running and getting the data from the database, from your command line run the following:
```
$ curl \`terraform output alb_dns_name\`/vets.html
```

You should get a lengthy output enumerating all the veterenarians that were defined in the initial database.

of course you can take the output of `$ terraform output alb_dns_name` command and paste it into a browser and see it there.

Thast's all folks! - Happy sailing! 

Ah, almost forgot, once you are done playing with it - don't forget to deprovision all the resources in AWS:
`$ terraform destroy` and don't forget to confirm by typing `yes` - it will take a few minutes to get rid of all the infra that we have created.




