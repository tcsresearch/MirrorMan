#!/bin/env bash

##### Corrected by Google AI and confirmed working as of 04/02/2026 #####
### Updated to enable excludes and needs testing as of 04/26/2026 ###

## FIXME: Even with usage function run disabled, excludes shows several lines as "command not found" and usage still displays.
##		Study UpdateRepo.bfunc to find error.


########## ShellCheck - Disable Unnecessary Checks #########
# shellcheck source=/dev/null
# shellcheck disable=SC2034  # Unused variables left for readability
#
########## Define Main Variables ##########

ProgVersion="26.07_r1"

FuncFolder="functions"

## FuncFile="UpdateRepo.bfunc"
 FuncFile="functions/UpdateRepo.bfunc"

# Cecho
 CechoFile="./Cecho.bfunc"

########## Define Program & Args Variables ##########

prog="reposync"
args=" -n -m --delete"


######### Excludes Configuration ##########
# TODO: Remove the following $excludes variable after further testing
# excludes="*-debug*,*-rt-*"

ExcludesFolder="excludes"

## ExcludesFile="excludes-filtered2.list"
## CommaExcludesFile="excludes-filtered2-commas.list"

 ExcludesFile="excludes/excludes-filtered2.list"
 CommaExcludesFile="excludes/excludes-filtered2-commas.list"


## FIXME: Need to change code so that contents of files are placed into a variable.
##		Sourcing runs the package names, so 'kernel-debug' listed in the file actually runs the command 'kernel-debug'.
##		Do NOT source excludes files!

########## Sanity Checkers ##########

function SanityChecker_CechoFile() {
# Check if the file exists and is a regular file
	if [ ! -f "$CechoFile" ]; then
        	echo " ERROR! Functions File $CechoFile Not Found.  Quitting..."
        	return 1
	else
        	echo "Sourcing Functions File: $CechoFile..."
        	source "$CechoFile" # && echo "Sourcing: $CechoFile..."
	fi
}


function SanityChecker_FuncFile() {
# Check if the file exists and is a regular file
        if [ ! -f "$FuncFile" ]; then
                echo " ERROR! Functions File $FuncFile Not Found.  Quitting..."
                return 1
        else
                echo "Sourcing Functions File: $FuncFile..."
                source "$FuncFile" # && echo "Sourcing: $FuncFile..."
        fi
}


function SanityChecker_ExcludesFile() {
# Check if the file exists and is a regular file
	if [ ! -f "$ExcludesFile" ]; then
        	echo " ERROR! Excludes File $ExcludesFile Not Found.  Quitting..."
        	return 1
	else
        	echo "Sourcing Excludes File: $ExcludesFile..."
        	source "$ExcludesFile" # && echo "Sourcing: $ExcludesFile..."
	fi
}

function SanityChecker_CommaExcludesFile() {
# Check if the file exists and is a regular file
	if [ ! -f "$CommaExcludesFile" ]; then
        	echo " ERROR! Comma Excludes File $CommaExcludesFile Not Found.  Quitting..."
        	return 1
	else
        	echo "Sourcing Comma Excludes File: $CommaExcludesFile..."
        	source "$CommaExcludesFile" # && echo "Sourcing: $CommaExcludesFile..."
	fi
}


########## Main Program ##########
SanityChecker_FuncFile


########## Show Usage ##########
  Usage
