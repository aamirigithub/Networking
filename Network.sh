${NETWORKING}
ip a                                                 # Check the Ethernet setting 
ifcfg-eth0
/etc/resolv.conf                        # name resolution
/etc/hosts 

Netadmin
su - netadmin
sudo lshw -class network
sudo ethtool
ip route show
ip addr flush eth0
