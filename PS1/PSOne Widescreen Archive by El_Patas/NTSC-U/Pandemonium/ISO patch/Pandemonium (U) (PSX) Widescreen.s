.psx
.open "SLUS_002.32", 0x8000F800
.org 0x8004E040
JR RA ;Skip LoadSTR Function to Enable Custom Code
NOP ;Delay Slot
correct3DAspect:
LW T0, 0(A0)
LUI K1, 0x8000
AND K1, A0, K1 ;Check if 3D Scaling Values are Pointed by A0
BEQ R0, K1, skip3dasp
NOP
ADDIU T0, R0, 0xC00 ;3D Scaling Value (0.75)
skip3dasp:
J 0x80066F6C
NOP
scaledownbitmaps:
SRA K1, A1, 0x2
SRA A1, A1, 0x1
ADDU A1, A1, K1 ;Scale Down Most bitmaps
J 0x8004E384
ADDU A1, A2, A1
.org 0x80066F64
J correct3DAspect
.org 0x8004D8AC
ADDIU T5, R0, 0xC00 ;Billboard Scaling Value (0.75)
.org 0x8004E37C
J scaledownbitmaps
.org 0x8004E930
ORI S2, R0, 0xFF ;Gems Count Position
.org 0x8004E9A8
ADDIU S3, V1, 0xFFFE ;Gems Count Spacing
.org 0x8004EAA8
ADDIU S0, S0, 0xC ;Health Count Spacing
.org 0x8004EB5C
ADDIU S0, A0, 0x13 ;Lives X Position
.org 0x8004EB5C
ADDIU S0, A0, 0x13 ;Lives Counter X Position
.org 0x8004EB90
ADDIU S3, V1, 0xFFFE ;Lives Counter Spacing
.org 0x8004F1E0
ADDIU S3, V1, 0xFFFE ;Switch Player Text Spacing
.org 0x8004F178
ADDIU S2, R0, 0x34 ;Switch Player Text Position
.org 0x8004F2E8
ADDIU S3, V1, 0xFFFE ;Switch Player Text Spacing
.org 0x8004F280
ADDIU S2, R0, 0x34 ;Switch Player Text Position
.org 0x8004EEB4
ADDIU A0, A0, 0xFFFE ;Level Number Spacing
.org 0x8004F008
ADDIU A0, A0, 0xFFFE ;Level Title Spacing
.org 0x8004E430
ADDIU A0, A0, 0xFFFE ;Pause Menu Text Spacing
.org 0x80053B04
ADDIU A0, R0, 0x51 ;To Continue Odd Frames Text Position
.org 0x80053AD8
ADDIU A0, R0, 0x51 ;To Continue Even Frames Text Position
.org 0x8005391C
ORI A0, A0, 0xBD ;Quit Marker Position
.org 0x80053ABC
ORI A0, A0, 0xAE ;No Marker Position
.org 0x800539DC
ADDIU A0, R0, 0x51 ;To Quit Even Frames Text Position
.org 0x800539B0
ADDIU A0, R0, 0x51 ;To Quit Odd Frames Text Position
.org 0x8005474C
ADDIU A0, R0, 0x51 ;To Continue Level End Position
.Close