#!/bin/bash

INCREMENT=0

while [[ $# > 0 ]]
do
key="$1"

case $key in
    -i|--increment)
    INCREMENT=1
    ;;
    *)
        # Unknown option
    ;;
esac
shift # pass argument or value
done

## Perform the ECRS customizations before building the firmware
echo "Inserting updated About page"
./insertecrsabout.sh
echo "Removing stock tomato branding"
./removetomatobranding.sh
echo "Adding ECRS custom style"
./insertecrsstyle.sh
echo "Placing custom Javascript for file reading and string stripping"
./insertecrsjs.sh
echo "Replacing stock config with ECRS config"
./insertecrsconfig.sh
echo "Adding forced ECRS defautls on upgrade"
./insertecrsupgrade.sh

## Now build the firmware
MAJOR_VERSION=$(grep -i 'version' VERSION | cut -f2 -d'=' | awk '{$1=$1};1')
BUILD_NUMBER=$(grep -i 'build' VERSION | cut -f2 -d'=' | awk '{$1=$1};1')

if [ "$INCREMENT" -eq "1" ]
then
    BUILD_NUMBER=$((BUILD_NUMBER+1))
fi

cd ../src-rt
make clean
make V1=RT-N16- V2=-132.${MAJOR_VERSION}.${BUILD_NUMBER} r2e

cd ../ecrs

if [ "$INCREMENT" -eq "1" ]
then
    echo "Updating build number to ${BUILD_NUMBER}"
    sed -i -e "s|build = .*|build = ${BUILD_NUMBER}|g" VERSION
fi

echo "Built ASUS RT-N16 - ECRS Build ${MAJOR_VERSION}.${BUILD_NUMBER}"
