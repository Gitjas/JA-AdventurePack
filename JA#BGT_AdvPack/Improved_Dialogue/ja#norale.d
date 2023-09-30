ALTER_TRANS NORALE // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~EquipItem("BRAC09")
Enemy()~
END

ALTER_TRANS NORALE // file name
BEGIN 3 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@11~
END

EXTEND_TOP NORALE 3 #1
++ @0 GOTO JA#NORALE_02 //6
END

EXTEND_TOP NORALE 4 #1
++ @0 GOTO JA#NORALE_02 //7
END

/* This is a tweak
REPLACE_ACTION_TEXT NORALE
~ReputationInc(1)~
~SmallWait(1)~
*/

//bgt
REPLACE_ACTION_TEXT NORALE
~EscapeAreaDestroy(90)~
~SmallWait(1)~

REPLACE_ACTION_TEXT NORALE
~ReputationInc(1)~
~SmallWait(1)~

//bgee eet
REPLACE_ACTION_TEXT NORALE
~EscapeArea()~
~SmallWait(1)~


APPEND NORALE

IF ~StateCheck(Myself,STATE_CHARMED)Global("HelpNoralee","GLOBAL",1)HasItem("BRAC09",Myself)~ THEN BEGIN JA#NORALE_CH01
SAY @1
IF ~~ THEN REPLY @2 GOTO JA#NORALE_CH02
IF ~~ THEN REPLY @3 EXIT
END

IF ~~ THEN BEGIN JA#NORALE_CH02
SAY @4
IF ~~ THEN DO ~GiveItem("BRAC09",LastTalkedToBy)~ EXIT
END

IF ~Global("HelpNoralee","GLOBAL",1)~ THEN BEGIN JA#NORALE_01
SAY @5
IF ~~ THEN REPLY @6 GOTO JA#NORALE_02
IF ~~ THEN REPLY @7 EXIT
END

IF ~~ THEN BEGIN JA#NORALE_02
SAY @8
IF ~Global("HelpNoralee","GLOBAL",1)~ THEN REPLY @9 EXIT
IF ~!Global("HelpNoralee","GLOBAL",1)~ THEN REPLY @9 + JA#NORALE_03
IF ~~ THEN REPLY @10 GOTO 5
END

/* Only small amount of reward if PC crossed her */

IF ~~ THEN BEGIN JA#NORALE_03
SAY @12
COPY_TRANS NORALE 3
END


////APPEND END/////
END
