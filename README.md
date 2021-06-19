# Assignment 1

There are two scripts for this assignment. 
- The first script, a1_ec2.sh runs on an EC2 instance (tested on Linux).
- The second script, a1.sh runs on a user's local machine (tested on Mac OSX).

### The script queries and displays all AWS private AMIs that are older than 60 days. 

For the script that runs on an EC2 instance (a1_ec2.sh), there are a few things that must be done before the script can be run.
- The EC2 instance must have permissions to read AMIs. This can be done by attaching an IAM role to the instance with adequate permissions. The AmazonEC2ReadOnlyAccess IAM Permission is enough.
- The following command needs to be run to copy the script onto the instance: scp -i <pem_file> <script_file> ec2-user@<instance_ip>:/home/ec2-user
- Now, you may SSH into the instance and run the script.
- Ensure the correct permission are placed onto the script - chmod u+x a1_ec2.sh
- Run the script: ./a1_ec2.sh


For the script that runs locally, it starts off by authenticating the user using their programmatic access keys. It then goes on to perform the query and then deletes the credentials. I understand that this is a known security flaw as credentials are stored on disk. However, I could not determine any other methods that would authenticate to the user's AWS account on their local machine.

Pre-requisites for running this script:
- Must have AWS CLI installed (preferably version 2) - https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
- Must have coreutils package to use gdate.

Implementation Detail for Assignment 1:
- There was no method I could find where I could take the account ID as an input and authenticate to the AWS account. I would like some feedback on this if possible.
- Hence, I created the script with the assumption that the script was being run on an EC2 instance with the correct IAM role attached to it.
- aws configure should never be used as a login, especially on EC2 instances. However, for the purposes of running the script on a local machine, I have added it in.
- Both scripts have been extended so that it can determine AMIs of any age, not just 60 days. This can be modified by changing the value within the script.




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
- cd into the directory that contains the script
- Ensure the following command is run: chmod u+x a2.sh
- Example run: ./a2.sh 99designs/aws-vault v6.2.0 v6.3.1
 

