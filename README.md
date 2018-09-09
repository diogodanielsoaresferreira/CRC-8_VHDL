# Design a digital circuit that encodes and decodes strings with CRC-8 algorithm with an optimal delay and number of components

Project presented in the Advanced Computer Architectures course (Universidade de Aveiro), 2017.

THe main goal of the project is to design different possible solutions in hardware, using VHDL, to encode and decode CRC-8 strings using the least possible number of components and with an optimal delay.

# Versions presented

4 versions were made, with encoder, decoder, system design and test vector.
The most optimized version is the version 4 (V4).
It was also included the script used to optimize the used gates, with the calculation of Xor combinations of the used bits in each gate.

Below are presented the delay times and the number of gates in each versions:

## V1:
Version with CRC polynomial processed in series
Each block of xor0s is applied to all 16 bits


### Encoder:
Block delay -> 2ns
Overall delay -> 2*16=32 ns

Number of gates:
Each xor block has 6 xor's.
6*16 = 96

### Checker:
Overall encoder delay + final Nor:
32+6=38 ns

Number of gates:
Encoder gates + checker_8bit gates:
96+7=103

## V2:
Synchronous version, with clock and shift register.

Encoder:
Delay for each clock cycle:
Multiplexer delay + CRC calculation delay:
4+2=6ns

Counter delay is despicable, because is done in paralell, like the final comparation with the counter value.
Register is synchronous, so it does not have an aditional delay besides the clock.

The clock must be 6ns.

2 cycles needed for the initial load:
Overall delay: 18*6=108 ns

Number of gates (without register and counter gates):
23*Mux gates + Remainder_CRC8 gates + Compare15 gates=
23*3+6+3=81

Checker:
Overall encoder delay + final Nor:
108+8=116 ns

Number of gates:
Encoder gates + checker_8bit gates:
81+8=89

## V3:
Version with CRC bits calculated taking into account the components of the remainder of the division of the input bits by the generating polynomial.

### Encoder:
Maximum block delay is the maximum block delay for each bit (xors with CRC are done in paralell):
8 ns.

Number of gates is the sum of all xors used in the blocks for each bit:
64

### Checker:
Overal encoder delay (xors with CRC are done in paralell) + final Nor:
8+6=14 ns

Number of gates:
Encoder gates + Xor gates with CRC + final check8 gates:
64+8+7=79


## V4:
Optimized V3, with lesser gates due to the combinations calculations

### Encoder:

Delay:
8 ns

Number of gates
38 gates

### Checker:

Delay:
Encoder delay + check_8 delay
8+6=14ns

Number of gates:
38+8(It is needed an Xor with the CRC bits)+7(to calculate check_crc)=
38+8+7=53

Diogo Ferreira  
Luís Leira
