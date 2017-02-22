#!/bin/bash
# @author   astclair
# @version  3.31.2016

# Setup global variables
ROUTERDIR=../src/router



####################
# PACKAGE: openssl #
####################
NOCIPHEROPTIONS=(  )
NOCIPHERDOPEN=( )

# ASUS-40 - Ticket #313727
# Remove support for RC4 and MD5 ciphers
NOCIPHEROPTIONS+=( no-rc4 )
NOCIPHEROPTIONS+=( no-md5 )
NOCIPHERDOPEN+=( DOPENSSL_NO_RC4 )
NOCIPHERDOPEN+=( DOPENSSL_NO_MD5 )


removeFromOptions ()
{
    PACKAGE=openssl
    EXISTS=$(grep -rF "OPTIONS=" $ROUTERDIR/$PACKAGE/Makefile | grep -c $1)
    if [ "$EXISTS" -eq "0" ]; then
        echo "Cipher $1 removal rule not found - it will be added"
        sed -i -e "/^OPTIONS=/ s/$/ $1/" $ROUTERDIR/$PACKAGE/Makefile
    else
        echo "Cipher $1 removal rule already exists"
    fi
}

removeFromDependencies ()
{
    PACKAGE=openssl
    EXISTS=$(grep "^DEPFLAG=.*" $ROUTERDIR/$PACKAGE/Makefile | grep -c $1)
    if [ "$EXISTS" -eq "0" ]; then
        echo "Dependency $1 removal rule not found - it will be added"
        sed -i -e "/^DEPFLAG=.*/ s/$/ $1/" $ROUTERDIR/$PACKAGE/Makefile
    else
        echo "Dependency $1 removal rule already exists"
    fi
}

for i in "${NOCIPHEROPTIONS[@]}"
do
    removeFromOptions $i
done

for i in "${NOCIPHERDOPEN[@]}"
do
    removeFromDependencies $i
done
#####################
