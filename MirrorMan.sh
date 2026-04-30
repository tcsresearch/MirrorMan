#!/usr/bin/env bash

### Define Config Dirs & Files ###
ConfigDir="config"
ConfigFile="config.ini"

FunctionsDir="functions"
FunctionsFile="functions.list"

### Sanity Check: Does Config File Exist? ###
if [ ! -f "$ConfigDir/$ConfigFile" ]; then
	echo "ERROR! Config File $ConfigDir/ConfigFile NOT Found...quitting."
	return
else
	echo "Sourcing $ConfigDir/$ConfigFile..."
	source "$ConfigDir/$ConfigFile"
fi

### Sanity Check: Do Functions Files Exist? ###
if [ ! -f "$FunctionsDir/$FunctionsFile" ]; then
	echo "ERROR! List File $FunctionsDir/$FunctionsFile NOT Found...quitting."
	return
else
	for func in "$(cat $FunctionsDir/$FunctionsFile)"; do
		source "$func"
	done
fi


### Main Program ###
DisplayBanner
SourceConfig
EnableCecho
ShowConfig
Pause
DoSync
