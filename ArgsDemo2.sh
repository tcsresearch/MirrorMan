# On a bash script, I personally like to use the following script to set parameters:

#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -a parameterA -b parameterB -c parameterC"
   echo -e "\t-a Description of what is parameterA"
   echo -e "\t-b Description of what is parameterB"
   echo -e "\t-c Description of what is parameterC"
   exit 1 # Exit script after printing help
}

while getopts "a:b:c:" opt
do
   case "$opt" in
      a ) parameterA="$OPTARG" ;;
      b ) parameterB="$OPTARG" ;;
      c ) parameterC="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterA" ] || [ -z "$parameterB" ] || [ -z "$parameterC" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "$parameterA"
echo "$parameterB"
echo "$parameterC"

# With this structure, we don't rely on the order of the parameters, as we're defining a key letter to each one of them. Also, the help function will be printed all the times that the parameters are defined wrongly. It's very useful when we have a lot of scripts with different parameters to handle. It works as the following:

# $ bash myscript -a "String A" -b "String B" -c "String C"
#       String A
#       String B
#       String C

# $ bash myscript -a "String A" -c "String C" -b "String B"
#       String A
#       String B
#       String C

# $ bash myscript -a "String A" -c "String C" -f "Non-existent parameter"
#       myscript: illegal option -- f

#       Usage: myscript -a parameterA -b parameterB -c parameterC
#           -a Description of what is parameterA
#           -b Description of what is parameterB
#           -c Description of what is parameterC

# $ bash myscript -a "String A" -c "String C"
# Some or all of the parameters are empty

# Usage: myscript -a parameterA -b parameterB -c parameterC
#            -a Description of what is parameterA
#            -b Description of what is parameterB
#            -c Description of what is parameterC

