BEGIN ~JA#DPSS1~
// END JA#DPSS1

BEGIN ~JA#DPSS2~
// END JA#DPSS2

BEGIN ~JA#DPSS3~
// END JA#DPSS3


CHAIN IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN JA#DPSS1 ja#doppse_01
  @0
  DO ~SetGlobal("JA#DOPPSE_TALK","GLOBAL",1)~
  == JA#DPSS1 @1
  == JA#DPSS2 @2
  == JA#DPSS3 @3
  == JA#DPSS1 @4
  == JA#DPSS2 @5
  == JA#DPSS1 @6
  == JA#DPSS2 @7
  == JA#DPSS3 @8
  == JA#DPSS1 @9
END
  IF ~~ THEN DO ~SetGlobal("Doppleganger","GLOBAL",1)~ UNSOLVED_JOURNAL #%doppse_state03_journal% EXIT



BEGIN ~JA#SSMR3~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 1
  IF ~~ THEN REPLY @12 GOTO 1
  IF ~~ THEN REPLY @13 GOTO 1
END

IF ~~ THEN 1
  SAY @14
  IF ~~ THEN UNSOLVED_JOURNAL #%doppse_state01_journal% EXTERN JA#SSGU4 0 // in ja#ssung.d
END

IF ~~ THEN 2
  SAY @15
  IF ~~ THEN DO ~ForceSpell(Myself,DOPPLEGANGER_CHANGE)~ EXIT
END

// END JA#SSMR3



BEGIN ~JA#SSMR4~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @16
  IF ~~ THEN REPLY @17 DO ~EscapeArea()~ EXIT
  IF ~~ THEN REPLY @18 GOTO 1
END

IF ~~ THEN 1
  SAY @19
  IF ~~ THEN REPLY @20 DO ~EscapeArea()~ EXIT
  IF ~~ THEN REPLY @21 GOTO 2
END

IF ~~ THEN 2
  SAY @22 = @23
  IF ~~ THEN DO ~EscapeArea()~ UNSOLVED_JOURNAL #%doppsm_state03_journal% EXIT
END

// END JA#SSMR3
