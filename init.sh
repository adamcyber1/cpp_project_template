#!/bin/bash

#  CPP_PROJECT_TEMPLATE
#  
#  A simple template to get your c++ project up and running in a matter of seconds.
#
#  init.sh
# 
#  A script that takes your project name, author name, and contact email and initializes the project with these values. 

project_name_lower=""
project_name_upper=""
email=""
name=""

programname=$0

function usage() {
    echo "usage: $programname  -n project_name -u author_name -e email"
    echo "  -n      project name"
    echo "  -u      author name"
    echo "  -e      contact email"
    echo "  -h      display help"
}

# Parse options to the `pip` command
while getopts ":hn:u:l:e:" opt; do
  case ${opt} in
    h )
      usage
      exit 0
      ;;
    n )
      project_name_lower=$OPTARG
      ;;
    u )
      name=$OPTARG
      ;;
    e )
      email=$OPTARG
      ;;
   \?: )
     echo "Invalid Option: -$OPTARG" 1>&2
     usage
     exit 1
     ;;
  esac
done

if [ -z "$project_name_lower" ] || [ -z "$name" ] || [ -z "$email" ]; then
  echo "All three arguments are mandatory!"
  usage
  exit 1
fi

project_name_upper=${project_name_lower^^}

files=$(find . -name "*" | grep --invert-match git | tr " " "\n")

#MOdify File Contents
while read -r line; do
    if [[ -d $line ]]; then
      echo "$line is a directory"
    elif [ -f $line ] && [ $line != "./init.sh" ]; then
      sed -i -e "s/@project_name@/$project_name_lower/g" $line
      sed -i -e "s/@PROJECT_NAME@/$project_name_upper/g" $line
      sed -i -e "s/@name@/$name/g" $line
      sed -i -e "s/@email@/$email/g" $line

      echo "$line is a file"
    else
      echo "$line is not valid"
    fi

done <<< "$files"
 
#Rename Directories
while read -r line; do

    if [ -d $line ]; then
      new_dir=$(echo $line | sed -e "s/\@project_name\@/$project_name_lower/g")
      mv $line $new_dir
    fi

done <<< "$files"

files=$(find . -name "*" | grep --invert-match git | tr " " "\n")

#Rename Files
while read -r line; do

    if [ -d $line ]; then
      echo "$line is a directory"
    elif [ -f $line ]; then
      rename "s/\@project_name\@/$project_name_lower/g" $line
    else
      echo $line is not valid
    fi

done <<< "$files"

rm -- "$0"