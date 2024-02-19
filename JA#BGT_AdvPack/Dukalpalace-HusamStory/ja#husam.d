
ALTER_TRANS HUSAM // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#LEADERS","LOCALS",1)~
END

ALTER_TRANS HUSAM // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#PLANS","LOCALS",1)~
END

EXTEND_BOTTOM HUSAM 3
IF ~~ THEN REPLY @0 DO ~SetGlobal("JA#DOOR","LOCALS",1)~ GOTO JA#HUSAM_1
END



ALTER_TRANS HUSAM // file name
BEGIN 7 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#PLANS","LOCALS",0)~
  "ACTION" ~SetGlobal("JA#PLANS","LOCALS",1)
SetGlobal("AskedHusam1","GLOBAL",1)~
  "EPILOGUE" ~GOTO 5~
END

ALTER_TRANS HUSAM // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO 7~
END


ALTER_TRANS HUSAM // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO 7~
END


EXTEND_BOTTOM HUSAM 7
IF ~Global("JA#LEADERS","LOCALS",0)~ THEN REPLY @1 DO ~SetGlobal("JA#LEADERS","LOCALS",1)~ GOTO 5
END

EXTEND_BOTTOM HUSAM 7
IF ~Global("JA#DOOR","LOCALS",0)~ THEN REPLY @0 DO ~SetGlobal("JA#DOOR","LOCALS",1)~ GOTO JA#HUSAM_1
END


ALTER_TRANS HUSAM // file name
BEGIN 11 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@20~ 
END

EXTEND_BOTTOM HUSAM 11
IF ~~ THEN REPLY @0 GOTO JA#HUSAM_2
END



APPEND HUSAM

IF ~~ THEN BEGIN JA#HUSAM_1
SAY @2
IF ~~ THEN DO ~SetGlobal("JA#HUSAM_SECRET","GLOBAL",2)
AddJournalEntry(%husam1%,QUEST)~ GOTO 7
END

IF ~~ THEN BEGIN JA#HUSAM_2
SAY @2
IF ~~ THEN DO ~AddJournalEntry(%husam1%,QUEST)
SetGlobal("JA#HUSAM_SECRET","GLOBAL",2)
SetGlobal("HusamMove","GLOBAL",2)
EscapeAreaDestroy(90)~ EXIT
END

END




// HUSAM2


ALTER_TRANS HUSAM2 // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~ClearAllActions()
StartCutSceneMode()
StartCutScene("JA#HUCU1")~
END

ALTER_TRANS HUSAM2 // file name
BEGIN 12 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~ClearAllActions()
MultiplayerSync()
StartCutSceneMode()
StartCutScene("JA#HUCU3")~
END

ALTER_TRANS HUSAM2 // file name
BEGIN 16 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#HUSAM_3~
END



APPEND HUSAM2

IF ~~ THEN BEGIN JA#HUSAM_3
SAY @3
IF ~~ THEN DO ~SetGlobal("HusamMove","GLOBAL",7)
EscapeAreaDestroy(90)~ UNSOLVED_JOURNAL @1059 EXIT
END

END



BEGIN JA#HUSAM

IF ~Global("HusamMove","GLOBAL",7)
Global("JA#HUSAM_MOVE","GLOBAL",0)~ THEN BEGIN JA#HUSAM2_1
SAY @5
= @6
IF ~~ THEN DO ~SetGlobal("JA#HUSAM_MOVE","GLOBAL",1)MoveToPoint([1773.3193])DestroySelf()~ UNSOLVED_JOURNAL @1060 EXIT
END

IF ~Global("JA#HUSAM_MOVE","GLOBAL",1)~ THEN BEGIN JA#HUSAM2_2
SAY @8
IF ~!PartyHasItem("SCRL3F")~ THEN REPLY @9 GOTO JA#HUSAM2_3
IF ~PartyHasItem("SCRL3F")~ THEN REPLY @10 GOTO JA#HUSAM2_4
END

IF ~~ THEN BEGIN JA#HUSAM2_3
SAY @11
= @12
IF ~~ THEN DO ~SetGlobal("JA#HUSAM_MOVE","GLOBAL",2)MoveToPoint([900.838])~ UNSOLVED_JOURNAL @1061 EXIT
END

IF ~~ THEN BEGIN JA#HUSAM2_4
SAY @14
= @12
IF ~~ THEN DO ~SetGlobal("JA#HUSAM_MOVE","GLOBAL",2)MoveToPoint([900.838])~ UNSOLVED_JOURNAL @1062 EXIT
END

IF ~Global("JA#HUSAM_MOVE","GLOBAL",2)~ THEN BEGIN JA#HUSAM2_5
SAY @16
IF ~~ THEN EXIT
END

IF ~Global("JA#HUSAM_MOVE","GLOBAL",3)
Global("SarevokBehavior","GLOBAL",1)~ THEN BEGIN JA#HUSAM2_6
SAY @17
= @18
IF ~~ THEN DO ~EraseJournalEntry(@1062)
EraseJournalEntry(@1061)
EraseJournalEntry(@1060)
EraseJournalEntry(@1059)
SetGlobal("JA#HUSAM_MOVE","GLOBAL",4)
EscapeAreaDestroy(90)~ SOLVED_JOURNAL @1063 EXIT
END










