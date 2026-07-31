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

# Program Version
ProgVersion="26.07_r2"

# Define Folders
ConfigFolder="config"
FuncFolder="functions"
ExcludesFolder="excludes"

# CheckVariable
 CheckVarFile="$FuncFolder/CheckVariable.bfunc"

# SanityCheckerFile
 SanityCheckerFile="$FuncFolder/SanityChecker.bfunc"

# FuncFile
 FuncFile="$FuncFolder/UpdateRepo.bfunc"

# Cecho
 CechoFile="$FuncFolder/Cecho.bfunc"

########## Define Config Files ##########
 Main_ConfigFile="$ConfigFolder/Main.conf"
 Excludes_ConfigFile="$ConfigFolder/Excludes.conf"

########## Define Program & Args Variables ##########

prog="reposync"
args=" -n -m --delete"


######### Excludes Configuration ##########
# TODO: Remove the following $excludes variable after further testing
# excludes="*-debug*,*-rt-*"


## ExcludesFile="excludes-filtered2.list"
## CommaExcludesFile="excludes-filtered2-commas.list"

 ExcludesFile="excludes/excludes-filtered2.list"
 CommaExcludesFile="excludes/excludes-filtered2-commas.list"


## FIXME: Need to change code so that contents of files are placed into a variable.
##		Sourcing runs the package names, so 'kernel-debug' listed in the file actually runs the command 'kernel-debug'.
##		Do NOT source excludes files!



########## Sanity Checkers ##########
# TODO: Will be deprecated in Update9.sh
#
function SanityChecker_CechoFile() {
# Check if the file exists and is a regular file
	if [ ! -f "$CechoFile" ]; then
        	cecho red " ERROR! Functions File $CechoFile Not Found.  Quitting..."
        	return 1
	else
        	cecho yellow "Sourcing Functions File: $CechoFile..."
        	source "$CechoFile" # && echo "Sourcing: $CechoFile..."
	fi
}

function SanityChecker_CheckVarFile() {
# Check if the file exists and is a regular file
        if [ ! -f "$CheckVarFile" ]; then
                cecho red " ERROR! CheckVar File $CheckVarFile Not Found.  Quitting..."
                return 1
        else
                cecho yellow "Sourcing CheckVar File: $CheckVarFile..."
                source "$CheckVarFile" # && echo "Sourcing: $CheckVarFile..."
        fi
}


function SanityChecker_SanityCheckerFile() {
# Check if the file exists and is a regular file
        if [ ! -f "$SanityCheckerFile" ]; then
                cecho red " ERROR! SanityChecker File $SanityCheckerFile Not Found.  Quitting..."
                return 1
        else
                cecho yellow "Sourcing SanityChecker File: $SanityCheckerFile..."
                source "$SanityCheckerFile" # && echo "Sourcing: $SanityCheckerFile..."
        fi
}



function SanityChecker_FuncFile() {
# Check if the file exists and is a regular file
        if [ ! -f "$FuncFile" ]; then
                cecho red " ERROR! Functions File $FuncFile Not Found.  Quitting..."
                return 1
        else
                cecho yellow "Sourcing Functions File: $FuncFile..."
                source "$FuncFile" # && echo "Sourcing: $FuncFile..."
        fi
}


function SanityChecker_ExcludesFile() {
# Check if the file exists and is a regular file
	if [ ! -f "$ExcludesFile" ]; then
        	cecho red " ERROR! Excludes File $ExcludesFile Not Found.  Quitting..."
        	return 1
	else
        	cecho yellow "Sourcing Excludes File: $ExcludesFile..."
        	source "$ExcludesFile" # && echo "Sourcing: $ExcludesFile..."
	fi
}

function SanityChecker_CommaExcludesFile() {
# Check if the file exists and is a regular file
	if [ ! -f "$CommaExcludesFile" ]; then
        	cecho red " ERROR! Comma Excludes File $CommaExcludesFile Not Found.  Quitting..."
        	return 1
	else
        	cecho yellow "Sourcing Comma Excludes File: $CommaExcludesFile..."
        	source "$CommaExcludesFile" # && echo "Sourcing: $CommaExcludesFile..."
	fi
}

########## Sanity Checkers - NEW Via SanityChecker Function ##########

function RunSanityCheckers_Main() {
	# SanityChecker $CechoFile
	SanityChecker $CheckVarFile
	SanityChecker $FuncFile
}

function RunSanityCheckers_Excludes() {
	SanityChecker $ExcludesFile
	SanityChecker $CommaExcludesFile
}

########## Main Program ##########

echo " "

# Source SanityChecker Functions Library...
SanityChecker_SanityCheckerFile

# Run Our SanityCheckers...
RunSanityCheckers_Main # New 07-30-2026
# RunSanityCheckers_Excludes


########## Show Usage ##########

echo " "
Usage
