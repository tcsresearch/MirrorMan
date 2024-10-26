### Source config.ini ###
function SourceConfig() {
# TODO: Add Sanity Check.
	echo "Sourcing config/config.ini..."
	source config/config.ini
	echo "Successfully sourced config.ini"
}

### Enable Cecho ###
function EnableCecho() {
# TODO: Add Sanity Check.
	source $FunctionsDir/NewCecho.bfunc
	cecho yellow "Cecho Enabled."
}

# TODO: Add Sanity Check.
function DoSync() {
	for repo in `cat $ConfigDir/repos.list`; do
		cecho yellow "Updating repo $repo..."
		cd $repo
		sh Update.sh
		cd -
		cecho yellow "Repo $repo Updated."
	done
}
