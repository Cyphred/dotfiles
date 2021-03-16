# !/bin/sh

printf "Device name: "
read name
[ -z "$name" ] && exit 1

printf "Desired IP: "
read ip
[ -z "$ip" ] && exit 1

printf "Net mask (default 255.255.255.0): "
read nm
[ -z "$nm" ] && nm="255.255.255.0"

printf "Default gateway (default 192.168.1.1): "
read dg
[ -z "$dg" ] && dg="192.168.1.1"

printf "DNS server (default 1.1.1.1): "
read dns
[ -z "$dns" ] && dns="1.1.1.1"

ifconfig $name $ip netmask $nm
route add default gw $dg
echo "nameserver $dns" > /etc/resolv.conf

echo "Done."
