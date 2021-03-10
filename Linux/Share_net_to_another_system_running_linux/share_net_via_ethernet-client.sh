#!/usr/bin/env sh

set -e

echo ""
echo "SETTING UP CLIENT FOR RECIEVING SHARED NET..."
echo ""

if [ "$1" = "" ]
then
	echo "Wrong Usage. Use Ex:"
	echo ""
	echo "    $ ./share_net_via_ethernet-client.sh <interface2>"
	echo ""
	echo "Where 'interface2' is the interface through which you will get \
the shared internet from the host."

	exit 0
fi

#==============================================================================

INTERNET=$1

#==============================================================================

set -x

sudo ip link set "$INTERNET" up
sudo ip address add 192.168.123.98/24 broadcast + dev "$INTERNET"
sudo ip route add default via 192.168.123.100 dev "$INTERNET"

set +x
echo "SUCCESSFULL !!"
#==============================================================================
# END