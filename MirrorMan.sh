### Source Config ###
source config/config.ini

### Source Functions ###
for func in `cat $FunctionsDir/functions.list`; do
		source $func
	done



### Main Program ###
DisplayBanner
SourceConfig
EnableCecho
ShowConfig
# This will pause until a button is pressed.
read -p "Press enter to continue"
DoSync
