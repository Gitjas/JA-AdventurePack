BEGIN ~JA#GHELD~

IF ~StateCheck(Myself,STATE_CHARMED)Global("JA#PILAR_JOB","GLOBAL",1)~ THEN BEGIN JA_CHARM1
  SAY @0
  IF ~Global("JA#GHELDCHARM","LOCALS",0)~ THEN REPLY @1 DO ~SetGlobal("JA#GHELDCHARM","LOCALS",1)~ GOTO JA_CHARM2
  IF ~~ THEN REPLY @2 EXIT
END

IF ~~ THEN BEGIN JA_CHARM2
  SAY @3
  IF ~~ THEN DO ~GiveItem("JA#PILAR",LastTalkedToBy)~ EXIT
END

IF ~Class(LastTalkedToBy(Myself),CLERIC_ALL)~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN EXIT
END

IF ~Global("JA#GHELD_JOB","GLOBAL",0)~ THEN BEGIN 1
  SAY @5
  IF ~~ THEN REPLY @6 DO ~SetGlobal("JA#GHELD_JOB","GLOBAL",1)~ UNSOLVED_JOURNAL @1057 EXIT
  IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#GHELD_JOB","GLOBAL",2)~ GOTO 7
END

IF ~!PartyHasItem("JA#GHELD")Global("JA#GHELD_JOB","GLOBAL",1)~ THEN BEGIN 2
  SAY @9
  IF ~~ THEN EXIT
END

IF ~PartyHasItem("JA#GHELD")Global("JA#GHELD_JOB","GLOBAL",1)Dead("JA#PILAR")~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN DO ~TakePartyItem("JA#GHELD")SetGlobal("JA#GHELD_JOB","GLOBAL",2)DestroyItem("JA#GHELD")AddexperienceParty(400)EraseJournalEntry(@1057)~ SOLVED_JOURNAL @1058 EXIT
END

IF ~PartyHasItem("JA#GHELD")
Global("JA#GHELD_JOB","GLOBAL",1)
!Dead("JA#PILAR")
HPPercent(Player1,100)
HPPercent(Player2,100)
HPPercent(Player3,100)
HPPercent(Player4,100)
HPPercent(Player5,100)
HPPercent(Player6,100)~ THEN BEGIN 4
  SAY @12
  IF ~~ THEN DO ~TakePartyItem("JA#GHELD")SetGlobal("JA#GHELD_JOB","GLOBAL",2)DestroyItem("JA#GHELD")GiveGoldForce(90)AddexperienceParty(400)EraseJournalEntry(@1057)~ SOLVED_JOURNAL @1058 EXIT
END

IF ~PartyHasItem("JA#GHELD")
Global("JA#GHELD_JOB","GLOBAL",1)
!Dead("JA#PILAR")
OR(6)
HPPercentLT(Player1,100)
HPPercentLT(Player2,100)
HPPercentLT(Player3,100)
HPPercentLT(Player4,100)
HPPercentLT(Player5,100)
HPPercentLT(Player6,100)~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN DO ~TakePartyItem("JA#GHELD")SetGlobal("JA#GHELD_JOB","GLOBAL",2)DestroyItem("JA#GHELD")AddexperienceParty(400)EraseJournalEntry(@1057)ForceSpell([PC],CLERIC_MASS_CURE)~ SOLVED_JOURNAL @1058 EXIT
END

IF ~True()~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 7
  SAY @15
  IF ~~ THEN EXIT
END
