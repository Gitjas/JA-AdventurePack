ADD_STATE_TRIGGER JOPI 0 ~NumTimesTalkedTo(0)~

ALTER_TRANS JOPI // file name
BEGIN 2 3 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
END


APPEND JOPI

IF ~GlobalGT("Chapter","GLOBAL",%tutu_chapter_3%)~ THEN BEGIN JA#JOPI_1
SAY @0
IF ~~ THEN REPLY @1 GOTO JA#JOPI_2
IF ~~ THEN REPLY @2 EXIT
END

IF ~~ THEN BEGIN JA#JOPI_2
SAY @3
IF ~~ THEN DO ~SetGlobal("JA#JOPIMOVE","GLOBAL",1)EscapeArea()~ EXIT
END

/* addition for v0.9b3: give Jopi a dialogue state if talked to again before chapter 5 to new stats */

IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%) RandomNum(3,1)~ THEN BEGIN JA#JOPI_3
SAY @4
IF ~~ THEN EXIT
END

IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%) RandomNum(3,2)~ THEN BEGIN JA#JOPI_4
SAY @5
IF ~~ THEN EXIT
END

IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%) RandomNum(3,3)~ THEN BEGIN JA#JOPI_5
SAY @6
IF ~~ THEN EXIT
END

END


BEGIN JA#JOPI

IF ~Global("JA#JOPIMOVE","GLOBAL",2)~ THEN BEGIN JA#JOPI_1
SAY @7
IF ~~ THEN REPLY @8 GOTO JA#JOPI_3
IF ~~ THEN REPLY @9 GOTO JA#JOPI_2
END

IF ~~ THEN BEGIN JA#JOPI_2
SAY @10
IF ~~ THEN DO ~SetGlobal("JA#JOPIMOVE","GLOBAL",20)EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN JA#JOPI_3
SAY @11
= @12
= @13
IF ~~ THEN REPLY @14 GOTO JA#JOPI_4
IF ~~ THEN REPLY @15 GOTO JA#JOPI_2
END

IF ~~ THEN BEGIN JA#JOPI_4
SAY @16
IF ~~ THEN DO ~SetGlobal("JA#JOPIMOVE","GLOBAL",3)~ UNSOLVED_JOURNAL @1023 EXIT
END

IF ~Global("JA#JOPIMOVE","GLOBAL",3)~ THEN BEGIN JA#JOPI_5
SAY @17
IF ~Dead("Ragefast")~ THEN REPLY @18 GOTO JA#JOPI_6
IF ~~ THEN REPLY @19 EXIT
END

IF ~~ THEN BEGIN JA#JOPI_6
SAY @20
= @21
IF ~~ THEN DO ~EraseJournalEntry(@1023)AddexperienceParty(100)SetGlobal("JA#JOPIMOVE","GLOBAL",20)EscapeArea()~ SOLVED_JOURNAL @22 EXIT
END

CHAIN
IF ~Global("JA#JOPIMOVE","GLOBAL",4)~
THEN JA#JOPI JA#JOPI_7
@23
DO ~SetGlobal("JA#JOPIMOVE","GLOBAL",5)EraseJournalEntry(@1023)AddexperienceParty(100)AddJournalEntry(@39,QUEST_DONE)EscapeArea()~
== RAGEFA @24
== JA#JOPI @25
== RAGEFA @26
== JA#JOPI @27
== RAGEFA @28
= @29
== JA#JOPI @30
== RAGEFA @31
== JA#JOPI @32
== RAGEFA @33
= @34
== JA#JOPI @35
== RAGEFA @36
== JA#JOPI @37
== RAGEFA @38
EXIT
