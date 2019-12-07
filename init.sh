#!/bin/bash

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

#replace instances of @project_name@ with {project_name_lower}
sed -e "s/@project_name@/$project_name_lower/g"  ./test
sed -e "s/@PROJECT_NAME@/$project_name_upper/g"  ./test
sed -e "s/@name@/$name/g"  ./test
sed -e "s/@email@/$email/g"  ./test

files=$(find . -name "*" | grep --invert-match git | tr " " "\n")

while read -r line; do
    if [[ -d $line ]]; then
      echo "$line is a directory"

    elif [[ -f $line ]]; then
      sed -e "s/@project_name@/$project_name_lower/g" $line
      sed -e "s/@PROJECT_NAME@/$project_name_upper/g" $line
      sed -e "s/@name@/$name/g" $line
      sed -e "s/@email@/$email/g" $line

      echo "$line is a file"
    else
      echo "$line is not valid"
      exit 1
    fi

    rename -n "s/\@project_name\@/$project_name_lower/" $line
    rename -n "s/\@PROJECT_NAME\@/$project_name_upper/" $line
    rename -n "s/\@name\@/$name/" $line
    rename -n "s/\@email\@/$email/" $line


done <<< "$files"