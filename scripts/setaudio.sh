#
#'''
#Script - This will set wireplumber to predefined device after autocomplete
#
# Dependencies: notify-osd, wireplumber
# Testet on Fedora 37
#
# Date:      25 October 2017
# Author:    Thor Miller Grotle
# Homepage:  https://www.itso.dk
#
#
#To run as local user put file in ~/bin
#
#To detect audio devices run:
#wpctl status | grep Sinks -A4
#'''
echo ""
echo "setaudio for wireplumber by itso.dk"
echo "----"
# Favorite Audiodevices
favOutput="Razer"
favOutput2="Starship"
#favInput="usb-PreSonus"

# Listing output device
echo "Listing output devices"
wpctl status | grep Sinks -A4 | grep "vol:" | sed -r 's/^.{7}//'

#echo "Listing current output"
#wpctl status | grep Sinks -A4 | grep "*" | sed -r 's/^.{7}//'
echo "----"

# Setting ID for audiosinks
currentid=$(wpctl status | grep Sinks -A4 | grep "*" | sed -r 's/^.{7}//' | cut -d "." -f1)
currentname=$(wpctl status | grep Sinks -A4 | grep "*" | sed -r 's/^.{7}//' | cut -d "." -f2 | cut -d "[" -f1)
favOutputid=$(wpctl status | grep Sinks -A4 | grep $favOutput | sed -r 's/^.{7}//' | cut -d "." -f1)
favOutputname=$(wpctl status | grep Sinks -A4 | grep $favOutput | sed -r 's/^.{7}//' | cut -d "." -f2 | cut -d "[" -f1)
favOutput2id=$(wpctl status | grep Sinks -A4 | grep $favOutput2 | sed -r 's/^.{7}//' | cut -d "." -f1)
favOutput2name=$(wpctl status | grep Sinks -A4 | grep $favOutput2 | sed -r 's/^.{7}//' | cut -d "." -f2 | cut -d "[" -f1)

TOGGLE () {
# Setting ID when to toggle too
if [[ $currentid == $favOutputid ]]; then
	setoutputid=$favOutput2id
	setoutputname=$favOutput2name
	SETAUDIO
elif [[ $currentid == $favOutput2id ]]; then
	setoutputid=$favOutputid
	setoutputname=$favOutputname
	SETAUDIO
else
	setoutput=$favOutputid
	setoutputname=$favOutputname
	SETAUDIO
fi
}

SETAUDIO ( ) {
# Setting audiointerface
	echo "Setting default audio out to: $setoutputname"
	wpctl set-default $setoutputid
NOTFY
}

NOTFY () {
# Create system notify
  if [ -f /usr/bin/notify-send ]; then
    /usr/bin/notify-send "Audio out:  $setoutputname"
  elif [ -f /usr/bin/zenity ]; then
   /usr/bin/zenity --notification --text "Audio out: $setoutputname"

fi
}


TOGGLE
