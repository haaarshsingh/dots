#!/usr/bin/bash

# Prashant Shrestha
# 2020-06-23

# Getting the data and initializing an array.
BATTERY_INFO=($( acpi | awk -F',' '{ print $0 }'))

# Formatting helpers
CHARGE=$((${BATTERY_INFO[3]//%,}))
ICON=""
FORMAT=""

# Format battery icon, depending on the status.
if [[ "${BATTERY_INFO[2]}" == *"Charging"* ]]; then
    ICON="  " # Plug icon, font awesome.
else
    ICON="  " # Car Battery icon, font awesome
fi

if [[ $CHARGE -lt 10 ]]; then
    # Red-ish
    FORMAT="%{B#B33D43}%{F#fff}  "
elif [[ $CHARGE -lt 30 ]]; then
    # Orange-ish
    FORMAT="%{B#F27F24}%{F#000}  "
elif [[ $CHARGE -lt 60 ]]; then
    # Yellow-ish
    FORMAT="%{B#E5C167}%{F#000}  "
elif [[ $CHARGE -lt 100 ]]; then
    # Green-ish
    FORMAT="%{B#6FB379}%{F#000}  "
fi

# Format charge & color depending on the status.
FORMAT="$FORMAT$ICON $CHARGE %{B- F-}"

# Final formatted output.
echo $FORMAT
