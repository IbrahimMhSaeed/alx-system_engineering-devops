# Networking Basics

## Open Systems Interconnection (OSI) model
is a reference model from the International Organization for Standardization (ISO) that "provides a common basis for the coordination of standards development for the purpose of systems interconnection".

Once you undertand the model you can recognize which devices are compatible with each other

communications between systems are split into seven different abstraction layers:
1. Physical
2. Data Link
3. Network
4. Transport
5. Session
6. Presentation
7. Application.

| Layer        | Description                                                                                                 |
|--------------|-------------------------------------------------------------------------------------------------------------|
| Application  | High-level protocols for resource sharing, file transfer, and network services (e.g., HTTP, FTP, DNS)        |
| Presentation | Translation and formatting of data for the application layer (e.g., encryption, compression, data formats) |
| Session      | Establishes, manages, and terminates sessions between applications                                           |
| Transport    | Reliable delivery of data segments and end-to-end error recovery (e.g., TCP)                                 |
| Network      | Routing, addressing, and logical network structure (e.g., IP, routing protocols)                            |
| Data Link    | Reliable transmission of data frames between adjacent network nodes (e.g., Ethernet)                        |
| Physical     | Physical transmission of raw data over the network medium (e.g., cables, signals)                           |

![Screenshot_2024-05-08-08-08-30-05_f9ee0578fe1cc94de7482bd41accb329](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/b1c891de-2a9d-45fc-a54e-f497e6f31719)
![Screenshot_2024-05-08-08-11-53-41_f9ee0578fe1cc94de7482bd41accb329](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/72dc4dcc-0b32-4067-8cee-b77b822c22c6)
![Screenshot_2024-05-08-08-12-41-54_f9ee0578fe1cc94de7482bd41accb329](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/5f97f875-fc55-4ccd-93c7-cbe2a0558cd6)
![Screenshot_2024-05-08-08-13-22-54_f9ee0578fe1cc94de7482bd41accb329](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/d64220a1-2080-4a6b-8eea-92588834949f)
![Screenshot_2024-05-08-08-14-14-98_f9ee0578fe1cc94de7482bd41accb329](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/3a7cd0a3-14e6-49ee-93b2-209c4827ae0f)
![Screenshot_2024-05-08-08-15-33-05_f9ee0578fe1cc94de7482bd41accb329](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/2ee1bf36-36db-4226-ba6c-1a32bd3e9659)
![Screenshot_2024-05-08-08-47-27-99_f9ee0578fe1cc94de7482bd41accb329](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/d5e77526-9dd6-44c1-bc5a-32f98d468355)

## Types of Area Networks

Common types of area networks are:
**LAN**: Local Area Network
**WAN**: Wide Area Network
**WLAN**: Wireless Local Area Network

### LAN: Local Area Network
![Ethernet_LAN svg](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/a9f7b538-0c6c-4710-8903-57e65fa4aac3)

- LAN connects network devices over a relatively short distance.
- A networked office building, school, or home usually contains a single LAN
- In TCP/IP networking, a LAN is often, but not always, implemented as a single IP subnet.
- LANs are also typically owned, controlled, and managed by a single person or organization.
- Ethernet and Wi-Fi are the two most common technologies in use for local area networks.

### WAN: Wide Area Network
![440px-LAN_WAN_scheme svg](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/641ec7de-164d-4fda-9b66-24e3948289a2)

- A WAN spans a large physical distance.
- The internet is the largest WAN, spanning the Earth.
- A WAN is a geographically-dispersed collection of LANs.
- A network device called a router connects LANs to a WAN.
- In IP networking, the router maintains both a LAN address and a WAN address.
- A WAN differs from a LAN most WANs (like the internet) aren't owned by a single organization. Instead, WANs exist under collective or distributed ownership and management.

## The Internet
- The Internet (or internet) is the global system of interconnected computer networks that uses the Internet protocol suite (TCP/IP)to communicate between networks and devices.
- It is a network of networks that consists of private, public, academic, business, and government networks of local to global scope
- Linked by a broad array of electronic, wireless, and optical networking technologies

## What is a MAC Address?
- A Media Access Control (MAC) address is a string of characters that identifies a device on a network.
- Tied to network interface card, or NIC
- A NIC turns data into an electrical signal that can be transmitted over the network.
- Manufacturers assign a MAC address to a network adapter when it is produced. It is hardwired or hard-coded onto your computer’s NIC and is unique to it. 

### What is a MAC address used for?
- MAC addresses are useful for network diagnosis because they never change, as opposed to a dynamic IP address.
- On wireless networks, a process called MAC filtering is a security measure to prevent unwanted network access by hackers and intruders (unwanted MAC filtered out)

### Difference Between MAC Address and IP Address
- IP address represents software, they identifies those devices outside of the local network.
- MAC address represents hardware, they identifies specific devices within the same local network.

## IP Addresses Explained
- Without a unique IP address on your machine, you will not be able to communicate with other devices on the Internet.
- You can look at your IP address as if it were a telephone number, each one being unique and used to identify a way to reach you and only you.

### IPv4 and IPv6 Addresses
- The version that the Internet and most routers are currently configured for, is IPv4 or Internet Protocol version 4.
- Uses 32-bit addresses, which limits the amount of addresses to 4,294,967,296 possible unique addresses.
- About 290 million, are reserved for special purposes.
- The pool of possible addresses would be exhausted in the near future.
- New version of IP addresses was developed called IPv6, or Internet Protocol version 6
- Change the address size from 32-bit address to 128-bit addresses.
- In order to use IPv6 addresses, though, existing routers and hardware would need to be upgraded or configured to use this new version of IP addresses.

### IPv4 The Address Itself
- An IP address consists of 4 numbers separated by periods
- Possible range of 0 through 255. 

An example of how an IP address appears is: **192.168.1.10**

- Decimal notation and is what is generally used by humans to refer to an IP address for readability purposes. 

Out of these addresses there are 3 special ranged that are reserved for special purposes:
- The first is the **0.0.0.0** address and refers to the **default network**
- The **255.255.255.255** address which is called the **broadcast address**.
- These addresses are used for routing.
- The third address, **127.0.0.1**, is the **loopback address**, and refers to your machine.

### IPv6 Benefits
- No more NAT (Network Address Translation)Auto-configuration
- No more private address collisions
- Better multicast routing

**Example of IPv6**
`3ffe:1900:4545:3:200:f8ff:fe21:67cf`

## What is the difference between public and private IP address?

1. Public IP: Your home router has a public IP address assigned by your Internet Service Provider (ISP). When someone sends you an email, their email server needs your public IP address to know where to send the email.

2. Email Connection: The sender's email server initiates a connection to your public IP address. It sends the email data to your router using your public IP.

3. Network Address Translation (NAT): Your router, which acts as a gateway between your local network and the internet, receives the incoming email request. It uses Network Address Translation (NAT) to translate the sender's request from the public IP to the private IP address of the specific device within your local network that should receive the email.

4. Private IP: Your device, connected to the router, has a private IP address assigned by the router. The router forwards the email data to your device using the private IP address.

5. Email Delivery: Your device receives the email through the router and displays it in your email client (such as Outlook or Gmail). You can now read and respond to the email.

So, in this scenario, the sender uses your public IP address to send the email, but your router and NAT handle the routing of the email to the specific device within your local network using the private IP address.

## localhost
"Localhost" refers to the loopback address of the device you are using. It is commonly represented as "127.0.0.1" in IPv4 or "::1" in IPv6. 

When you access "localhost" on your device, you are essentially referring to the device itself. It is a way to access services and resources hosted on your own machine without going through a network connection.

For example, if you run a web server on your device, you can access it by entering "http://localhost" or "http://127.0.0.1" in your web browser. This will direct the browser to connect to the web server running on your own device.

Localhost is often used in development and testing environments, allowing developers to interact with their own applications without the need for an internet connection or external network access.

It's important to note that "localhost" is specific to your own device and cannot be used to access services or resources on other devices within a network.

## What's the Difference Between TCP and UDP?
- TCP/IP is a suite of protocols used by devices to communicate over the Internet and most local networks.
- Transmission Control Protocol (TCP) and the Internet Protocol (IP).
- TCP provides apps a way to deliver (and receive) an ordered and error-checked stream of information packets over the network.
- The User Datagram Protocol (UDP) is used by apps to deliver a faster stream of information by throughing away error-checking.

### What They Have In Common
- Both are protocols used for sending bits of data---known as packets---over the Internet.
- Both protocols send packet to an IP address.

### How TCP Works
- TCP is the most commonly used protocol on the Internet.
- When you request a web page in your browser, your computer sends TCP packets to the web server's address, asking it to send the web page back to you. The web server responds by sending a stream of TCP packets, which your web browser stitches together to form the web page.
- Packets sent with TCP are tracked so no data is lost or corrupted in transit. (This is why file downloads don't become corrupted even if there are network hiccups).
- First, it orders packets by numbering them.
- Second, it error-checks by having the recipient send a response back to the sender saying that it has received the message. If the sender doesn't get a correct response, it can resend the packets to ensure the recipient receives them correctly.

### How UDP Works
- similarly to TCP, but it throws out all the error-checking stuff. All the back-and-forth communication introduce latency, slowing things down.
- UDP is used when speed is desirable and error correction isn't necessary. For example, UDP is frequently used for live broadcasts and online games.

**Example of packet lose**
If you lose your connection for a few seconds, the video may freeze or get jumpy for a moment and then skip to the current bit of the broadcast. If you experience minor packet-loss, the video or audio may be distorted for a moment as the video continues to play without the missing data.

## ping (networking utility)

The "ping" command is a network utility used to test the reachability and response time of a host or IP address. When you ping a host, your device sends a small network packet to that host and waits for a response. The ping command measures the time it takes for the packet to reach the host and return back to your device, also known as round-trip time.

To use the ping command, follow these steps:

1. Open a command prompt or terminal on your device.
2. Type "ping" followed by the IP address or domain name of the host you want to ping. For example:
   ```
   ping www.example.com
   ```
   or
   ```
   ping 192.168.0.1
   ```
3. Press Enter to execute the command.
4. The ping command will start sending ICMP (Internet Control Message Protocol) packets to the specified host. It will display the round-trip time (in milliseconds) for each packet along with other statistics.
5. You can stop the ping command by pressing Ctrl+C.

The ping command is useful for troubleshooting network connectivity issues, checking if a host is reachable, and assessing network performance. It can help identify network latency, packet loss, and other network-related problems.

## Bash Positional Parameters, Arguments

1. $0 , $1 $2 $3 … bash Parameters

$0 : bash Shell argument 0, It expands into bash script file name or bash shell.

$1 $2 $3 …   : bash shell argument number : Used to get the specific argument from the script.

```bash
$test.sh aa bb cc dd
#!/bin/sh
echo “File name is ” $0
echo “First arg. is ” $1
echo “Second arg. is ” $2
echo “Third arg. is ” $3
echo “Fourth arg. is ” $4
```

**Output:**
```bash
$ ./test.sh aa bb cc dd
File name is ./test.sh
First arg. is aa
Second arg. is bb
Third arg. is cc
Fourth arg. is dd
```
2. $*

Lists all the command line parameters in a single string format.

```bash
test.sh
#!/bin/sh
echo “All (*) args are ” $*
```
**Output:**
```bash
./test.sh aa bb cc dd
All (*) args are aa bb cc dd
```
3. $@

Lists all command line parameters in a array format.

```bash
test.sh
#!/bin/sh
echo “Array of args are ” $@
```
**Output:**
```bash
./test.sh aa bb cc dd
Array of args are aa bb cc dd
```

4. $#
Numeric count of the command line argument.

5. $?
Returns the exit status of last executed process.

6. $!
Gives the process ID of the last job placed into the background

7. $$
Expands to the process ID of the shell or invoking shell in case of subshell.

8. $_ 
Gives shell script names or command line argument for the last command executed.

```bash
ls -ltr
total 156
drwxr-xr-x. 2 work work 4096 Jun 20 2015 Templates
drwxr-xr-x. 2 work work 4096 Jun 20 2015 Public
drwxr-xr-x. 2 work work 4096 Jun 20 2015 Pictures
drwxr-xr-x. 2 work work 4096 Jun 20 2015 Music

$ echo $_
-ltr                 ###    it gives command line parameters

$ ./test.sh
$ echo $_
./test.sh     ### Gives file name for shell scripts
```
