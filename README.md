# Assignment 1

There are two scripts for this assignment.

The first script, a1_ec2.sh runs on an EC2 instance.

The second script, a1.sh runs on a user's local machine.

The script queries and displays all AWS private AMIs that are older than 60 days. 

For the script that runs on an EC2 instance, there are a few things that must be done before the script can be run.
- An EC2 instance will need to be launched with a key pair and an IAM role that gives Read-Only access to the instance. The Permission policy 'AmazonEC2ReadOnlyAccess' will be sufficient.
- The following command needs to be run to copy the script onto the instance: scp -i <pem_file> <script_file> ec2-user@<instance_ip>:/home/ec2-user
- An example of the command is scp -i MyKp.pem ~/Documents/a1_ec2.sh ec2-user@123.21.31.21:/home/ec2-user
- Now, you may SSH into the instance and run the script.
- Ensure the correct permission are placed onto the script - chmod u+x a1_ec2.sh
- Run the script: ./a1_ec2.sh

For the script that runs locally, it starts off by authenticating the user using their programmatic access keys. It then goes on to perform the query and then deletes the credentials.

Pre-requisites for running this script:
- Must have AWS CLI installed (preferably version 2)
- Must have coreutils package

Implementation Detail for a1_ec2.sh:
- There was no method I could find where I could take the account ID as an input and authenticate to the AWS account.
- Hence, I created the script with the assumption that the script was being run on an EC2 instance with the correct IAM role attached to it.

Implementation Detail for a1.sh:
- aws configure was used to authenticate the user into their AWS environment. This is a known security flaw as credentials are stored on disk. However, I could not determine any other methods that would authenticate to the user's AWS account on their local machine.
- The credentials are deleted after the query is run. 



# Assignment 2

This script is under the name: a2.sh

This script takes three inputs:
1. Github repository. This needs to be specified with the owner and the repo name e.g. 99designs/aws-vault
2. Tag 1 e.g. v1.2.0
3. Tag 2 e.g. v1.3.0

It outputs all files that have been modified between tag 1 and tag 2 for a chosen GitHub repository e.g. v1.2.0 and v1.3.0, excluding any files that begin with 'excl'.

Pre-requisites for running the script:
- Git CLI: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

Implementation Detail:
- The goal of the script was to be able to take any remote repository and find the difference in files between two tags without cloning the repository. However, that proved quite difficult.
- The implementation that I have done clones the remote repository and then performs the diff which adds a little bit of overhead as it requires cloning the repository that is potentially large.
- Some feedback on how to implement the first option would be great.

Notes:
- This script was produced and tested on a Mac OSX operating system. 

How to run?
- Ensure the following command is run: chmod u+x a2.sh

## Example Run
./a2.sh 99designs/aws-vault v6.2.0 v6.3.1
 

