BEGIN ~JA#PILAR~

IF ~StateCheck(Myself,STATE_CHARMED)Global("JA#GHELD_JOB","GLOBAL",1)~ THEN BEGIN JA_CHARM1
  SAY @0
  IF ~Global("JA#PILARCHARM","LOCALS",0)~ THEN REPLY @1 DO ~SetGlobal("JA#PILARCHARM","LOCALS",1)~ GOTO JA_CHARM2
  IF ~~ THEN REPLY @2 EXIT
END

IF ~~ THEN BEGIN JA_CHARM2
  SAY @3
  IF ~~ THEN DO ~GiveItem("JA#GHELD",LastTalkedToBy)~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN REPLY @5 DO ~TakePartyGold(8)~ GOTO 1
  IF ~~ THEN REPLY @6 GOTO 6
END

IF ~~ THEN BEGIN 1
  SAY @7
  IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#PILAR_JOB","GLOBAL",1)~ UNSOLVED_JOURNAL @9 EXIT
  IF ~~ THEN REPLY @10 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @11
  IF ~~ THEN EXIT
END

IF ~!PartyHasItem("JA#PILAR")Global("JA#PILAR_JOB","GLOBAL",1)~ THEN BEGIN 3
  SAY @12
  IF ~~ THEN EXIT
END

IF ~PartyHasItem("JA#PILAR")Global("JA#PILAR_JOB","GLOBAL",1)Dead("JA#GHELD")~ THEN BEGIN 4
  SAY @13
  IF ~~ THEN DO ~TakePartyItem("JA#PILAR")SetGlobal("JA#PILAR_JOB","GLOBAL",2)DestroyItem("JA#PILAR")EraseJournalEntry(@9)AddexperienceParty(280)~ SOLVED_JOURNAL @14 EXIT
END

IF ~PartyHasItem("JA#PILAR")Global("JA#PILAR_JOB","GLOBAL",1)~ THEN BEGIN 5
  SAY @15
  IF ~~ THEN DO ~TakePartyItem("JA#PILAR")SetGlobal("JA#PILAR_JOB","GLOBAL",2)DestroyItem("JA#PILAR")EraseJournalEntry(@9)GiveItem("JA#PILAX",LastTalkedToBy)AddexperienceParty(280)ReputationInc(1)~ SOLVED_JOURNAL @14 EXIT
END

IF ~~ THEN BEGIN 6
  SAY @16
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 7
  SAY @17
  IF ~~ THEN EXIT
END
