Start:
setb P3.4
CLR P0.3
mov R1, #000fh
mov R2, #0000h
Mov P1,#00C0h
CALL Check_key
JMP Start

Begin2:
CLR P0.3
CALL Check_key
JMP Begin2

Check_key:
JNB P0.6, Click
RET


Click:
call waiting;odkliknij
inc R2
jmp n0
RET


waiting:
JNB P0.6, waiting
RET

n0:
CJNE R2, #0000h, n1
mov R4, #00C0h
jmp wypisz

n1:
CJNE R2, #0001h, n2
mov R4, #00F9h
jmp wypisz

n2:
CJNE R2, #0002h, n3
mov R4, #00A4h
jmp wypisz

n3:
CJNE R2, #0003h, n4
mov R4, #00B0h
jmp wypisz

n4:
CJNE R2, #0004h, n5
mov R4, #0099h
jmp wypisz

n5:
CJNE R2, #0005h, n6
mov R4, #0092h
jmp wypisz

n6:
CJNE R2, #0006h, n7
mov R4, #0082h
jmp wypisz

n7:
CJNE R2, #0007h, n8
mov R4, #00F8h
jmp wypisz


n8:
CJNE R2, #0008h, n9
mov R4, #0080h
jmp wypisz

n9:
CJNE R2, #0009h, n10
mov R4, #0090h
jmp wypisz

n10:
CJNE R2, #000Ah, n11
mov R4, #0023h
jmp wypisz


n11:
CJNE R2, #000Bh, n12
mov R4, #0003h
jmp wypisz

n12:
CJNE R2, #000Ch, n13
mov R4, #00A7h
jmp wypisz

n13:
CJNE R2, #000Dh, n14
mov R4, #0021h
jmp wypisz

n14:
CJNE R2, #000Eh, n15
mov R4, #0084h
jmp wypisz

n15:
mov R4, #10001110b
mov P1, R4
mov R7, #000Fh
djnz R7, $
jmp Done

wypisz:
mov P1, R4
jmp Begin2
RET


Done:
mov P1, #007Fh
mov R7, #0001h
mov P1, #00FFh
JMP Done

END
