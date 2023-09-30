
////For Translators: Strings can be found in Bg1 "DOPPSE.DLG"
BEGIN ~JA#DPSS1~
BEGIN ~JA#DPSS2~
BEGIN ~JA#DPSS3~

CHAIN
IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN JA#DPSS1 ja#doppse_01
  @0	//könnte weidu nicht schaffen = vor DO
= @1
DO ~SetGlobal("JA#DOPPSE_TALK","GLOBAL",1)~
  == JA#DPSS2
    @2

  == JA#DPSS3
    @3

  == JA#DPSS1
    @4

    == JA#DPSS2
      @5

    == JA#DPSS1
      @6

    == JA#DPSS2
      @7

    == JA#DPSS3
      @8

    == JA#DPSS1
      @9
END
IF ~~ THEN DO ~SetGlobal("Doppleganger","GLOBAL",1)AddJournalEntry(%ssungu3%,QUEST)~ EXIT


BEGIN ~JA#SSMR3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 4
  SAY @10
  IF ~~ THEN REPLY @11 GOTO 5
  IF ~~ THEN REPLY @12 GOTO 5
  IF ~~ THEN REPLY @13 GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @14
  IF ~~ THEN DO ~AddJournalEntry(%ssungu1%,QUEST)~ EXTERN JA#SSGU4 0
END

IF ~~ THEN BEGIN 6
  SAY @15
  IF ~~ THEN DO ~ForceSpell(Myself,DOPPLEGANGER_CHANGE)~ EXIT
END


BEGIN ~JA#SSMR4~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @16
IF ~~ THEN REPLY @17 DO ~EscapeArea()~ EXIT
IF ~~ THEN REPLY @18 GOTO 1
END

IF ~~ THEN BEGIN 1
SAY @19
IF ~~ THEN REPLY @20 DO ~EscapeArea()~ EXIT
IF ~~ THEN REPLY @21 GOTO 2
END

IF ~~ THEN BEGIN 2
SAY @22
= @23
IF ~~ THEN DO ~AddJournalEntry(%ssungu2%,QUEST)EscapeArea()~ EXIT
END

ADD_TRANS_ACTION DOPPSM
BEGIN 3 7 8 END
BEGIN 0 END
~AddJournalEntry(%ssungu1%,QUEST)~
