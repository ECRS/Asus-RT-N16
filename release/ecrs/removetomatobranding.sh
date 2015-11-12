#!/bin/bash

## Replace the default title and version div's with just the digital logo div
#for F in ../src/router/mipsel-uclibc/install/www/www/*.asp; do
#    grep -v "<div class='title'>.*</div>" $F > $F.tmp
#    mv $F.tmp $F
#    sed -i -e "s|<div class='version'>.*</div>|<div class='digital'>\&nbsp;</div>|g" $F
#done

for F in ../src/router/www/*.asp; do
    grep -v "<div class='title'>.*</div>" $F > $F.tmp
    mv $F.tmp $F
    sed -i -e "s|<div class='version'>.*</div>|<div class='digital'>\&nbsp;</div>|g" $F
done


## Replace any digital logo div that was added without the correct <img> tag
#for F in ../src/router/mipsel-uclibc/install/www/www/*.asp; do
#    sed -i -e "s|<div class='digital'>.*</div>|<div class='digital'><img src='digital_logo.png' /></div>|g" $F
#done

for F in ../src/router/www/*.asp; do
    sed -i -e "s|<div class='digital'>.*</div>|<div class='digital'><img src='digital_logo.png' /></div>|g" $F
done


## Remove the [TomatoUSB] portion of the title on each page.
#for F in ../src/router/mipsel-uclibc/install/www/www/*.asp; do
#    sed -i -e "s|<title>.*\s|<title>|g" $F
#    sed -i -e "s|</title>| - ECRS</title>|g" $F
#done

for F in ../src/router/www/*.asp; do
    ## This only matches and removes the stock [<% ident() %>] text
    sed -i -e "s|<title>.*]\s|<title>|g" $F

    ## Can add postfix text by replacing the " - ECRS" text with whatever is desired for postfix text
    #    sed -i -e "s|</title>| - ECRS</title>|g" $F
done
