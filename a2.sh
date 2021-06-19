#!/usr/bin/env bash
# This configuration ensures the script stops upon erroring
set -e

# Parameters: Github repo name, tag 1 and tag 2
repository=$1
tag1=$2
tag2=$3

# Change to home directory and clone the repo. 
cd ~
git clone "https://github.com/github/$repository.git"

# cd into the local repo and perform a diff of the two tags.
cd $repository
diff_files=$(git diff $tag1 $tag2 --name-only)

echo "The list of files with differences between tag ${tag1} and ${tag2} is: "

# Outputs all files with differences between tag1 and tag2. 
for filename in $diff_files;
do
    if [[ $filename == excl* ]];
    then
        continue
    else
        echo $filename;
    fi;
done

# Removes the repo at the end.
cd ..
rm -rf $repository
