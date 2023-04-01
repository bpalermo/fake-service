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
if ! git_rev=$(git rev-parse HEAD); then
    exit 1
fi
echo "BUILD_SCM_REVISION ${git_rev}"

if ! latest_tag=$(git describe --tags --abbrev=0); then
    latest_tag="dev"
fi
echo "BUILD_SCM_TAG ${latest_tag}"
