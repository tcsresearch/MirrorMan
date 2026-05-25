#!/usr/bin/env bash

### Enable Cecho ###
# TODO: Add Sanity Check.
source "./Cecho.bfunc"
cecho blue "Cecho Enabled."
echo " "

for repo in $(cat repos.list); do
	cecho yellow "##########---------- Updating Repo: $repo... ----------##########"
	echo " "
	cd "$repo" > /dev/null || return 1
	sh Update.sh
	cd ... > /dev/null || return 1
	echo " "
	cecho blue "Repo $repo Updated."
	echo " "
done

