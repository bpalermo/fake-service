#!/bin/bash

# This script will be run bazel when building process starts to
# generate key-value information that represents the status of the
# workspace. The output should be like
#
# KEY1 VALUE1
# KEY2 VALUE2
#
# If the script exits with non-zero code, it's considered as a failure
# and the output will be discarded.

# The code below presents an implementation that works for git repository
git_rev=$(git rev-parse HEAD)
if [[ $? != 0 ]];
then
    exit 1
fi
echo "BUILD_SCM_REVISION ${git_rev}"

# Check whether there are any uncommitted changes
git diff-index --quiet HEAD --
if [[ $? == 0 ]];
then
    tree_status="Clean"
else
    tree_status="Modified"
fi
echo "BUILD_SCM_STATUS ${tree_status}"

latest_tag=$(git describe --tags --abbrev=0)
if [[ $? != 0 ]];
then
    latest_tag="dev"
fi
echo "BUILD_SCM_TAG ${latest_tag}"

echo "STABLE_REPOSITORY index.docker.io/palermo"