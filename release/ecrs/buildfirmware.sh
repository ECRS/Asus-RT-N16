#!/bin/bash

## Verify that a version string was passed to the call of this file
## -z checks for "zero length"
<<COMMENT
if [ -z ${1} ]; then
    echo "No ECRS build number provided"
    exit 2
fi

## Verify that the version number provided has length of 4
if [ ${#1} -ne 4 ]; then
    echo "Invalid version number. Must have a length of 4 (i.e. 1000)"
    exit 3
fi

#elif [ $1 -lt 1000 ] -o [ $1 -gt 9999 ] then
if [ ${1} -lt 1000 -o ${1} -gt 9999 ]; then
    echo "Version number is out of range. Must be atleast 1000 and no greater than 9999."
    exit 4
fi
COMMENT

## Perform the ECRS customizations before building the firmware
./insertecrsabout.sh
./removetomatobranding.sh
./insertecrsstyle.sh
./insertecrsjs.sh
./insertecrsconfig.sh
./insertecrsupgrade.sh

## Now build the firmware
MAJOR_VERSION=$(grep -i 'version' VERSION | cut -f2 -d'=' | awk '{$1=$1};1')
BUILD_NUMBER=$(grep -i 'build' VERSION | cut -f2 -d'=' | awk '{$1=$1};1')
BUILD_NUMBER=$((BUILD_NUMBER+1))

cd ../src-rt
make clean
make V1=RT-N16- V2=-132.${MAJOR_VERSION}.${BUILD_NUMBER} r2e

cd ../ecrs
echo "Updating build number to ${BUILD_NUMBER}"
sed -i -e "s|build = .*|build = ${BUILD_NUMBER}|g" VERSION
