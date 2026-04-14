${NETWORKING}
ip a                                                 # Check the Ethernet setting 
ifcfg-eth0
/etc/resolv.conf                                     # name resolution
/etc/hosts                                           # name servers

Netadmin
su - netadmin
sudo lshw -class network
sudo ethtool
ip route show
ip addr flush eth0

${Network Connections}
netstat -tulpn | grep 80                                                        # check applications listening on port 80)
netstat -tpan | grep 443                                                        # to check if server is listening at port 443)
netstat -n --inet                                                               # check the privileged ports status)
netstat –anr                                                                    # displays the routing table

ss                                                                              # socket statistics and communication connections)
ss -t
ss -a -A udp
ss -ltn

watch

Nload, iftop, iptraf, nethogs, bmon, slurm, tcptrack, Vnstat, cbm, speedometer, Pktstat, Netwatch, Trafshow, Netload, ifstat(Network bandwidth monitor)

$ tcpdump -i eth0 | grep ssh                                                         # Network bandwidth and traffic monitor)

traceroute
traceroute -I <IP>                                                                   # force traceroute with the -I argument to use ICMP packets.
traceroute -w 3 -q 1 -m 16 example.com                                               # -w (wait) -q (query for hop) -m (max hop)
traceroute -n google.com                                                             # To disable IP address mapping in traceroute, use the -n option.
traceroute -i wlp3s0b1 google.com                                                    # To set the network interface that traceroute should use, use the -i option. 

Hop #         RTT 1         RTT 2         RTT 3         Name/IP Address
1.      *       *       *                                     Request timed out.     # If there is no response within 5.0 seconds (default), an "*" (asterisk) is printed for that probe.
2.      1m      12m     13m     192.168.1.100        Unknown                         # if a middlebox (like a firewall) blocks the delivery of the ICMP packet, then the host with the specific TTL/hoplimit will show up as unknown in traceroute.
3.      18 ms   17 ms   20 ms   cr2.kc9mo.ip.att.net [12.122.150.206]

${Ping Multiple IP/Hosts}
ping 
cat IPADDR.txt|xargs ping                                                            # ping multiple IP addresses in a text file)
`
for i in $(cat IPADDR.txt); do ping ${i} done            # ping multiple ip addresses in a text file)
`
awk '{sub(/,/,""); print "Pinging hostname "$1; system("ping -c 1 "$2) }' <IP addresses/Hosts with space> | grep --color -e 'PING' -e '1 packets.'

nmap -sP 7.191.12.140 7.191.12.161 7.191.12.162                                       # ping multiple IP addresses/Host names)
nmap <multiple IP/hosts> | grep --color -e 'Host is up' -e 'rDNS' -e '161' -e 'All'   # to nmap multiple hosts or IPs at once)
