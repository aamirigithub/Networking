`Network and ports`
nmap -p 80 192.168.1.1                                   # Scan port 80
nmap -p T:80 192.168.1.1                                 # Scan TCP port 80
nmap -p U:53 192.168.1.1                                 # Scan UDP port 53
nmap -sU -p <port> <IP address / host>                                  # Scan UDP port
nmap -sT -p <port> <IP address / host>
nmap -sP -PI 192.168.1.0/20                                                        # ICMP Network Scanning, (-sP: only host discovery, -PI: ICMP echo request) 
nmap 192.168.1.1-20                                                                        # discover range from 1 to 20
nmap 192.168.1.*                                                                        # discover IPs from 1 to 255
nmap 192.168.1.0/24                                                                        # discover all subnets and ranges under it
nmap 192.168.1.*                                                                        # Scan all 256 IP addresses)
nmap 192.168.1.0/24                                                                          # Scan IP addresses in subnet 24 range)
nmap -A <IP address> or -v -A <IP>                                         # In-depth details of the host by turning on OS and version detection scanning)
nmap -sA <IP address>                                                                 # Find out if a firewall protects a host/network)
nmap -PN <IP address>                                                                  # Scan a host when protected by the firewall, show all available ports)
nmap --reason <IP>                                                                         # Display the reason a port is in a particular state)
nmap --open <IP>                                                                         # Only show open (or possibly open) ports
nmap --packet-trace <IP>                                                         # Show all packets sent and received
nmap --iflist <IP>                                                                         # Show host interfaces and routes
nmap -v -O --osscan-guess <IP>                                                 # How do I detect remote operating system?
nmap -sV <IP>                                                                                 # How to detect remote services version numbers
nmap -PA <IP>        or -PS or -PO or -PU                                 # firewall is blocking standard ICMP pings, host using TCP ACK (PA) & TCP Syn (PS) ping)
nmap -sU <IP>                                                                                 # Scan a host for UDP services (UDP scan)
nmap -sU -p <port> <IP or hostname>                                         # Scan a host for UDP services (UDP scan)
nmap -sO <IP>                                                                                 # Determine which IP protocols (TCP, ICMP, IGMP, etc.) are supported by the target
nmap -sN <IP> or -sF or -sX                                                         # Scan a firewall for a security weakness
nmap -sn -PS <target>                                                                # Discovering hosts with TCP SYN ping scans
nmap -sn -PA <target>                                                                # Discovering hosts with TCP ACK ping scans
nmap -sn -PU <target>                                                                # Discovering hosts with UDP ping scans
nmap -sn -PE <target>                                                                # Discovering hosts with ICMP ping scans
nmap -sn -PY <target>                                                                # Discovering hosts with SCTP INIT ping scans
nmap -sn -PO <target>                                                                # Discovering hosts with IP protocol ping scans
nmap -sn -PR <target>                                                                # Discovering hosts with ARP ping scans
nmap -sn --send-ip -PS21,22,23,25,80,445,443,3389,8080 -PA80,443,8080 -PO1,2,4,6 -PU631,161,137,123 <target> # Performing advanced ping scans
nmap --script broadcast-ping --packet-trace                        # Discovering hosts with broadcast ping scans
nmap -6 <target>                                                                        # Scanning IPv6 addresses
nmap --script broadcast -e <interface>                                # Gathering network information with broadcast scripts
nmap -sV -Pn -n --proxies <comma separated list of proxies> <target>        # Scanning through proxies
nmap -p80 --script ipidseq <your ip>/24                                # Spoofing the origin IP of a scan
nmap -p80 --script ipidseq -iR 1000                                        # Spoofing the origin IP of a scan
nmap --script dns-brute <target>                                        # Discovering hostnames by brute forcing DNS records
nmap -T4 -n -Pn -p- <target>                                                # scan all possible open ports on host 
nmap -p- <target>                                                                        # scan all possible open ports on host
nmap -T4 -d <target>                                                                # timing template can be 1 to 5
nmap -T4 --scan-delay 1s --initial-rtt-timeout 150ms --host-timeout 15m -d scanme.nmap.org        # adjust time
nmap --min-hostgroup 100 --max-hostgroup 500 --max-retries 2 <target>        # adjust performance
nmap -sI zombie_host target_host                                        # hide original source of command 

nmap -sP -PI 192.168.1.0/20                                                        # ICMP and host discovery 
nmap -p 22,80,443 <IP address>                                                 # Linux OS
nmap -p 4,80,135,139,443,445,7001 <IP Address>                 # Windows OS"
nmap -p 22,135,139,445 <IP-address>                                 # WIndows/Linux OS"
nmap -p 902 <IP address>                                                         # vCenter"
nmap -p 389,636 <IP address>                                                 # LDAP or DC"
nmap -p 123 <IP address>                                                         # NTP server"
nmap -p 25 <IP address>                                                         # SMTP server"
nmap -p 25032 <IP Address>                                                         # Consolidation server"
nmap -p 1433 <IP address>                                                         # MSSQL'
nmap -p 1521 <IP address>                                                         # Oracle SQL"
nmap -p 3306 <IP address>                                                         # mySQL"
nmap -p 4100 <IP address>                                                         # sybase SQL"
nmap -p 5988,5989 <IP address>                                                 # WBEM http(s)"
`
*** Legend ***
-p                 Port selection
        -p 22
        -p ssh
        -p 22,135,80
        -p80-1200,8000-8005,900-1000
        -p-100,1000-        You can omit the beginning of a range to imply port one, or the end to imply the last port possible (65535 for TCP and UDP, 
                255 for protocol scan). This example scans ports one through 100, and all ports greater than or equal to 60,000.
        -p-   Omit beginning and end numbers to scan the whole range (excluding zero).
        -pT:21,23,110, U:53,111,137,161.  Separate lists of TCP and UDP ports can be given by preceding the lists with T: (for TCP) or U:. This 
                example scans three TCP ports (FTP, Telnet, and POP3), and four UDP services (DNS, rpcbind, NetBIOS, and SNMP). Specifying both TCP and UDP ports only matters if you also tell Nmap to do a UDP scan (-sU) and one of the TCP scan methods, such as -sS, -sA, or -sF.
        -p http*                   Wildcards may be used to match ports with similar names. This expression matches eight port numbers, including HTTP (80), 
                http-mgmt (280), https (443), and http-proxy (8080). 
        -p 1-1023,[1024-]                Enclosing a range in brackets causes those port numbers to be scanned only if they are registered in nmap-services. 
                In this example, all the reserved ports (1–1,023), plus all the higher ports registered in nmap-services. 
        
-sn         option tells Nmap to skip the port scan phase but perform host discovery
-PU         Ping UDP, Nmap uses UDP ping scanning
-PE         Packet Echo, used for ICMP tracing
-PY         SCTP INIT ping scans
-PR         ARP ping scan
-PA     host using TCP ACK (PA)
-PS     TCP Syn (PS) ping
-Pn         ping n times
-PN         doesn't ping the target, especially the target blocked off by the firewall 
-T4                aggressive timing template
-d                 debug mode
-A                TCP ACK scan, ACK scan is commonly used to map out firewall rulesets. In particular, it helps understand whether firewall rules are                 
        stateful or not. The downside is that it cannot distinguish open from closed ports.
-sT         TCP connection scan
-sS         TCP SYNC (Stealth) Scan
-sU         UDP scan
-sW                TCP Window scan, Window scan is like ACK scan, except that it can detect open versus closed ports against certain machines.
-sF         FIN scan - A FIN scan sends the packet only set with a FIN flag, so it is not required to complete the TCP handshaking.
-sP         PING scan
-sN                NULL scan
-sO                IP Protocol scan, Protocol scan determines which IP protocols (TCP, ICMP, IGMP, etc.) are supported by the target machine. This isn't 
        technically a port scan, since it cycles through IP protocol numbers rather than TCP or UDP port numbers.
-sX                Xmas scan
-sM                TCP Maimon Scan, his obscure firewall-evading scan type is similar to a FIN scan, but includes the ACK flag as well. This allows it to get 
        by more packet filtering firewalls. 
-sV         Version detection
-sI                TCP Idle Scan, Idle scan is the stealthiest scan type of all, and can sometimes exploit trusted IP address relationships. Unfortunately, it It 
        is also slow and complex.
-oA         fileName save files as logs
-oN/-oX/-oG/-oS This writes the results to a file that we can use for later analysis
-sI         Idle scan -  In idle scan, Nmap doesn’t send the packets from your real IP address—instead of generating the packets from the attacker 
        machine, Nmap uses another host from the target network to send the packets. Let’s consider an example to understand the concept of idle scan
--log-errors                 include error logs 
--reason                         This tells nmap to provide the reason that a port's state was reported a certain way.
--append-output         Append logs to the output file
`

https://nmap.org/nsedoc/index.html                                                                                                # Library of nmap scripts
nmap --script ssl-enum-ciphers -p 443 addmCONcrtLS01                                                          # Check and give the list of all supported ciphers
nmap --script ssl-enum-ciphers -p 443 addmdevls01                                                                # check the communicating TLS protocols
nmap -sU -p161 --script snmp-brute --script-args snmplist=community.lst<target> # community.lst is a file containing the community names
nmap -sU -p161 --script snmp-brute --script-args snmplist=community.lst 192.168.1.0/24

nmap --script +ssl-enum-ciphers -p 3389 <hostName> -Pn

nmap 192.168.1.1 > output.txt                                                                                                                          # Scan IP address and output to a file
nmap <multiple IP/hosts> | grep --color -e 'Host is up' -e 'rDNS' -e '161' -e 'All'         # to nmap multiple hosts or IPs at once
nmap -sP <multiple IP/hosts>

` Exclude hosts/networks or a list.`
nmap 192.168.1.0/24 --exclude 192.168.1.5
nmap 192.168.1.0/24 --exclude 192.168.1.5,192.168.1.254
nmap -iL /tmp/scanlist.txt --excludefile /tmp/exclude.txt

` Turn on OS and version detection scanning script (IPv4).`
nmap -A 192.168.1.254
nmap -v -A 192.168.1.1
nmap -A -iL /tmp/scanlist.txt 

` Find out if a firewall protects a host/network.`
nmap -sA 192.168.1.254
nmap -sA server1.cyberciti.biz

` Scan a host when protected by the firewall.`
nmap -PN 192.168.1.1
nmap -PN server1.cyberciti.biz

` Scan an IPv6 host/address.`
The -6 option enables IPv6 scanning. The syntax is:
nmap -6 IPv6-Address-Here
nmap -6 server1.cyberciti.biz
nmap -6 2607:f0d0:1002:51::4
nmap -v A -6 2607:f0d0:1002:51::4

` Scan a network and find out which servers and devices are up and running.`
This is known as host discovery or ping scan:
nmap -sP 192.168.1.0/24

`Input & Output file`
nmap -iL <INPUT FILE>                         #The target list contained in the input file may be separated either by spaces, tabs, or newlines.
nmap -iL CISCO_ACI_TXT
nmap -iL /tmp/test.txt
nmap -iL CISCO_ACI_TXT > CISCO_ACI_RESULTS
nmap -sU -p 161 -iL CISCO_ACI_TXT
nmap -sU -p 161 -iL CISCO_ACI_TXT > CISCO_ACI_RESULTS 
nmap -v -sO -oG - -sU -p 161 -iL CISCO_ACI_TXT | grep "Ports:"                                                # Formats output
nmap -v -oG - -sU -p 161 -iL CISCO_ACI_TXT | grep "Ports:" > CISCO_ACI_RESULTS                # Formats output
nmap -oN <output file> <target>                                                                                                                # TXT file
nmap -oX <filename> <target>                                                                                                                # XML file
scanpbnj -a <Nmap arguments> <target>                                                                                                # SQLite database
nmap -oG <output file> <target>                                                                                                                # Grepable 
nmap -sV --traceroute scanme.nmap.org                                                                                                # Zenmap


`NMAP Output` 
nmap -oA scanme scanme.nmap.org                                                                                        # saving output in all formats, .nmap/.xml/.grep
nmap --append-output -oN existing.log scanme.nmap.org                                        # Append output logs
nmap -A -T4 -oN output.txt --log-errors <target>                                                # include debug information in logs 
nmap --reason <target>                                                                                                         # include reason in output


` XML output `
nmap -oX <filename> <target>                                                                                                                # XML format
nmap -A -O -oX scanme.xml <Target IP/Name/FQDN>                                                                                # XML output
nmap -T4 -A -oX - localhost                                                                                                                        # output as XML with -oX

` Grepo output `
nmap -sn -oG - -iR 100                        # demonstrates a ping scan of five random hosts on the internet
nmap -sL -oG - -iR 5                         # demonstrates a list scan of five hosts on the internet 
nmap -p22 -Pn -oG - localhost | awk 'open/{print $2 " " $3}'

` NSE scripts `
nmap --script-help=scriptName                                                                # To get help on security scripts
nmap --script-help=*                                                                                # To get a list of installed NSE scripts
nmap -sV -p 443 –script=ssl-heartbleed.nse 192.168.1.1                # Using NSE security scripts, there are currently 471 NSE scripts. 

` Geolocation `
nmap --script=asn-query,whois,ip-geolocation-maxmind 192.168.1.0/24

` SQL output `
scanpbnj -a <Nmap arguments> <target>                                                # Save results in sql 
apt-get install pbnj

` PDF output`
nmap -oX scanme.xml scanme.nmap.org
. We could use a tool named fop to achieve this task.

`Vulnerabilities check`
nmap -sV --script vuln localhost

`Geo location`
The ip-geolocation-maxmind script depends on a database that Nmap does not include by default. Download Maxminds GeoLite City database in binary format from http://dev.maxmind.com/geoip/legacy/geolite/ and place it in your local Nmap data folder (/nselib/data/) inside your installation directory. The ip-geolocation-ipinfodb script requires an API key to query an external service. The service is free, and you only need to register at http://ipinfodb.com/register.php to get one. This service does not limit the number of queries, but connections are only processed from one IP address that you need to register during the signup process.

nmap --traceroute --script traceroute-geolocation <target>                # Obtaining traceroute geolocation information

`HTML & Web`
nmap -p80,443 --script http-methods,http-trace --script-args http-methods.test-all=true google.com                # Listing supported HTTP methods
nmap -p80 --script http-methods,http-trace --script-args http-methods.test-all=true localhost
nmap --script http-open-proxy -p8080 localhost                                # Checking whether a web server is an open proxy
nmap --script http-enum -p80,443 localhost                                        # Discovering interesting files and folders in web servers
nmap -p80 --script http-userdir-enum localhost                                # Abusing mod_userdir to enumerate user accounts
nmap -p80,443 --script http-brute localhost                                        # Brute forcing HTTP authentication
nmap --script http-form-brute -p80,443 localhost
nmap --script http-form-brute -p80,443  localhost                        # Brute forcing web applications
nmap -p80 --script http-waf-detect,http-waf-fingerprint <target>        # Detecting web application firewalls
nmap -p80 --script http-methods,http-trace --script-args http-methods.retest <target># Detecting possible XST vulnerabilities
nmap -p80 --script http-unsafe-output-escaping localhost        # Detecting XSS vulnerabilities
nmap -p80 --script http-sql-injection                                                # Finding SQL injection vulnerabilities
nmap -p80 --script http-slowloris --max-parallelism 400                # Detecting web servers vulnerable to solaris denial of service attacks
nmap -p80 --script http-default-accounts                                        # Finding web applications with default credentials
nmap -sV --script http-shellshock                                                        # Detecting web applications vulnerable to Shellshock
nmap --script http-cross-domain-policy                                                # Detecting insecure cross-domain policies
nmap -p80 --script http-git                                                                        # Detecting exposed source code control systems
nmap --script ssl-enum-ciphers -p 443                                                # Auditing the strength of cipher suites in SSL servers
nmap -p80 --script http-grep --script-args http-grep.builtins=e-mail         # Scrapping e-mail accounts from web servers  
nmap -sn --script whois-* <target>                                                        # Getting information from WHOIS records
nmap -sn -Pn -n --script shodan-api --script-args shodan-api.apikey=<ShodanAPI KEY> <target>#Querying Shodan to obtain target information
# Checking whether a host is flagged by Google Safe Browsing for malicious activities
nmap -p80 --script http-google-malware --script-args http-google-malware.api=<API> <target> 
nmap -sn --script hostmap-* <target>                                                # Discovering hostnames pointing to the same IP address
nmap -p80 --script http-methods --script-args http.pipeline=25 <target> # number of requests for servers
nmap -p80 --script http-methods --script-args http.pipeline=25 <target>        # number of requests to crawl


nmap -p 'T:513,3940,5989,902,135,80,22,5988,443,U:161' 10.132.35.20 - worked 
nmap -p 'T:513,3940,5989,902,135,80,22,5988,443,U:161' 10.132.35.20 - worked 
nmap '-p' 'T:513,3940,5989,902,135,80,22,5988,443,U:161' 10.132.35.20 - worked 
 
nmap '-sT' '-sU' '-T4' '-PE' '-PA139,445,22,161' 10.132.35.20

nmap -v 10.132.35.20         This option scans all reserved TCP ports on the machine IP. The -v option enables verbose mode.

nmap -sS -O scanme.nmap.org/24
nmap -sS -O 10.132.35.20/24                 Launches a stealth SYN scan against each machine that is up out of the 256 IPs on the class C-sized network where Scanme resides. It also tries to determine what operating system is running on each host that is up and running. This requires root privileges because of the SYN scan and OS detection.

nmap -sV -p 22,53,110,143,4564 198.116.0-255.1-127                Launches host enumeration and a TCP scan at the first half of each of the 255 possible eight-bit subnets in the 198.116 class B address space. This tests whether the systems run SSH, DNS, POP3, or IMAP on their standard ports, or anything on port 4564. For any of these ports found open, version detection is used to determine what application is running.

nmap -v -iR 100000 -Pn -p 80                Asks Nmap to choose 100,000 hosts at random and scan them for web servers (port 80). Host enumeration is disabled with -Pn since first sending a couple of probes to determine whether a host is up is wasteful when you are only probing one port on each target host anyway.

nmap -Pn -p80 -oX logs/pb-port80scan.xml -oG logs/pb-port80scan.gnmap 216.163.128.20/20                This scans 4096 IPs for any web servers (without pinging them) and saves the output in grepable and XML formats.


` Obtaining profile information from Google's People API.`
Please install it manually before continuing. You can download google-people-enum.nse from https://raw.githubusercontent.com/cldrn/nmap-nse-scripts/master/scripts/google-people-enum.nse.

nmap -sn --script google-people-enum.nse <target>

To accomplish this task, we use the NSE script vulscan. This script is not included in the official Nmap repository, so you need to install it manually before continuing. To install it, download the latest version of VulScan from my GitHub repository:

https://github.com/cldrn/nmap-nse-scripts/blob/master/scripts/vulscan.nse

Copy the script vulscan. nse in your local script folder ($NMAP_INSTALLATION/scripts/). Then, create the files cve.csv, scipvuldb.csv, and exploitdb.csv inside your data directory ($NMAP_INSTALLATION/nselib/data).

nmap -p80 -sV --script vulscan --script-args vulscan.updatedb <target> # Matching services with public vulnerability advisories



`eMail`
nmap -p <Port> --script http-grep <target>                                        # Collecting valid e-mail accounts and IP addresses from web servers
nmap -p443 --script http-grep nmap.org 
nmap -sV --script smtp-open-relay -v <target>                                # Detecting SMTP open relays
nmap -p25 --script smtp-brute <target>                                                # Brute forcing SMTP passwords
nmap -sV --script smtp-strangeport <target>                                        # Detecting suspicious SMTP servers
nmap -p25 --script smtp-enum-users <target>                                        # Enumerating SMTP usernames
nmap -p143 --script imap-brute <target>                                                # Brute forcing IMAP passwords
nmap -p143,993 --script imap-capabilities                                         # Retrieving the capabilities of an IMAP server
nmap -p110 --script pop3-brute <target>                                                # Brute forcing POP3 passwords
nmap -p110 --script pop3-capabilities <target>                                # Retrieving the capabilities of a POP3 server
# Retrieving information from SMTP servers with NTLM authentication
nmap -p25,465,587 --script smtp-ntlm-info --script-args smtp-ntlm-info.domain=<target domain> <target>

`Database`
nmap -p3306 --script mysql-databases --script-args mysqluser=   <user>,mysqlpass=<password> <target> # Listing MySQL databases
nmap -p3306 --script mysql-users --script-args mysqluser=<username>,mysqlpass=<password> <target>        # Listing MySQL users
nmap -p3306 --script mysql-variables --script-args mysqluser=<root>,mysqlpass=<pass> <target>                # Listing MySQL variables
nmap -p3306 --script mysql-brute <target>                                # Brute forcing MySQL passwords
nmap -p3306 --script mysql-empty-password <target>                # Finding root accounts with an empty password in MySQL servers
nmap -p3306 --script mysql-audit --script-args 'mysql-audit.username="<username>",mysql-audit.password="<password>",mysql-audit.filename=/usr/local/share/nmap/nselib/data/mysql-cis.audit' <target>                                                                                        # Detecting insecure configurations in MySQL servers
nmap -sV --script oracle-brute --script-args oracle-brute.sid=TEST <target>        # Brute forcing Oracle passwords
nmap -sV --script oracle-sid-brute <target>                        # Brute forcing Oracle SID names
nmap -p1433 --script ms-sql-info <target>                        # Retrieving information from MS SQL servers
nmap -p1433 --script ms-sql-brute <target>                        # Brute forcing MS SQL passwords
nmap -p1433 --script ms-sql-empty-password,ms-sql-dump-hashes <target>                # Dumping password hashes of MS SQL servers

# Running commands through xp_cmdshell in MS SQL servers. MS SQL servers have a stored procedure named xp_cmdshell. This feature allows programmers to execute commands through MS SQL servers. 
nmap --script-args 'mssql.username="<user>",mssql.password="<password>"' --script ms-sql-xp-cmdshell -p1433 <target> 
nmap -p1433 --script ms-sql-empty-password -v <target>                # Finding system administrator accounts with empty passwords in MS SQL servers
nmap -p1433 --script ms-sql-ntlm-info <target>                                # Obtaining information from MS SQL servers with NTLM enabled
nmap -p27017 --script mongodb-info <target>                                        # Retrieving MongoDB server information
nmap -p27017 --script mongodb-databases <target>                        # Detecting MongoDB instances with no authentication enabled
nmap -p27017 --script mongodb-databases <target>                        # Listing MongoDB databases
nmap -p5984 --script couchdb-databases <target>                                # Listing CouchDB databases
nmap -p5984 --script couchdb-stats <target>                                        # Retrieving CouchDB database statistics
nmap -p9160 --script cassandra-brute <target>                                # Detecting Cassandra databases with no authentication enabled
nmap -p6379 --script redis-brute <target>                                        # Brute forcing Redis passwords

`Windows`
nmap -p139,445 --script smb-os-discovery <target>                        # Obtaining system information from SMB
nmap -p137,139,445 --script smb-security-mode <target>                # Detecting Windows clients with SMB signing disabled
nmap -p80 --script iis-short-name-brute <target>                        # Detecting IIS web servers that disclose Windows 8.3 names
nmap -p445 --script smb-vuln-ms08-067 <target>                                # Detecting Windows hosts vulnerable to MS08-067
nmap -sU -p137 --script nbstat <target>                                                # Retrieving the NetBIOS name and MAC address of a host
nmap -p139,445 --script smb-enum-users <target>                                # Enumerating user accounts of Windows hosts
nmap -p139,445 --script smb-enum-shares --script-args smbusername=Administrator,smbpassword=Password <target>        # Enumerating shared folders
nmap -p445 --script smb-enum-sessions <target>                                # Enumerating SMB sessions
nmap -p389 -sV <target>                                                                                # Find domain controllers
nmap -p445 --script smb-vuln-double-pulsar-backdoor <target> # Detecting Shadow Brokers' DOUBLEPULSAR SMB implants

`Distributed nmap - DNMAP`
Download the latest version of Dnmap from the official SourceForge repositories at https://sourceforge.net/projects/dnmap/files/.
Dnmap depends on Python's twisted library. If you are on a Debian-based system, you can install it with the following command:

apt-get install libssl-dev python-twisted

It is also worth mentioning that Nmap is not self-contained in Dnmap; we must install it separately on each client. Please refer to the Compiling Nmap from source code 

`Brute Modes`
# user: In this mode, for each user listed in userdb, every password in passdb will be tried,
nmap --script <brute force script> --script-args brute.mode=user <target>

# pass: In this mode, for each password listed in passdb, every user in userdb will be tried, as follows:
nmap --script <brute force script> --script-args brute.mode=pass <target>

# creds: This mode requires the additional argument brute. credfile, as follows:
nmap--script <brute force script> --script-args  brute.mode=creds,brute.credfile=./creds.txt <target>

`Anonymous Port Scanning: Nmap + Tor + ProxyChains` 
Posted on Tuesday December 27th, 2016, by admin  
In this article, I will explain how to stay anonymous during port scanning with Nmap (a utility for network discovery and security auditing). 
I’ll show how to perform an anonymous port scan through the Tor network, using the ProxyChains utility. 
I’ll also show how to get around a situation where the scan fails, because Tor endpoints are blocked. 
Install Tor + Nmap + ProxyChains 
 
From <https://www.shellhacks.com/anonymous-port-scanning-nmap-tor-proxychains/>  

`NMAP Cheat Sheet`

# Basic Scanning Techniques
nmap [target]                                                Scan a single target —> 
nmap [target1,target2,etc]                        Scan multiple targets —> 
—-> nmap -iL [list.txt]                                Scan a list of targets 
—-> nmap [range of IP addresses]        Scan a range of hosts 
nmap [IP address/cdir]                                Scan an entire subnet —-> 
—-> nmap -iR [number]                                Scan random hosts 
Excluding targets from a scan —> nmap [targets] –exclude [targets]
Excluding targets using a list> nmap [targets] –excludefile [list.txt]
Perform an aggressive scan —> nmap -A [target]
Scan an IPv6 target —> nmap -6 [target]

# Discovery Options
Perform a ping scan only —> nmap -sP [target]
Don’t ping —> nmap -PN [target]
TCP SYN Ping —> nmap -PS [target]
TCP ACK ping —-> nmap -PA [target]
UDP ping —-> nmap -PU [target]
SCTP Init Ping> nmap -PY [target]
ICMP echo ping —-> nmap -PE [target]
ICMP Timestamp ping —> nmap -PP [target]
ICMP address mask ping —> nmap -PM [target]
IP protocol ping —-> nmap -PO [target]
ARP ping —> nmap -PR [target]
Traceroute —> nmap –traceroute [target]
Force reverse DNS resolution —> nmap -R [target]
Disable reverse DNS resolution —> nmap -n [target]
Alternative DNS lookup —> nmap –system-dns [target]
Manually specify DNS servers —> nmap –dns-servers [servers] [target]
Create a host list —-> nmap -sL [targets]

# Advanced Scanning Options

TCP SYN Scan —> nmap -sS [target]
TCP connect scan —-> nmap -sT [target]
UDP scan —-> nmap -sU [target]
TCP Null scan —-> nmap -sN [target]
TCP Fin scan —> nmap -sF [target]
Xmas scan —-> nmap -sX [target]
TCP ACK scan —> nmap -sA [target]
Custom TCP scan —-> nmap –scanflags [flags] [target]
IP protocol scan —-> nmap -sO [target]
Send Raw Ethernet packets —-> nmap –send-eth [target]
Send IP packets —-> nmap –send-ip [target]

# Port Scanning Options
Perform a fast scan —> nmap -F [target]
Scan specific ports —-> nmap -p [ports] [target]
Scan ports by name —-> nmap -p [port name] [target]
Scan ports by protocol —-> nmap -sU -sT -p U:[ports],T:[ports] [target]
Scan all ports —-> nmap -p “*” [target]
Scan top ports —–> nmap –top-ports [number] [target]
Perform a sequential port scan —-> nmap -r [target]

# Version Detection
Operating system detection —-> nmap -O [target]
Submit TCP/IP Fingerprints —-> http://www.nmap.org/submit/
Attempt to guess an unknown —-> nmap -O –osscan-guess [target]
Service version detection —-> nmap -sV [target]
Troubleshooting version scans —-> nmap -sV –version-trace [target]
Perform an RPC scan —-> nmap -sR [target]

# Timing Options
Timing Templates —-> nmap -T [0-5] [target]
Set the packet TTL -> nmap –ttl [time] [target]
Minimum of parallel connections —-> nmap –min-parallelism [number] [target]
Maximum of parallel connection —-> nmap –max-parallelism [number] [target]
Minimum host group size —–> nmap –min-hostgroup [number] [targets]
Maximum host group size —-> nmap –max-hostgroup [number] [targets]
Maximum RTT timeout —–> nmap –initial-rtt-timeout [time] [target]
Initial RTT timeout —-> nmap –max-rtt-timeout [TTL] [target]
Maximum retries —-> nmap –max-retries [number] [target]
Host timeout —-> nmap –host-timeout [time] [target]
Minimum Scan delay —-> nmap –scan-delay [time] [target]
Maximum scan delay —-> nmap –max-scan-delay [time] [target]
Minimum packet rate —-> nmap –min-rate [number] [target]
Maximum packet rate —-> nmap –max-rate [number] [target]
Defeat reset rate limits —-> nmap –defeat-rst-ratelimit [target]

# Firewall Evasion Techniques
Fragment packets —-> nmap -f [target]
Specify a specific MTU —-> nmap –mtu [MTU] [target]
Use a decoy —-> nmap -D RND: [number] [target]
Idle zombie scan —> nmap -sI [zombie] [target]
Manually specify a source port —-> nmap –source-port [port] [target]
Append random data —-> nmap –data-length [size] [target]
Randomize target scan order —-> nmap –randomize-hosts [target]
Spoof MAC Address —-> nmap –spoof-mac [MAC|0|vendor] [target]
Send bad checksums —-> nmap –badsum [target]

# Output Options
Save output to a text file —-> nmap -oN [scan.txt] [target]
Save output to an XML file —> nmap -oX [scan.xml] [target]
Grepable output —-> nmap -oG [scan.txt] [target]
Output all supported file types —-> nmap -oA [path/filename] [target]
Periodically display statistics —-> nmap –stats-every [time] [target]
133t output —-> nmap -oS [scan.txt] [target]

# Troubleshooting and debugging
Help —> nmap -h
Display Nmap version —-> nmap -V
Verbose output —-> nmap -v [target]
Debugging —-> nmap -d [target]
Display port state reason —-> nmap –reason [target]
Only display open ports —-> nmap –open [target]
Trace packets —> nmap –packet-trace [target]
Display host networking —> nmap –iflist
Specify a network interface —> nmap -e [interface] [target]

# Nmap Scripting Engine
Execute individual scripts —> nmap –script [script. nse] [target]
Execute multiple scripts —-> nmap –script [expression] [target]
Script categories —-> all, auth, default, discovery, external, intrusive, malware, safe, vuln
Execute scripts by category —-> nmap –script [category] [target]
Execute multiple scripts categories —-> nmap –script [category1,category2, etc]
Troubleshoot scripts —-> nmap –script [script] –script-trace [target]
Update the script database —-> nmap –script-updatedb

# Ndiff
Comparison using Ndiff —-> ndiff [scan1.xml] [scan2.xml]
Ndiff verbose mode —-> ndiff -v [scan1.xml] [scan2.xml]
XML output mode —-> ndiff –xml [scan1.xm] [scan2.xml]

`How do I perform a fast scan?`
nmap -F 192.168.1.1

#11: Display the reason a port is in a particular state

nmap --reason 192.168.1.1
nmap --reason server1.cyberciti.biz

#12: Only show open (or possibly open) ports

nmap --open 192.168.1.1
nmap --open server1.cyberciti.biz

#13: Show all packets sent and received

nmap --packet-trace 192.168.1.1
nmap --packet-trace server1.cyberciti.biz

# 14: Show host interfaces and routes

This is useful for debugging (ip command, route command, or netstat command like output using nmap)

nmap --iflist

#16: The fastest way to scan all your devices/computers for open ports ever

nmap -T5 192.168.1.0/24

#17: How do I detect a remote operating system?

You can identify a remote host's apps and OS using the -O option:

nmap -O 192.168.1.1
nmap -O  --osscan-guess 192.168.1.1
nmap -v -O --osscan-guess 192.168.1.1

#18: How do I detect remote services (server/daemon) version numbers?

nmap -sV 192.168.1.1

#19: Scan a host using TCP ACK (PA) and TCP SYN (PS) ping

If the firewall is blocking standard ICMP pings, try the following host discovery methods:

nmap -PS 192.168.1.1
nmap -PS 80,21,443 192.168.1.1
nmap -PA 192.168.1.1
nmap -PA 80,21,200-512 192.168.1.1

#20: Scan a host using the IP protocol ping

nmap -PO 192.168.1.1

#21: Scan a host using UDP ping

This scan bypasses firewalls and filters that only screen TCP:

nmap -PU 192.168.1.1
nmap -PU 2000.2001 192.168.1.1

#23: Scan a host for UDP services (UDP scan)

Most popular services on the Internet run over the TCP protocol. DNS, SNMP, and DHCP are three of the most common UDP services. Use the following syntax to find out UDP services:

nmap -sU nas03
nmap -sU 192.168.1.1

#24: Scan for IP protocol

This type of scan allows you to determine which IP protocols (TCP, ICMP, IGMP, etc.) are supported by target machines:

nmap -sO 192.168.1.1

#25: Scan a firewall for security weakness

The following scan types exploit a subtle loophole in TCP and are good for testing the security of common attacks:

## TCP Null Scan to fool a firewall to generate a response ##
## Does not set any bits (TCP flag header is 0) ##
nmap -sN 192.168.1.254
 
#TCP Fin scan to check firewall ## #Sets just the TCP FIN bit ##
nmap -sF 192.168.1.254
 
## TCP Xmas scan to check firewall ##
## Sets the FIN, PSH, and URG flags, lighting the packet up like a Christmas tree ##
nmap -sX 192.168.1.254

#28: Scan a firewall for MAC address spoofing

### Spoof your MAC address ##
nmap --spoof-mac MAC-ADDRESS-HERE 192.168.1.1
 
### Add other options ###
nmap -v -sT -PN --spoof-mac MAC-ADDRESS-HERE 192.168.1.1
 
 
### Use a random MAC address ###
### The number 0 means nmap chooses a completely random MAC address ###
nmap -v -sT -PN --spoof-mac 0 192.168.1.1

#30 Scans for web servers and pipes into Nikto for scanning

nmap -p80 192.168.1.2/24 -oG - | /path/to/nikto.pl -h -
nmap -p80,443 192.168.1.2/24 -oG - | /path/to/nikto.pl -h -

#31 Speed up nmap

Pass the -T option:
nmap -v -sS -A -T4 192.168.2.5
