ipconfig                                      - Displays current TCP/IP network configuration, including IP address, subnet mask, and default gateway.
ping                                          - Tests connectivity to another IP address or hostname by sending ICMP echo requests.
tracert                                       - Traces the path packets take to reach a destination IP or hostname, showing each hop.
pathping                                      - Combines ping and tracert; shows packet loss and latency to each hop along the route.
nslookup                                      - Queries DNS servers to find IP addresses for hostnames or hostnames for IPs.
netstat                                       - Shows active TCP/UDP connections, listening ports, and network statistics.
arp                                           - Displays and manages the ARP cache, which maps IP addresses to MAC addresses.
route                                         - Displays and modifies the IP routing table.
netsh                                         - Network Shell utility; configure and manage network interfaces, firewall, and wireless settings.
telnet                                        - Connects to a remote host on a specific port; used for testing connectivity.
ftp                                           - File Transfer Protocol client; connects to FTP servers to upload/download files.
powershell -Command "Get-NetAdapter"          - Lists all network adapters and their status using PowerShell.
powershell -Command "Get-NetIPConfiguration"  - Displays detailed IP configuration for all network interfaces.
powershell -Command "Test-NetConnection"      - Tests network connectivity to a host, port, or service.
net use                                       - Connects, disconnects, or displays network shared resources (like mapped drives).
net view                                      - Displays a list of computers or shared resources on a network.
net user                                      - Manages user accounts on local or remote computers.
net localgroup                                - Displays or modifies local groups on a computer.
net config                                    - Shows or configures server or workstation network settings.
net session                                   - Displays or disconnects active sessions on the local computer.
netsh wlan show profiles                      - Shows saved Wi-Fi profiles on the system.
netsh wlan connect name="ProfileName"         - Connects to a specified Wi-Fi network profile.
netsh interface ip show config                - Displays IP configuration for network interfaces.
netsh interface ip set address                - Sets a static IP address for a network interface.
netsh interface ip set dns                    - Sets DNS servers for a network interface.
netsh advfirewall show allprofiles            - Displays the status of Windows Firewall for all profiles.
nbtstat                                       - Displays NetBIOS over TCP/IP statistics and remote machine information.
getmac                                        - Shows the MAC addresses of all network adapters on the system.
hostname                                      - Displays the hostname of the local computer.
netinfo                                       - Display network information
nettest                                       - ping
netlookup                                     - DNS lookup
netportscan                                   - Scan top 1000 ports (requires nmap)
network                                       - Show network command help
netdiag                                       - Run ping, traceroute, DNS lookup, and port scan
port                                          - Show process using a given port
whatismyip                                    - Show public IP
searchIP                                      - Lookup IP details
jitter                                        - Measure network jitter to a host
