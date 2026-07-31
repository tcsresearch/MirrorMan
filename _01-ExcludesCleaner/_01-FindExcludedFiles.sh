#!/bin/env bash
## find | grep -f excludes-filtered2.list | tee ExcludedFiles.list
find . | grep -f excludes-filtered2.list | tee ExcludedFiles.list
