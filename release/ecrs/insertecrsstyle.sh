#!/bin/bash

hiddenmenus=( basic-ddns advanced-ctnf nas-ftp nas-samba nas-media vpn-server vpn-pptp-server vpn-pptp-online vpn-pptp admin-tomatoanon admin-cifs admin-jffs2 )

hiddensections=( "Telnet Daemon" "Ethernet Ports State - Configuration" )

hiddenIDs=( "remote_access" "remote_access_port" "gui_directory" "color_scheme" "ssh_remote_access" "ssh_remote_port" "f_original_limit" )

## Some entire menus can be hidden as they would not be used in any normal circumstance
function hideMenuItems
{
    hiddencss=""

    ## Loop through the hiddemenus array and hide each page that should not be displayed
    for i in "${hiddenmenus[@]}"
    do
        hiddencss="a.indent2[href=\"$i.asp\"] { display: none !important; }"
    	echo -e "${hiddencss}" >> temp.css
    	echo  >> temp.css
    done

    ## Hide the Shutdown button
    hiddencss="a[href=\"javascript:shutdown()\"] { display: none !important; }"
    echo -e "${hiddencss}" >> temp.css
}

## Specific sections of some pages are potentially dangerous or will not be used
function hidePageSections
{
    ## Loop through the hiddensections array
    for i in "${hiddensections[@]}"
    do
        ## Loop through the *.asp files to find the one with the correct section
        for F in ../src/router/www/*.asp;
        do
            ## If the grep returns a result then this is the correct file, so insert the 'hidden' class
            if grep -q "<div class='section-title'>${i}" "$F"; then
                sed -i "s/<div class='section-title'>${i}<\/div>/<div class='section-title hidden'>${i}<\/div>/" ${F}
                sed -i "/<div class='section-title hidden'>${i}<\/div>/{n;d}" ${F}
                sed -i "s/<div class='section-title hidden'>${i}<\/div>/&\n<div class='section hidden'>/" ${F}
            fi
        done
    done
}

## Specific items of some pages are potentially dangerous or will not be used. If they
## have an ID then hide them by adding them to the hiddenIDs var.
function hideElementsByID
{
    hiddencss=""

    ## Loop through the hiddenIDs array and hide each item that should not be displayed
    for i in "${hiddenIDs[@]}"
    do
        hiddencss="#$i { display: none !important; }"
        echo -e "${hiddencss}" >> temp.css
        echo  >> temp.css
    done
}

## There are a few odds and ends that must be hidden manually
function hideElementsManually
{
    ## Remove the !! Attention !! TomatoAnon message from the status-overview.asp page
    sed -i "/anon_enable/,+2d" ../src/router/www/status-overview.asp
}


cp ecrstomato.css temp.css

echo  >> temp.css
echo  >> temp.css
echo "/** ECRS HIDE MENU ITEMS **/" >> temp.css
echo  >> temp.css
hideMenuItems

echo  >> temp.css
echo  >> temp.css
echo "/** ECRS HIDE PAGE SECTIONS **/" >> temp.css
echo  >> temp.css
hidePageSections

echo  >> temp.css
echo  >> temp.css
echo "/** ECRS HIDE ITEMS BY ID **/" >> temp.css
echo  >> temp.css
hideElementsByID

hideElementsManually

java -jar yuicompressor-2.4.8.jar --type css temp.css > temp_min.css

mv -f temp_min.css ../src/router/www/ecrstomato.css
rm -f temp.css
