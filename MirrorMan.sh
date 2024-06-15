### Enable Cecho ###
# TODO: Add Sanity Check.
source ./NewCecho.bfunc
cecho yellow "Cecho Enabled."


for repo in `cat repos.list`; do
	cecho yellow "Updating repo $repo..."
	cd $repo
	sh Update.sh
	cd -
	cecho yellow "Repo $repo Updated."
done

