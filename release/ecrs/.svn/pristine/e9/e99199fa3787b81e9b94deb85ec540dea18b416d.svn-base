#!/bin/bash

DATE=`date +%c`

sed -i -e "s|\"buildtime\">.*<\/pre>|\"buildtime\">Built on ${DATE}<\/pre>|g" ecrsabout.asp
cp ecrsabout.asp ../src/router/www/about.asp
