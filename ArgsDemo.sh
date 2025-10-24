# For more complex scripts with named options (like -v for verbose or --help), the getopts command is commonly used.

#!/bin/bash
while getopts "vn:" flag; do
  case "${flag}" in
    v) verbose=true ;;
    n) name=${OPTARG} ;;
    *) echo "Invalid option: -${OPTARG}" >&2; exit 1 ;;
  esac
done

if [ "$verbose" = true ]; then
  echo "Verbose mode enabled."
fi

if [ -n "$name" ]; then
  echo "Hello, $name."
fi


# Example Usage:
#       To run a script named myscript.sh with arguments:

#       bash myscript.sh argument1 "another argument" -v -n John

