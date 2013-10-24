# SEM5720 - The Internet And How It Really Works

The Internet is a complex, multi-organisation network reaching nearly all parts of the world. The functioning of this network and the applications running upon it depend on a complex set of protocols. This module addresses the fundamental aspects of the most important issues that permit the network and its applications to operate successfully. The module also addresses the current threats to the Internet and topics still emerging from R&D studies around the world.

*Postal service analogies: 4*

## Introduction

*This module discusses the detailed underlying operation of the Internet and its constituent components and is an essential topic in its own right as well as providing a solid foundation for much of the other material covered in the MEng.*

### Staff

- **[Dave Price](mailto:dap@aber.ac.uk)**
- [Nitin Naik](mailto:nkn@aber.ac.uk)
- [Stephen Kingston](mailto:spk@aber.ac.uk)

### Learning Outcomes

1. Participate in planning networks that are cost effective and realistic in terms of products and services currently available.
2. Critically assess proposed networking solutions.
3. Assess the effect of likely technological developments on existing network applications.
4. Make decisions and provide guidance to others in the choice of appropriate communications technologies to deploy, to solve real world requirements.
5. Demonstrate extensive knowledge of the internal operation of the Internet and its protocols.
6. Demonstrate an appreciation of the problems that appear in the management of routing and naming in large networks.
7. Exercise judgment in the choice of appropriate protocols and services to address the real needs of Internet operators and users.
8. investigate, and propose solutions to problems of quality of service.
9. Demonstrate an appreciation of the security issues that surround the Internet and its applications and how these can be mitigated.
10. Explain the need for a new generation of the Internet and describe current progress towards it.

### Assessment

- Assignment **40%** *??/??/2013 to ??/??/????*
- Exam **60%**

### Commitment

20 credits = 200 hours of work.

44 hours of lectures, around 20 hours of practicals.

This leaves about 140 hours of personal study, including extra practical work.

There is an assignment worth 40% of the marks (2000 word report).

Text book study and revision.

2 hour exam.

### Recommended Reading

* TCP/IP Protocol Suite - *Foruzan B., Fegan S.*
* RFC or internet drafts available online from [IEFT](http://www.ietf.org/)
* Other textbooks and journals
* [The Internet Protocol Journal](http://cisco.com/ipj/) by Cisco Systems

## Practicals

*Practical work sessions focusing mainly on the electronics and hardware of network issues.*

### Practical 1

Using the computer connected digital oscilloscopes or *picoscopes*.

## Basic Issues in Data Communication

*A revision of the basic issues in data communication.*

### Protocol Models and Frameworks

In the 1970s there was no master plan, overall structure nor agreements on application protocols.

Proprietary protocols and architectures lead to a large amount of anarchy.

### ISO Committees

In 1977 ISO establishes committees and subcommittees and so on and so forth.

Not just ISO doing this, telecommunications (CCITT) also got involved.

### OSI Reference Model - IS 7498

Provides a basic framework using a "divide and conquer" principle.

Uses layering to reduce complexity, where each layer handles one (group of) problem(s).

1. Keep things simple.
2. Choose boundaries at places that minimise interaction between adjacent layers.
3. Functions of a different nature or purpose in different layers
4. Similar function in same layer.
5. Use all part knowledge and experience.
6. Hide implementation within layers
7. Special hardware/processors
8. Data abstraction levels.
9. Internal changes do not affect other layers
10. Only create interfaces to directly surrounding layers (controversial).

### OSI Reference Model Layers

1. Physical - wires, radio frequency
2. Data Link - direct link from one to another
3. Network - global issues like addressing
4. Transport - methods for ensuring quality of service.
5. Session - availability of resources, "checkpoints", etc.
6. Presentation - Language/character set encoding
7. Application - Not supposed to contain or control whole applications, just the useful parts to applications, e.g. directory service

### Exercise
Discuss the statement: *The existence of a communications framework like the OSI model promotes competition between companies*.

#### For
* Companies spend more time actually building products than on firmware to deal with communications. 
* Standardised method of communication allow products to be linked: more scope for different products.


#### Against
* No competition to improve the network process.
* No differentiation.

## Local Area Networks

*A detailed study of variants of the technologies collectively known as Ethernet.*

### 802.3 CSMA/CD Bus (Ethernet)

Derived from work by:

* Xerox
* Intel
* Digital (DEC)

Publised in Ethernet (DIS Blue Book) V1.0 September 30th 1980.

802.3 Revision D dated December 1982 publish by IEEE.

Revision F published July 1984 and also issued as draft proposal 8802/3 by ISO.

### Operation: Carrier Sense Multiple Access with Collision Detection (CSMA/CD)

*Distributed Control*

* Contend for use
* Acquire access and send a data packet
* No priority

Simple Algorithm:

```
1.
if(network active)
  goto 1
transmit(data)
check for collision
if(collision)
  transmit(JAM)
  delay(a random time)
  goto 1
transmission complete
```

Checking for collision is the difficult part. Can check:

1. I'm transmitting a `1`, is there a `1` on the wire.
2. Do the signals on the wire look like the output of one station and one station only.

Delay must be random to avoid future collisions and not have priority.

### Coaxial cable

Very rigorous specifications. Maximum length of 500m and limits on bend.

These are to stop the electric current being interfered with.

Hard limit on propagation: `c` (speed of light).

Transceiver (MAU) to link devices to co-ax conveniently.

Terminators absorb the signal at the ends of the cable.

Repeaters repeat the signal onto other cables, repeat a perfect version of the signal (if possible).

### Broadcast Networks

If data is inserted into the network, it should reach every member on the network.

Need to know how long it will take for data to get across the network.

Rules tend to be the distance between two extremes in the network is 5 of the co-ax cables and 4 repeaters. 2 of the co-ax cables must be point to point without any devices attached.

Bridges, switches, hubs and routers help build larger networks.

### Co-ac Medium Options 802.3

* Original (10BASE5)
  * 10Mbps
  * Baseband coaxial cable
  * segment length 500m
  * Max 10 taps per segment
  * Max 4 repeaters
* 10BASE2
  * 10Mbps
  * Thinner coaxial cable
  * 185m segments
  * Max 30 taps per segment.

### Slot Time

Worst case:

`B` stars transmitting when `A`s packet has nearly reached `B`.

`B` must corrupt, at least, the last bit of `A`s packet.

Therefore, packet length must be such that time to transmit is greater than twice the **transmission delay** for longest route in the network.

For a 2.5km network, 10MBit/sec, the slot time is 51.2 micro seconds.

Smallest allowed packet needs to be the number of bits it takes to reach from one end of the network to the other, times 2, plus a little extra for luck.

512 bit packets capture the network for 10BASE5.

> *"Your bits are now all over the network"* - Dave Price, 10/10/2013

### Calculatng Slot Time

Slot time `s`.

Path time `p`.

`s > 2p`

* 3 coax (with stations) = 21.65 bits
* 2 links (no stations) = 25.65 bits
* 4 repeater delays = 7.5 bits
* Transceiver delays = 6.0 bits
* Transceiver cable delays = 2.57 bits
* etc.

Total about 499 bits worst case. Specified as 512 bits to give a safety margin.

### Network JAMs

* Repeaters required to propagate JAMs.
* Must make sure all repeaters see JAMs.
* Time delay of 500m coax about 2.165 micoseconds
* 32 bits JAM
...

### MAC Frame Format for 802.3

<table><tr><th>Number of Octets</th><th>Field Usage</th></tr><tr><td>7</td><td>Preamble</td></tr><tr><td>1</td><td>Start of frame delimiter</td></tr><tr><td>6</td><td>Destination Address</td></tr><tr><td>6</td><td>Source Address</td></tr><tr><td>2</td><td>Length in 802.3</td></tr><tr><td>1500</td><td>LLC data and padding</td></tr><tr><td>4</td><td>Frame Check Sequence</td></tr></table>

* Preamble synchronises.

### Ethernet Addresses

48 bits long. Designed to be globally unique.

![](http://upload.wikimedia.org/wikipedia/commons/thumb/9/94/MAC-48_Address.svg/475px-MAC-48_Address.svg.png)

Globally unique should be completely unique, not always though.

Not expected to be able to be changed, can now be programmed (simply, apparently; `nmap --spoof-mac 0`)

### Frame details

Minimum frame size is 512 bits, not including the preamble.

Maximum frame size is 1518 octets (1500 octets of data).

Above assumes 48 bit addresses which IEEE 302.3 says "shall be used" for 10 Mbps networks.

9.6&micro;s inter-frame gap to allow desynchronisation.

Time for frame is 51.2&micro;s plus 6.4&micro;s for preamble.

### Collision Backoff and Retransmission

Transmitter tries to send for a maximum of 16 attempts to send a frame.

The transmitter waits for an integer multiple slot times determined by the following algorithm prior to each retry.

Rescheduling of each transmission uses "truncated binary exponential backoff"

This ensures a random but increasing delay if many collisions occur:

`DelaySlots = rand[0 <= r < 2^k]`

Where `k = min(n, 10)` for the `n`<sup>th</sup> retansmission

### Probabilistic Characteristics of CSMA/CD

All access to the 802.3 LAN only completes with some probability. It is thus impossible to guarantee transfer rates. When the net is very busy collisions might go on forever.

Debates often take place on the usability of CSMA/CD LANs for real time use. The answer depends on the true use intended rather than the LAN.

### Bridges

Partition LAN to segregate load, add reliability, add security.

Combine remote LAN segments into a single logical network.

Combine separately developed and controlled LANs.

IEEE 802 LANs often include bridges.

Repeaters clean and forward all data.

Bridges selectively forward data. It will store and forward complete packets.

Forwarding based on header information,

Sometimes known as *MAC level relay*.

#### Source Routing Bridges

Hosts discover the route to each other host and are very aware of the presence of multiple LANs couple by bridges.

Needs identifiers for bridges and LANs.

Data is transmitted with routing attached.

Bridges obey the routing.



#### Transparent Bridges

Bridge learns (or is told) the LAN on which each address exists. Hosts need not to know anything about the location of other hosts and indeed are not even aware of the presence of the bridges.

Frames which arrive are handled in one of 3 different ways:

1. Same LAN
2. Different LAN
3. Unknown destination.
4. Broadcast address.

##### Same LAN

If destination address on same LAN as source address then discard the packet

##### Differnet LAN

If destination address on different LAN, forward packet.

##### Unknown Destination

If location of destination address is not known then 'flood'.

##### Broadcast Address

'flood'.

##### Flood

Forward the packet to every other network attached to the bridge.

##### Address Learning

Bridges listen to the traffic and can learn where machines where by looking at the source addresses in the packets.

##### Address Tables

Need to be quite large depending on the network.

Generally there is a time-out associated with the addresses known.

##### Bridge Cycles

Address Learning works well if there are no alternative routes in the internetwork connections (i.e. a tree structure).

However there often are alternative routes, so bridges might cause loops.



##### Solution to Bridge Cycles

Need a protocol to avoid cycles.

Result for graph theory states:

> For any connected graph, there is a *spanning tree* of edges which maintains the connectivity but contains no closed loop.

Each LAN represents a graph node and each bridge corresponds to an edge.

###### Spanning Tree

1. Bridges have numbers
2. Broadcast number every few seconds
3. One bridge becomes the *root bridge*
4. Bridges discover route to *root* via *root port*.
5. Routes might have costs.
6. A *designated bridge* is determined for each LAN (minimum cost of path to root).
7. Only the designated bridge can forward to and from its LAN.
8. Bridges communicate with a Bridge Protocol Data Unit (BPDU) consisting of:
  * The originating bridge number
  * The number of the bridge thought to be the root
  * The path cost to root.

Initially every bridge thinks it is the root and it broadcasts a BPDU to assert this fact.

If a bridge gets a BPDU indicated a 'superior' bridge exists it assigns its root port and the path cost to root.

If a bridge gets a BPDU from a bridge with a shorter root path it releases any claim to be the designated bridge for the segment.

The lowest numbered bridge becomes the root.

Bridge ports which are not root or designated ports are blocks.

#### Local Bridge

Connect two (or more) adjacent LANs. Throughput is likely to be high. Hosts not likely to notice much performance degradation unless waiting for each packet to be acknowledged.

#### Remote Bridge

Connect two (or more) LANs which are widely separated. Bridge consists of two 'half bridges' connected by a WAN type link. Link typically 64Kbps to 2Mbps.

#### Managed Bridges

Bridges often available in a managed form. These are managed from a station and can load the bridges with lots of things.

Lots of monitoring, etc.

Another protocol needed and this needs to be standardised.

## Other Network Technologies

*A brief look at fast and wireless network technologies.*

## Standards

*The ISO OSI model.*

### IEEE 802 Standards

![IEEE 802](http://misc.alexanderdbrown.com/ieee802.png "IEEE 802")

Encapsulation at each level.

![IEEE 802 Standards](http://misc.alexanderdbrown.com/802-standards.png "IEEE 802 Standards")


### Data Link and Physical Layer

More hardware-based layers.

Data Link layer could be divided into two sub-layers:

1. Logical Link Control (LLC)
2. Media Access Control (MAC)

LLC is more software orientated and interacts with higher layers.

MAC is more hardware orientated and interacts with lower layer.

(R)ARP protocol links hardware addresses to logical addresses at the Network layer.

#### Physical Layer

Defines:

* Physical and electrical properties of the media
* Mechanical properties of the connectors
* Bit representation by the signals (encoding)
* Transmission rate
* Physical topology
* Transmission mode



#### Data Link Layer

Defines:

* Encoding bits into packets prior to transmission
* Decoding the packets back into bits at the destination
* Flow control
* Error control (**A**utomatic **r**epeat re**q**uest (ARQ))
* Access control
* Hardware addressing
* Defining physical layer standards


##### Logical Link Control

* Frames the Network layer packet
* Identifies the Network layer protocol.

Provides multiplexing and demultiplexing to and from the network layer.

Manages flow control and error control.

##### Media Access Control

* Addresses the frame
* Marks the beginning and ending of the frame

Managed access control.

Related to the MAC address.

#### LAN Technologies

* Ethernet
* Fast Ethernet
* Gig Ethernet
* 10 Gig Ethernet
* WiFi
* FDDI
* Token Ring
* ATM LANE

#### WAN Technologies

* X.25
* Frame Relay
* T-carrier
* ISDN
* DSL Technologies
* SONET/SDH
* ATM

### OSI Layers

Protocol Data Unit (PDU) is a term to define any one of the following:

* Data (at Application, Presentation and Session layers)
* Segment (at Transport layer)
* Packet (at Network layer)
* Frame (at Data Link Layer)
* Bits (at Physical Layer)

Each layer, with the exception of the physical layer, adds its own header. This is done because each layer has its own specific function.

## Unicast Network Level Protocols

*Unicast Network Level Protocols in use in today's Internet. Including further study of protocols such as IPv4, ICMP, ARP, RARP used in unicast applications and IPv4 and IGMP used in multicast applications.*

### Internet Protocol version 4 (IPv4)

#### IP Headers

Organised in octlets as bytes didn't used to be just 8 bits long.

IPv4 designed for 32 bits.

![IPv4 Header from wikipedia](http://misc.alexanderdbrown.com/ipv4.png)

Version indicates the version of the IP protocol

Time to live stops network loops.

Header checksum to check the integrity of the header but not the data. Very basic checksum which is used by the router to ensure the packet has not be damaged. 

This does add significant load to the router, not only this, but due to TTL it has to create a new checkum without much gain. There are better checksums to be used and they do not appear in IPv6.

#### The IP Address

Tied to an interface, not an actual machine.

Common to have multiple interfaces (eth0, wlan0, etc.)

Can have multiple addresses on a single interface.

#### Classes of Network

5 classes.

* Class A - `0, 7 bits netid, 24 bits hostid` many host.
* Class B - `10, 14 bits netid, 16 bits hostid`
* Class C - `110, 21 bits netid, 8 bits hostid` many network.
* Class D
* Class E - intended for future use

Class Es will never be used because of Microsoft and lack of value.

#### Special Addresses

* `X.X.255.255` = Broadcast Address
* `X.X.0.0` = Network
* `255.255.255.255` = Limited broadcast address, used in auto-configuration (e.g. DHCP)

#### Network masks

IF you own the address:

`10.0.0.0`

But want to share the address so that:

`10.1.0.0` and `10.2.0.0` are different networks.

`10.0.0.0` is a class A address. therefore is is actually: `10.0.0.0/8`.

So if we change the networks to: `10.1.0.0/16` the network id will be expanded to the first 16 bits.

#### Loopback Interface

Most TCP implementations have a loopback interface with the IP address `127.0.0.1` (`127.X`) and name localhost (or anything else in `/etc/hosts` which specifies `127.X` as an address).

The localhost behaves as a separate data link interface,

A packet that is sent to the loopback interface moves down the protocol stack and is returned back by the driver software for the localhost "device".

Used for debugging.

Loopback is done in software, never appears on the network.

#### Subnets: An example

Take the university address:

`144.124.76.0`

Say we want a network per department, can't use a 24 bit address as that doesn't leave enough addresses.

So they can use a 22 bit network id.

`144.124.76.30/22` or `144.124.76.30/255.255.252.0`

Apply the mask `255.255.252.0` to the IP address to get the host id. Invert for the host address.

Network address is: `144.124.76.0`

But what's the broadcast address?

`144.124.79.255`

*(Look at the bits for this)*

Here, `255.255.252.0` is the subnet mask.

Used to be allowed to have subnet masks like `255.0.255.255` as it doesn't add anything.

#### Classless Interdomain Routing (CIDR) - Supernetting

Treat two contiguous class C networks as a single network.

This eases routing (supernets). For example supernet on geographic locations to make routing tables easier at a router level.

Usual class C is /24, we make them a /23 if we have to contiguous networks

This is the answer to the 192 soup.

Non-contiguous versions of this are disallowed. Must choose numbers for which the maths works.

#### Private Address Space

There are some special IP addresses

* e.g. loopback

RFC 1918 written when started IP addresses to reserve certain IP addresses:

These can be used for private addressing schemes, but not routable on the internet.

* 10.0.0.0 - 10.255.255.255 (10/8)
* 172.16.0.0 - 172.31.255.255 (172.16/12)
* 192.168.0.0 - 192.168.255.255 (192.168/16)



#### Network Address Translation

Router has a pool of public IP addresses, when a private IP address attempts to access an external resource. The router maps the private IP address to a public IP address which accesses the resource and returns. The public IP address is then translated back to the private IP address and routed.

In industry the pool may be a class C network. In home networks there is only a pool of one. They also do port address translation.

### Address Resolution Protocol (ARP)

IPv4 has the problem that we know *our* IP address and the ones which we want to talk to, either router or machines on the link.

Very first header is the Ethernet header, need this because every machine would need to look at the IP header, which is a process which needs to be done in software. Other network protocols exist too.

Ethernet headers can be processed in hardware.

Ethernet headers don't contain much, but the machines can automate the process of deciding to ignore the packet in firmware not by the CPU.

There is a problem of mapping IPv4 address to Ethernet address. There's no direct link between IP addresses and Ethernet addresses so we need more at the data link layer.

#### ARP Packets

![ARP Packet](http://misc.alexanderdbrown.com/arp.png "ARP Packet")

ARP is cached for a limited amount of time.

If no reply, retransmit after stand-off.

##### Hardware Type

Which type of hardware are we using

##### Protocol Type

ARP can be used with other protocols (other than IP).

##### Hardware Size & Protocol Size

Size of the addresses (hardware and protocol).

Doesn't map just MAC addresses, etc.

##### Sender Hardware/IP Address

Hardware address is repeated as the Ethernet header is harder to access in software.

##### Operation

Code to differentiate request/reply.

1. ARP Request
2. ARP Reply
3. RARP Request
4. RARP Reply

RARP - Reverse ARP (looking up IP from MAC). Can be used to discover the machine's own IP address, for example.

Used before DHCP.

##### Target Hardware Address

If unknown to the sender, filled with `0`s, otherwise the actual address

##### Target IP Address

The address being looked for

#### ARP Delay

First packet:

1. ARP Request.
2. Processing Time
3. ARP Reply
4. ICMP Echo Request
5. ICMP Echo Reply

Following packets:

1. ICMP Echo Request
2. ICMP Echo Reply

### Fooling ARP

Locate an interface in promiscuous mode, ARP request not broadcast, a dummy address is used.

Some TCP/IP stacks pass the ARP request up the line.

A reply indicates a machine is in promiscuous mode.

`neped`

### Gratuitous ARP

A host sends a request for its own MAC.

The sender's IP and MAC address are broadcast, and other hosts will insert this mapping into their ARP tables.

Useful to detect duplicate IP addresses (should be no reply).

Causes other hosts to update their ARP cache (useful if the network adapter has been changed or if this is a hot spare).

#### Why switched networks are not safe

Man-in-the-Middle attacks.

![](http://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Man_in_the_middle_attack.svg/200px-Man_in_the_middle_attack.svg.png)

ARP allows for MITMA as the IP and MAC are learned by the switch. Sending out a false ARP reply **last** will allow you to to spoof the IP address to your MAC address.

#### Proxy ARP

Same problems with MITMA

### MAC Addresses (IEEE 802)

![MAC Address](http://misc.alexanderdbrown.com/mac.png "MAC Address")

* Gotcha: each Octet of MAC frame transmitted low order first (back-to-front).
* I/G - Individual (`0`), Group (`1`) - Unicast or Multicast
* U/L - Universal (`0`), Local (`1`) 

### Internet Control Message Protocol (ICMP)

The Internet Control Message Protocol (ICMP) is the protocol used for error and control messages in the Internet

ICMP provides an error reporting mechanism of routers to the sources.

All ICMP packets are encapsulated as IP datagrams.

#### ICMP Message Types
ICMP messages are either query messages or error messages. 

* ICMP query messages:
  * Echo request / Echo reply
  * Router advertisement / Router solicitation
  * Timestamp request / Timestamp reply
  * Address mask request / Address mask reply
* ICMP error messages:
  * Host unreachable
  * Source quench
  * Time exceeded 
  * Parameter problem

#### Message Codes

Specific to message type.

E.g. for message type 3 (destination unreachable):

* 0 = network unreachable
* 1 = host unreachable
* 3 = port unreachable 
* 4 = fragmentation needed but don’t fragment bit is set
* Etc

#### ICMP Error Codes

Each ICMP error message contains the header and at least the first 8 bytes of the IP datagram payload that triggered the error message.

To avoid too many ICMP messages, ICMP error messages are not sent

* for multiple fragments of the same IP datagrams
* in response to an error message
* in response to a broadcast packet

#### ICMP Codes

![](http://misc.alexanderdbrown.com/icmp-codes.png)

#### Echo Request/Reply Message Format

Identifier is set to process the ID of querying process.

Sequence numbers are created for each new echo request.

#### Port unreachable error

Reply telling that a port is not available.

Network scanners may make use of this, e.g. NMAP.

Many hosts will not reply.

### Traceroute

Sends out ICMP ping messages with increasing TTL starting at 1. For each host that isn't the target, an ICMP time exceeded message is sent back.

On UNIX uses the port unreachable message instead (using a UDP packet) by default.

### Fragmentation

If a packet needs to be split then a flag is set to say "more fragments". Identification is the same through the fragments. More fragments flag is not set for the last fragment, but is known to be a fragment due to the fragmentation offset.

If a part of a fragment is missing, after an amount of time packet loss is assumed.

Occurs if MTU < datagram size to be sent out on an interface, "Don't fragment" flag allowed: causes ICMP "Destination unreachable: fragmentation needed but don't fragment bit set".

Reassembly takes place at destination.

Fragments may be fragmented.

Experience shows that fragmentation is best avoided.

#### Avoiding Fragmentation

* Never send a datagram which is greater than the minimum MTU maximum size it can be sent wholly.
* Path MTU discovery to make sure you never send a datagram which is grater than the smallest MTU maximum size.

### Path MTU Discovery

Intermediate routers may have lower MTUs.

Uses ICMP uncreachable Error: Fragmentation Required

`ping -s n -M do`:

* Set packet size and "do not fragment" bi
* Returns "message too long" is `s > MTU`.
* RFC 1191 has likely values

`traceroute.pmtu`

* Version of tracerout that automates discovery.

Firewalls can break PMTU discovery.

### Sock Traffic Generator

Sock is a test program which can be run as a client or as a server.

### Ping

TTL doesn't always start at 255, might be around 64 but not standardised.


#### Ping through a router

Routers have many different interfaces. This means, with traceroute, only the nearside interface can be found.

There is a record route option which can find this: `ping -R`

## Unicast Routing in the Internet

*Example routing problems. Interior and exterior routing protocols. Protocols covered will include RIP, OSPF and BGP.*

## Multicast Routing in the Internet

*Example routing problems. Protocols covered will include PIM-DM, PIM-SM and MSDP. We will also cover the role of the Rendezvous Point, Anycast IP, and issues still under debate in the technical community.*

## Transport Level Protocols

*An in-depth study addressing the behaviour of TCP and UDP. Connection establishment and termination, flow control under various load conditions, timeouts and retransmission, newer features and performance.*

### User Datagram Protocol (UDP)

RFC 768

* Datagram orientated
* Unreliable, connectionless
* Simple
* Unicast and multicast
* Useful for only a few application
* Used a lot for services

No handshake required which allows it to be fast, especially for many short connections.

Applications must handle failures.

#### UDP Header

![UDP Header](http://misc.alexanderdbrown.com/udp-header.png "UDP Header")

Checksum is the same as the IPv4 checksum, but is over the UDP header, the data, and the UDP pseudo header

##### IPv4 UDP Pseudo Header

![IPv4 UDP Pseudo Header](http://misc.alexanderdbrown.com/udp-pseudo-header.png "IPv4 UDP Pseudo Header")

##### IPv6 UDP Pseudo Header

![IPv6 UDP Pseudo Header](http://misc.alexanderdbrown.com/ipv6-udp-pseudo-header.png "IPv6 UDP Pseudo Header")

#### Example: Trivial File Transfer Protocol (TFTP)

TFTP used UDP, uses a stop-and-wait flow window control algorithm:

* Stop for ACK before sending the next data packet
* A lost packet causes timeout and retransmission.

Designed for diskless systems to download configuration files during bootstrapping.

Does waste a lot of network time.

### Transmission Control Protocol (TCP)

* Stream orientated
* Reliable, connection-orientated
* Complex
* Only unicast
* Used for most internet applications

Done by creating connections between two points and aim to provide data integrity.

Also provides flow control.

#### TCP Header

![TCP Header](http://misc.alexanderdbrown.com/tcp-header.png "TCP Header")

### Port Numbers

...

### Demultiplexing

Layered like the OSI model (but pre-dates the OSI model).

Ethernet driver captures the incoming frame, strips the Ethernet header and passes to IP

IP layer strips out the IP header and passes it to the transport layer, etc.

Levels:

* Application
* Transport
* Network
* Link
* Physical

The process of moving things up and down layers is demultiplexing and multiplexing.

### Data Encapsulation

Don't sent arbitrary length methods, to allow the multiplexing of networking.

(In TCP) Data is encapsulated into frames, frames have a frame header, trailer and a datagram.

This datagram contains an IP Header and a segment or protocol data unit (PDU)

The PDU has the (TCP) protocol header and the actual data.

The frame header is used to drop the packet onto the local link. The address used in the frame header is embedded in the hardware in the network card (MAC address), this is why the IP address is not used. This is for efficiency.

Frame headers are: source address, destination address, protocol and checksum.

## Naming and Directory Services

*Including the DNS and LDAP and their use.*

## Quality of Service

*The need for and the provision of Quality of Service (QoS) within packet based networks such as the Internet which are inherently best efforts at heart.*

## Security Issues

*The inherent risks within networks such as the Internet, cracking, viruses, trojans, worms and denial of service attacks. The role of the Firewall and the problems it can bring.*

## Current and Future Issues

*The (still) emerging IPv6 protocol and other active issues.*

### Internet Protocol Version 6 (IPv6)

Problems with IPv4 is that 32 bit addresses is too small.

* 128 bit address space solves the problem for the long term.
* Large space allows addresses to be more structured.

### An IPv6 Address

`fe80::2c0:dfff:fee4:bd87/10`

Loopback address: `::1/128`

`::` is a string of `0`s of indeterminate length.

IPv4 addresses are encapsulated in IPv6 are expressed with dotted decimal for last four octlets: ``::194.123.1.2`

IPv6 addresses are leased (possibly infinitely).

#### Current Allocation

* `0000 0000` - Reserved
* `0000 001 ` - NSAP Allocation 
* `001       ` - Aggregatable Global Unicast
* `1111 1110 10` - Link-Local Unicast
* `1111 1110 11` - Site-Local Unicast
*  `1111 1111` -  Multicast

### Link-Local Addresses

Format Prefix: `1111 1110 10` or `FE80::/64`

Postfix is usually the last 24 bits of MAC address. middle byte is `fffe` due to IEEE standards.

`fe80::00ff:fe00:0000` for MAC address: `00:00:00:00:00:00`

### Site-Local Addresses

Format Prefix `1111 1110 11` or `FEC0`

