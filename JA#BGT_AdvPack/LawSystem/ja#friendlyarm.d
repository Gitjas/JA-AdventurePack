
//WACHEN AM TOR

REPLACE_STATE_TRIGGER FRIEND 0 ~Global("JA#FR_RULES","%FriendlyArmInn%",0)~
REPLACE_STATE_TRIGGER FRIEND 7 ~GlobalTimerNotExpired("JA#FRBLOCKED","GLOBAL")~
REPLACE_STATE_TRIGGER FRIEND 8 ~!GlobalTimerNotExpired("JA#FRBLOCKED","GLOBAL")~

ALTER_TRANS FRIEND // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#FR_RULES","%FriendlyArmInn%",1)~
END

ALTER_TRANS FRIEND // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#FR_RULES","%FriendlyArmInn%",1)~
END

ALTER_TRANS FRIEND // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#FR_RULES","%FriendlyArmInn%",1)~
END

ALTER_TRANS FRIEND // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#FR_RULES","%FriendlyArmInn%",1)~
END

ALTER_TRANS FRIEND // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#FR_RULES","%FriendlyArmInn%",1)~
END


//WACHEN INNEN

REPLACE_STATE_TRIGGER FAFIGHT 0 ~RandomNum(4,1)~

APPEND FAFIGHT

IF ~RandomNum(4,2)~ THEN BEGIN JA#FAFIGHT_01
SAY @0
IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)~ THEN BEGIN JA#FAFIGHT_02
SAY @1
IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)~ THEN BEGIN JA#FAFIGHT_03
SAY @2
IF ~~ THEN EXIT
END

END


BEGIN ~JA#FACAP~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN JA#FACAP_01
SAY @3
= @4
= @5
IF ~~ THEN REPLY @6 GOTO JA#FACAP_02
IF ~~ THEN REPLY @7 GOTO JA#FACAP_03
IF ~~ THEN REPLY @8 GOTO JA#FACAP_05
IF ~~ THEN REPLY @9 GOTO JA#FACAP_04
END

IF ~~ THEN BEGIN JA#FACAP_02
SAY @10
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN JA#FACAP_03
SAY @11
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN JA#FACAP_04
SAY @12
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN JA#FACAP_05
SAY @13
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END






