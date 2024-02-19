BEGIN ~JA#MERC3~

IF ~Global("JA#_HelpedMechant","MYAREA",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 2
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",1) SetGlobalTimer("JA#MERC3","GLOBAL",TWO_DAYS)~ UNSOLVED_JOURNAL @1008 EXIT
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~PartyHasItem("POTN08")~ THEN REPLY @5 DO ~TakePartyItemNum("POTN08",1)~ EXIT
  IF ~PartyHasItem("POTN17")~ THEN REPLY @6 DO ~TakePartyItemNum("POTN17",1)~ EXIT
  IF ~PartyHasItem("GBERRY")~ THEN REPLY @7 DO ~TakePartyItemNum("GBERRY",1)~  EXIT
  IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#_HelpedMechant","MYAREA",1) SetGlobalTimer("JA#MERC3","GLOBAL",TWO_DAYS)~ UNSOLVED_JOURNAL @1008 EXIT
  IF ~~ THEN REPLY @9 JOURNAL @1069 GOTO 1
END

IF ~Global("JA#_HelpedMechant","MYAREA",2)~ THEN BEGIN 3
  SAY @11
  IF ~~ THEN REPLY @12 DO ~EraseJournalEntry(@1008)~ SOLVED_JOURNAL @1070 GOTO 4
  IF ~~ THEN REPLY @14 DO ~EraseJournalEntry(@1008)~ SOLVED_JOURNAL @1071 GOTO 6
  IF ~~ THEN REPLY @16 DO ~EraseJournalEntry(@1008)~ SOLVED_JOURNAL @1071 GOTO 5
  IF ~~ THEN REPLY @17 DO ~EraseJournalEntry(@1008)~ SOLVED_JOURNAL @1072 GOTO 5
END

IF ~~ THEN BEGIN 4
  SAY @19
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",3) ReputationInc(-1) AddExperienceParty(150)EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 5
  SAY @20
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",3) AddExperienceParty(150) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 6
  SAY @21
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",3) ReputationInc(1) AddExperienceParty(150)EscapeArea()~ JOURNAL @1073 EXIT
END

IF ~~ THEN BEGIN 7
  SAY @23
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",3) ReputationInc(1) AddExperienceParty(150)EscapeArea()~ JOURNAL @1074 EXIT
END

IF ~~ THEN BEGIN 8
  SAY @25
  IF ~~ THEN EXIT
END

IF ~Global("JA#_HelpedMechant","MYAREA",1)~ THEN BEGIN 9
  SAY @26
  IF ~PartyHasItem("POTN08")~ THEN REPLY @5 DO ~TakePartyItemNum("POTN08",1)~ EXIT
  IF ~PartyHasItem("POTN17")~ THEN REPLY @6 DO ~TakePartyItemNum("POTN17",1)~ EXIT
  IF ~PartyHasItem("GBERRY")~ THEN REPLY @7 DO ~TakePartyItemNum("GBERRY",1)~  EXIT
  IF ~~ THEN REPLY @27 EXIT
  IF ~~ THEN REPLY @9 DO ~EraseJournalEntry(@1008)~ JOURNAL @1069 EXIT
END
