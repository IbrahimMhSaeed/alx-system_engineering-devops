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


