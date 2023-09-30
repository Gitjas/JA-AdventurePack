ADD_STATE_TRIGGER NILA 0 ~
Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",0)
Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",0)~
ADD_STATE_TRIGGER NILA 1 ~
Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",0)
Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",0)~

REPLACE_STATE_TRIGGER NILA 2 ~
Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",1)~

REPLACE_STATE_TRIGGER NILA 7~
Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",3)
Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",2)~

REPLACE_STATE_TRIGGER NILA 8 ~
NumTimesTalkedToGT(0)
!Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",1)
!Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",1)
!Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",2)~

ALTER_TRANS NILA // file name
BEGIN 0 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#NILA_WHO","LOCALS",1)~
  "REPLY" ~@8~
  "EPILOGUE" ~GOTO JA#NILA_3~
END

ALTER_TRANS NILA // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",2)
MoveToPoint([522.640])~
END


EXTEND_BOTTOM NILA 0
IF ~~ THEN REPLY @0 DO ~SetGlobal("JA#SARE","LOCALS",1)~ GOTO JA#NILA_4
END

EXTEND_BOTTOM NILA 0
IF ~~ THEN REPLY @1 GOTO JA#NILA_5
END

EXTEND_BOTTOM NILA 1
IF ~~ THEN REPLY @0 DO ~SetGlobal("JA#SARE","LOCALS",1)~ GOTO JA#NILA_4
END

EXTEND_BOTTOM NILA 1
IF ~~ THEN REPLY @1 GOTO JA#NILA_5
END


APPEND NILA

IF ~
Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",1)~ THEN BEGIN JA#NILA_1
SAY @2
IF ~~ THEN DO ~SetGlobal("JA#NILA","%NBaldursGate_DucalPalace_L2%",2)
DialogInterrupt(FALSE)
MoveToPoint([587.578])
Face(6)
Wait(2)
PlaySound("AMB_D21")
Unlock("Container 1")
Wait(1)
DialogInterrupt(TRUE)
Dialogue([PC])~ EXIT
END

IF ~
Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",2)~ THEN BEGIN JA#NILA_2
SAY @3
IF ~~ THEN DO ~SetGlobal("JA#NILA","%NBaldursGate_DucalPalace_L2%",3)MoveToPoint([522.640])~ EXIT
END

IF ~~ THEN BEGIN JA#NILA_3
SAY @4
IF ~Global("JA#SARE","LOCALS",0)~ THEN REPLY @0 DO ~SetGlobal("JA#SARE","LOCALS",1)~ GOTO JA#NILA_4
IF ~~ THEN REPLY @1 GOTO JA#NILA_5
END

IF ~~ THEN BEGIN JA#NILA_4
SAY @5
IF ~Global("JA#NILA_WHO","LOCALS",0)~ THEN REPLY @6 DO ~SetGlobal("JA#NILA_WHO","LOCALS",1)~ GOTO JA#NILA_3
IF ~~ THEN REPLY @1 GOTO JA#NILA_5
END

IF ~~ THEN BEGIN JA#NILA_5
SAY @7
IF ~~ THEN EXIT
END

END