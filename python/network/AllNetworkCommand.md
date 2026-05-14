# Windows Networking Commands — Description & Usage Guide

## Basic Network Information

### `ipconfig`
Displays IP address, subnet mask, gateway, and adapter information.

```powershell
ipconfig
```

Useful options:

```powershell
ipconfig /all
ipconfig /release
ipconfig /renew
ipconfig /flushdns
```

- `/all` → Detailed adapter info
- `/release` → Release IP address
- `/renew` → Request new IP address
- `/flushdns` → Clear DNS cache

---

### `hostname`
Displays the computer hostname.

```powershell
hostname
```

---

### `getmac`
Shows MAC addresses of all network adapters.

```powershell
getmac
```

---

# Connectivity Testing

### `ping`
Tests connectivity to another device or website.

```powershell
ping google.com
```

Send 5 packets:

```powershell
ping google.com -n 5
```

Use Cases:
- Check internet connection
- Test server availability
- Troubleshoot network issues

---

### `tracert`
Shows the path packets take to a destination.

```powershell
tracert google.com
```

Use Cases:
- Detect slow network hops
- Troubleshoot routing problems

---

### `pathping`
Combines `ping` and `tracert`.

```powershell
pathping google.com
```

Shows:
- Packet loss
- Network latency
- Problematic routers

---

### `powershell -Command "Test-NetConnection"`
Advanced network testing.

```powershell
powershell -Command "Test-NetConnection google.com"
```

Test a specific port:

```powershell
powershell -Command "Test-NetConnection google.com -Port 443"
```

Use Cases:
- HTTPS testing
- Firewall troubleshooting
- Port availability checking

---

# DNS Commands

### `nslookup`
Queries DNS servers.

```powershell
nslookup google.com
```

Reverse lookup:

```powershell
nslookup 8.8.8.8
```

Use Cases:
- DNS troubleshooting
- Domain resolution testing

---

# Network Connections & Ports

### `netstat`
Displays active connections and listening ports.

```powershell
netstat
```

Useful options:

```powershell
netstat -ano
netstat -an
netstat -b
```

- `-a` → Show all connections
- `-n` → Numerical addresses
- `-o` → Show process ID
- `-b` → Show executable name

Find process using port 8080:

```powershell
netstat -ano | findstr :8080
```

---

### `port`
(Custom command)

Displays the process using a specific port.

```powershell
port 3000
```

Equivalent example:

```powershell
netstat -ano | findstr :3000
```

---

# ARP & Routing

### `arp`
Displays IP-to-MAC address mappings.

```powershell
arp -a
```

Use Cases:
- LAN troubleshooting
- Device identification

---

### `route`
Displays routing table.

```powershell
route print
```

Add a route:

```powershell
route add 192.168.1.0 mask 255.255.255.0 192.168.0.1
```

Use Cases:
- Static routing
- Advanced networking

---

# Network Configuration

### `netsh`
Advanced network configuration utility.

Show interfaces:

```powershell
netsh interface show interface
```

Reset TCP/IP stack:

```powershell
netsh int ip reset
```

Reset Winsock:

```powershell
netsh winsock reset
```

Use Cases:
- Fix network problems
- Configure adapters
- Manage firewall

---

### `netsh interface ip show config`
Displays interface IP settings.

```powershell
netsh interface ip show config
```

---

### `netsh interface ip set address`
Sets a static IP address.

```powershell
netsh interface ip set address name="Ethernet" static 192.168.1.10 255.255.255.0 192.168.1.1
```

---

### `netsh interface ip set dns`
Sets DNS server manually.

```powershell
netsh interface ip set dns name="Ethernet" static 8.8.8.8
```

---

# Wi-Fi Commands

### `netsh wlan show profiles`
Displays saved Wi-Fi profiles.

```powershell
netsh wlan show profiles
```

---

### `netsh wlan connect`
Connects to a saved Wi-Fi profile.

```powershell
netsh wlan connect name="MyWiFi"
```

---

# Firewall Commands

### `netsh advfirewall show allprofiles`
Displays firewall status.

```powershell
netsh advfirewall show allprofiles
```

---

# File Transfer & Remote Access

### `ftp`
Connects to an FTP server.

```powershell
ftp ftp.example.com
```

Common FTP commands:

```powershell
put file.txt
get file.txt
dir
bye
```

---

### `telnet`
Tests remote connectivity on a specific port.

```powershell
telnet google.com 80
```

Use Cases:
- Port testing
- Server troubleshooting

> Note: Telnet may need to be enabled in Windows Features.

---

# Network Sharing & Users

### `net use`
Maps network drives.

```powershell
net use Z: \\SERVER\Share
```

Disconnect mapped drive:

```powershell
net use Z: /delete
```

---

### `net view`
Displays computers and shared resources on the network.

```powershell
net view
```

---

### `net user`
Manages local user accounts.

Show users:

```powershell
net user
```

Create user:

```powershell
net user victor password123 /add
```

---

### `net localgroup`
Manages local groups.

Show administrators:

```powershell
net localgroup administrators
```

Add user to administrators:

```powershell
net localgroup administrators victor /add
```

---

### `net session`
Displays active sessions.

```powershell
net session
```

---

### `net config`
Displays workstation/server configuration.

```powershell
net config workstation
```

---

# PowerShell Networking Commands

### `Get-NetAdapter`
Lists network adapters.

```powershell
powershell -Command "Get-NetAdapter"
```

---

### `Get-NetIPConfiguration`
Displays detailed IP configuration.

```powershell
powershell -Command "Get-NetIPConfiguration"
```

---

# NetBIOS

### `nbtstat`
Displays NetBIOS information.

```powershell
nbtstat -n
```

Remote lookup:

```powershell
nbtstat -A 192.168.1.1
```

---

# Custom Utility Commands

## `netinfo`
Displays general network information.

```powershell
netinfo
```

---

## `nettest`
Quick ping test.

```powershell
nettest google.com
```

---

## `netlookup`
Quick DNS lookup.

```powershell
netlookup google.com
```

---

## `netportscan`
Scans ports using Nmap.

```powershell
netportscan 192.168.1.1
```

Requires:
- Nmap installed

---

## `netdiag`
Runs multiple network diagnostics.

```powershell
netdiag google.com
```

Usually includes:
- Ping
- DNS lookup
- Traceroute
- Port scan

---

## `whatismyip`
Displays your public IP address.

```powershell
whatismyip
```

---

## `searchIP`
Looks up information about an IP address.

```powershell
searchIP 8.8.8.8
```

---

## `jitter`
Measures network jitter and latency variation.

```powershell
jitter google.com
```

Useful for:
- Gaming
- VoIP
- Streaming diagnostics

---

# Most Useful Commands for Troubleshooting

| Task | Command |
|---|---|
| Check internet | `ping google.com` |
| View IP address | `ipconfig` |
| Detailed IP info | `ipconfig /all` |
| Test port | `Test-NetConnection` |
| View open ports | `netstat -ano` |
| Reset network | `netsh winsock reset` |
| DNS lookup | `nslookup` |
| Trace route | `tracert` |
| View Wi-Fi profiles | `netsh wlan show profiles` |
| View public IP | `whatismyip` |
