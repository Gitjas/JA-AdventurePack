ADD_STATE_TRIGGER BARDOL 0 ~NumTimesTalkedTo(0)~

ALTER_TRANS BARDOL // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~MoveToPoint([1104.722])
Face(11)~
END

ALTER_TRANS BARDOL // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~MoveToPoint([1104.722])
Face(11)~
END

ALTER_TRANS BARDOL // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~MoveToPoint([1104.722])
Face(11)~
END


APPEND BARDOL

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN BEGIN JA#BARDOL_1
SAY @0
IF ~~ THEN EXIT
END

IF ~Dead("Mulahey")Global("JA#BARDOL_MULAHEY","LOCALS",0)~ THEN BEGIN JA#BARDOL_2
SAY @1
IF ~~ THEN REPLY @2 DO ~SetGlobal("JA#BARDOL_MULAHEY","LOCALS",1)~ EXIT
IF ~~ THEN REPLY @3 DO ~SetGlobal("JA#BARDOL_MULAHEY","LOCALS",1)~ GOTO JA#BARDOL_5
END

IF ~NumTimesTalkedToGT(0)Global("JA#BARDOL_MULAHEY","LOCALS",0)~ THEN BEGIN JA#BARDOL_3
SAY @4
IF ~~ THEN REPLY @2 EXIT
IF ~~ THEN REPLY @3 GOTO JA#BARDOL_5
END

IF ~NumTimesTalkedToGT(0)Global("JA#BARDOL_MULAHEY","LOCALS",1)~ THEN BEGIN JA#BARDOL_4
SAY @5
IF ~~ THEN REPLY @2 EXIT
IF ~~ THEN REPLY @3 GOTO JA#BARDOL_5
END

IF ~~ THEN BEGIN JA#BARDOL_5
SAY @6
IF ~Global("MetBrage","GLOBAL",0)~ THEN REPLY @7 JOURNAL @8 GOTO JA#BARDOL_6
IF ~!Dead("Mulahey")~ THEN REPLY @9 JOURNAL @10 GOTO JA#BARDOL_7
IF ~~ THEN REPLY @11 GOTO JA#BARDOL_8
IF ~~ THEN REPLY @12 EXIT
END

IF ~~ THEN BEGIN JA#BARDOL_6
SAY @13
= @14
IF ~~ THEN REPLY @15 GOTO JA#BARDOL_5
IF ~~ THEN REPLY @16 EXIT
END

IF ~~ THEN BEGIN JA#BARDOL_7
SAY @17
IF ~~ THEN REPLY @15 GOTO JA#BARDOL_5
IF ~~ THEN REPLY @16 EXIT
END

IF ~~ THEN BEGIN JA#BARDOL_8
SAY @18
= @19
IF ~~ THEN REPLY @15 GOTO JA#BARDOL_5
IF ~~ THEN REPLY @16 EXIT
END

END