# What is 0.0.0.0?

The IP address 0.0.0.0 is a special address used in networking to represent an invalid or unknown target. It is often referred to as the "unspecified" or "wildcard" address.

In the context of network configuration, using 0.0.0.0 as an IP address typically has specific meanings:

1. Default Route: In the routing table of a device, the entry 0.0.0.0 represents the default route or the gateway of last resort. It indicates that if there is no specific route available for a particular destination, the device should forward the traffic to the default gateway.

2. Listening on All Network Interfaces: When a program or service binds to the IP address 0.0.0.0, it means that it is listening on all available network interfaces or addresses of the host. This allows the program to accept incoming connections from any network interface or address.

It's important to note that 0.0.0.0 is not assigned to any specific device or interface and cannot be used as a valid destination IP address for normal network communication.

## How to Modify and Manage the Hosts File on Linux

There's a single file on your computer that serves as a small gateway between you and the web. It's called the hosts file. If you need to block websites or create personalized web shortcuts on Linux, you can just add or tweak a few lines in the file.

### What's the Linux Hosts File?

The hosts file is a plain text file that all operating systems use to translate hostnames into IP your system will look into the hosts file to get the IP address needed to connect to the appropriate server.

your system will check the hosts file first before looking up a site on the DNS servers defined in your network settings

Before DNS came online, this file held all the hostnames and IP addresses for the entire internet. 

### The Linux Hosts File's Location
```bash
sudo nano /etc/hosts
```
![hosts_file_example (1)](https://github.com/IbrahimMhSaeed/alx-system_engineering-devops/assets/96060166/2f1a444c-7d51-4671-8b62-48fa3d71ec2e)

### Ports
In computer networking, a port is like a door or gateway that allows communication between different programs or services. It is a numerical identifier that helps direct network traffic to the right application or process running on a computer. Ports are identified by numbers ranging from 0 to 65535.

### Servers
A server is a computer or software program that provides services or resources to other computers or clients on a network. It is designed to handle incoming requests and respond with the requested information or perform specific tasks. Servers can provide various services such as web hosting, email, file sharing, and more.

When a client (such as a web browser or email client) wants to communicate with a server, it needs to know two things: the IP address of the server (to identify where the server is located on the network) and the port number (to specify which service or application on the server it wants to communicate with).

For example, when you access a website, your web browser communicates with the web server using the HTTP protocol. The browser knows to send the request to port 80 (the default port for HTTP) on the server's IP address. The server receives the request on port 80, processes it, and sends back the requested web page to the browser.

## 8 Practical Linux Netcat NC Command Examples

Netcat or nc is a networking utility for debugging and investigating the network.

This utility can be used for creating TCP/UDP connections and investigating them. The biggest use of this utility is in the scripts where we need to deal with TCP/UDP sockets.

1. Netcat in a Server-Client Architecture

The netcat utility can be run in the server mode on a specified port listening for incoming connections.
```bash
$ nc -l 2389
```
Also, it can be used in client mode trying to connect on the port(2389) just opened
```bash
$ nc localhost 2389
```
Now, if we write some text at the client side, it reaches the server side. Here is the proof :
```bash
$ nc localhost 2389
HI, server
```
On the terminal where server is running :
```bash
$ nc -l 2389
HI, server
```
So we see that netcat utility can be used in the client server socket communication.

2. Use Netcat to Transfer Files

The netcat utility can also be used to transfer files. At the client side, suppose we have a file named ‘testfile’ containing :
```bash
$ cat testfile hello test
```
and at the server side we have an empty file ‘test’

Now, we run the server as :
```bash
$ nc -l 2389 > test
```
and run the client as :
```bash
cat testfile | nc localhost 2389
```
Now, when we see the ‘test’ file at the server end, we see :
```bash
$ cat test hello test
```
So we see that the file data was transfered from client to server.

3. Netcat Supports Timeouts

Server :
```bash
nc -l 2389
```
Client :
```bash
$ nc -w 10 localhost 2389
```
The connection above would be terminated after 10 seconds.

NOTE : Do not use the -w flag with -l flag at the server side as in that case -w flag causes no effect and hence the connection remains open forever.

4. Netcat Supports IPV6 Connectivity

The flag -4 or -6 specifies that netcat utility should use which type of addresses. -4 forces nc to use IPV4 address while -6 forces nc to use IPV6 address.

```bash
Server :

$ nc -4 -l 2389

Client :

$ nc -4 localhost 2389

Now, if we run the netstat command, we see :

$ netstat | grep 2389
tcp 0 0 localhost:2389 localhost:50851 ESTABLISHED 
tcp 0 0 localhost:50851 localhost:2389 ESTABLISHED
```
The first field in the above output would contain a postfix ‘6’ in case the IPV6 addresses are being used.

Now, If we force nc to use IPV6 addresses

```bash
Server :

$ nc -6 -l 2389

Client :

$ nc -6 localhost 2389

Now, if we run the netstat command, we see :

$ netstat | grep 2389
tcp6 0 0 localhost:2389 localhost:33234 ESTABLISHED
tcp6 0 0 localhost:33234 localhost:2389 ESTABLISHED
```

So now a postfix ‘6’ with ‘tcp’ shows that nc is now using IPV6 addresses.

5. Disable Reading from STDIN in Netcat

This functionality can be achieved by using the flag -d.

```
Server :

$ nc -l 2389

Client :

$ nc -d localhost 2389
Hi
```
The text ‘Hi’ will not be sent to the server end as using -d option the read from stdin has been disabled.

6. Force Netcat Server to Stay Up

If the netcat client is connected to the server and then after sometime the client is disconnected then normally netcat server also terminates.

```bash
Server :

$ nc -l 2389

Client :

$ nc localhost 2389
^C

Server :

$ nc -l 2389
$
```

So, in the above example we see that as soon as the client got disconnected the server was also terminated.

This behavior can be controlled by using the -k flag at the server side to force the server to stay up even after the client has disconnected.

```bash
Server :

$ nc -k -l 2389

Client :

$ nc localhost 2389
^C

Server :

$ nc -k -l 2389
```

So we see that by using the -k option the server remains up even if the client got disconnected.

7. Configure Netcat Client to Stay Up after EOF

- Netcat client can be configured to stay up after EOF is received.
- In a normal scenario, if the nc client receives an EOF character then it terminates immediately
- This flag -q expects a number which depicts number of seconds to wait before client terminates (after receiving EOF)

Client should be started like :
```bash
nc -q 5 localhost 2389
```
Now if the client ever receives an EOF then it will wait for 5 seconds before terminating.

8. Use Netcat with UDP Protocol

- By default all the sockets that nc utility creates are TCP protocols
- But this utility also works with UDP protocol. To enable UDP protocol the -u flag is used.

Server :
```bash
$ nc -4 -u -l 2389
```
Client :
```bash
$ nc -4 -u localhost 2389
```
Now, both the server and client are configured to use UDP protocol. This can be confirmed by the following
```bash
$ netstat | grep 2389 udp 0 0 localhost:42634 localhost:2389 ESTABLISHED
```
