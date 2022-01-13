#!/bin/bash
echo "This is a script used to test PRM"
echo "Contents of target dir: "
ls

while getopts 'f' opt; do
    case $opt in
        f)
        echo "-f flag was triggered, the script will now exit with error code 1" >&2
        exit 1;
    esac
done
