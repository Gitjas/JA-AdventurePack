ADD_STATE_TRIGGER JHASSO 0 ~Global("JA#JHASSO_MOVE","GLOBAL",0)~
ADD_STATE_TRIGGER JHASSO 7 ~Global("JA#JHASSO_TALK","LOCALS",0)
!Global("ENDOFBG1","GLOBAL",2)~
ADD_STATE_TRIGGER JHASSO 16 ~False()~

ALTER_TRANS JHASSO // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("ScarMission","GLOBAL",1)~
  "ACTION" ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~
END

ALTER_TRANS JHASSO // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("ScarMission","GLOBAL",1)~
  "ACTION" ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~
END

ALTER_TRANS JHASSO // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",1)~
END

ALTER_TRANS JHASSO // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",0)~
  "EPILOGUE" ~GOTO JA#JHASSO_02~
END

ALTER_TRANS JHASSO // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",1)~
END

ALTER_TRANS JHASSO // file name
BEGIN 6 18 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#JHASSO_MOVE","GLOBAL",1)EscapeAreaDestroy(90)~
END

ALTER_TRANS JHASSO // file name
BEGIN 7 12 15 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~
END

ALTER_TRANS JHASSO // file name
BEGIN 9 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#JHASSO_TALK","LOCALS",100)~
END

ALTER_TRANS JHASSO // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",1)~
  "UNSOLVED_JOURNAL" ~@1012~
END

EXTEND_BOTTOM JHASSO 3
IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @0 GOTO JA#JHASSO_03
END

EXTEND_BOTTOM JHASSO 3
IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @1 GOTO JA#JHASSO_03
END

EXTEND_BOTTOM JHASSO 4
IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @2 GOTO JA#JHASSO_03
END



APPEND JHASSO

IF ~StateCheck(Myself,STATE_CHARMED)GlobalGT("JA#JHASSO_MOVE","GLOBAL",0)~ THEN BEGIN JA#JHASSO_CHARM
SAY @3
IF ~~ THEN EXIT
END

IF ~Global("JA#JHASSO_MOVE","GLOBAL",0)Global("JA#JHASSO_TALK","LOCALS",0)~ THEN BEGIN JA#JHASSO_01
SAY @4
IF ~Global("ScarMission","GLOBAL",1)~ THEN REPLY @5 DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
IF ~Global("ScarMission","GLOBAL",1)~ THEN REPLY @6 DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 3
IF ~~ THEN REPLY @7 EXIT
END

IF ~~ THEN BEGIN JA#JHASSO_02
SAY @8
IF ~~ THEN DO ~SetGlobal("JA#JHASSO_MOVE","GLOBAL",1)EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN JA#JHASSO_03
SAY @9
IF ~~ THEN REPLY @10 DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ EXIT
IF ~~ THEN REPLY @11 GOTO JA#JHASSO_02
END

IF ~Global("JA#JHASSO_MOVE","GLOBAL",0)Global("JA#JHASSO_TALK","LOCALS",1)~ THEN BEGIN JA#JHASSO_04
SAY @12
IF ~Global("JA#DOPPSE_TALK","GLOBAL",1)~ THEN REPLY @13 DO ~SetGlobal("JA#JHASSO_MOVE","GLOBAL",1)~ GOTO JA#JHASSO_05
IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @14 GOTO JA#JHASSO_02
IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @15 EXIT
END

IF ~~ THEN BEGIN JA#JHASSO_05
SAY @16
IF ~~ THEN GOTO 5
END

IF ~Global("JA#JHASSO_MOVE","GLOBAL",2)Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN BEGIN JA#JHASSO_06
SAY @17
IF ~~ THEN EXIT
END


IF ~Global("JA#JHASSO_MOVE","GLOBAL",2)Global("JA#DOPPSE_TALK","GLOBAL",1)~ THEN BEGIN JA#JHASSO_09
SAY @18
IF ~~ THEN DO ~SetGlobal("JA#JHASSO_MOVE","GLOBAL",3)~ JOURNAL @19 EXIT
END

IF ~Global("JA#JHASSO_MOVE","GLOBAL",3)GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%)~ THEN BEGIN JA#JHASSO_10
SAY @20
IF ~~ THEN EXIT
END

//JHASSO-QUEST:


IF ~Global("JA#JHASSO_TALK","LOCALS",100)~ THEN BEGIN JA#JHASSO_HOSTILE
SAY @21
IF ~~ THEN EXIT
END

IF ~Global("JA#JHASSO_TALK","LOCALS",1)Global("JA#JHASSO_QUEST","GLOBAL",0)!Global("ENDOFBG1","GLOBAL",2)~ THEN BEGIN JA#JHASSO_11
SAY @22
IF ~~ THEN REPLY @23 DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",1)~ GOTO 13
IF ~~ THEN REPLY @24 EXIT
END

IF ~Global("JA#JHASSO_QUEST","GLOBAL",1)~ THEN BEGIN JA#JHASSO_12
SAY @25
IF ~Global("TalkedToIvanne","GLOBAL",1)
!Dead("JA#KIZSKA")~ THEN REPLY @26 DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",2)~ GOTO JA#JHASSO_13
IF ~Global("TalkedToIvanne","GLOBAL",1)
Dead("JA#KIZSKA")~ THEN REPLY @27 DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",3)~ GOTO JA#JHASSO_18
IF ~~ THEN REPLY @28 EXIT
END

IF ~~ THEN BEGIN JA#JHASSO_13
SAY @29
IF ~~ THEN REPLY @30 GOTO JA#JHASSO_14
IF ~~ THEN REPLY @31 GOTO JA#JHASSO_16
END

IF ~~ THEN BEGIN JA#JHASSO_14
SAY @32
IF ~~ THEN REPLY @33 GOTO JA#JHASSO_15
IF ~~ THEN REPLY @34 GOTO JA#JHASSO_16
END

IF ~~ THEN BEGIN JA#JHASSO_15
SAY @35
= @36
= @37
IF ~~ THEN DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN JA#JHASSO_16
SAY @38
= @39
IF ~~ THEN DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",3)~ UNSOLVED_JOURNAL @1013 EXIT
END

IF ~Global("JA#JHASSO_QUEST","GLOBAL",2)~ THEN BEGIN JA#JHASSO_17
SAY @40
IF ~Dead("JA#KIZSKA")~ THEN REPLY @41 DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",3)~ GOTO JA#JHASSO_18
IF ~~ THEN REPLY @42 EXIT
END

IF ~~ THEN BEGIN JA#JHASSO_18
SAY @43
IF ~~ THEN REPLY @44 GOTO JA#JHASSO_19
IF ~~ THEN REPLY @45 GOTO JA#JHASSO_19
END

IF ~~ THEN BEGIN JA#JHASSO_19
SAY @46
= @47
IF ~~ THEN REPLY @48 GOTO JA#JHASSO_20
IF ~~ THEN REPLY @49 GOTO JA#JHASSO_21
END

IF ~~ THEN BEGIN JA#JHASSO_20
SAY @50
IF ~~ THEN DO ~ReputationInc(1)GiveGoldForce(1000)EraseJournalEntry(@1012)EraseJournalEntry(@1013)EraseJournalEntry(@1014)EraseJournalEntry(@1015)EraseJournalEntry(@1016)EraseJournalEntry(@1017)EraseJournalEntry(@1018)~ SOLVED_JOURNAL @51 EXIT
END

IF ~~ THEN BEGIN JA#JHASSO_21
SAY @52
IF ~~ THEN DO ~ReputationInc(1)EraseJournalEntry(@1012)EraseJournalEntry(@1013)EraseJournalEntry(@1014)EraseJournalEntry(@1015)EraseJournalEntry(@1016)EraseJournalEntry(@1017)EraseJournalEntry(@1018)~ SOLVED_JOURNAL @51 EXIT
END

IF ~Global("JA#JHASSO_QUEST","GLOBAL",3)!Global("ENDOFBG1","GLOBAL",2)~ THEN BEGIN JA#JHASSO_22
SAY @53
IF ~~ THEN EXIT
END


END



///////////////////////////////////
///////////////////////////////////

//	IVANNE

REPLACE_STATE_TRIGGER IVANNE 0
~Global("TalkedToIvanne","GLOBAL",0)~

ALTER_TRANS IVANNE // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("TalkedToIvanne","GLOBAL",1)~
END

ALTER_TRANS IVANNE // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "UNSOLVED_JOURNAL" ~@1014~
END

ALTER_TRANS IVANNE // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!Dead("JA#KIZSKA")
!Dead("Cythan")~
  "UNSOLVED_JOURNAL" ~@1015~
END

ALTER_TRANS IVANNE // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!Dead("JA#KIZSKA")
Dead("Cythan")~
  "UNSOLVED_JOURNAL" ~@1016~
END

ALTER_TRANS IVANNE // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Dead("JA#KIZSKA")
!Dead("Cythan")~
  "UNSOLVED_JOURNAL" ~@1017~
END

ALTER_TRANS IVANNE // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 3 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Dead("JA#KIZSKA")
Dead("Cythan")~
  "UNSOLVED_JOURNAL" ~@1018~
END


APPEND IVANNE

IF ~Global("TalkedToIvanne","GLOBAL",1)~ THEN BEGIN IVANNE_1
SAY @54
IF ~~ THEN EXIT
END

END

REPLACE_ACTION_TEXT RASHAD
~ApplySpell(Myself,DOPPLEGANGER_CHANGE_DEFAULT)~
~UseItem("JA#DPKIZ",Myself)~


