#!/usr/bin/env bash
#####################################################################################
# Define Reposync Variables #							    
#############################

prog="reposync"
args=" -n -m --delete"
excludes="*-debug*,*-rt-*"

#####################################################################################
# Define RPMFusion Repos #
##########################

# RPMFusion Free #
RepoID_1="rpmfusion-free"
RepoID_2="rpmfusion-free-updates"

# RPMFusion Nonfree #
RepoID_3="rpmfusion-nonfree"
RepoID_4="rpmfusion-nonfree-updates"

# RPMFusion Nonfree - Steam #
RepoID_5="rpmfusion-nonfree-steam"

# RPMFusion Nonfree - nVidia Driver #
RepoID_6="rpmfusion-nonfree-nvidia-driver"

#####################################################################################
# Define Cecho Library File #
#############################

Cecho_File="./Cecho.bfunc"

######################################################################################
# Enable Cecho #
################

function Enable_Cecho() {
	if [ ! -f "$Cecho_File" ]; then
		echo "ERROR: Cecho Library NOT Found.  Quitting..."
		return
	else
		echo "Sourcing Cecho Library..."
		source "$Cecho_File"
		echo "Cecho Loaded Successfully."
		echo " "
	fi
}

######################################################################################
# NewLine #
function NewLine() {
	echo " "
}

######################################################################################
# Seperator #
function Seperator() {
	cecho yellow " ---------------------------------------------------------------------- "
}

######################################################################################
# NewLineCinema #
function NewLineCinema() {
	NewLine
	Seperator
	NewLine
}

######################################################################################

# reposync -n -m --delete --repoid=kernel-vanilla:fedora
# reposync -n -m --delete --repoid=kernel-vanilla:stable

# $prog $args --repoid=kernel-vanilla:fedora --exclude=*-debug*,*-rt-* 
# $prog $args --repoid=kernel-vanilla:stable --exclude=*-debug*,*-rt-*

##### Debug #####
function RunDebug() {
	echo "Run Command: $prog $args --repoid=$RepoID_1 --exclude='$excludes' "
	echo " "
	echo "Run Command: $prog $args --repoid=$RepoID_2 --exclude='$excludes' " 
}

### Pause ###
# Pause


######################################################################################
# DoSync #
##########

# TODO: Create superceding function SyncRepo() that allows a $1 to the function.
#		It will use the $1 in cecho command and $prog $args command also.
#		Need to use -z test to prevent blank $1 or -eq 0
		
function SyncRepo_1() {
	cecho yellow " ---------- Updating Repo: $RepoID_1 ---------- "
	# echo " ---------- Updating Repo: $RepoID_1 ---------- "
	echo " "
	"$prog" "$args" --repoid=$RepoID_1 --exclude='$excludes'
}

function SyncRepo_2() {
	cecho yellow " ---------- Updating Repo: $RepoID_2 ---------- "
	# echo " ---------- Updating Repo: $RepoID_2 ---------- "
	echo " "
	"$prog" "$args" --repoid=$RepoID_2 --exclude='$excludes'
}

function SyncRepo_3() {
        cecho yellow " ---------- Updating Repo: $RepoID_3 ---------- "
        # echo " ---------- Updating Repo: $RepoID_3 ---------- "
        echo " "
        "$prog" "$args" --repoid=$RepoID_3 --exclude='$excludes'
}

function SyncRepo_4() {
        cecho yellow " ---------- Updating Repo: $RepoID_4 ---------- "
        # echo " ---------- Updating Repo: $RepoID_4 ---------- "
        echo " "
        "$prog" "$args" --repoid=$RepoID_4 --exclude='$excludes'
}

function SyncRepo_5() {
        cecho yellow " ---------- Updating Repo: $RepoID_5 ---------- "
        # echo " ---------- Updating Repo: $RepoID_5 ---------- "
        echo " "
        "$prog" "$args" --repoid=$RepoID_5 --exclude='$excludes'
}

function SyncRepo_6() {
        cecho yellow " ---------- Updating Repo: $RepoID_6 ---------- "
        # echo " ---------- Updating Repo: $RepoID_6 ---------- "
        echo " "
        "$prog" "$args" --repoid=$RepoID_6 --exclude='$excludes'
}



#########################################################################################
# Main Program #									#
#########################################################################################

  Enable_Cecho

# RunDebug

  SyncRepo_1
  NewLineCinema
  
  SyncRepo_2
  NewLineCinema
  
  SyncRepo_3
  NewLineCinema
  
  SyncRepo_4
  NewLineCinema

  SyncRepo_5
  NewLineCinema

  SyncRepo_6
  NewLineCinema

