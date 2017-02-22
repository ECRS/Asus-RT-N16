#!/bin/sh

logger -t "FIREWALL SCRIPT" "Removing infinite loops"

# /bin/cat "$(nvram get script_fire)" > /tmp/script_fire_nvram.0
# /bin/cat /tmp/script_fire.sh > /tmp/script_fire.sh.0
sed -i '/while \[ 1 \]\; do/,/done/d' /tmp/script_fire.sh
# /bin/cat /tmp/script_fire.sh > /tmp/script_fire.sh.1
sed -i '/bidirectional/d' /tmp/script_fire.sh
# /bin/cat /tmp/script_fire.sh > /tmp/script_fire.sh.2
sed '/bin\/sh/d' /tmp/script_fire.sh > /tmp/tmp_script_fire
