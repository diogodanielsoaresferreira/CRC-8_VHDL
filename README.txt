Diogo Ferreira Nº 76504
Luís Leira Nº 76514

Foram efetuadas 4 versões com Encoder, Checker, Desenho do sistema e vetor de teste.
A versão apresentada para avaliação, mais otimizada, é a versão 4 (V4).
Também foi incluido nesta pasta o script utilizado para ajudar a otimizar as portas utilizadas, através do cálculo de combinações dos Xors dos bits utilizados para cálculo cada porta.
Abaixo estão apresentados os cálculos dos atrasos e das portas de cada circuito apresentado.


V1:
Versão com polinómio CRC calculado em série.
Cada "bloco" de xor's é aplicado aos 16 bits.

Encoder:
Logo, atraso de cada bloco -> 2ns.
Atraso total -> 2*16=32 ns

Nº de portas:
Cada bloco de xor's tem 6 xor's.
6*16 = 96

Checker:
Atraso total do encoder + Nor final:
32+6=38 ns

Nº de portas:
Portas do encoder + Portas do checker_8bit:
96+7=103

V2:
Versão síncrona, com clock e shift register.

Encoder:
Atraso para cada ciclo de clock:
Atraso do multiplexer + atraso do cálculo CRC:
4+2=6ns

O atraso do counter é desprezável, porque é efetuado em paralelo, tal como a comparação com o valor final do counter.
O register é síncrono, logo não tem atraso "fora" do clock.

Logo, o clock tem de ser de 6ns.

Como são necessários 2 ciclos para o load inicial:
Atraso total: 18*6=108 ns

Nº de portas (Para este cálculo iremos desprezar as portas no register e no counter):
23*portas do Mux+Portas do Remainder_CRC8+portas do Compare15=
23*3+6+3=81

Checker:
Atraso total do encoder + Nor final:
108+8=116 ns

Nº de portas:
Portas do encoder + Portas do checker_8bit:
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

