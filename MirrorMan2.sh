### TODO: Set config and functions folders in config.ini file.

### Enable Cecho ###
# TODO: Add Sanity Check.
source functions/NewCecho.bfunc
cecho yellow "Cecho Enabled."

# TODO: Add Sanity Check.
for repo in `cat config/repos.list`; do
	cecho yellow "Updating repo $repo..."
	cd $repo
	sh Update.sh
	cd -
	cecho yellow "Repo $repo Updated."
done
