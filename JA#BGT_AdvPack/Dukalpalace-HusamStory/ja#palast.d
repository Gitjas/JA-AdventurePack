BEGIN ~JA#NOPA6~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN BEGIN JA#ODELI_0
SAY @0
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN JA#ODELI_1
SAY @1
IF ~~ THEN REPLY @2 GOTO JA#ODELI_2
IF ~~ THEN REPLY @3 GOTO JA#ODELI_3
IF ~~ THEN REPLY @4 GOTO JA#ODELI_4
IF ~~ THEN REPLY @5 EXIT
END

IF ~~ THEN BEGIN JA#ODELI_2
SAY @6
= @7
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA#ODELI_3
SAY @8
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA#ODELI_4
SAY @9
IF ~~ THEN EXIT
END

IF ~RandomNum(3,1)~ THEN BEGIN JA#ODELI_5
SAY @10
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN JA#ODELI_6
SAY @11
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN JA#ODELI_7
SAY @12
IF ~~ THEN EXIT
END


BEGIN ~JA#KAEM1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN JA#KAEM1_0
SAY @13
IF ~~ THEN REPLY @14 GOTO JA#KAEM1_1
IF ~~ THEN REPLY @15 GOTO JA#KAEM1_5
IF ~~ THEN REPLY @16 GOTO JA#KAEM1_4
END

IF ~~ THEN BEGIN JA#KAEM1_1
SAY @17
IF ~~ THEN REPLY @18 GOTO JA#KAEM1_2
IF ~~ THEN REPLY @16 GOTO JA#KAEM1_4
END

IF ~~ THEN BEGIN JA#KAEM1_2
SAY @19
IF ~~ THEN REPLY @20 GOTO JA#KAEM1_3
IF ~~ THEN REPLY @21 GOTO JA#KAEM1_4
END

IF ~~ THEN BEGIN JA#KAEM1_3
SAY @22
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN JA#KAEM1_4
SAY @23
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN JA#KAEM1_5
SAY @24
IF ~~ THEN REPLY @14 GOTO JA#KAEM1_1
IF ~~ THEN REPLY @16 GOTO JA#KAEM1_4
END

BEGIN ~JA#FLAM2~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN BEGIN JA#FLAM2_0
SAY @25
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN JA#FLAM2_1
SAY @26
IF ~~ THEN DO ~SetGlobal("JA#ALERT","MYAREA",1) Enemy()~ EXIT
END


BEGIN ~JA#FLAM3~

IF ~RandomNum(3,1)~ THEN BEGIN JA#FLAM3_1
SAY @27
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN JA#FLAM3_2
SAY @28
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN JA#FLAM3_3
SAY @29
IF ~~ THEN EXIT
END


BEGIN ~JA#FLAM4~

IF ~RandomNum(3,1)~ THEN BEGIN JA#FLAM3_1
SAY @30
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN JA#FLAM3_2
SAY @31
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN JA#FLAM3_3
SAY @32
IF ~~ THEN EXIT
END


BEGIN ~JA#NOB00~

IF ~RandomNum(3,1)~ THEN BEGIN JA#NOB00_0
SAY @33
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN JA#NOB00_1
SAY @34
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN JA#NOB00_2
SAY @35
IF ~~ THEN DO ~AddJournalEntry(%noblba1%,USER)~ EXIT
END


BEGIN ~JA#NOB13~

IF ~RandomNum(3,1)~ THEN BEGIN JA#NOB13_0
SAY @36
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA#NOB13_1
SAY @37
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN JA#NOB13_2
SAY @38
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN JA#NOB13_3
SAY @39
IF ~~ THEN DO ~AddJournalEntry(%noblba2%,USER)~ EXIT
END


BEGIN ~JA#NOBW6~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN BEGIN JA#NOBW6_0
SAY @39
IF ~~ THEN DO ~AddJournalEntry(%noblba2%,USER)~ EXIT
END

IF ~RandomNum(3,1)~ THEN BEGIN JA#NOBW6_1
SAY @40
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN JA#NOBW6_2
SAY @41
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN JA#NOBW6_3
SAY @42
IF ~~ THEN EXIT
END




ALTER_TRANS FLAM10 // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~Wait(5)
SetGlobal("JA#ALERT","%NBaldursGate_DucalPalace_L3%",1)~
END

ALTER_TRANS FLAM10 // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~Wait(5)
SetGlobal("JA#ALERT","%NBaldursGate_DucalPalace_L3%",1)~
END

ALTER_TRANS FLAM10 // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~Wait(5)
SetGlobal("JA#ALERT","%NBaldursGate_DucalPalace_L3%",1)~
END

ALTER_TRANS FLAM10 // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~Wait(5)
SetGlobal("JA#ALERT","%NBaldursGate_DucalPalace_L3%",1)~
END

ALTER_TRANS FLAM10 // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~Wait(5)
SetGlobal("JA#ALERT","%NBaldursGate_DucalPalace_L3%",1)~
END

ALTER_TRANS FLAM10 // file name
BEGIN 7 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("Invitation","GLOBAL",1)
ChangeEnemyAlly(Myself,NEUTRAL)~
END

APPEND FLAM10

IF ~Global("Invitation","GLOBAL",1)~ THEN BEGIN JA#FLAM10_1
SAY @43
IF ~~ THEN EXIT
END

END
