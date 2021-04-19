//Addition of two 8bit numbers
//Manually strore 1st no in the memory location C050
//Manually store 2nd no in the memory location C051
//Result is stored in C053

LXI H,C050
MOV A,M
INX H
ADD M
STA 0004
HLT


LXI H,C050
MOV A,M
INX H
SUB M
INX H
MOV M,A
HLT