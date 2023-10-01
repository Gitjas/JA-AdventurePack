BEGIN ~JA#NASHA~

IF ~Global("JA#NASHA","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN EXIT
END

IF ~Global("JA#NASHA","GLOBAL",1)~ THEN BEGIN 1
  SAY @1
  IF ~~ THEN DO ~SetGlobal("JA#NASHA","GLOBAL",2)SetGlobal("JA#NASHA_HEAL","LOCALS",1)~ EXIT
END

IF ~Global("JA#NASHA","GLOBAL",2)
OR(6)
HPPercentLT(Player1,100)
HPPercentLT(Player2,100)
HPPercentLT(Player3,100)
HPPercentLT(Player4,100)
HPPercentLT(Player5,100)
HPPercentLT(Player6,100)~ THEN BEGIN 2
  SAY @2
  IF ~~ THEN DO ~SetGlobal("JA#NASHA_HEAL","LOCALS",1)~ EXIT
END

IF ~Global("JA#NASHA","GLOBAL",2)
OR(6)
HPPercent(Player1,100)
HPPercent(Player2,100)
HPPercent(Player3,100)
HPPercent(Player4,100)
HPPercent(Player5,100)
HPPercent(Player6,100)~ THEN BEGIN 3
  SAY @3
  IF ~~ THEN EXIT
END

IF ~false()~ THEN BEGIN 4
  SAY @4
  IF ~~ THEN DO ~~ EXIT
END
