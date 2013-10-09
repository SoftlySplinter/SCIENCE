# SEM5720 - The Internet And How It Really Works

The Internet is a complex, multi-organisation network reaching nearly all parts of the world. The functioning of this network and the applications running upon it depend on a complex set of protocols. This module addresses the fundamental aspects of the most important issues that permit the network and its applications to operate successfully. The module also addresses the current threats to the Internet and topics still emerging from R&D studies around the world.

*Postal service analogies: 2*

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

## Other Network Technologies

*A brief look at fast and wireless network technologies.*

## Standards

*The ISO OSI model.*

### IEEE 802 Standards

![IEEE 802](http://misc.alexanderdbrown.com/ieee802.png "IEEE 802")

Encapsulation at each level.

## Unicast Network Level Protocols

*Unicast Network Level Protocols in use in today's Internet. Including further study of protocols such as IPv4, ICMP, ARP, RARP used in unicast applications and IPv4 and IGMP used in multicast applications.*

## Unicast Routing in the Internet

*Example routing problems. Interior and exterior routing protocols. Protocols covered will include RIP, OSPF and BGP.*

## Multicast Routing in the Internet

*Example routing problems. Protocols covered will include PIM-DM, PIM-SM and MSDP. We will also cover the role of the Rendezvous Point, Anycast IP, and issues still under debate in the technical community.*

## Transport Level Protocols

*An in-depth study addressing the behaviour of TCP and UDP. Connection establishment and termination, flow control under various load conditions, timeouts and retransmission, newer features and performance.*

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

### IP Headers

Organised in octlets as bytes didn't used to be just 8 bits long.

IPv4 designed for 32 bits.

![IPv4 Header from wikipedia](http://misc.alexanderdbrown.com/ipv4.png)

Version indicates the version of the IP protocol

Time to live stops network loops.

Header checksum to check the integrity of the header but not the data. Very basic checksum which is used by the router to ensure the packet has not be damaged. 

This does add significant load to the router, not only this, but due to TTL it has to create a new checkum without much gain. There are better checksums to be used and they do not appear in IPv6.

### Loopback Interface

Most TCP implementations have a loopback interface with the IP address `127.0.0.1` (`127.X`) and name localhost (or anything else in `/etc/hosts` which specifies `127.X` as an address).

The localhost behaves as a separate data link interface,

A packet that is sent to the loopback interface moves down the protocol stack and is returned back by the driver software for the localhost "device".

Used for debugging.

Loopback is done in software, never appears on the network.

### The IP Address

Tied to an interface, not an actual machine.

Common to have multiple interfaces (eth0, wlan0, etc.)

Can have multiple addresses on a single interface.

### Classes of Network

5 classes.

* Class A - `0, 7 bits netid, 24 bits hostid` many host.
* Class B - `10, 14 bits netid, 16 bits hostid`
* Class C - `110, 21 bits netid, 8 bits hostid` many network.
* Class D
* Class E - intended for future use

Class Es will never be used because of Microsoft and lack of value.

### Special Addresses

* `X.X.255.255` = Broadcast Address
* `X.X.0.0` = Network
* `255.255.255.255` = Limited broadcast address, used in auto-configuration (e.g. DHCP)

### Network masks

IF you own the address:

`10.0.0.0`

But want to share the address so that:

`10.1.0.0` and `10.2.0.0` are different networks.

`10.0.0.0` is a class A address. therefore is is actually: `10.0.0.0/8`.

So if we change the networks to: `10.1.0.0/16` the network id will be expanded to the first 16 bits.

### Subnets: An example

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

## Naming and Directory Services

*Including the DNS and LDAP and their use.*

## Quality of Service

*The need for and the provision of Quality of Service (QoS) within packet based networks such as the Internet which are inherently best efforts at heart.*

## Security Issues

*The inherent risks within networks such as the Internet, cracking, viruses, trojans, worms and denial of service attacks. The role of the Firewall and the problems it can bring.*

## Current and Future Issues

*The (still) emerging IPv6 protocol and other active issues.*

