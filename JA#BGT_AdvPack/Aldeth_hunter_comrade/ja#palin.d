BEGIN ~JA#PALIN~

IF ~StateCheck(Myself,STATE_CHARMED)
~ THEN BEGIN 2
  SAY @0
  IF ~~ THEN JOURNAL @1 EXIT
END

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN BEGIN 3
  SAY @2
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,1)
~ THEN BEGIN 0
  SAY @3
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)
~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN EXIT
END


