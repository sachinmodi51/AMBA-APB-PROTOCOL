# AMBA-APB-PROTOCOL
This projects describes design and verification of AMBA APB protocol using verilog in EDA Playground for read and write operation.

# Table of Contents
- Introduction
- AMBA Bus Architecture
- APB Theory
- List of Signal
-

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

## APB Bridge

The APB bridge is the only bus master on the AMBA APB. In addition, the APB bridge is also a slave on the higher-level system bus.

The bridge unit converts system bus transfers into APB transfers and performs the following functions:
-   Latches the address and holds it valid throughout the transfer.
    
-   Decodes the address and generates a peripheral select,  **PSELx**. Only one select signal can be active during a transfer.
    
-   Drives the data onto the APB for a write transfer.
    
-   Drives the APB data onto the system bus for a read transfer.
    
-   Generates a timing strobe,  **PENABLE**, for the transfer.

## APB Slave

APB slaves have a simple, yet flexible, interface. The exact implementation of the interface will be dependent on the design style employed and many different options are possible.
The APB slave interface is very flexible.

For a write transfer the data can be latched at the following points:

-   on either rising edge of  **PCLK**, when  **PSEL**  is HIGH
    
-   on the rising edge of  **PENABLE**, when  **PSEL**  is HIGH.
    

The select signal  **PSELx**, the address  **PADDR**  and the write signal  **PWRITE**  can be combined to determine which register should be updated by the write operation.

For read transfers the data can be driven on to the data bus when  **PWRITE**  is LOW and both  **PSELx**  and  **PENABLE**  are HIGH. While  **PADDR**  is used to determine which register should be read.


# List of AMBA APB Signals


|        Name        |Description                                                  |
|----------------          |-----------------------------------------------------------|
|**PCLK** <br> Bus clock         |The rising edge of **PCLK** is used to time all transfers on the APB.           |
|**PRESETn**  <br> APB reset        |The APB bus reset signal is active LOW and this signal will normally be connected directly to the system bus reset signal.
|**PADDR[31:0]**,<br>APB address bus          | This is the APB address bus, which may be up to 32-bits wide and is driven by the peripheral bus bridge unit.
|**PSELx** <br>	APB select		|A signal from the secondary decoder, within the peripheral bus bridge unit, to each peripheral bus slave x. This signal indicates that the slave device is selected and a data transfer is required. There is a **PSELx** signal for each bus slave.
|**PENABLE**<br>APB strobe |This strobe signal is used to time all accesses on the peripheral bus. The enable signal is used to indicate the second cycle of an APB transfer. The rising edge of **PENABLE** occurs in the middle of the APB transfer.
|**PWRITE**<br>APB transfer direction |When HIGH this signal indicates an APB write access and when LOW a read access.
|**PRDATA**<br>APB read data bus |The read data bus is driven by the selected slave during read cycles (when  **PWRITE**  is LOW). The read data bus can be up to 32-bits wide.
|**PWDATA**<br>APB write data bus |The write data bus is driven by the peripheral bus bridge unit during write cycles (when **PWRITE** is HIGH). The write data bus can be up to 32-bits wide.|

# State diagram of APB

![image](https://user-images.githubusercontent.com/75358489/100916578-f19d8500-34fb-11eb-8ac8-e0dd4905a173.png)



The state machine operates through the following states:

**IDLE**

This is the default state of the APB.

**SETUP**

When a transfer is required the bus moves into the SETUP state, where the appropriate select signal,  **PSELx**, is asserted. The bus only remains in the SETUP state for one clock cycle and always moves to the ACCESS state on the next rising edge of the clock.

**ACCESS**

The enable signal,  **PENABLE**, is asserted in the ACCESS state. The address, write, select, and write data signals must remain stable during the transition from the SETUP to ACCESS state.

Exit from the ACCESS state is controlled by the  **PREADY**  signal from the slave:

-   If  **PREADY**  is held LOW by the slave then the peripheral bus remains in the ACCESS state.
    
-   If  **PREADY**  is driven HIGH by the slave then the ACCESS state is exited and the bus returns to the IDLE state if no more transfers are required. Alternatively, the bus moves directly to the SETUP state if another transfer follows.

# Write cycle

![image](https://user-images.githubusercontent.com/75358489/101146274-d12b1300-3640-11eb-8d2b-274f31c485cc.png)


- At T1, a write transfer starts with address PADDR, write data PWDATA, write signal
- PWRITE, and select signal PSEL, being registered at the rising edge of PCLK. This is called
the Setup phase of the write transfer.
- At T2, enable signal PENABLE, and ready signal PREADY, are registered at the rising edge
of PCLK.
- When asserted, PENABLE indicates the start of the Access phase of the transfer.
- When asserted, PREADY indicates that the slave can complete the transfer at the next rising
edge of PCLK.
- The address PADDR, write data PWDATA, and control signals all remain valid until the
transfer completes at T3, the end of the Access phase.
- The enable signal PENABLE, is deasserted at the end of the transfer. The select signal PSEL,
is also deasserted unless the transfer is to be followed immediately by another transfer to the
same peripheral.

# Read Cycle

![image](https://user-images.githubusercontent.com/75358489/101146959-ba38f080-3641-11eb-884b-4e19c0372e8f.png)


- Figure 3-4 shows a read transfer. The timing of the address, write, select, and enable signals are
as described in Write transfers on page 3-2. The slave must provide the data before the end of
- the read transfer. Figure 3-4 shows a read transfer. The timing of the address, write, select, and enable signals are
as described in Write transfers on page 3-2. The slave must provide the data before the end of
the read transfer. 


# Design Methodology



# Simulation






