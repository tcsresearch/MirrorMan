#!/usr/bin/env bash
# shellcheck disable=SC2034  # Unused variables left for readability

## Define Variables ##

prog="reposync"
args=" -n -m --delete"
excludes="*-kmodsrc-*"

# reposync -n -m --delete --repoid=kernel-vanilla:fedora
# reposync -n -m --delete --repoid=kernel-vanilla:stable

"$prog" "$args" --repoid=rpmfusion-free
"$prog" "$args" --repoid=rpmfusion-free-updates

"$prog" "$args" --repoid=rpmfusion-nonfree
"$prog" "$args" --repoid=rpmfusion-nonfree-updates
