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
