BEGIN ~JA#SVLST~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
  IF ~~ THEN REPLY @5 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @6
  IF ~~ THEN REPLY @7 DO ~SetGlobal("JA#ZOMBI1","%FirewineBridge%",1)~ UNSOLVED_JOURNAL @1009 EXIT
  IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#ZOMBI1","%FirewineBridge%",1)~ UNSOLVED_JOURNAL @1009 EXIT
END

IF ~Dead("JA#ZOMB1")Global("JA#SVLAST_RESC","LOCALS",0)~ THEN BEGIN 3
  SAY @9
  IF ~~ THEN REPLY @10 DO ~SetGlobal("JA#SVLAST_RESC","LOCALS",1)~ GOTO 6
  IF ~~ THEN REPLY @11 DO ~SetGlobal("JA#SVLAST_RESC","LOCALS",1)~ GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @12
  IF ~~ THEN REPLY @13 GOTO 5
  IF ~~ THEN REPLY @14 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @15
  IF ~~ THEN DO ~EraseJournalEntry(@1009)AddExperienceParty(320)~ SOLVED_JOURNAL @16 EXIT
END

IF ~~ THEN BEGIN 6
  SAY @17
  IF ~~ THEN DO ~EraseJournalEntry(@1009)Enemy()~ SOLVED_JOURNAL @18 EXIT
END


IF ~Global("JA#SVLAST_RESC","LOCALS",1)~ THEN BEGIN 7
  SAY @19
  IF ~~ THEN EXIT
END