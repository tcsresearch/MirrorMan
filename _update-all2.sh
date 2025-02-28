### Enable Cecho ###
# TODO: Add Sanity Check.
source ./NewCecho.bfunc
cecho blue "Cecho Enabled."
echo " "

for repo in `cat repos.list`; do
	cecho yellow "##########---------- Updating Repo: $repo... ----------##########"
	echo " "
	cd $repo > /dev/null
	sh Update.sh
	cd - > /dev/null
	echo " "
	cecho blue "Repo $repo Updated."
	echo " "
done

