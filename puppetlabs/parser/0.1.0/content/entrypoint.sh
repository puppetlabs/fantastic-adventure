#!/bin/bash
if [ -z "$1" ]
then
  files=$(find . -type f -name '*.pp'  -not -path "./.onceover/*")
elif [ "$1" = "help" ]
then
  echo "Please specify a file glob pattern to search for PP files, such as '**/*.pp'"
  exit
else
  cmd="find ."
  for var in "$@"
  do
    cmd="$cmd -o -type f -name '$var'"
  done
  cmd=$(echo "$cmd" | sed '0,/-o/s///')
  files=$(eval ${cmd})
fi
echo "Validating PP for ${files}"
puppet parser validate $files
