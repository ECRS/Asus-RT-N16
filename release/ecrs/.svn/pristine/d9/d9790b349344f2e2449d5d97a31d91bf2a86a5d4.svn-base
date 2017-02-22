#!/bin/bash

declare -A CONFIGMAP
declare -A NAME
declare -A VALUE

KEY=""
NEWLINE=""
grep . ecrsconfig.txt | grep -v '^//' | while read line; do
    if [[ "$line" =~ ^[^#]*= ]]; then

	# Create KEY variable to use in SED command to find appropriate line to replace
	KEY=${line%% =*}

	# Build the new line to place into the config file
	NEWLINE=$(printf "\t{ %-29s %-31s },\n" "\"${KEY}\"," "\"${line#*= }\"")

	# SED config file for KEY, and replace the line it appears on with the new line
	sed -i "s|.*${KEY}.*|${NEWLINE}|" ../src-rt/router/nvram/defaults.c
    fi
done
