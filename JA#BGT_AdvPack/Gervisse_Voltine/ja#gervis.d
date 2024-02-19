
// GERVISSE

REPLACE_STATE_TRIGGER GERVIS 0 ~NumTimesTalkedTo(0)~

REPLACE_STATE_TRIGGER GERVIS 2 ~Dead("Voltine")
Global("JA#GERVIS_QUEST","GLOBAL",1)~

REPLACE_STATE_TRIGGER GERVIS 3 ~!Dead("Voltine")
Global("JA#GERVIS_QUEST","GLOBAL",1)~

ALTER_TRANS GERVIS // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~
  "EPILOGUE" ~GOTO 1~
END

/* if another mod added I_C_T, this won't catch all transaction. Change it A_T_A instead + EXTEND_BOTTOM
ALTER_TRANS GERVIS // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
  "REPLY" ~@83~ 
  "EPILOGUE" ~GOTO JA_GERVIS_5~
END
*/

ADD_TRANS_TRIGGER GERVIS 1 ~False()~

/* we will not change this but add a weighted greetings dialogue
ALTER_TRANS GERVIS // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("HelpLaerta","GLOBAL",1)
SetGlobal("JA#GERVIS_QUEST","GLOBAL",2)
EraseJournalEntry(%gervis1%)
EraseJournalEntry(%gervis2%)
EraseJournalEntry(%gervis3%)~
  "REPLY" ~@84~ 
  "SOLVED_JOURNAL" ~@1043~ 
END
*/


ALTER_TRANS GERVIS // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@85~ 
END

ALTER_TRANS GERVIS // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#GERVIS_QUEST","GLOBAL",10)
Enemy()~
END

/* inserted reply option from above and shortened code */

EXTEND_BOTTOM GERVIS 1
IF ~~ THEN REPLY @83 DO ~AddJournalEntry(%gervis2%,QUEST)~ GOTO JA_GERVIS_5
IF ~~ THEN REPLY @3 DO ~SetGlobal("JA#WHY","LOCALS",1)~ GOTO JA_GERVIS_1
IF ~GlobalGT("JA#VOLT_QUEST","GLOBAL",0)~ THEN REPLY @4 DO ~SetGlobal("JA#OFFEND","LOCALS",1)~ GOTO JA_GERVIS_2
IF ~~ THEN REPLY @5 GOTO JA_GERVIS_3
END

/* this is new weighted greetings dialogue
EXTEND_BOTTOM GERVIS 2
IF ~~ THEN REPLY @6 DO ~SetGlobal("HelpLaerta","GLOBAL",1)
EraseJournalEntry(%gervis1%)
EraseJournalEntry(%gervis2%)
EraseJournalEntry(%gervis3%)~ GOTO 4
END
*/

EXTEND_BOTTOM GERVIS 3
IF ~Global("JA#VOLT_QUEST","GLOBAL",2)~ THEN REPLY @7 DO ~SetGlobal("HelpLaerta","GLOBAL",1)
EraseJournalEntry(%gervis1%)
EraseJournalEntry(%gervis2%)
EraseJournalEntry(%gervis3%)~ GOTO 4
END

EXTEND_BOTTOM GERVIS 3
IF ~~ THEN REPLY @6 DO ~SetGlobal("HelpLaerta","GLOBAL",1)
EraseJournalEntry(%gervis1%)
EraseJournalEntry(%gervis2%)
EraseJournalEntry(%gervis3%)~ GOTO 4
END



APPEND GERVIS

IF WEIGHT #-1
~Dead("Voltine")
Global("JA#GERVIS_QUEST","GLOBAL",1)~ THEN voltine_is_dead
SAY @91
++ @89 DO ~SetGlobal("JA#GERVIS_QUEST","GLOBAL",2)~ + 2
IF ~~ THEN REPLY @6 DO ~SetGlobal("HelpLaerta","GLOBAL",1)
EraseJournalEntry(%gervis1%)
EraseJournalEntry(%gervis2%)
EraseJournalEntry(%gervis3%)~ GOTO 4
END

IF ~~ THEN BEGIN JA_GERVIS_1
  SAY @8
  IF ~~ THEN REPLY @9 GOTO JA_GERVIS_5
  IF ~GlobalGT("JA#VOLT_QUEST","GLOBAL",0)
Global("JA#OFFEND","LOCALS",0)~ THEN REPLY @4 DO ~SetGlobal("JA#OFFEND","LOCALS",1)~ GOTO JA_GERVIS_2
  IF ~Global("JA#OFFEND","LOCALS",1)~ THEN REPLY @10 GOTO 4
  IF ~~ THEN REPLY @11 GOTO JA_GERVIS_4
  IF ~~ THEN REPLY @5 GOTO JA_GERVIS_3
END

IF ~~ THEN BEGIN JA_GERVIS_2
  SAY @12
  IF ~~ THEN REPLY @9 GOTO JA_GERVIS_5
  IF ~Global("JA#WHY","LOCALS",0)~ THEN REPLY @3 DO ~SetGlobal("JA#WHY","LOCALS",1)~ GOTO JA_GERVIS_1
  IF ~GlobalGT("JA#VOLT_QUEST","GLOBAL",0)~ THEN REPLY @10 GOTO 4
  IF ~~ THEN REPLY @11 GOTO JA_GERVIS_4
  IF ~~ THEN REPLY @5 GOTO JA_GERVIS_3
END

IF ~~ THEN BEGIN JA_GERVIS_3
  SAY @13
  IF ~~ THEN DO ~SetGlobal("JA#GERVIS_QUEST","GLOBAL",10)~ EXIT
END

IF ~~ THEN BEGIN JA_GERVIS_4
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#GERVIS_QUEST","GLOBAL",10)~ EXIT
END

IF ~~ THEN BEGIN JA_GERVIS_5
  SAY @15
= @16
  IF ~~ THEN DO ~SetGlobal("JA#GERVIS_QUEST","GLOBAL",1)AddJournalEntry(%gervis2%,QUEST)~ EXIT
END

IF WEIGHT #-1
~Global("JA#GERVIS_QUEST","GLOBAL",10)~ THEN BEGIN JA_GERVIS_6
  SAY @17
  IF ~!Dead("Voltine")Global("JA#VOLT_QUEST","GLOBAL",2)~ THEN REPLY @18 GOTO 4
  IF ~Dead("Voltine")~ THEN REPLY @19 GOTO 4
  IF ~!Dead("Voltine")~ THEN REPLY @20 GOTO JA_GERVIS_5
  IF ~~ THEN REPLY @21 EXIT
END

IF WEIGHT #-1
~Global("JA#GERVIS_QUEST","GLOBAL",2)~ THEN BEGIN JA_GERVIS_7
  SAY @22
  IF ~~ THEN REPLY @23 GOTO JA_GERVIS_9
  IF ~~ THEN REPLY @24 GOTO JA_GERVIS_8
  IF ~~ THEN REPLY @25 GOTO 4
END

IF ~~ THEN BEGIN JA_GERVIS_8
  SAY @26
  IF ~~ THEN REPLY @27 GOTO JA_GERVIS_9
  IF ~~ THEN REPLY @25 GOTO 4
END

IF ~~ THEN BEGIN JA_GERVIS_9
  SAY @28
  IF ~~ THEN EXIT
END

END







// VOLTINE

REPLACE_STATE_TRIGGER VOLTIN 0 ~NumTimesTalkedTo(0)
AreaCheck("JA#C08")~

REPLACE_STATE_TRIGGER VOLTIN 2 ~False()~

REPLACE_STATE_TRIGGER VOLTIN 5 ~Global("HelpVoltine","GLOBAL",1)~

/* change this to ADD_TRANS_ACTION to catch all NPC mods that already added I_C_T
ALTER_TRANS VOLTIN // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#VOLT_QUEST","GLOBAL",1)~
END
*/

ADD_TRANS_ACTION VOLTIN
BEGIN 0 END
BEGIN 0 END
~SetGlobal("JA#VOLT_QUEST","GLOBAL",1)~


/* this will not show for all cases if other NPC mods already added I_C_T - moved to area script
ALTER_TRANS VOLTIN // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~ClearAllActions()StartCutSceneMode()StartCutScene("JA#CUVOM")~
END
*/

/* remove reply option - see changes below
ALTER_TRANS VOLTIN // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@86~	
END
*/

/* add this to all transitions */
ADD_TRANS_ACTION VOLTIN
BEGIN 3 END
BEGIN 0 END
~EraseJournalEntry(@1039)~

ALTER_TRANS VOLTIN // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~Enemy()~
END

/* this will be turned into an own new greetings dialogue for compatibility reasons
EXTEND_BOTTOM VOLTIN 3
IF ~~ THEN REPLY @29 GOTO JA_VOLTIN_9
END
*/

APPEND VOLTIN

/* Gervisse is dead - not PC can acceot Gervisse's thanks or kill her, too. This will work with bg1npc as long as no other mod introduces a weighted dialogue higher than this one */

IF WEIGHT #-1 ~Dead("Gervisse")
Global("HelpVoltine","GLOBAL",0)
~ THEN BEGIN gervisse_is_dead
SAY @88
++ @89 + 3
++ @29 GOTO JA_VOLTIN_9
END



IF WEIGHT #-1
~NumTimesTalkedToGT(0) Global("JA#VOLT_QUEST","GLOBAL",0)!Dead("Gervisse")~ THEN BEGIN JA_VOLTIN_1
  SAY @30
  IF ~Global("JA#GERVIS_QUEST","GLOBAL",1)~ THEN REPLY @31 GOTO JA_VOLTIN_2
  IF ~Global("JA#GERVIS_QUEST","GLOBAL",10)~ THEN REPLY @32 GOTO JA_VOLTIN_3
  IF ~~ THEN REPLY @33 GOTO JA_VOLTIN_9
  IF ~~ THEN REPLY @34 GOTO JA_VOLTIN_5
END

IF ~~ THEN BEGIN JA_VOLTIN_2
  SAY @35
  IF ~~ THEN REPLY @36 GOTO JA_VOLTIN_9
  IF ~~ THEN REPLY @37 GOTO JA_VOLTIN_3
  IF ~~ THEN REPLY @34 GOTO JA_VOLTIN_5
END

IF ~~ THEN BEGIN JA_VOLTIN_3
  SAY @38
= @39
  IF ~~ THEN REPLY @36 GOTO JA_VOLTIN_9
  IF ~~ THEN REPLY @40 GOTO JA_VOLTIN_4
  IF ~~ THEN REPLY @41 GOTO JA_VOLTIN_9
  IF ~~ THEN REPLY @34 GOTO JA_VOLTIN_5
END

IF ~~ THEN BEGIN JA_VOLTIN_4
  SAY @42
  IF ~~ THEN DO ~SetGlobal("JA#VOLT_QUEST","GLOBAL",2)~ UNSOLVED_JOURNAL @1038 EXIT
END

IF ~~ THEN BEGIN JA_VOLTIN_5
  SAY @44
  IF ~~ THEN DO ~SetGlobal("HelpVoltine","GLOBAL",1)
EraseJournalEntry(%gervis1%)
EraseJournalEntry(%gervis2%)
EraseJournalEntry(%gervis3%)
EraseJournalEntry(@1038)ActionOverride("Gervisse",Attack("Voltine"))Attack("Gervisse")~ SOLVED_JOURNAL @1039 EXIT
END

IF WEIGHT #-1
~Global("JA#VOLT_QUEST","GLOBAL",1)!Dead("Gervisse")~ THEN BEGIN JA_VOLTIN_6
  SAY @46
  IF ~Global("JA#GERVIS_QUEST","GLOBAL",1)~ THEN REPLY @31 GOTO JA_VOLTIN_2
  IF ~~ THEN REPLY @32 GOTO JA_VOLTIN_3
  IF ~~ THEN REPLY @33 GOTO JA_VOLTIN_9
  IF ~~ THEN REPLY @34 GOTO JA_VOLTIN_5
END

IF WEIGHT #-1
~Global("JA#VOLT_QUEST","GLOBAL",2)!Dead("Gervisse")~ THEN BEGIN JA_VOLTIN_7
  SAY @47
  IF ~~ THEN REPLY @48 GOTO JA_VOLTIN_8
  IF ~~ THEN REPLY @49 GOTO JA_VOLTIN_9
  IF ~Dead("Gervisse")~ THEN REPLY @50 + JA_VOLTIN_9
  IF ~~ THEN REPLY @34 GOTO JA_VOLTIN_5
END

IF ~~ THEN BEGIN JA_VOLTIN_8
  SAY @51
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA_VOLTIN_9
  SAY @52
  IF ~~ THEN DO ~SetGlobal("HelpVoltine","GLOBAL",1)
EraseJournalEntry(%gervis1%)
EraseJournalEntry(%gervis2%)
EraseJournalEntry(%gervis3%)
EraseJournalEntry(@1038)
Enemy()~ EXIT
END

END



// LAERTA

/* we leave this out. We can't catch other NPC mods adding I_C_T into this state. Gervisse will spwn any time of day
ALTER_TRANS LAERTA // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#GERVIS_SPWN","%NWBaldursGate_LaertasHouse_L1%",1)
SetGlobal("TalkedToLaerta","GLOBAL",1)~
END
*/

/* this is not necessary and may block other mod content
REPLACE_STATE_TRIGGER LAERTA 0 ~Global("TalkedToLaerta","GLOBAL",0)~
*/

REPLACE_STATE_TRIGGER LAERTA 4 ~Global("JA#QUESTDONE","%NWBaldursGate_LaertasHouse_L1%",0)
OR(2)
Global("HelpLaerta","GLOBAL",1)
Global("HelpVoltine","GLOBAL",1)~

ADD_TRANS_ACTION LAERTA
BEGIN 4 END
BEGIN 0 END
~SetGlobal("JA#QUESTDONE","%NWBaldursGate_LaertasHouse_L1%",1)~

ALTER_TRANS LAERTA // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@87~ 
END

ALTER_TRANS LAERTA // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Dead("Voltine")Dead("Gervisse")~
  "SOLVED_JOURNAL" ~@1042~ 
END

EXTEND_BOTTOM LAERTA 1
IF ~~ THEN REPLY @53 GOTO JA_LAERTA_3
END

EXTEND_BOTTOM LAERTA 1
IF ~~ THEN REPLY @54 GOTO JA_LAERTA_1
END

EXTEND_BOTTOM LAERTA 1
IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
END

EXTEND_BOTTOM LAERTA 1
IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
END

EXTEND_BOTTOM LAERTA 4
IF ~Dead("Voltine")!Dead("Gervisse")~ THEN DO ~SetGlobal("JA#QUESTDONE","%NWBaldursGate_LaertasHouse_L1%",1)
SetGlobal("HelpLaerta","GLOBAL",2)
AddexperienceParty(500)
GiveItem("SCRL78",LastTalkedToBy)~ SOLVED_JOURNAL @1040 EXIT
END

EXTEND_BOTTOM LAERTA 4
IF ~!Dead("Voltine")Dead("Gervisse")~ THEN DO ~SetGlobal("JA#QUESTDONE","%NWBaldursGate_LaertasHouse_L1%",1)
SetGlobal("HelpLaerta","GLOBAL",2)
AddexperienceParty(500)
GiveItem("SCRL78",LastTalkedToBy)~ SOLVED_JOURNAL @1041 EXIT
END


APPEND LAERTA

IF ~~ THEN BEGIN JA_LAERTA_1
  SAY @59
  IF ~~ THEN REPLY @60 GOTO JA_LAERTA_2
  IF ~~ THEN REPLY @61 EXIT
END

IF ~~ THEN BEGIN JA_LAERTA_2
  SAY @62
  IF ~~ THEN REPLY @63 GOTO JA_LAERTA_3
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @64 EXIT
END

IF ~~ THEN BEGIN JA_LAERTA_3
  SAY @65
  IF ~~ THEN EXTERN LOUISE JA_LOUISE_1
END

IF ~~ THEN BEGIN JA_LAERTA_4
  SAY @66
= @67
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN BEGIN JA_LAERTA_5
  SAY @72
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN BEGIN JA_LAERTA_6
  SAY @73
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN BEGIN JA_LAERTA_7
  SAY @74
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN BEGIN JA_LAERTA_8
  SAY @75
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN BEGIN JA_LAERTA_9
  SAY @76
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~~ THEN REPLY @71 EXIT
END


END


// LOUISE

REPLACE_STATE_TRIGGER LOUISE 0 ~Global("TalkedToLaerta","GLOBAL",0)~

REPLACE_STATE_TRIGGER LOUISE 1 ~Global("HelpLaerta","GLOBAL",0)~

ALTER_TRANS LOUISE // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@87~ 
END

EXTEND_BOTTOM LOUISE 1
IF ~~ THEN REPLY @53 EXTERN LAERTA JA_LAERTA_3
END

EXTEND_BOTTOM LOUISE 1
IF ~~ THEN REPLY @54 EXTERN LAERTA JA_LAERTA_1
END

EXTEND_BOTTOM LOUISE 1
IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ EXTERN LAERTA JA_LAERTA_8
END

EXTEND_BOTTOM LOUISE 1
IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0)Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ EXTERN LAERTA JA_LAERTA_9
END


APPEND LOUISE

IF ~Global("JA#QUESTDONE","%NWBaldursGate_LaertasHouse_L1%",0)
OR(2)
Global("HelpLaerta","GLOBAL",1)
Global("HelpVoltine","GLOBAL",1)~ THEN BEGIN JA_LOUISE_2
  SAY @77
  IF ~~ THEN EXTERN LAERTA 4
END

IF ~Global("HelpLaerta","GLOBAL",2)~ THEN BEGIN JA_LOUISE_SAVED
  SAY @78
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA_LOUISE_1
  SAY @79
= @80
  IF ~~ THEN EXTERN LAERTA JA_LAERTA_4
END

END




