#!/usr/bin/env sh
# Set brightness via light when redshift status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day=95
brightness_transition=50
brightness_night=30

# Adjust this grep to filter only the backlights you want to adjust
backlights=($(light -L | grep -v auto | grep backlight/))
kbd_backlights=($(light -L | grep kbd_backlight))

set_brightness() {
	for backlight in "${backlights[@]}"
	do
		light -s "$backlight" -S $1
	done

    for backlight in "${kbd_backlights[@]}"
    do
        light -s "$backlight" -S $((100 - $1))
    done
}

if [ "$1" = period-changed ]; then
	case $3 in
		night)
			set_brightness $brightness_night 
			;;
		transition)
			set_brightness $brightness_transition
			;;
		daytime)
			set_brightness $brightness_day
			;;
	esac
fi
