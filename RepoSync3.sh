#!/usr/bin/env bash
# shellcheck disable=SC2034  # Unused variables left for readability

## Define Variables ##
# TODO: Use $1 for cmdline
#
prog="reposync"
# Using -u to do a dry run without any changes.
cmdlines=" -u -n -m --delete --download-metadata"
Repo_ID="$1" # Change this for different repos

## Confirm Cecho is enabled. ##
function IsCechoEnabled() {
	if ! [ -x "$(command -v cecho)" ]; then
	  echo 'Error: cecho is not installed.' >&2
  	exit 1
	fi
}

function EnableCecho() {
	if [ -x "$(command -v cecho)" ]; then
		echo "Cecho Enabled."
		echo " "
	fi
}

## Define Banner Function ##
# TODO: Enable Cecho.
function DisplayBanner {
	echo "RepoSync Updater v0.1"
	echo "(c) TCS Research.  All Rights Reserved."
	echo " "
}


## Define DisplayConfig Function ##
function DisplayConfig {
	echo "Program:  $prog"
	echo "CmdLines: $cmdlines"
	echo "Repo ID:  $Repo_ID"
	echo " "
}

## Define StatusLineString Function ###
StatusLineString='Status: '
function StatusLine {
	numlines="$(tput lines)"
	numcols="$(tput cols)"
	# DEPRICATED: numcols="$(expr $numcols - 1)"
	numcols=$((numcols - 1)) # Modern Implementation (replaces 'expr')
	separator_line="$(for i in $(seq 0 $numcols);do printf "%s" "-";done;printf "\n")"
	tput cup "$numlines"
	echo "$separator_line"
	echo "Status Line String: None"
	# echo "$StatusLineString"
}


## Define DoRepoSync Function ##
# TODO: Insert $StatusLineString here w/ function call 
function DoRepoSync() {
	# We need to change folders into and out of the repo
	echo "Entering Folder: $Repo_ID..."
	cd "$Repo_ID" && pwd || return 1
	# Begin reposync
	 "$prog" "$cmdlines" --repoid="$Repo_ID"
	# $prog $cmdlines --repoid=rpmfusion-free-updates
	# reposync -n -m --delete --download-metadata --repoid=rpmfusion-free
	#
	# Revert to previous folder after sync
	echo "Exiting Folder: $Repo_ID..."
	cd ... || return
}


## Call Functions ##
#	IsCechoEnabled
#	EnableCecho
#	 StatusLine ()
	DisplayBanner
	DisplayConfig
 # There should be a pause here from BLING's Pause.bfunc
 # Pause Press Any Key To Continue or CTRL + C To Cancel.
 	DoRepoSync

