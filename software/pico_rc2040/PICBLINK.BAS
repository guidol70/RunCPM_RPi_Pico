10 REM ---------------------------------------------------------------------
20 REM Original MBASIC Pin Control Code from Krzysztof Klis
30 REM from ArduinoInterface-folder in the original RUNCPM project
40 REM ---------------------------------------------------------------------
50 REM ### Load machine code procedures to memory ###
60 BD$="" : READ A : WHILE A>-1 : BD$=BD$+CHR$(A) : READ A : WEND
70 ADR=PEEK(VARPTR(BD$)+1)+PEEK(VARPTR(BD$)+2)*256
80 REM
90 REM ---------------------------------------------------------------------
100 REM ### USRx = BDOS CALL 22x ###
110 REM
120 DEF USR0=ADR : DEF USR1=ADR+14 : DEF USR2=ADR+37 : DEF USR3=ADR+51
130 REM ---------------------------------------------------------------------
140 REM ### P = PIN number and its V = value (0 = LOW, 1 = HIGH) ###
150 REM ### P1=GPIO6=RED_LED P2=GPIO25=GREEN_LED V0=OFF V1=ON
160 P1=6:P2=25:V0=0:V1=1
170 REM
180 REM ---------------------------------------------------------------------
190 REM ### Variables do not work with USRx as described in MBasic manual ###
200 REM ### But you can pass argument via memory using fixed numbers only ###
210 REM ---------------------------------------------------------------------
220 REM ### RED LED GPIO6 ON
230 POKE ADR+74,P1 : POKE ADR+75,V1 : X=USR0(PEEK(ADR+74)*256+1)
240 X=USR2(PEEK(ADR+74)*256+PEEK(ADR+75))
250 REM ---------------------------------------------------------------------
260 REM ### GREEN LED GPIO25 OFF
270 POKE ADR+74,P2 : POKE ADR+75,V0 : X=USR0(PEEK(ADR+74)*256+1)
280 X=USR2(PEEK(ADR+74)*256+PEEK(ADR+75))
290 REM ---------------------------------------------------------------------
300 REM ### PAUSE
310 FOR I=1 TO 2000:NEXT I
320 REM ---------------------------------------------------------------------
330 REM ### RED LED GPIO6 OFF
340 POKE ADR+74,P1 : POKE ADR+75,V0 : X=USR0(PEEK(ADR+74)*256+1)
350 X=USR2(PEEK(ADR+74)*256+PEEK(ADR+75))
360 REM ---------------------------------------------------------------------
370 REM ### GREEN LED GPIO25 ON
380 POKE ADR+74,P2 : POKE ADR+75,V1 : X=USR0(PEEK(ADR+74)*256+1)
390 X=USR2(PEEK(ADR+74)*256+PEEK(ADR+75))
400 REM ---------------------------------------------------------------------
410 REM PAUSE
420 FOR I=1 TO 2000:NEXT I
430 GOTO 220
440 REM ---------------------------------------------------------------------
450 END
460 REM
470 REM ---------------------------------------------------------------------
480 REM ### BDOS procedures in machine code ###
490 REM ---------------------------------------------------------------------
500 DATA 229,94,1,1,0,9,86,14,220,205,5,0,225,201
510 DATA 229,1,1,0,9,86,14,221,205,5,0,225,119,229,62,0,1,1,0,9,119,225,201
520 DATA 229,94,1,1,0,9,86,14,222,205,5,0,225,201
530 DATA 229,1,1,0,9,86,14,223,205,5,0,84,93,225,115,229,1,1,0,9,114,225,201
540 DATA 0,0,-1
