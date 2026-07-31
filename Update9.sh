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

# ConfirmVar_Empty
 ConfirmVarEmpty_File="$FuncFolder/ConfirmVar-Empty.bfunc"

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

########## Sanity Checkers - NEW Via SanityChecker Function ##########

function RunSanityCheckers_Functions() {
#	 SanityChecker $CechoFile
	 SanityChecker $CheckVarFile
	 SanityChecker $FuncFile
}

function RunSanityCheckers_Configs() {
         SanityChecker $Main_ConfigFile
#        SanityChecker $ExcludesConfigFile
}


function RunSanityCheckers_Excludes() {
	SanityChecker $ExcludesFile
	SanityChecker $CommaExcludesFile
	SanityChecker $ConfirmVarEmpty_File
}

########## Main Program ##########

echo " "

# Source SanityChecker Functions Library...
   SanityChecker_SanityCheckerFile

# Run Our SanityCheckers...
   RunSanityCheckers_Functions # New 07-30-2026
   RunSanityCheckers_Configs

# Setup Our Excludes...
   # ClearExcludes
   # PopulateExcludesFromFile
   # RunSanityCheckers_Excludes


########## Show Usage ##########

echo " "
Usage

