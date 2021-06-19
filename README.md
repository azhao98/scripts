# scripts


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
 

