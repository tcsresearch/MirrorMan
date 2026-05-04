## Define Variables ##

prog="reposync"
args=" -n -m --delete"
excludes="*-debug*,*-rt-*"

# RPMFusion Free #
RepoID_1="rpmfusion-free"
RepoID_2="rpmfusion-free-updates"

# RPMFusion NonFree #
RepoID_3="rpmfusion-nonfree"
RepoID_4="rpmfusion-nonfree-updates"


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


function SyncRepo_1() {
	## cecho yellow " ---------- Updating Repo: $RepoID_1 ---------- "
	echo " ---------- Updating Repo: $RepoID_1 ---------- "
	$prog $args --repoid=$RepoID_1 --exclude='$excludes'
}

function SyncRepo_2() {
	## cecho yellow " ---------- Updating Repo: $RepoID_2 ---------- "
	$prog $args --repoid=$RepoID_2 --exclude='$excludes'
	echo " ---------- Updating Repo: $RepoID_2 ---------- "
}

function SyncRepo_3() {
        ## cecho yellow " ---------- Updating Repo: $RepoID_1 ---------- "
        echo " ---------- Updating Repo: $RepoID_3 ---------- "
        $prog $args --repoid=$RepoID_3 --exclude='$excludes'
}
function SyncRepo_4() {
        ## cecho yellow " ---------- Updating Repo: $RepoID_1 ---------- "
        echo " ---------- Updating Repo: $RepoID_4 ---------- "
        $prog $args --repoid=$RepoID_4 --exclude='$excludes'
}


#########################################################################################

# Main Program #

# RunDebug

 SyncRepo_1
 SyncRepo_2

 SyncRepo_3
 SyncRepo_4

