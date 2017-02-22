#!/bin/sh

# @author       jdyer, astclair
# @version      12.29.2016
#
# Adaptation of legacy firewall script from RT-N16
# Recreated to work on an event-based system rather than checking
# every five minutes.
#
# Reference: https://kb.ecrsoft.com/index.php/ASUS_RT-N16_-_Bi-directional_Communication#Firewall_Script
# Reference: http://askubuntu.com/questions/28733/how-do-i-run-a-script-after-openvpn-has-connected-successfully/28755#28755

# The infamous bi-directional communication firewall script
logger -t CUSTOMFIREWALL "OpenVPN client connection status changed"

MYIP=`ip a s br0 | grep 'inet ' | cut -d '/' -f 1 | sed 's/^.*inet //'`
HASRULE=`iptables -L FORWARD -n --line-numbers --verbose | grep -e '.*br0.*tun0' | wc -l`

if [ $script_type == 'up' ]
then
    logger -t CUSTOMFIREWALL "Initializing custom firewall script to allow bidirectional traffic between LAN and VPN"
    if [ $HASRULE -lt 1 ]
    then
        logger -t CUSTOMFIREWALL "VPN is connected but netfilter rules are missing - adding rules"
        iptables -I FORWARD -i br0 -o tun0 -j ACCEPT
        iptables -I FORWARD -i tun0 -o br0 -j ACCEPT
        iptables -t filter -I INPUT 1 -i tun0 --destination "$MYIP" -j ACCEPT
    else
        logger -t CUSTOMFIREWALL "VPN to LAN netfilter rules detected"
    fi
else
    if [ $HASRULE -eq 1 ]
    then
        logger -t CUSTOMFIREWALL "VPN to LAN netfilter detected but VPN is disconnected - removing rules"
 
        LINENUM=`iptables -t filter -L -n --line-numbers --verbose | grep "tun0.*${MYIP}.*" | cut -d ' ' -f 1`
        iptables -t filter -D INPUT $LINENUM
 
        LINENUM=`iptables -L FORWARD -n --line-numbers --verbose | grep "tun0.*br0" | cut -d ' ' -f 1`
        iptables -D FORWARD $LINENUM
 
        LINENUM=`iptables -L FORWARD -n --line-numbers --verbose | grep "br0.*tun0" | cut -d ' ' -f 1`
        iptables -D FORWARD $LINENUM
    fi
fi
