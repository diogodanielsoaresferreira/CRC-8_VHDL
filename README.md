# Design a digital circuit that encodes and decodes strings with CRC-8 algorithm with an optimal delay and number of components

Project presented in the Advanced Computer Architectures course (Universidade de Aveiro), 2017.

THe main goal of the project is to design different possible solutions in hardware, using VHDL, to encode and decode CRC-8 strings using the least possible number of components and with an optimal delay.

# Versions presented

4 versions were made, with encoder, decoder, system design and test vector.
The most optimized version is the version 4 (V4).
It was also included the script used to optimize the used gates, with the calculation of Xor combinations of the used bits in each gate.

Below are presented the delay times and the number of ports in each versions:

V1:
Version with CRC polynomial processed in series
Each block of xor0s is applied to all 16 bits


Encoder:
Block delay -> 2ns
Overall delay -> 2*16=32 ns

Number of ports:
Each xor block has 6 xor's.
6*16 = 96

Checker:
Overall encoder delay + final Nor:
32+6=38 ns

Number of ports:
Encoder ports + checker_8bit ports:
96+7=103

V2:
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

Gates number (without register and counter gates):
23*Mux gates + Remainder_CRC8 gates + Compare15 gates=
23*3+6+3=81

Checker:
Overall encoder delay + final Nor:
108+8=116 ns

Number of gates:
Encoder gates + checker_8bit gates:
81+8=89

V3:
Versão com bits do CRC calculados tendo em conta as várias componentes do resto da divisão dos bits de entrada pelo polinómio gerador.

Encoder:
Atraso máximo do bloco é o atraso máximo dos blocos para cada bit (xors com o CRC são efetuados em paralelo):
8 ns.

Nº de portas é a soma de todos os xors utilizados nos blocos para cada bit:
64

Checker:
Atraso total do encoder (xors com o CRC são efetuados em paralelo) + Nor final:
8+6=14 ns

Nº de portas:
Nº de portas do encoder + nº de portas para o Xor com o CRC + nº de portas do check8 final:
64+8+7=79


V4:
V3 otimizada, com menos portas lógicas devido ao cálculo de combinações

Encoder:

Atraso:
8 ns

Nº de portas:
38 portas lógicas

Checker:

Atraso:
Atraso do encoder + Atraso do check_8=
8+6=14ns

Nº de portas:
38+8(é necessário xor com bits do CRC)+7(para calcular o check_crc)=
38+8+7=53

Diogo Ferreira  
Luís Leira
