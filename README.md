# AMBA-APB-PROTOCOL
This projects describes design and verification of AMBA APB protocol using verilog in EDA Playground for read and write operation.
# Table of Contents
- Introduction
- AMBA Bus Architecture
- APB Theory
- List of Signal

# Introduction
 The ARM Advanced Microcontroller Bus Architecture (AMBA) is an open-standard, on-chip interconnect specification for the connection and management of functional blocks in system-on-a-chip (SoC) designs. 

The AMBA specification describes an on-chip communications standard for designing high-performance 16 and 32-bit microcontrollers, signal processors and complex peripheral devices. The communications are based on Master-Slave protocol.

AMBA has been proven in and is being designed into:

- PDA microcontrollers, with a high number of integrated peripherals but also with very low power consumption
- multi-media microcontrollers with floating-point co-processors, on-chip video controller and high memory bandwidth
- complex peripheral ASICs for consumer products
- digital mobile communication devices integrating control and signal-processing functions

# AMBA Bus Architecture
AMBA is a freely-available, open standard for the connection and management of functional blocks in a system-on-chip (SoC). It facilitates right-first-time development of multi-processor designs, with large numbers of controllers and peripherals

Three distinct buses are defined within the AMBA specification:

- the Advanced High-performance Bus (AHB)
- the Advanced System Bus (ASB)
- the Advanced Peripheral Bus (APB).

An AMBA-based microcontroller typically consists of a high-performance system backbone bus (AMBA AHB or AMBA ASB), able to sustain the external memory bandwidth, on which the CPU, on-chip memory and other Direct Memory Access (DMA) devices reside. This bus provides a high-bandwidth interface between the elements that are involved in the majority of transfers. Also located on the high-performance bus is a bridge to the lower bandwidth APB, where most of the peripheral devices in the system are located .

![image](https://user-images.githubusercontent.com/75358489/100890409-387c8200-34de-11eb-94ff-4838039f22ca.png)

# APB Theory

The Advanced Peripheral Bus (APB) is part of the Advanced Microcontroller Bus Architecture (AMBA) protocol family. It defines a low-cost interface that is optimized for minimal power consumption and reduced interface complexity.The APB protocol is not pipelined, use it to connect to low-bandwidth peripherals that do not require the high performance of the AXI protocol.

The APB protocol relates a signal transition to the rising edge of the clock, to simplify the integration of APB peripherals into any design flow. Every transfer takes at least two cycles.

The APB can interface with:

- AMBA Advanced High-performance Bus (AHB)
- AMBA Advanced High-performance Bus Lite (AHB-Lite)
- AMBA Advanced Extensible Interface (AXI)
- AMBA Advanced Extensible Interface Lite (AXI4-Lite)

An AMBA APB implementation typically contains a single APB bridge which is required to convert AHB or ASB transfers into a suitable format for the slave devices on the APB. The bridge provides latching of all address, data and control signals, as well as providing a second level of decoding to generate slave select signals for the APB peripherals.


![image](https://user-images.githubusercontent.com/75358489/100902304-c52d3d00-34ea-11eb-8759-c25103f85e7e.png)

# List of AMBA APB Signals

| NAME     | Description |
| ---------|-----------------
| **PCLK** 
xyz | The rising edge of PCLK is used to time all transfers |
|          | on APB.|
|         
|          |
|          |



- The ARM Advanced Microcontroller Bus Architecture (AMBA) is an open-standard, on-chip interconnect specification for the connection and management of functional blocks in system-on-a-chip (SoC) designs. 
- AMBA is a set of interconnect protocols for communication among various blocks or IPs in a SoC (System on Chip). The communications are based on Master-Slave protocol.