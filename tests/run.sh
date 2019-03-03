#!/usr/bin/env bash

wd=`echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"`
tests_wd="$wd/tests/"

setup() {
    cd $tests_wd
}

teardown() {
    git checkout -- example.tf
    cd $wd
}

commands=(
    "git apply example.tf.diff && tfplan --git-diff --dry-run"
    "tfplan -f example.tf -l \"google_compute_network.*\" --dry-run"
    "tfplan -f example.tf -l \"google_compute_network.*2\" --dry-run"
)
failed=( )
for i in "${!commands[@]}"
do
    id=$i
    command="${commands[$i]}"
    setup
    expected_output=`cat outputs/${id}.output`
    current_output=`eval $command`
    if [[ $current_output != $expected_output ]]; then
        failed+=($i)
    fi
    teardown
done

if [[ $failed ]]; then
    echo "Failed tests: ${failed[@]}"
else
    echo "Tests succeeded"
fi