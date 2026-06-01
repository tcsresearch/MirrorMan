#!/usr/bin/env bash
# shellcheck disable=SC2034  # Unused variables left for readability

## Define Variables ##
# TODO: Use $1 for cmdline
#

# Check if any args specified; exit if not.
if [ $# -eq 0 ]; then
  echo "Error: No arguments provided."
  echo "Usage: $0 <argument1> [argument2]..."
  exit 1
fi

# Check Miscellaneous Args, such as verbose
while getopts "tndm:" flag; do
  case "${flag}" in
    t) test=true ;;
    n) name=${OPTARG} ;;
    d) delete=true ;;
    m) metadata=true ;;
    *) echo "Invalid option: -${OPTARG}" >&2; exit 1 ;;
  esac
done

## Check Parameters ##

if [ "$test" = true ]; then
  echo "Test mode enabled.  Only the URLs will display.  No downloads will take place."
  UrlsOnly=" -u"
  cmdlines=" -u -n -m --delete --download-metadata" # Will be obsoleted when UrlsOnly is imnplemented.
fi

if [ -n "$name" ]; then
  echo "Hello, $name."
fi


# FIXME: We will need to if/else these two.

if [ "delete" = true ]; then
        Deletion_Enabled=" -d"
        echo "Deletion Enabled.  Obsolete packages will be removed."
        fi

if [ "metadata" = true ]; then
        MetaData_Enabled=" -m"
        echo "Metadata Downloads Enabled.  Metadata will be saved."
fi


## Define Variables ##

EchoCmd="echo" # Will be changed to cecho if installed.
prog="reposync"
# UrlsOnly will need to be tested.
cmdlines=" -n -m --delete --download-metadata"
cmdlines2=" $UrlsOnly $Deletion_Enabled $MetaData_Enabled" # TEST THIS!

# FIXME: $1 will not work for Fedora, as repo is called 'updates'.
Repo_ID="$1" # Change this for different repos


##### BEGIN Functions #####

## Confirm Cecho is enabled. ##
function IsCechoEnabled() {
        if ! [ -x "$(command -v cecho)" ]; then
          echo 'Error: cecho is not installed.' >&2
        return 1
        fi
}

function EnableCecho() {
        if [ -x "$(command -v cecho)" ]; then
                echo "Cecho Enabled."
                echo " "
                echo="cecho"
                EchoCmd="cecho"
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


## List Repos
function ListRepos() {
        dnf5 repo list --enabled | awk 'NR>1 {print $1}'
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
#       IsCechoEnabled
#       EnableCecho
#        StatusLine ()
        DisplayBanner
        DisplayConfig
 # There should be a pause here from BLING's Pause.bfunc
 # Pause Press Any Key To Continue or CTRL + C To Cancel.
        DoRepoSync
