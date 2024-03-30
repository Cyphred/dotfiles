# !/bin/sh

# Your VPS' Wireguard IP
VPS=192.168.69.1

# Your Home server's Wireguard IP
HS=192.168.69.2

WG_INTERFACE=wg0
ETH_INTERFACE=eth0

forward_udp() {
	sudo iptables -A FORWARD -i $ETH_INTERFACE -o $WG_INTERFACE -p udp --dport $1 -m conntrack --ctstate NEW -j ACCEPT
	sudo iptables -t nat -A PREROUTING -i $ETH_INTERFACE -p udp --dport $1 -j DNAT --to-destination $HS
	sudo iptables -t nat -A POSTROUTING -o $WG_INTERFACE -p udp --dport $1 -d $HS -j SNAT --to-source $VPS
}

forward_tcp() {
	sudo iptables -A FORWARD -i $ETH_INTERFACE -o $WG_INTERFACE -p tcp --syn --dport $1 -m conntrack --ctstate NEW -j ACCEPT
	sudo iptables -t nat -A PREROUTING -i $ETH_INTERFACE -p tcp --dport $1 -j DNAT --to-destination $HS
	sudo iptables -t nat -A POSTROUTING -o $WG_INTERFACE -p tcp --dport $1 -d $HS -j SNAT --to-source $VPS
}

# Uncomment this if you want to clear your iptables every time this script is run (NOT RECOMMENDED)
#sudo iptables --flush

sudo iptables -P FORWARD DROP

# Add entries below this line

# Satisfactory
forward_udp 15000
forward_udp 15777
forward_udp 7777

# Minecraft
forward_tcp 25565
forward_tcp 25566

# Valheim
forward_tcp 2456
forward_tcp 2457
forward_tcp 2458
forward_udp 2456
forward_udp 2457
forward_udp 2458

# Home server ssh
forward_tcp 25300

# Home dev server
forward_tcp 8080

# Add entries above this line

# Do not modify
sudo iptables -A FORWARD -i $ETH_INTERFACE -o $WG_INTERFACE -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i $WG_INTERFACE -o $ETH_INTERFACE -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

sudo netfilter-persistent save
