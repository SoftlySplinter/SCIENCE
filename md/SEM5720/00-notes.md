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

### More DNS

`nslookup minted.dcs.aber.ac.uk` whilst capturing packets on port 53 captured **8** packets.

The type of the message was of type **A** and of class **IN** and was a **recursive** lookup. There was no response because the message was a query.

The server this was sent to was `193.60.11.253`. In `/etc/resolv.conf/` the nameserver: `127.0.1.1 c57net.aber.ac.uk`.

**1** question and **3** answers were held in the first answering packet. **4** authoritative records were received specifying the 2 authoritative nameservers from `dcs.aber.ac.uk` and 2 from `yale.ac.uk`.

The additional records provided all possible IP addresses of all nameservers contacted during the lookup to cache the information.

`nslookup set type=MX aber.ac.uk` was then captured. The answer record contained: `Mail exchange: aber-ac-uk.mail.protection.outlook.com`.

The authorative record contained nameservers for: `aber.ac.uk` (3) and `yale.ac.uk` (1).

`nslookup set type=SOA dcs.aber.ac.uk` was then captured.

The email of the person responsible for this domain is: `cs-root.aber.ac.uk`.

There are 4 authoritative nameservers for this domain: `dcs.aber.ac.uk` (2), `aber.ac.uk` (1) and `yale.ac.uk` (1).

`nslookup aber-ac-uk.mail.protection.outlook.com.` The response from this was from microsoft. 2 IP addresses which can switch (load balanced?).

`nslookup 193.60.11.36` had a type of `PTR` for the name `36.11.60.193.in-addr.arpa`. Still used the standard nameservers.

`nslookup sillyname` gave an authoritative and non-authoritative response (one authoritative for `sillyname.c57net.dcs.aber.ac.uk` and non-authoritative for `sillyname`). Uses two different sets of nameservers, the Aberystwyth local ones and the root nameserver.

`dig @dns0.aber.ac.uk 98.34.124.144.in-addr.arpa PTR` shows lots of packets, initially gathering DNS information, then on `144.124.34.98`.

`dig www.yahoo.com A` shows that yahoo uses `CNAME` instead, with an IP address of `87.248.122.122`.


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

### Ethernet 

A passive, contention-based broadcast technology that uses baseband signalling.

#### Passive 

No one device controlling the network.

#### Contention-based

Each device must compete with every other device for access to the network.

#### Broadcast

Ever device on a shared network fears broadcast transmissions.



#### Baseband Signalling

Entire bandwidth of a cable for a single transmission.

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

### Alternative LAN Technologies

* 802.4 - Token Bus
* 802.5 - Token Ring

Standards differ at the physical layer

Differ at MAC sublayer of Data Link Layer.

Compatible at the LLC sublayer of the Data Link Layer.

#### Token Bus

Uses a bus physical topology and ring logical topology. The physical order of nodes does not matter.

Coaxial cable served as a common communication bus.

Token was created bus the token bus protocol to manage access to the bus

Any station that holds the token packet has permission to transmit data.

The station releases the token when it is done communication or when a higher priority device needs to transmit.

Two major problems:

1. Bus failure leads to a network failure.
2. Adding a new node is not simple.

#### Token Ring

Similar to token bus, but in a ring physical ring topology.

Messages are transferred in one direction along the ring at all times.

Token Ring networks sequentially pass a token to each connected device.

When the token arrives at a particular node, the recipient is allowed to transmit data onto the network.

Since only one device may be transmitting at any given time, no data collisions occur.

Access to the network is guaranteed

Time-sensitive applications can be supported.

Still used for some real-time applications.

Based initially for the mainframe infrastructure.

Problems:

1. Costly
2. Complex.

### Quick notes on Ethernet

A quick summary of 802.3

### Why Ethernet is used

* Inexpensive
* Easy to install, maintain, troubleshoot and expand
* Widely accepted industry standard.
* Structured to allow compatibility with Network Operating Systems.
* Reliable

### Ethernet Versions

1. Ethernet 10 BASE-T/F 802.3 (10 Mbps)
2. Fast Ethernet 100 BASE-T/F 802.3u (100 Mbps)
3. Gigabit Ethernet 1000 BASE-T/F 802.3z (1000 Mbps)
4. 10 Gigabit Ethernet 10 GBASE-F 802.3ae (10 Gbps)


#### Coding Convention

* Network speed
* Baseband Signalling
* 2 or 5 stands for coaxial cable and length
* T stands for Twisted Pair
* F/FL/S/L Stands for Fiber-Optic
* X stands for full duplex.

### Ethernet Components

* CSMA/CD (No protocol for 10 GigE) as 10 GigE is completely full duplex so it isn't needed.
* Baseband Signalling.
* Ethernet cables.
* Ethernet card or adapter.
* Ethernet devices.

#### Ethernet Cables: Twisted Pair (CAT5/CAT5e)

* CAT5: Ethernet and Fast Ethernet.
* CAT5e: Gigabit Ethernet.

Contains four pairs of copper wire.

Cable runs are limited to a maximum run length of 100m.

Operates at 100MHz.

CAT5 comes in two main varieties, solid and stranded.

Fast Ethernet communications only utilise 2 out of 4 pairs.

CAT5 enhanced (CAT5e) uses all 4 pairs to support GigE over short distances.

CAT5e is backwards compatible with CAT5.

CAT6 (250MHz) and CAT7 (600MHz).

### Signalling

Baseband is a single transmission involved (digital signal)

Broadband can handle multiple transmissions with a modulated analogue signal.

#### Baseband Signalling

Network uses all available signal frequencies or the entire bandwidth.

One signal can be transmitted at a time.

Light or electrical pulses based transmission.

Related to digital technologies, but can be used for analogue technologies.

Bi-directional communication (Half duplex) is possible, but difficult.

Multiplexing (using Time Division Multiplexing) allows transfer of multiple signals on a single medium.

#### Broadband Signalling

Network uses only one frequency or a part of the entire bandwidth.

Multiple signals can be transmitted at a time.

Electromagnetic or optical waves transmission.

Related to analogue technologies but can be used for digital technologies.

Bi-directional communication is possible and fairly easy.

Multiplexing (using Frequency Division Multiplexing) allows transfers of multiple signals on a single medium.


### Multiplexing and Demultiplexing

Putting more than one signal on a wire at once and getting it back again at the other end.

#### Time Division Multiplexing

Gives the illusion of multiplexing.

Each signal is allowed a slot of time to transmit for.



#### Frequency Division Multiplexing

Actual multiplexing.

Each signal uses a single frequency channel to transmit.

### Fibre Optic

Supports all Ethernet versions above 10BASE5.

Carries high-bandwidth data through beams of light carrying electromagnetic signals. Not so affected by noise. Can carry signals up to approximately 70 miles without amplification.

Light can be pulsed in a single wavelength to represent 45 Gigabits of information.

#### Single-Mode Fibre Optic

Transmits one signal per fibre.

Diameter: 8.3 to 10 microns that has one mode of transmission.

Speed and distance: up to 40Gbps over up to 100km

Used in telephones and cable TV applications.

####Multi-Mode Fibre Optic

Transmits many signals per fibre.

Multi-modes result from the fact that light will only propergate in the fibre core at discrete angles within the cone of acceptance.

Diameter: 50 to 100 microns.

Speed and distance: 10Mbps to 1 Gbps over 275m to 2km.

Used for Computer Networks and LAN Applications.

### Network Adapters

Adapters for connecting to ethernets.

Ethernet cards, etc.

#### 10/100 Ethernet

Connect computer using a PCI, PCIe or ISA moethboard interface slot, CAT5/6

#### Gigabit Ethernet

PCIe slots, CAT5/5e/6/7 and Fibre Optic cables.

#### Fibre Optics

For tier 1 and 2 internet backbones, External device, Fibre Optic cables.

Slightly different, can use not only for network but for the backbone (a sophisticated network).

#### Wireless Network Interface Cards

Internal or external device

#### Wireless Dongles

External device

### Ethernet Devices

Note that most devices are completely tied to a specific function, some repeaters might have some Data Link Layer functions depending on the manufacturer.

#### Repeater

Repeat an electrical signal including noise.

Takes an incoming signal and then generates a new, clean copy of that exact signal.

Overcomes signal attenuation problem.

Allows LANs to extend beyond normal distance limitations.

Physical layer device.

Doesn't read data frames, just repeat the signal unintelligently.

#### Hub

Multiport repeater.

Broadcasts frame to all ports and devices.

Allows users to share Ethernet for transmission of data onto a single network (collision domain).

Physical Layer device.

Doesn't read data frames.

Repeater is usually used for the extension of the length of a network, while the hub is a simple connectivity gadget that is used to broaden a network.

#### Bridge

Connect two LAN segments of similar or dissimilar types such as Ethernet and Token Ring.

Split a networking into separate collision domains.

Map the Ethernet addresses of the nodes residing on each network segment and allow only the necessary traffic to pass through the bridge.

Do not forward bad or misaligned packets.

Works on the Physical and lower Data Link (MAC) Layers

#### Switch

Expansion of the Bridge.

Used in heavily loaded networks to isolate data flow and improve performance (parallelism).

Up to on-half of the computers connected to a switch can send data at the same time.

Data Link and Network Layer device.

##### Cut-through Switches

Are faster because they examined the packet destination address only before forwarding it on to its destination segment.

##### Store-and-forward Switches

Work like bridges in that they accept and analyse the packet before forwarding it to its destination.

Takes more time to examine the whole packet, although it does allow the switch to catch certain packet errors and keep them from propagating through the network.

### Ethernet Encoding

Methods for encoding bits in different Ethernet technologies.

#### Manchester Coding

Used in 10-Base* 

Bipolar scheme, synchronisation via a clock.

### Fast Ethernet 802.3u

CSMA/CD and Full Duplex

Backwards compatible.

Physical layer structure (PHY) has been redesigned.

Complex signal encoding mechanisms than the simple Manchester code.

Uses three sublayers.

#### Convergence Sublayer

Introduces the concept of auto-negotiation; negotiates between two different medium to make the properties similar to for communication

#### Media Independent Interface

Interfaces the physical medium used so that it can be handled generically.

#### Media Dependent Sublayer

Deals with encoding, transmission in a way specific to the medium.

### Gigabit Ethernet 802.3z

Two distinctive approaches for medium access:

1. Half Duplex
2. Full Duplex

Most follow the full-duplex approach.

Star topology.

Support standard Ethernet frame format.

Uses 802.3x flow control.

Backwards compatible.

Physical layer is more complex

#### Gigabit Media Independent Interface

#### Physical Layer

#### Media Dependent Interface

#### Medium

### Encoding

Digital to digital encoding schemes.

#### Unipolar Encoding

Only use one pole (`+` or `-`). One pole is used to represent `1` or `0`, zero is used to represent the other.

![](http://file1.hpage.com/000143/66/bilder/picture3.png)

![](https://lh6.googleusercontent.com/i_wHvlOcxGA9HilYhdmFM5wjbo1dJ3q9q8qc6vKMkl8gbgqkBW2vhGjzoioF9gS8DA=s400)

Two problems:

1. DC Component
2. Synchronisation

DC cannot be transmitted properly through an AC line without noise.

The receiver cannot synchronise its clock to the sender.

#### Polar Encoding

Uses both poles to represent bits.

##### Non-Return to Zero (NRZ)

###### NRZ-Level

1 as positive voltage, 0 as negative voltage.

![](https://lh6.googleusercontent.com/mP9wm9qDd9b5JoiZKmh5FfRDC6aLo7LUd5Vy3lMwRK_7ZBf5rayz67dOzaonQSEY0g=s400)

###### NRZ-Inverse

Voltage inverts on a 1.

##### Return to Zero (RZ)

* Positive to 0 is 1.
* Negative to 0 is 0

![](https://lh6.googleusercontent.com/HsrRIApzAFwlGCCoFtthVZmKRsROFZdEpN6cpv8tsQsXOl-PVGbD7wkO6adq2rMqUw=s400)

##### Biphase

###### Manchester

![](https://lh4.googleusercontent.com/MA7WfPVKktOw6LLGbu3pQCVMswe4cqHsZnrQ9oNDPqjR28qPOw7j7IjaakklukHDYA=s400)

###### Differential Manchester

![](https://lh6.googleusercontent.com/GsN5RdpXdhqMLMub0RgampWgREFpBMwcot-BmHSzY2GxGPC18HYRUh06YLzj3Mpuig=s400)

#### Bipolar Encoding

![](https://lh4.googleusercontent.com/dsAffc-caZWoTueproHHYXmv7b46ebT0bHws-HJNeDVE6YO3rmWLCe9RgoSy0ljo2g=s400)

##### Alternating Mark Inversion

##### Bipolar 8 Zero Subsitution

##### High Density Bipolar 3


### Broadband

#### Digital Subscriber Line

Uses local telephone lines.

Allows simultaneous void and data transmission.

##### Asymmetric Digital Subscriber Line (ADSL)

Designed to deliver more bandwidth down than up.

Rates range from 1.5 to 9 Mbps down, 16 to 640kbps up.

Distances of 18,000 feet over a single copper twisted pair.

A splitter is needed.

##### Very high bit-rate Digital Subscriber Line (VDSL)

VDSL is designed to provide higher bandwidths.

Up to 52Mbps down, 16Mbps up.

##### VDSL 2

Support the wide deployment og triple play services.

100 Mbps down, 20 Mbps up

150 to 500m distance.

500 Mbps transmission rates over copper cabling by using crosstalk cancellation or "vectorized" VDSL2 based modems.

##### BT Infinity

Now rolling out ultrafast fibre optic broadband with speeds of up to 100Mb.

Next step up from FTCC is FTTh (Fibre to the Home).

Negative factor is the costs.

###### Infinity-1

Top speeds are up to 40Mbps down and 10Mbps up

###### Infinity-2

Topspeeds are up to 76Mbps down and 19Mbps up.

#### Cable

### Wireless LAN (802.11)



#### Station (STA)

#### Access Point (AP)

Access points act as a central transmitter and receiver of WLAN radio signals.

#### Basic Service Set (BSS)

A set of STAs that communicate with each other.

When two or more stations communicate together they form a BSS.

##### Infrastructure Mode

All wireless clients are connected to an AP.

Generally the default mode for the 802.11b cards.

All mobile STAs communicate with each other via the AP.

Network consumes double bandwidth for one communication.

AP provide buffering of traffic for a mobile broadcast.

##### Ad-hoc Mode

Wireless clients are connected without an AP.

An ad-hoc network is where stations only communicate peer-to-peer (P2P).

There is no base and no one gives permission to talk.

Mostly these networks are set up spontaneously.

#### Distributed System (DS)

Two or more BSSs are interconnected using a distribution system.

APs communicate via the DS.

The DS is the backbone of the WLAN and may be constructed of either wired or wireless networks.

The DS is also a thin layer in each AP.

That determines if communications received from the BSS are to be relayed back to a destination in the BSS, forwarded on to the DS to another AP or sent into the wired network infrastructure to a destination not in the ESS

#### Extended Service Set (ESS)

An ESS is a BSS where APs communicate amongst themselves from one BSS to another..

Entire network looks like an interdependent BSS to the Logical Link Control (LLC).

This means stations can communicate or even move between BSSs transparently to the LLC.

#### Portal

The logical point at which medium access control (MAC) service data units (MSDUs) from a non-IEEE 802.11 local are network (LAN) enter the distribution system (DS) of an extended service set (ESS).

#### WLAN Frame



#### MSDU and AMSDU

Multiple MSDUs are aggregated at the MAC layer and are pushed into a single MPDU.

They have a single frame header with multiple frames and they are destined for the same client and the same service class.

##### Mac Service Data Unit (MSDU)

It is the MAC service data unit. This is the unit o transmission used at the MAC layer which is received from the upper layer.

##### Aggregated Mac Service Data Unit

Aggregation of the MSDU directly performed at the MAC layer is called AMSDU.

Such AMSDUs are now passed to the lower PHY later where they are dealt with as MPDUs

#### MPDU and AMPDU

##### Mac Protocol Data Unit (MPDU)

These are the frames passed from the MAC layers into the PHY later.

##### Aggregated Mac Protocol Data Unit

These are the aggregated MPDU units which are pushed into a single Physical Protocol Data Unit (PPDU).

#### DS Services

While the implementation for the DS is not specified, 802.11 does specify the services which the DS must support.

##### Station Mobility

###### No Transition

If a station is not moving within its own BSS or it is not moving

###### BSS Transition

If a station moves between BSSs within the same ESS

###### ESS Transition

If the station moves between BSSs of differing ESS.

##### Station Services (SS)

###### Authentication

With a wireless system, the medium is not exactly bounded as with a wired system.

In order to control access to the network, stations must first establish their identity.

The authentication relationship may be between two stations inside an IBSS or to the AP of the BSS.

Authentication outside of the BSS does not take place.

Two types of authentication:

1. Open System Authentication
2. Shared Key Authentication

###### Deauthentication

When either the station or AP wishes to terminate a stations authentication. 

###### Privacy

An encryption algorithm, which is used so that other 802.11 users cannot eavesdrop on your LAN traffic.

##### Distribution Station Services (DSS)


###### Association

A station must affiliate itself with the BSS infrastructure if it wants to use the LAN.

This is done by Associating itself with an AP. Associations are dynamic in nature because stations can move, turn on or turn off.

A station can only be associated with one AP.

This ensures that the DS always knowns where the station is.

Association supports no-transition mobility, but is not enough to support BSS transition.

###### Reassociation

The service allows the station to switch its association from one AP to another.

Both association and reassociation are initiated by the station.

###### Disassociation

When the association between the station and the AP is terminated.

Can be initiated by either party.

A disassociated station cannot send or receive data.

ESS transition is not supported.

A station can move to a new ESS but will have to reinitiate connections

###### Distribution

Getting data from the sender to the receiver.

The message is sent to the local AP (input AP) then distributed via the DS to the AP (output AP) that the recipient is associated with.

If the sender and receiver are on the same BSS the input and output APs are the same.

The distribution service is not logically invoked whether the data is going through the DS or not.

###### Integration

Where the output AP is a portal. Thus 802.X LANs are integrated into the 802.11 DS.

#### Physical Layer

##### Spread Spectrum

The three physical layers originally defined in 802.11 included two spread-spectrum radio techniques and a diffuse infrared specification.

Spread spectrum is a communication technique that spreads a narrowband communication signal over a wide range of frequencies for transmission then de-spreads it into the original data bandwidth at the receive.

Spread spectrum increases the bandwidth of the signal compared to narrow band by spreading the signal.

###### Techniques

The Code of Federal Regulations (CFR) Part 15 originally only described two spread spectrum techniques to be used in the licensed free Industrial, Scientific, Medical (ISM)  band, 2.4 GHz,  thus 802.11 and 802.11b.

* Frequency Hopping Spread Spectrum (FHSS) 
* Direct Sequence spread Spectrum (DSSS) 

Orthogonal Frequency Division Multiplexing (OFDM) was not covered by the CFR and would have required licensing.

802.11a, employing OFDM, was created to work in the 5GHz.

###### Frequency Hopping Spread Spectrum (FHSS)

FHSS spreads the signal  by hopping from one frequency to another across a bandwidth of 83 MHz. 

The data is spread over 83 MHz in the 2.4 GHz ISM band. 

A short burst of data is sent on one frequency (usually less than half a second).

Then the sender changes to another pseudorandom frequency and broadcasts another burst of data before changing to another frequency, and so on.

The carrier then repeats this pattern.


###### Direct Sequence Spread Spectrum (DSSS)

DSSS spreads the signal by adding redundant bits to the signal prior to transmission. 

The signal is divided into many different parts and sent on different frequencies simultaneously.
Spectrum is divided into 13/14 channels.
 
However, the FCC specifies only 11 channels for non-licensed (ISM band) use in the US.

##### Narrowband and Wideband

In communications, band is referred to as the range of frequencies (bandwidth) used in the channel.

Depending on the size of the band (in terms of kHz, MHz or GHz) and some other properties of the communication channel, they can be categorized as narrowband and wideband etc.

Narrowband uses a smaller frequency range (bandwidth)- 300–3400 Hz.

Wideband is a relative term, and the size of the band may be in kHz, MHz or GHz depending on the application.



##### Narrow Band vs. Spread Spectrum  


###### Narrow Band

Uses only enough frequency spectrum to carry the signal
 
* High peak power 
* Easily jammed
* Easy to detect
* Easy to intercept


###### Spread Spectrum

The bandwidth is much wider than required to send to the signal

* Low peak power 
* Difficult to jam
* Hard to detect
* Hard to intercept


### Wireless Mobile Communication/Cellular Telephony.

Utilises lower frequency radio spectrum.

#### Mobile RF Spectrum

Typically delivered over a wide range of radio frequency spectrum bands (e.g. 900MHz, 1800MHz, 2.6GHz, etc.).

Most of which can also reach indoors to some degree.

#### Architecture of the GSM Network

##### Base Station Subsystem (BSS)

Composed of one or more BSC.

BSS is the point where all radio transmission related functions are performed.

BTS and BSC connected through the **Abis interface**.

BSS connected to the MSC through the **A interface**.

###### Base Station Controller (BSC)

The management of several BTS is done by the BSC.

It also provides all the control functions and physical links amoung the different BTS and between the mobile switching centre (MSC) and the BTSs.

Being a high-capacity switch, it provides functions such as cell configuration data, control of radio frequency power levels in BTS, frequency hopping, and handovers.

One MSC serves a number of BSCs.

###### Base Transceiver Station (BTS)

It is a station or site where antennas and radio transmitters and receivers are placed to create a radio coverage area in the mobile network.

Contains one or more transceivers (TRC) and antennas.

The cell site has a 360 degree omni-directional (omni-sector) antenna that is turned to create a cellular area of a specific size.

Omni-sector means the same frequencies are used in all directions.

Communication from the mobile terminal to the cell site is referred to as uplink.

Cell site to mobile terminal is downlink

###### Mobile Station (MS)

Mobile phone with ME and SIM.

It consists of the mobile equipment (uniquely identified by International Mobile Equipment Identity (IMEI)

The SIM card contains the International Mobile Subscriber Identity (IMSI) used to identify the subscriber to the system, a secret key for authentication and other information.

The IMEI and the IMSI are independent, thereby allowing personal mobility.

The SIM card may be protected against unauthorised by a password or PIN.

##### Network Switching Subsystem

Contains the network elements MSC, LR, VLR, EIR, AuC and GMSC.

###### Mobile Switching Centre (MSC)

Primary service delivery node for GSM and central components of NSS.

It provides all the functionality needed to handle a mobile subscriber, such as:

* Registraion
* Authentication
* Sets up and releases the end-to-end connection
* Location Updating
* Handovers
* Cell routing and roaming subscribers

HLR and VLR, together with the MSC, provide the call-routing and roaming capabilities of GSM.

It takes care of charging and real time pre-paid account monitoring.

These services are provided in conjunction with several functional entities, which together form the Network Switching Subsystem (NSS). 

The MSC provides the connection to the fixed networks (such as the PSTN or ISDN). 

###### Home Location Register (HLR)

The database that contains a subscription record for each subscriber of the GSM network.

All the administrative information related to each subscriber registered in the respective communication network, including the current location of the subscriber, is contained in the HLR.

The HLR is responsible for the sending of subscription data to the VLR (during registration)
or GMSC (during mobile terminating call handling).

The location of the mobile is typically in the form of the signalling address of the VLR associated with the mobile station. 

A GSM subscriber is normally associated with one particular HLR. 

There is logically one HLR per GSM network, although it may be implemented as a distributed database.


###### Visitor Location Register (VLR)

The database that contains subscriber data for subscribers registered in a MSC.

It contains all the temporary information about the subscribers. 

This information is needed by the MSC to service the visiting subscribers.

Every MSC contains a VLR. Although MSC and VLR are individually addressable.

They are always contained in one integrated node.

###### Equipment Identity Register (EIR)

A database of all valid mobile equipment on the network.

Where each mobile station is identified by its International Mobile Equipment Identity (IMEI). 

An IMEI is marked as invalid if it has been reported stolen or is not type approved.

###### Authentication Centre (AuC)

A protected database that stores a copy of the secret key stored in each subscriber's SIM card which is used for authentication and encryption.

######Gateway MSC (GMSC)

Switching entity that controls mobile terminating calls.

When a call is estabished towards a GSM subscriber, a GMSC contacts the HLR of that subscriber, to obtain the address of the MSC where that subscriber is currently registered.

That MSC address is used to route the call to that subsciber

##### GSM Interfaces

###### A Interface

The connection between MSC and BSC.

###### Abis Interface

The connection between BSC and BTS.

######D interface

The connection between MSC and HLR.

###### Um interface

The radio connection between MS and BTS.

#### Cell

Cellular telephony derives its name from the partition of geographical area into small cells.

A cell is roughly circular (exactly hexagonal) area with a central transmitter and receiver base station.

The size and shape of each cell is determined by the features of the surrounding area, such as buildings, trees and hills, which can block signals.

In a city, there are many small cells, while rural areas may have very large cells.

#### Sector

Site coverage (cell) is partitioned into different directions called sectors.

Each cell is usually split into tree sectors. Which overlap with other sectors of neighbouring cells so network is uninterrupted.

#### Switched Communications Networks

Long distance transmission between stations (called end devices) is typically done over a network of switching nodes.

Switching nodes do not concern with content of data.

Their purpose is to provide a switching facility that will move the data from node to node until they reach their destination.

A collection of nodes and connections forms a communications network.

In a switched communications network, data entering the network from a station is routed to the destination by being switched from node to node.

##### Circuit Switching Network

A dedicated radio channel is allocated to a single transmission

As long as data transmissions are long and continuous (file transfers) a circuit is used efficiently.

However, most data transmissions are bursty, and dedicating an entire circuit to them is usually a waste of valuable wireless bandwidth. 

During idle periods when no data is being sent, bandwidth is still dedicated to the user and not available for others to use.

##### Packet Switching Network

An entire network may be designed just for packet data.

Packets do not have a dedicated path, it is decided by the routers.

Most old wireless data systems offered minimal data rates, usually in the 10Kbps range. However new wireless protocols bond multiple channels to increase data rates.

#### Multiple Access (Multiplexing) Protocol

Mobile development is facing the major problem to find protocols that could be used to maximise bandwidth efficiently.

Multiple access enables ...

##### Frequency Division Multiple Access (FDMA)

##### Time Division Multiple Access (TDMA)

##### Code Division Multiple Access (CDMA)

Each user is assigned a different psuedorandom binary sequence that modulates the carrier, spreading the spectrum of the waveform, giving each user a unique code pattern.

#### Cellular Generations

...

##### 1G

##### 2G



##### 2.5G

##### 2.75G

##### 3G

##### 3.5G

##### 3.75G/Pre-4G

##### 4G

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

### IP Routing

Split into two parts:

1. Packet Forwarding or Packet Switching
2. Routing

#### Packet Forwarding

Needs to be fast and efficient, every packet involves a forwarding option.

Based on prior knowledge the packet is moved towards the destination.

#### Routing

Filling routing tables. This requires knowledge of the connectivity in some sense.

This needs to be stable and should converge relatively quickly.

This task should not be performed frequently

### Classifying Routes

Routes can be classified into three different categories:

1. Default Routes
2. Static Routes
3. Dynamic Routes

Could also classify by interior and exterior routing.

#### Default Routes

A default route which is used as a fallback if all other routing fails.

#### Static Routes

Manually configured information.

Not very scalable.

#### Dynamic Routes

Automatically use information from other participating routers.

### Routing Algorithms/Protocols

Different methods for finding out routes.

#### Distance View Routing

Uses the Bellman-Ford algorithm.

Regularly broadcast the entire routing table, containing known networks and the "distance" to each (usually a number of hops).

Has the problem of routing loops and convergence after change.

#### Routing Internet Protocol (RIP)

Uses Distance View Routing

##### RIPv1 (RFC 1058)

Classful routing with no ability to pass netmasks.

Typically broadcasts every 30 seconds.

Metrics range from 1 to 16 (infinity).

"Split Horizon" often used.

"Triggered Updates" send an update when something (close) changes to improve convergence.

Sent via UDP to the IP broadcast address (usually) to port 520.

###### Single Splint Horizon

Don't repeat information to the originator.

###### Poison Reverse Horizon

Repeat back information, but metric is set to infinity

##### RIPv2 (RFC 1723)

Refinement of RIPv1.

Includes netmasks and some support for authentication and multicast.

#### Link State Routing

Each router sends the state of all its links to all adjacent routers.

* Link State Advertisements (LSA)

<!-- .. -->

Each router independently calculates its routing table based on the link state database it has constructed.

Normally uses Dijkstra Shortest Path (Shortest Path First).

#### Open Shortest Path First (OSPF)

Uses IP directly.

Early versions could calculate a different set of routes for each value of the IP Type-Of-Service (ToS) field, but this was abandoned in the latest RFC.

Interfaces have a dimension-less costs (these were potentially different for each value of ToS).

Supports equal cost load balancing.

Supports subnet mask and thus CIDR.

Point-to-point links can be used without IP addresses.

Supports authentication

Uses multicasting to reduce load.

On a multi-access network (e.g. ethernet), two routers are elected as Designated Router and Backup Designated Router.

#### IP Address Class Based Only

#### Classless Inter-domain Routing

## Multicast Routing in the Internet

*Example routing problems. Protocols covered will include PIM-DM, PIM-SM and MSDP. We will also cover the role of the Rendezvous Point, Anycast IP, and issues still under debate in the technical community.*

### Multicast

Refers to the sending of data from one to many or many to many registered recipients.

Contrast to broadcast, which floods the network with data, which all hosts will receive whether they want it or not.

Unicast is the sending of data to a single recipient.

Unlike unicast, multicast is scalable,if ten clients request a connection then unicast must provide those ten connections with their own copy of the data.

Multicast, whether there are 1, 10 or 100 members of a ground, only one copy of the data is transmitted and is only replicated where there are group members on different paths to and from the router.

### Media Access Control (MAC)

All devices have a unique 48-bit MAC address.

Devices on the LAN keep a table that maps unicast IP to MAC.

A special range of MAC addresses is used for multicast as a multicast address does not correspond to a single end host.

### 1:32 IP Multicast to MAC Multicast Mapping

Class D address range: `224.0.0.0 - 239.255.255.255`

High order 4 bits of the first octet of a class D address are always `1110` (`0xE`)

To provide a 1:1 mapping between MAC and multicast IP addresses the remaining 28 bits of the IP address would need a unique representation in MAC addresses.

MAC address range assigned for multicast is only 24 bits. The high order bit is reserved, leaving 23 bits.

Thus, 28 bits of IP addresses need to be mapped to just 23 bits of the MAC address.

This corresponds to a 1:32 mapping MAC multicast addresses to IP multicast addresses.

#### Translation

Six octets in an Ethernet header. Three high order octets are constant `01-00-5E`.

The remaining three octets have a range of `00-00-00` to `7F-FF-FF` (high order bit is always `0` for IP multicast.

An IP address of `224.1.1.1` maps to `01-00-5E-01-01-01`. Byt the MAC address also maps to 31 other IP addresses.

#### Host Behaviour Reception

Discarding of unwanted packets has to be handled by the IP stack.

Hosts interesting in 224.1.1.1 will also receive (if on LAN) the other 31 possibilities.

After de-capsulation the Ethernet fram and discovering the IP address of an unwanted packet, the host discards the packet.

The probability of this are quite slim at the moment

### Special Multicast Addresses



#### Local Network Control Block

`224.0.0.0 - 244.0.0.255 (224.0.0.0/24)`

Should never leave the local network.

#### Internetwork Control Block

`224.0.1.0 - 244.0.1.255 (244.0.0.1/24)`

#### Session Description Protocol (SDP)/Session Announcement Protocol (SAP) Block

`224.2.0.0 - 224.2.255.255 (224.2/16)`

#### Source Specific Multicast

`232.000.000.000 - 232.255.255.255`

Specifically permit or block source addresses.

#### GLOP Block

`233.000.000.000 - 233.255.255.255`

Ensure that addresses are specific to an administrative domain. Low number of specific addresses (255).

#### Administratively Scoped

`239.000.000.000 - 239.255.255.255`

Private multicast addresses.

### IP Group Management

Protocol used is Internet Group Management Protocol (IGMP)

* IGMPv1 - RFC1112
* IGMPv2 - RFC2236
* IGMPv3 - RFC3376

#### IGMPv1

No explicit leave message.

IGMP Report Suppression

##### Membership Queries

Sent by routers to ask for existence of hosts interested in receiving multicast groups.

##### Membership Reports

Sent by hosts in response to Queries,

Also sent by the host if they wish to join a new group.

##### Message Format

![](http://routemyworld.com/wp-content/uploads/2009/01/igmpv1header.png)

#### IGMPv2

Major change, introduces an explicit Leave Message

##### Membership Queries

General Query as before.

Group-Specific Query. Used to query if there are any members of a group left after a leave message.

#### IGMPv1 and IGMPv2 Interoperability

IGMPv2 Hosts **must** send IGMPv1 if they spot an IGMPv1 router is the querier.

IGMPv2 Hosts **may** suppress Leave Messages if they spot an IGMPv1 router is the querier.

IGMPv2 Hosts **must** suppress reports if they see others using IGMPv1 or IGMPv2 reports for a given group.

IGMPv2 routers **must** ignore Leave messages if IGMPv1 hosts are present.

If any IGMPv1 routers are present must use IGMPv1

#### IGMPv3

Major change: supports the specification of sources in messages.

Host now do **not** suppress Reports.

Thus, supports the concept of Source Specific Multicast.

Protocol messages are now more complex.

##### Membership Queries

Now contain source address information.

##### Membership Reports

Now contain information relating to multiple groups and each group report can contain source address information.

### Multicast Distribution Trees

The set of links and connections that traffic will follow to get to a destination.

#### Source Trees

Sometimes called Shortest Path Trees (SPT)

A tree where the root is the source of the data.

A different forwarding tree for every combination of source (S) and group (G). N groups and M sources implies ![](http://smarturl.it/math?M\times~N\) trees.

This makes it difficult to calculate the best tree.

Routers need to maintain separate states for all trees.

(S,G) notation.

#### Shared Trees

Rendezvous Point Trees or Core Based Trees.

Traffic follows some form of common path, unlike source trees in which two different trees can send data through different paths, at least most of the route will follow a common tree.

Each group in the system uses the same tree. N trees implies N groups, no matter how many sources.

Normally, each group has a nominated router as the Rendezvous Point, which is the root of the tree.

All sources send towards the Rendezvous Point.

Can potentially lead to a single point of failure if no backup is specified.

(*, G) Notation

### Multicast Forwarding

Routers must no just forward all multicast traffic. Potentially there could be customers anywhere, unlike with unicast. However, forwarding all multicast would be broadcast instead and would lead to chaos.

Techniques include:

* Reverse Path Forwarding
* Multicast Forwarding Caches
* TTL Thresholds
* Administratively Scoped Boundaries

#### Reverse Path Forwarding

Note the source address of the arriving packet and interface of arrival. The IP tables are checked for the correct interface towards the source.

If the packet has arrived into the expected interface, it can be forwarded onwards. If not it can be discarded.

#### Multicast Forwarding Caches

Used to help avoid some RPF calculations

Sometimes called multicast routing tables.

Used to help make decisions for routing tables.

#### TTL Thresholds

TTL normally used by IP and decremented as each router passed. When this TTL reaches zero, the packet is dropped.

Multicast routers often set TTL Thresholds on interfaces, if the TTL of the packet is less than this threshold then the packet isn't forwarding.

If traffic was only designed to reach internal locations, the TTL would be set such that it could reach all internal routers, but external routers would have high enough threshold to stop this traffic, but not those expected to reach external locations.

#### Administratively Scoped Boundaries

These boundaries don't pass certain multicast addresses.

### Multicast Routing Protocols

#### Dense Mode Protocol

Send all valid packets out of all interfaces, flooding the network.

When a router receives unwanted packets it sends a prune message upstream.

When a prune message is received, the router removes the interface it was received on from the forwarding table for the specified group.

Prune times out in typically 2 to 3 minutes.

##### DVMRP

##### Protocol Independant Multicast - Dense Mode (PIM-DM)



#### Sparse Mode Protocol

Routers send no traffic onwards unless asked.

Shared tree branch constructed from rendezvous point (root) to any interested receiver.

Join messages are sent from the receiver to the root  via other routes, creating a shared tree where it goes.

Prune sent when the traffic is no longer wanted.

##### Protocol Independant Multicast - Sparse Mode (PIM-SM)

Has a rendezvous point using a shared tree, but uses source trees to get data from sources to the rendezvous point. Also allows the final router feeding receivers to switchover to a source tree from the source if the traffic level exceeds some threshold (in Cisco routers the default value for the threshold is zero).

##### CBT

#### Link State Protocol

##### MOSPF

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

##### Source Port Number

##### Destination Port Number

##### Sequence Number

Ensures ordering of packets (is actually a byte count of the first byte count in the packet of data).

Doesn't start at 1.

##### Acknowledgement Number

Helps find missing packets, is the last byte of the packet.

##### Header Length

Describes the length of the header.

##### Reserved

##### Flags

###### Urgent (URG)

The value in the Urgent field is valid.

###### Acknowledge (ACK)

The value in the Acknowledge field is valid.

###### Push (PSH)

Push the data up to the application as quickly as possible.

###### Reset (RST)

Reset the connection

###### Synchronise (SYN)

Used to set up connections

###### Finish (FIN)

Used to tear down connections

##### Window Size

##### TCP Checksum

Same as UDP Checksum

##### Urgent Pointer

##### Options

#### Connections

How TCP establishes, keeps and tears down connections.

##### States

![](http://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Tcp_state_diagram_fixed.svg/796px-Tcp_state_diagram_fixed.svg.png)

###### Listening

Waiting for a connection

###### SYN Sent

Waiting for acknowledgement of the first send of a `SYN`

###### SYN Received


###### Established

###### FIN Wait 1

Wait for an `ACK` of a sent `FIN`

###### FIN Wait 2

Wait for a `FIN` from an acknowledged `FIN`.

###### Close Wait

Acknowledged a `FIN` but still need the connection to send data.

###### Last ACK

Final `FIN` sent, waiting for the last `ACK`.

###### Time Wait

Final `FIN` received and `ACK` sent, wait for a number of seconds before closing.

Done in case the `ACK` is not received by the other party.

###### Closed

Not listening, connection closed.

##### Wait States

`TIME_WAIT` is also called the 2MSL wait state.

* MSL - Maximum segment life.
* RFC 793 specifies MSL as 2 minutes.
* 30 seconds, 1 minute, 2 minutes are common implementations.



##### Connection Establishment

1. **Server** listens on a given port (no network traffic).
2. **Client** sends a TCP packet with the `SYN` flag set to a random number.
3. **Server** receives the `SYN`, the 0 offset is the value of the `SYN` flag. Server goes into `SYN Received` state.
4. **Server** sends a TCP packet with a different `SYN` flag and an `ACK` flag, returning the Client's `SYN` flag plus one*.
5. **Client** returns an `ACK` flag.


\* The `SYN` flag is assumed to have consumed 1 byte.

If no `ACK` is received at `SYN Received` state then the `SYN` is resent after a timeout.

Known as the *three way handshake*.

**Note:** Initial sequence numbers are important! Both client and server choose different ISNs.

##### Half-Open

When you have a connection between two machines, but one crashes. There's no data sent between them so one still believes it is connected.

##### Simultaneous Open

Possible (but unlikely) that two applications will perform active open to one another. Not Client/Server, each opens to a known port.

Results in a single open connection.

Four-way handshake required.

##### Connection Termination

1. **Client** sends a `FIN`
2. **Server** sends an `AWK` and a `FIN`
3. **Client** sends an `AWK`.

*Three way closedown*.

`ACK` and `FIN` might not be sent together (server might still be transmitting data).

##### Half-Close

When a `FIN` is sent to the server but there is still more data to be sent should not close fully until a `FIN AWK` is sent and the `AWK` returned. Microsoft broke this by sending a `RST` instead of a proper `AWK`

##### Simultaneous Close

Both sides of a connection might perform an active close.

Four segments required, which s not unusual.

#### TCP Options

TCP Header also supports options.

Originally only `MSS`, `NOOP` and `EOS` were specified.

##### End of Option List (0)

##### No Operation (NOOP) (1)

##### Maximum Segment Size (MSS) (2)

Length is 4

2 byte MSS. Usually based on the MTU size.

##### Window Scale Factor (3)

Length is 3

1 byte shift count.

##### Timestamp (4)

Length is 10

4 bytes timestamp value
4 bytes timestamp echo reply

#### Bulk Data Transfer

Bulk data transfer (e.g. FTP) has different requirements.

Low overhead from headers.

Receiving systems have limited buffers.

Sliding windows used for flow control.

Packet loss is expensive; timeouts are the simplest way, but there are better.

Want to send as many packets as possible without flooding the network.

#### Flow Control In TCP for Bulk Data Transfer

Sliding window flow control is carried out by the receiver.

CWND flow control is carried out by the receiver.


##### Sliding Windows Flow Control

The idea is that in every `ACK` we also advertise a window. The window is a number of bytes, usually a multiple of the `MSS`.

The initial window size will be the size of the buffer TCP has available.

Sender can send up to the limit of the window.

When a segment is acknowledged, the window slides making another slot in the window available.

The window is said to close when the left-hand edge moves to the right.

The window is said to open when the right-hand edge moves to the right.

The window is said to shrink if the right-hand edge moves to the left.

###### Window Scaling

Scale factor is actually a shift.

Largest scaling factor is 14 (maximum window size of 1,073,741,823 bytes).

Remember this increases the size of the header.

Used for high capacity networks.

RFC 1323, TCP Extensions for High Performance.

###### Calculating Optimal Window Size

Can never reach optimal capacity but can approach it.

###### Bandwidth delay product

`Capacity(bits) = bandwidth (bits/s) * RTT (sec)`

Increase Round Trip Time (RTT) and data travels more slowly, thus higher capacity.

Likewise increased bandwidth involves higher capacity.

Max window size of 65535 bytes, but window scale option can increase this to 1024MB.

Around 10% of the capacity is a good size for the TCP buffer size.

##### TCP Slow Start (RFC 2001)

Intermediate routers must queue packets - congestion may occur at routers.

Congestion window (CWND).

1. Initially set to 1 segment (based on announced MSS).
2. On first ACK, increase CWND by 1 segments of bytes.
3. Now 2 segments are sent and ACK'd. CWND is increased to 4 segments.
4. Exponentiall increase until peak flow reached or router discards packets.
5. Sender can transmit up to the minimu of the sliding window size and CWND.

Has two phases:

1. Exponential increase.
2. Linear increase.

Based on a threshold (the slow start threshold).

Drops drastically when there is packet loss.

##### Fast Retransmit and Fast Recovery (TCP Reno)

Problem: TCP timeouts lead to idle periods.

Fast retransmit: use 3 duplicate ACKs to trigger retransmission.

Fast recovery: start CWND at SSTHRESH and do incremental increase after fast retransmit.

###### Problems with Fast Retransmit and Fast Recovery

WiFi and very fast networks.

Can be a problem on high capacity networks.

#### TCP Westwood +

Improved congestion control algorithm for fast, high latency links and lossy links.

Can take many hours to reach optimal throughput with TCP Reno as packet loss has a large affect on throughput.

Westwood carries out end to end bandwidth estimate (BWE) using received ACKs and RTT monitoring.

TCP Reno overreacts to random loss by cutting cwnd in half.

A small fraction of random packet loss does not impact the BWE.

Thus the ssthresh remains unchanged, allowing Westwood to be much more efficient than Reno.

###### On ACK Reception

Increase cwnd according to Reno algorithm.

Estimate available bandwidth.

###### When 3 Duplicate ACKs received

![](http://www.texify.com/img/%5Cnormalsize%5C%21%5Ctext%7BSsthresh%7D%20%3D%20%5Ctext%7Bmax%7D%5Cleft%282%2C%20%5Cfrac%7B%5Ctext%7BBWE%7D%20%5Ctimes%20%5Ctext%7BRTT%7D_%7B%5Ctext%7Bmin%7D%7D%7D%7B%5Ctext%7BSeg%5C_size%7D%5Cright%29.gif)

cwnd is then set to ssthresh.

###### On RTO (coarse timeout)
![](http://www.texify.com/img/%5Cnormalsize%5C%21%5Ctext%7BSsthresh%7D%20%3D%20%5Ctext%7Bmax%7D%5Cleft%282%2C%20%5Cfrac%7B%5Ctext%7BBWE%7D%20%5Ctimes%20%5Ctext%7BRTT%7D_%7B%5Ctext%7Bmin%7D%7D%7D%7B%5Ctext%7BSeg%5C_size%7D%5Cright%29.gif)

cwnd is then set to 1.

#### Flow Control in TCP for Interactive Data Transfer

Interactive data transfer can result in many small segments which, together with their ACKs, can lead to congestion.

ACKs are, therefore, piggybacked onto data segments - delayed ACKs.

Nagle's algorithm result in some collection of data to produce larger segments.

##### Nagle Algorithm

Many small datagrams results in very large overhead.

Can cause congestion, particularly on a WAN.

* Only one outstanding segement not ACK'd
* Cannot send any more small segments until ACK received.
* Whilst waiting for ACK, TCP will collect small segments together to send as a single segment.
* On a fast network, more segments are sent.
* On a congested network less segments are sent, but data still get through (with less overhead).

Sometimes desirable to disable Nagle algorithm, e.g., X mouse movements need to be sent without delay.

#### Persist Timer

Keeps window size information flowing even if the other end closes its receive window.

Possible situation where an `ACK` is lost and both ends waiting.

* Sender waiting for acknowledgement with window update so that it can send more data.
* Receiver waiting to receive the data as it indicated a non-zero window in the acknowledgement that go lost.

Sending TCP uses a persist timer to periodically query the receiver to see if the window size has updated.

#### Timeout and Retransmission

Fundamental to the use of acknowledgements is the need for timeout and re-transmission of packets.

TCP keeps four different timers for a connection and performs exponential backoff when a packet goes unacknowledged.

TCP also has a congestion avoidance algorithms to complement the slow start algorithm to cope with packet loss caused by congestion.

##### Timers

###### Retransmission Timer

Used when expecting an acknowledgement from the other end.

###### Persist Timer

Keeps window size information flowing even if the other end closes its receive window.

###### Keepalive Timer

Detects when the other end of a connection has crashed or re-booted.

###### 2MSL Timer

##### Round Trip Time Measurement

Used to calculate retransmission timeout (RTO).

Mean deviation is used to allow arithmetic to be carried out with integers and without square roots.

![](http://www.texify.com/img/%5Cnormalsize%5C%21Err%20%3D%20M%20-%20A%5C%5CA%20%5Cleftarrow%20A%20%2B%20gErr%20%5C%5C%20D%20%5Cleftarrow%20D%20%2B%20h%20%28%20%7C%20Err%20%7C%20-%20D%20%29%5C%5C%20RTO%20%3D%20A%20%2B%204D.gif)

Where:

* D is the smoothed mean deviation
* M is the latest measured RTT value
* Gain (g) for average is set to 1/8
* Gain (h) for deviation is set to 1/4

##### Karn's Algorithm
If a packet times out and there is a retransmission, when an ACK is received, whose was it.

Karn's algorithms specifies that RTT estimate cannot be update when a timeout and retransmission occur.

Re-use the RTO after such an exponential back off until an acknowledgement is received.

### Transactional Transmission Control Protocol (T/TCP) RFC 1644

TCP for transactions.

Nearly as fast as UDP.

#### TCP Accelerated Open (TAO)

Reduces minimum number of packets required to three in many circumstances.

Data and FIN are piggybacked on the ACK.

Connection Count (CC) used to avoid duplicate SYNs.

Security issues caused due to this.

#### Truncation of TIME_WAIT State

2MSL state is abandonded.

8 times RTO used instead.

Allows retransmission of final ACK.

A new incarnation of the same connection, using TAO, implicitly acknowledges the ACK of FIN.

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

### Domain Name Service (DNS)

A distributed database mapping hostnames to IP addresses and vice versa.

#### How DNS is used

* Applications access the information in the DNS by way of resolver programs
  * `gethostbyname()` returns an IP address in response on a hostname
  * `gethostbyaddr()` returns a hostname in response to an IP address.
* People access information by way of client programs
  * `nslookup`
  * `dig`
* Common implementation of DNS client and server is BIND (Berkeley Internet Domain Server).
  * Server is **named**
* The DNS defines a protocol (see RFCs) that is used for communication between client and server.

#### The DNS namespace

DNS is stored as a tree:

![](http://bio3d.colorado.edu/tor/sadocs/dns/dns-1.png)

13 canonical name servers which server information for the root "unnamed" root.

##### .arpa

A special domain which is used for reverse lookup.

Now `.ipv6`

##### Fully qualified domain names

`www.google.com.` is a fully qualified domain name. Missing the trailing `.` allows the DNS to lookup other entries based on the domain it resides on.

#### DNS Lookup

Is a recursive process and therefore quite slow. Results are cached to improve performance.

To try and reduce the effects of this when changing hostnames the TTL of the cache is reduced prior to performing this.

#### Name Ownership

No one company owns all names

#### Name Server Zones and Boundaries

Can have zones within a name server.

#### Resource Record

This is where DNS gets its information from.

![](http://www.tcpipguide.com/free/diagrams/dnsrrformat.png)

Examples:

`3www4aber2ac2uk0`

`3www6google3com0`

The `0` occurs because the top-level domain has no name. This is how the end of the string is reached.

##### SOA

Name of primary source of info for zeon

##### A

IP address of host

##### CNAME

Canonical name

##### PTR

Alias for an IP address for reverse lookups

##### MX

Mail exchange information

##### NS

The Name of the nameserver

##### AAAA

IPv6 address of host

##### A6

Experimental IPv6 address.

##### HINFO

Host information (CPU and OS).

##### LOC

Location of host.

### Dynamic Host Configuration Protocol (DHCP)

### DHCP Timeline

![](http://www.tarunz.org/~vassilii/TAU/protocols/dhcp/alloc.gif)

Request are broadcast address `255.255.255.255`.

Often used during host configuration.

Never forwarded by a route, by a DHCP/BOOTP relay agent can be used to forward this onto the DHCP server.

Replies are routed normally.

### Lightweight Directory Access Protocol (LDAP)

### The Directory Information Tree

Similar to the DNS tree, but the whole world doesn't typically use the same tree.

### The Information Model

Service model based on **entries**.

An **entry** is a collection of **attributes**, that has a **distinguished name (DN)**.

#### Attributes

Type/value pairs, e.g.:

`C = GB`

`o = University of Wales`

Attributes described by a schema.

## Quality of Service

*The need for and the provision of Quality of Service (QoS) within packet based networks such as the Internet which are inherently best efforts at heart.*

### Challenges

* QoS needs to be end-to-end, involving numerous management domains.
* QoS service should address all requirements - not just 'top quality'
* QoS *policy* distribution, maintenance and monitoring will increase in importance.
* Better to implement QoS earlier - provides scalability, experience. Pro-active not reactive.

### Queueing Disciplines

Ways in which resources can be allocated to priority traffic best.

#### Priority Queue

Other queues only get any resources at all when the priority queue is empty.

Simple and effective.

Traffic must be policed to stay within low limit as other traffic can get starved or the priority queue reverts to Best Effort

#### Weighted Round Robin

Multiple queues, each queue gets a guaranteed minimum of resource even under congestion conditions.

Can be combined with Priority Queues.

## Security Issues

*The inherent risks within networks such as the Internet, cracking, viruses, trojans, worms and denial of service attacks. The role of the Firewall and the problems it can bring.*

### Data Encryption

Four aspects of security to consider:

1. Privacy
2. Authentication
3. Integrity
4. Nonrepudiation

#### Aspects of Security

#### Privacy

Snoopers should not be able to read confidential data

#### Authentication

Verifies that the apparent sender really sent a message, and not an imposter.

#### Integrity

Verifies that data has not been corrupted or altered in transmission

#### Nonrepudiation

Ensures that the sender or receiver cannot deny sending or receiving a piece of information.

#### Encryption Techniques

Classical encryption techniques:

* Permutation: The order of the plaintext characters is changed
* Substitution: a plaintext alphabet is mapped to a different one.

A cipher used to perform the encryption.

* Stream ciphers encrypt data bit by bit or byte by byte.
* Block ciphers first pack data bits into a fixed length block, then encrypt the whole block into a ciphertext block.

#### Symmetric Key Encryption

Use a shared secret key to encrypt and decrypt.

For ![](http://smarturl.it/math?n\) users, ![](http://smarturl.it/math?\sum{n}\) keys required.

Can be done in hardware.

#### Public Key Encryption

The key is split into two: a public key and a private key.

Anything encrypted by the public key can only be decrypted by the private key.

The private key must be kept private, but the public key can be shared without worry.

Cannot be done in hardware.

#### Combining Both

Create a shared secret based from public key encryption.

### Transport Layer Security (TLS)

Client sends a "hello" message with TLS version number and prefernces.

Server sends a certificate including a public key.

* Public key encrypted by some CAs.
* Client has a list of CAs and their keys and uses a corresponding key to decrypt the server key.
  * This authenticates the server, unless it is self-signed.

Client sends a secret key encrypted with the server's public key.

Server decrypts message and then encrypts a response with secret key which the client decrypts.

### Hashing and Message Authentication

Hashing is the operation that maps the message of variable length into a hash value with fixed length.

Hashing is not reversible.

Hashing can be used to generate a digest of the message, called the Message Authentication Code.

The receiver can use the digest to verify if the message is authentic.

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

### Neighbour Discovery

### Router Advertisements

### DHCPv6

Where autoconfiguration is undesirable for operational reasons.

Similar in concept to DHCP for IPv4

Compatible with autoconfiguration

Nodes may request multiple addresses.

Authentication of nodes.

Makes use of address deprecation and reconfiguration-init message...

### Co-existence and Tunnelling



## Exam Preparation

*Some chances to get a feel for what is expected in the exam.*

### Steve Kingston

`s/(Use a diagram) is necessary/\1/g`

## Past Paper 2012-113

### 1. This is a question about the Transport Layer Protocols

#### a) With reference to the User Datagram Protocol (UDP) and the Transmission Control Protocol (TCP), describe features that are provided by transport layer protocols. In your answer distinguish between features provided just by TCP and those provided by both UDP and TCP.

* Both use port numbers. Server listens of a specific port and client sends data to that port.
* UDP Connectionless
  * No acknowledgement that data is recieved
  * Up to the application to manage successful transmission of data
* TCP sets up a connection between two machines
  * Connection must first be established
  * All sent packets (except ACK's) must be acknowledged by the other party
  * Support for flow control using sliding window protocol
  * Must also terminate the connection
  * Protocol ensures sucessful delivery of data (or failure).

b) Describe with the aid of diagrams the TCP/IP connection establishment processes, and explain how the initial sequence number (ISN) is exchanged between two nodes during connection establishment. Label the diagrams with the TCP connection states at each stage.

* Server listens on a specified port
* Client sends a SYN packet to that with a random ISN and a receiving port number (usually fairly high).
* Server responds to the client with an ACK with a sequence one higher than the SYN's ISN (the SYN is seen to have taken up one byte of data).
* Server also responds with a SYN to the client, the ISN here is generated by the server and is different to the clients.
* Client responds to the server's SYN with an ACK, again here the sequence number of this packet will be the ISN of the Servers SYN packet + 1.
* At this point the connection is established.

The ISNs must be different as they are used to acknowledge how much data was actually received later in the connection.

Sequence numbers returned in the ACK are the sequence number of the acknowledge packets plus the size of that packet (which can then be used for flow control).

#### c) What is meant by a flow control mechanism? In your answer describe the likely effect of not employing flow control on TCP connections.

* Flow control used to send multiple packets of data and acknowledging them all in a single packet.
* Flow control is also used to stop flooding the network with packets that would just be dropped by the receiver because it's buffers are full.

Not using flow control would either:

1. Require the sender to wait for the receiver to acknowledge a single packet before sending the next one, meaning the whole transmission would be very slow.
2. Allow the sender to flood the network with packets which would eventually be dropped by the receiver as its buffers fill up to maximum (or by intermediary devices to the same effect). The sender would receive acknowledgements for some of the packets and would have to constantly resend dropped packets after a timeout period, leading to a lot of traffic on the network, especially when the receiver does not process the information quickly.


#### d) Describe, with the aid of diagrams, the problem with transferring very large files using the slow start /congestion avoidance flow control mechanism on fast (e.g. gigabit) but high latency networks. Explain in your answer how the TCP Westwood+ algorithm modifies the mechanism to provide better throughput whilst retaining a concept of fair access.



* Slow start sets the window to 1 to begin with and grows it exponentially after each ACK received. Once it reaches the slow start threshold (ssthres), this growth is linear (by 1 from each ACK) - this is congestion avoidance.
* Eventually the congestion will be encountered, and a packet will not be ACK'd before a timeout. The size of sstresh is set to one half of the current window size and then the size of the window is reset to 1. The process then repeats endlessly.
* This tends to lead to "sawtooth" graphs.
* Problem of slow start is that it has to wait for a timeout to occur before it knows congestion has occurred.

* To change this, TCP Reno was implemented; if the receiver does not receive the next expected packet (i.e. it receives one with a higher sequence number than expected) it will send a duplicate ACK of the last ACK it sent.
* If this ACK is received by the sender 3 times it triggers retransmission and will retransmit the next packet from that sequence number.
* The receiver may then acknowledge further packets in the sequence in the next ACK.
* Instead of reseting the window size to 1, it is started at sstresh instead and grown incramentally.

* TCP Reno still leads to sawtooth graphs, but is less affected by congestion.
* TCP Westwood+ implemented to further improve TCP connections.
* Westwood+ estimates the bandwidth available using received ACKs and Round Trip Time monitoring.
* In both cases of 3 duplicate ACKs or coarse timeout, the ssthresh is set to `max(2, (BWE * RTTmin) / Seg_size)`. The congestion window is set to ssthresh in the case of 3 dup ACKs or 1 in the case of coarse timeout.
* A small fraction of randomly lost packets doesn't affect the BWE and therefore the ssthresh, unlike with Reno.

