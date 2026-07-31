#!/bin/env bash
## Define Variables ##

prog="reposync"
args=" -n -m --delete"
excludes="*debug*,*-langpack-*,*-source-*,*-src-*,*-headless-*,*-langpack-*,libreoffice-help-*"

RepoID="updates"

# $prog $args --repoid=updates --exclude=*debug*,*-langpack-*,*-source-*,*-src-*,*-headless-*,*-langpack-*,libreoffice-help-*,
$prog $args --repoid=$RepoID --exclude='$excludes'
