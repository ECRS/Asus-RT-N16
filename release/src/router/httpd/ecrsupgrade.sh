
#!/bin/bash

rm /www/originalnvramsettings.txt
nvram get lan_state >> /www/originalnvramsettings.txt
nvram get lan_desc >> /www/originalnvramsettings.txt
nvram get lan_invert >> /www/originalnvramsettings.txt
nvram get dnsmasq_customer >> /www/originalnvramsettings.txt
nvram get vpn_client_eas >> /www/originalnvramsettings.txt

nvram set lan_state=1
nvram set lan_desc=1
nvram set lan_invert=1
nvram set dnsmasq_custom=rebind-domain-ok=/catapultweboffice.com/
nvram set vpn_client_eas=1
nvram set vpn_client_poll=5
nvram set http_enable=0
nvram set https_enable=1
nvram set remote_management=0
nvram set remote_mgt_https=0
nvram set sshd_remote=0
nvram set web_dir=default
nvram set web_css=ecrstomato
nvram set web_mx=status,basic,vpn,admin
nvram set tomatoanon_answer=1
nvram set tomatoanon_enable=0
nvram set tomatoanon_notify=0

rm /www/newnvramsettings.txt
nvram get lan_state >> /www/newnvramsettings.txt
nvram get lan_desc >> /www/newnvramsettings.txt
nvram get lan_invert >> /www/newnvramsettings.txt
nvram get dnsmasq_customer >> /www/newnvramsettings.txt
nvram get vpn_client_eas >> /www/newnvramsettings.txt
