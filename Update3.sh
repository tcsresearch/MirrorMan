#!/usr/bin/env bash

##### Corrected by Google AI and confirmed working as of 04/02/2026 #####

## Define Variables ##
FuncFile="./UpdateRepo.bfunc"

# Check if the file exists and is a regular file
if [ ! -f "$FuncFile" ]; then
        echo " ERROR! Functions File $FuncFile Not Found.  Quitting..."
        exit 1
else
        echo "Sourcing Functions..."
        source "$FuncFile"
fi
