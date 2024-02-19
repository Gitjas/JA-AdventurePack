REPLACE_STATE_TRIGGER TENYA2 0 ~Global("JA#TENYA_QUEST","GLOBAL",0) Global("HelpTenya","GLOBAL",2)~

/* this is a fix */
ALTER_TRANS TENYA2 // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpTremain","GLOBAL",1)
ReactionGT(LastTalkedToBy,HOSTILE_UPPER)
Global("BOYBODY","GLOBAL",0)~
END

/* this is a fix */
ALTER_TRANS TENYA2 // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpTremain","GLOBAL",1)
ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)
Global("BOYBODY","GLOBAL",0)~
END

ALTER_TRANS TENYA2 // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~GlobalGT("JA#FISHER_KILLS","GLOBAL",0)~
  "EPILOGUE" ~GOTO 11~
END

ALTER_TRANS TENYA2 // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 3 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#FISHER_KILLS","GLOBAL",0)~
END

/* this is a fix */
ALTER_TRANS TENYA2 // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 4 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpTremain","GLOBAL",1)
Global("BOYBODY","GLOBAL",0)~
END

/* ## this is for removing the EscapeAreaDestroy(90) */
// ALTER_TRANS TENYA2 // file name
// BEGIN 2 4 8 9 END // state number (can be more than one)
// BEGIN 0 END // transition number (can be more than one)
// BEGIN // list of changes, see below for flags
  // "ACTION" ~SetGlobal("BOYBODY","GLOBAL",1)
// GiveItemCreate("MISC54",LastTalkedToBy,0,0,0)~
// END

/* ## this is for removing the EscapeAreaDestroy(90) and setting SetGlobal("JA#UMBERL_HOST","%BaldursGateDocks_WaterQueensHouse%",1) */
// ALTER_TRANS TENYA2 // file name
// BEGIN 3 5 7 END // state number (can be more than one)
// BEGIN 0 END // transition number (can be more than one)
// BEGIN // list of changes, see below for flags
  // "ACTION" ~SetGlobal("BOYBODY","GLOBAL",1)
// GiveItemCreate("MISC54",LastTalkedToBy,0,0,0)
// SetGlobal("JA#UMBERL_HOST","%BaldursGateDocks_WaterQueensHouse%",1)
// Enemy()~
// END

ADD_TRANS_ACTION TENYA2
BEGIN 10 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
~SetGlobal("JA#UMBERL_HOST","%BaldursGateDocks_WaterQueensHouse%",1)~

ALTER_TRANS TENYA2 // file name
BEGIN 11 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "JOURNAL" ~%tenya10%~
END

REPLACE_STATE_TRIGGER TENYA2 11 ~Global("Chapter","GLOBAL",%tutu_chapter_7%)~

ADD_STATE_TRIGGER TENYA2 6 ~Global("JA#TENYA_QUEST","GLOBAL",0)~

ALTER_TRANS TENYA2 // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpTremain","GLOBAL",1)
ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)
Global("BOYBODY","GLOBAL",0)~
END

ALTER_TRANS TENYA2 // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpTremain","GLOBAL",1)
ReactionGT(LastTalkedToBy,HOSTILE_UPPER)
Global("BOYBODY","GLOBAL",0)~
END

ALTER_TRANS TENYA2 // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpTremain","GLOBAL",1)
ReactionGT(LastTalkedToBy,NEUTRAL_UPPER)
Global("BOYBODY","GLOBAL",0)~
END

ALTER_TRANS TENYA2 // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 3 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpTremain","GLOBAL",1)
ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)
Global("BOYBODY","GLOBAL",0)~
END

EXTEND_BOTTOM TENYA2 0
IF ~~ THEN REPLY @0 EXIT
END

EXTEND_BOTTOM TENYA2 6
IF ~~ THEN REPLY @1 GOTO JA#TENYA_X0
END

APPEND TENYA2

IF ~~ THEN BEGIN JA#TENYA_X0
SAY @2
IF ~~ THEN DO ~SetGlobal("JA#UMBERL_HOST","%BaldursGateDocks_WaterQueensHouse%",1)Enemy()~ EXIT
END

IF ~Global("JA#TENYA_QUEST","GLOBAL",1)~ THEN BEGIN JA#TENYA_00
SAY @3
= @4
= @5
IF ~~ THEN REPLY @6 GOTO JA#TENYA_02
IF ~~ THEN REPLY @7 GOTO JA#TENYA_03
IF ~~ THEN REPLY @8 GOTO JA#TENYA_01
END

IF ~~ THEN BEGIN JA#TENYA_01
SAY @9
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN JA#TENYA_02
SAY @10
= @11
IF ~~ THEN DO ~SetGlobal("JA#TENYA_QUEST","GLOBAL",2)~ UNSOLVED_JOURNAL @1022 EXIT
END

IF ~~ THEN BEGIN JA#TENYA_03
SAY @12
IF ~~ THEN REPLY @13 GOTO JA#TENYA_02
IF ~~ THEN REPLY @14 GOTO JA#TENYA_04
END

IF ~~ THEN BEGIN JA#TENYA_04
SAY @15
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~Global("JA#TENYA_QUEST","GLOBAL",2)~ THEN BEGIN JA#TENYA_05
SAY @16
IF ~!Dead("JA#TLOS1")~ THEN REPLY @17 GOTO JA#TENYA_09
IF ~Dead("JA#TLOS1")~ THEN REPLY @18 GOTO JA#TENYA_07
IF ~Dead("JA#TLOS1")~ THEN REPLY @19 GOTO JA#TENYA_07
IF ~~ THEN REPLY @20 EXIT
END

IF ~~ THEN BEGIN JA#TENYA_07
SAY @21
IF ~~ THEN DO ~EraseJournalEntry(@1022)SetGlobal("JA#TENYA_QUEST","GLOBAL",3)AddExperienceParty(1000)GiveItemCreate("JA#TENYA",LastTalkedToBy,1,0,0)~ SOLVED_JOURNAL @1034 EXIT
END

IF ~!Global("Chapter","GLOBAL",%tutu_chapter_7%)Global("JA#TENYA_QUEST","GLOBAL",3)~ THEN BEGIN JA#TENYA_08
SAY @23
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA#TENYA_09
SAY @24
IF ~~ THEN DO ~EraseJournalEntry(@1022)SetGlobal("JA#TENYA_QUEST","GLOBAL",10)SetGlobal("JA#UMBERL_HOST","%BaldursGateDocks_WaterQueensHouse%",1)Enemy()~ EXIT
END

////APPEND END/////
END

///TENYA NICHT TENYA2!!

/* this doesn't change anything in my install */

/* This is a fix */
ALTER_TRANS TENYA // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HostileFishermen","GLOBAL",0)~
END

/* this doesn't change anything in my install */
ALTER_TRANS TENYA // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Dead("Jebadoh")
Dead("Telman")
Dead("Sonner")~
END

/* this doesn't change anything in my install */
ALTER_TRANS TENYA // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~PartyHasItem("MISC53")~
END

/* this won't show because Garrick (bg1npc + GToaT and Finch have I_C_T and are likely to be installed before JAP */
EXTEND_BOTTOM TENYA 8
IF ~PartyHasItem("MISC53")
Dead("Jebadoh")
Dead("Telman")
Dead("Sonner")~ THEN REPLY @25 GOTO 10
END

/* This is a fix, but we have to apply it to every transaction because e.g. Finch interjects here 
ALTER_TRANS TENYA // file name
BEGIN 16 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("TalkedToTenya","GLOBAL",1)
SetGlobal("KillFishermen","GLOBAL",1)
EraseJournalEntry(%999999%)
EraseJournalEntry(%999998%)
EraseJournalEntry(%999997%)
EraseJournalEntry(%999996%)
EraseJournalEntry(%999995%)
EraseJournalEntry(%999994%)
EraseJournalEntry(%999993%)
ForceSpell(Myself,DRYAD_TELEPORT)~
  "SOLVED_JOURNAL" ~999992~
END

*/

/* changed to ADD_TRANS_ACTION */

ADD_TRANS_ACTION TENYA
BEGIN 16 END 
BEGIN END 
~SetGlobal("TalkedToTenya","GLOBAL",1)
SetGlobal("KillFishermen","GLOBAL",1)
EraseJournalEntry(%tenya1%)
EraseJournalEntry(%tenya2%)
EraseJournalEntry(%tenya3%)
EraseJournalEntry(%tenya4%)
EraseJournalEntry(%tenya5%)
EraseJournalEntry(%tenya6%)
EraseJournalEntry(%tenya7%)
ForceSpell(Myself,DRYAD_TELEPORT)
AddJournalEntry(%tenya8%,QUEST_DONE)~