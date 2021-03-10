#!/usr/bin/env sh

set -e

echo ""
echo "SETTING UP SERVER FOR SHARING NET..."
echo ""

if [ "$1" = "" ] || [ "$2" = "" ]
then
	echo "Wrong Usage. Use Ex:"
	echo ""
	echo "    $ ./share_net_via_ethernet-server.sh <interface0> <interface1>"
	echo ""
	echo "Where 'interface0' is the interface through which Host/server \
gets internet access."
	echo "And 'interface1' is the interface through which internet is \
shared with target/client."

	exit 0
fi

#==============================================================================

INTERNET=$1
SHARE_NET=$2

#==============================================================================

set -x

sudo ip link set "$SHARE_NET" up
sudo ip addr add 192.168.123.100/24 dev "$SHARE_NET"

set +x

printf '%s' "Run 'sudo iptables -F' ? (y/n). Note this will reset iptable: "
while :
do
	read -r CHOICE
	if [ "$CHOICE" = "y" ] || [ "$CHOICE" = "Y" ]
	then
		sudo iptables -F
		break

	elif [ "$CHOICE" = "n" ] || [ "$CHOICE" = "N" ]
	then
	break

	else
		printf '%s' "Enter [y/n]: "
		continue
	fi

done

echo ""

set -x

sudo sysctl net.ipv4.ip_forward=1
sudo sysctl net.ipv6.conf.default.forwarding=1
sudo sysctl net.ipv6.conf.all.forwarding=1

sudo iptables -t nat -A POSTROUTING -o "$INTERNET" -j MASQUERADE
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i "$SHARE_NET" -o "$INTERNET" -j ACCEPT

set +x
echo "SUCCESSFULL !!"
#==============================================================================
# END