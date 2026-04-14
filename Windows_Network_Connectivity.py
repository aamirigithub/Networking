# How to troubleshoot a slow network
# Step 1 - ping the endpoint to check the time delays in response
ping 192.168.10.10

# Step 2 - run arp -a to the correct entry for the gateway 
arp -a 

# Step 3 - ping any internet site to check delays or packet loss
ping www.google.com or ping 8.8.8.8

# Step 4 -  Using 3rd party software ColaSoft Ping Tool to check continuous ping with or ping with -t
ping -t 192.168.10.10

# Step 5 - using traceroute to check the packet loss
tracert -d www.google.com

# Step 6 - run the traceroute 2nd time and compare the results
tracert -a www.google.com

# Conclusion - we will determine if packets take different paths to get the delays

Find VLAN ID in Windows 10 CMD
1
2
To identify the VLAN ID on a Windows 10 machine, you can use the following methods. These approaches depend on the network configuration and tools available.

Method 1: Using Command Prompt with Network Adapter Details

Open Command Prompt: Press Win + R, type cmd, and hit Enter.

Run the following command to display network adapter details: ipconfig /all Look for the IPv4 Address or Default Gateway of your active network adapter.

Cross-reference the IP address or gateway with your network administrator or VLAN documentation to determine the VLAN ID.

Method 2: Using PowerShell with NetworkSwitchManager

If you have access to a network switch and PowerShell, you can query VLAN details directly.

Open PowerShell as Administrator.

Use the following commands: $Session = New-CimSession -ComputerName "SwitchNameOrIP" Get-NetworkSwitchVlan -CimSession $Session Replace "SwitchNameOrIP" with the name or IP of your network switch. This will list all VLANs configured on the switch, including their IDs.

Method 3: Using Network Interface Settings

Open Device Manager: Press Win + X and select Device Manager.

Locate your active network adapter under Network Adapters.

Right-click and select Properties > Advanced Tab.

Look for a property like VLAN ID or similar (depends on NIC driver support). If available, it will display the VLAN ID.
