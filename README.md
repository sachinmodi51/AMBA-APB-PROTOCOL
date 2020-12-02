# AMBA-APB-PROTOCOL
This projects describes design and verification of AMBA APB protocol using verilog in EDA Playground for read and write operation.
# Table of Contents
- Introduction
- AMBA Bus Architecture

# Introduction
 The ARM Advanced Microcontroller Bus Architecture (AMBA) is an open-standard, on-chip interconnect specification for the connection and management of functional blocks in system-on-a-chip (SoC) designs. 

The AMBA specification describes an on-chip communications standard for designing high-performance 16 and 32-bit microcontrollers, signal processors and complex peripheral devices. The communications are based on Master-Slave protocol.

AMBA has been proven in and is being designed into:

- PDA microcontrollers, with a high number of integrated peripherals but also with very low power consumption
- multi-media microcontrollers with floating-point co-processors, on-chip video controller and high memory bandwidth
- complex peripheral ASICs for consumer products
- digital mobile communication devices integrating control and signal-processing functions

# AMBA Bus Architecture
The AMBA specification describes an on-chip communications standard for designing high-performance 16 and 32-bit microcontrollers, signal processors and complex peripheral devices.The communications are based on Master-Slave protocol.

Three distinct buses are defined within the AMBA specification:

- the Advanced High-performance Bus (AHB)
- the Advanced System Bus (ASB)
- the Advanced Peripheral Bus (APB).

An AMBA-based microcontroller typically consists of a high-performance system backbone bus (AMBA AHB or AMBA ASB), able to sustain the external memory bandwidth, on which the CPU, on-chip memory and other Direct Memory Access (DMA) devices reside. This bus provides a high-bandwidth interface between the elements that are involved in the majority of transfers. Also located on the high-performance bus is a bridge to the lower bandwidth APB, where most of the peripheral devices in the system are located (see Figure 1.1).

![image](https://user-images.githubusercontent.com/75358489/100890409-387c8200-34de-11eb-94ff-4838039f22ca.png)






- The ARM Advanced Microcontroller Bus Architecture (AMBA) is an open-standard, on-chip interconnect specification for the connection and management of functional blocks in system-on-a-chip (SoC) designs. 
- AMBA is a set of interconnect protocols for communication among various blocks or IPs in a SoC (System on Chip). The communications are based on Master-Slave protocol.