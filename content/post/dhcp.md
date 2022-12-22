---
title: "DHCP"
author: "Amnex"
date: 2022-12-22T22:40:38Z
draft: true
---
# What is DHCP?
A network device needs to have 4 things to communicate with other devices:

1. IP address
2. Subnet mask
3. Default gateway
4. DNS server

DHCP is the protocol executed between a client and a DHCP server in a network. The DHCP server enables the client to communicate in a network by distributing these 4 configurations. 

# Why we need DHCP?
Every host needs the configuration mentioned above. The DHCP protocol automates the process of granting the IP address etc. for you entire network. DHCP also takes care that every IP in the network is unique. For small self-managed networks, it is feasible to set all the configs manually. But imagine sitting in an airport with hundreds of people on the same network..

# How DHCP works?
UDP
- Client port: 68
- DHCP port: 67

4 steps using the DORA packets:
1. DHCP Discover:  
   Client sends a broadcast request to ask if there is a DHCP server in the network
  - source ip: 0.0.0.0   
    This is a special IP telling the device to send out the message via all its NICs 
  - destination ip: 255.255.255.255

2. DHCP Offer:  
   DHCP server responds with the 4 configs and the lease terms
  - source ip: IP of the DHCP server
  - destination ip: NEW IP provided by the DHCP server 

3. DHCP Request:  
   Client sends a DHCP request accepting the config provided by the DHCP server earlier
  - source ip: 0.0.0.0
  - destination ip: 255.255.255.255

4. DHCP Acknowledge:  
   DHCP sends an acknowledgement reply
  - source ip: IP of the DHCP server
  - destination ip: NEW IP

 

# Lease
The configurations granted by the DHCP server are not ‘owned’ by the client, but are leased instead. This means that the DHCP configuration is granted temporarily and should be renewed after the lease has expired. As a result a distributed IP address is freed up again after a certain time. That way the DHCP server avoids that an IP address is occupied by a device that left the network and ensures there are enough IP addresses to distribute to new devices.

You can also renew your lease via: ipconfig/renew   

 

# DHCP starvation
Distributing IP addresses automatically via DHCP comes at a cost. The number of free IP addresses that the DHCP server can distribute is limited. If that number is exceeded, no IP address can be provided to a new host. That is exactly what a DHCP starvation attack tries to accomplish. 

By sending mock Discover requests with MAC addresses representing false devices, the DHCP server is tricked and sends the response with a free IP address. The attack keeps sending these requests until the free pool of IP is depleted.   