for repo in `cat repos.list`; do
	echo "Updating repo $repo..."
	cd $repo
	sh Update.sh
	cd -
	echo "Repo $repo Updated."
done

