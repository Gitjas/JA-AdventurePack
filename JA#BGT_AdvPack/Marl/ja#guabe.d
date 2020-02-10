BEGIN ~JA#GUAB1~

IF ~AreaCheck("%Temple_SongoftheMorning%")~ THEN BEGIN JA#GUAB1_0
  SAY @0
  IF ~Global("JA#MARL_GUARD","GLOBAL",2)~ THEN EXTERN KELDDA 4
  IF ~Global("JA#MARL_GUARD","GLOBAL",1)~ THEN EXTERN KELDDA 5
END

IF ~Global("JA#MARL_GUARD","GLOBAL",2)~ THEN BEGIN 12
  SAY @1
  IF ~~ THEN REPLY @2 DO ~ActionOverride("Marl",ChangeEnemyAlly(Myself,NEUTRAL))ActionOverride("Marl",NoAction())ClearAllActions()StartCutSceneMode()StartCutScene("JA#GBECU")~ EXIT
  IF ~~ THEN REPLY @3 DO ~ActionOverride("JA#GUAB2",Enemy())ActionOverride("JA#GUAB3",Enemy())Enemy()~ EXIT
END

IF ~Global("JA#MARL_GUARD","GLOBAL",1)~ THEN BEGIN 13
  SAY @4
  IF ~~ THEN REPLY @2 DO ~ActionOverride("Marl",ChangeEnemyAlly(Myself,NEUTRAL))ActionOverride("Marl",NoAction())ClearAllActions()StartCutSceneMode()StartCutScene("JA#GBECU")~ EXIT
  IF ~~ THEN REPLY @3 DO ~ActionOverride("JA#GUAB2",Enemy())ActionOverride("JA#GUAB3",Enemy())Enemy()~ EXIT
END



BEGIN ~JA#GUAB4~

IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)NumTimesTalkedTo(0)~ THEN BEGIN 1
  SAY @5
  IF ~~ THEN EXIT
END

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN BEGIN 15
  SAY @6
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 4
  SAY @7
  IF ~~ THEN EXIT
END



BEGIN ~JA#GUAB5~

IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)NumTimesTalkedTo(0)~ THEN BEGIN 2
  SAY @8
  IF ~~ THEN JOURNAL @9 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN EXIT
END

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN BEGIN 15
  SAY @6
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 4
  SAY @7
  IF ~~ THEN EXIT
END



BEGIN ~JA#GUAB6~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN JA#GUAB4_1
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 14
  IF ~~ THEN REPLY @13 EXIT
END

IF ~~ THEN BEGIN JA#GUAB4_2
  SAY @14
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 0
  SAY @15
  IF ~~ THEN JOURNAL @16 EXIT
END

IF ~~ THEN BEGIN 6
  SAY @17
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 7
  SAY @18
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @19
  IF ~~ THEN JOURNAL @20 EXIT
END

IF ~~ THEN BEGIN 10
  SAY @21
  IF ~~ THEN JOURNAL @22 EXIT
END

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN BEGIN 15
  SAY @6
  IF ~~ THEN EXIT
END

IF ~OR(4)
!Dead("Bassilus")
Global("wyvernp","GLOBAL",0)
!Dead("Mulahey")
GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)~ THEN BEGIN 14
  SAY @23
  IF ~!Dead("Bassilus")~ THEN REPLY @24 GOTO JA#GUAB4_2
  IF ~Global("wyvernp","GLOBAL",0)~ THEN REPLY @25 GOTO 0
  IF ~!Dead("Mulahey")~ THEN REPLY @26 GOTO 7
  IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)~ THEN REPLY @27 GOTO 6
  IF ~~ THEN REPLY @28 EXIT
END


IF ~True()~ THEN BEGIN 4
  SAY @7
  IF ~~ THEN EXIT
END


BEGIN ~JA#GUAB7~

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN BEGIN 1
  SAY @6
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,1)~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)~ THEN BEGIN 3
  SAY @29
  IF ~~ THEN EXIT
END


BEGIN ~JA#GUAB8~

IF ~RandomNum(2,1)Global("JA#GUABE_ACT","AR6704",0)~ THEN BEGIN 1
  SAY @30
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)Global("JA#GUABE_ACT","AR6704",0)~ THEN BEGIN 2
  SAY @31
  IF ~~ THEN EXIT
END

BEGIN ~JA#GUAB9~

IF ~RandomNum(2,1)Global("JA#GUABE_ACT","AR6704",0)~ THEN BEGIN 1
  SAY @32
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)Global("JA#GUABE_ACT","AR6704",0)~ THEN BEGIN 2
  SAY @33
  IF ~~ THEN EXIT
END

CHAIN
IF ~!Dead("Bassilus")~
THEN JA#GUAB8 JA#GUAB8_1
@34
DO ~SetGlobal("JA#GUABE_ACT","AR6704",0)AddJournalEntry(@1020,INFO)~
== JA#GUAB9 @35
== JA#GUAB8 @36
== JA#GUAB9 @37
== JA#GUAB8 @38
== JA#GUAB9 @39
== JA#GUAB8 @40
= @41
== JA#GUAB9 @42
EXIT

CHAIN
IF ~Dead("Bassilus")Dead("Mulahey")~
THEN JA#GUAB8 JA#GUAB8_3
@43
DO ~SetGlobal("JA#GUABE_ACT","AR6704",0)~
= @44
== JA#GUAB9 @45
== JA#GUAB8 @46
== JA#GUAB9 @47
== JA#GUAB8 @48
EXIT

CHAIN
IF ~Dead("Bassilus")~
THEN JA#GUAB8 JA#GUAB8_2
@49
DO ~SetGlobal("JA#GUABE_ACT","AR6704",0)AddJournalEntry(@1021,INFO)~
== JA#GUAB9 @50
== JA#GUAB8 @51
== JA#GUAB9 @52
== JA#GUAB8 @53
== JA#GUAB9 @54
== JA#GUAB8 @55
EXIT


