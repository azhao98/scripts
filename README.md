# scripts


# Assignment 2

This script takes three inputs - Github repository, tag 1 and tag 2.

It outputs all files that have been modified between one tag and another tag for a chosen repository e.g. v1.2.0 and v1.3.0, excluding any files that begin with 'excl'.

Pre-requisites for running the script:
- Git CLI Access

Implementation Detail:
- The goal of the script was to be able to take any remote repository and find the difference in files between two tags. However, that proved quite difficult.
- The implementation that I have done clones the remote repository and then performs the diff which adds a little bit of overhead as it requires cloning the repository that is potentially large.
 

