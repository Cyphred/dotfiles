# !/bin/sh

# Your VPS' Wireguard IP
VPS=

# Your Home server's Wireguard IP
HL_MINECRAFT=

WG_INTERFACE=
ETH_INTERFACE=

forward_udp() {
	# Usage: forward_udp <IP Address> <Port>
	sudo iptables -A FORWARD -i $ETH_INTERFACE -o $WG_INTERFACE -p udp --dport $2 -m conntrack --ctstate NEW -j ACCEPT
	sudo iptables -t nat -A PREROUTING -i $ETH_INTERFACE -p udp --dport $2 -j DNAT --to-destination $1
	sudo iptables -t nat -A POSTROUTING -o $WG_INTERFACE -p udp --dport $2 -d $1 -j SNAT --to-source $VPS
}

forward_tcp() {
	# Usage: forward_tcp <IP Address> <Port>
	sudo iptables -A FORWARD -i $ETH_INTERFACE -o $WG_INTERFACE -p tcp --syn --dport $2 -m conntrack --ctstate NEW -j ACCEPT
	sudo iptables -t nat -A PREROUTING -i $ETH_INTERFACE -p tcp --dport $2 -j DNAT --to-destination $1
	sudo iptables -t nat -A POSTROUTING -o $WG_INTERFACE -p tcp --dport $2 -d $1 -j SNAT --to-source $VPS
}

# Uncomment this if you want to clear your iptables every time this script is run (NOT RECOMMENDED)
#sudo iptables --flush

sudo iptables -P FORWARD DROP

# Add entries below this line

# Minecraft
forward_tcp $HL_MINECRAFT 25565

# Add entries above this line

# Do not modify
sudo iptables -A FORWARD -i $ETH_INTERFACE -o $WG_INTERFACE -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i $WG_INTERFACE -o $ETH_INTERFACE -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

sudo netfilter-persistent save
