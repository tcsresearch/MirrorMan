### Source Config ###
# TODO: Add Sanity Check.
source config/config.ini

### Source Functions ###
# TODO: Add Sanity Check.
for func in `cat $FunctionsDir/functions.list`; do
		source $func
	done



### Main Program ###
DisplayBanner
SourceConfig
EnableCecho
ShowConfig
Pause
DoSync
