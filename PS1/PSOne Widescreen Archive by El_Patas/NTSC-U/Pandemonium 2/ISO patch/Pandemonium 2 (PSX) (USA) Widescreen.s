.psx
.open "SLUS_005.78", 0x8000F800
.org 0x80064B18
JR RA ;Skip LoadSTR Function to Enable Custom Code
NOP ;Delay Slot
correctasp:
LW T0, 0(A0)
LUI K1, 0x8001
ADDI K1, K1, 0x180 ;Identity Projection Matrix
BNE A0, K1, skipaspcorrect
NOP
ADDIU T0, R0, 0xC00 ;Corrects 3D Aspect if Identity Projection Matrix
skipaspcorrect:
J 0x8007E83C
NOP
correctbmpwidth:
SRA K1, A1, 0x2
SRA A1, A1, 0x1
ADDU A1, A1, K1
J 0x80064F98
ADDU A1, A2, A1
drawcolourboxoptions:
ADDIU SP, SP, 0xFFFC
SW RA, 0(SP)
LUI A3, 0x80
ORI A3, A3, 0x8080
LW A1, 0x4(A2)
NOP ;Because of bullshit Load Delays on the MIPS r3000 CPU
ANDI K1, A1, 0xFF
SRA T0, A1, 0x10
ANDI T0, T0, 0xFF
SUBU T0, T0, K1
ADDU T1, T0, R0
ANDI K1, A1, 0xFF00
SRA K1, K1, 0x8
SRA T0, A1, 0x18
SUBU T0, T0, K1
SLL T0, T0, 0x10
OR A1, T0, T1
JAL 0x800652E4 ;DrawColourBox
ADDIU A2, R0, 0x940
LW RA, 0(SP)
ADDIU SP, SP, 4
JR RA
NOP
.org 0x8007E834 ;Some GTE SDK Scaling Function
J correctasp
.org 0x80064414
ADDIU T4, R0, 0xC00 ;Fix Billboard Widths
.org 0x80064F90
J correctbmpwidth
.org 0x80065980
ADDIU S1, S1, 0x18 ;Fix Coin Counter Position
.org 0x80065B44
ADDIU S3, V0, 0xFFFB ;Fix Lives Counter Position
.org 0x80065088
ADDIU V1, V1, 0xFFFD ;Fix Text Spacing
.org 0x8006D400
ORI A0, A0, 0xB8 ;Fix Quit Selection Cursor Position
.org 0x8006D40C
ORI A1, A1, 0x30 ;Fix Quit Selection Cursor Width
.org 0x8006D518
ORI A0, A0, 0x4D ;Fix Continue Selection Cursor Position
.org 0x8006D524
ORI A1, A1, 0x56 ;Fix Continue Selection Cursor Width
.org 0x8006D590
ORI A0, A0, 0xA8 ;Fix No Selection Cursor Position
.org 0x8006D598
ORI A1, A1, 0x19 ;Fix No Selection Cursor Width
.org 0x8006D470
ORI A0, A0, 0x72 ;Fix Yes Selection Cursor Position
.org 0x8006D478
ORI A1, A1, 0x24 ;Fix Yes Selection Cursor Width
.org 0x8006C8EC
ORI A0, A0, 0x47 ;Fix SFX Volume Meter Position
.org 0x8006C904
ORI A0, A0, 0xE0 ;Fix Music Volume Meter Position
.org 0x8006C894
JAL drawcolourboxoptions
.org 0x8006E7C8
JAL drawcolourboxoptions
.Close