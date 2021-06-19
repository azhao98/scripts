#!/usr/bin/env bash

aws configure

# Function that takes in an argument (number of days)
# Returns a list of all the private AMIs that are older than the number of days entered
get_old_amis () {
    lifetime=$1
    lifetime_date=$(gdate -u +'%Y-%m-%dT%H:%M:%S.%3NZ' --date "$lifetime days ago")
    for ami_name in $(aws ec2 describe-images --region ap-southeast-2 --query 'Images[?CreationDate < `'"$lifetime_date"'`].ImageId' --owner self)
    do
        echo $ami_name
    done
}

get_old_amis 60

# Delete credentials
rm -rf ~/.aws


