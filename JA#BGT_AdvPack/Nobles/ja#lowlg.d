BEGIN ~JA#LOWLG~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN BEGIN 5
  SAY @0
  IF ~~ THEN EXIT
END

IF ~Global("YagoFight","GLOBAL",1)~ THEN BEGIN 6
  SAY @1
  IF ~~ THEN DO ~SetGlobal("JA#LOWLG","GLOBAL",1)~ EXIT
END

IF ~Global("JA#LOWLG","GLOBAL",2)~ THEN BEGIN 7
  SAY @11
  IF ~~ THEN EXIT
END

IF ~GlobalLT("JA#LOWLG","GLOBAL",2)~ THEN BEGIN 0
  SAY @2
  IF ~Global("JA#LOWLG","GLOBAL",0)~ THEN REPLY @3 DO ~SetGlobal("JA#LOWLG","GLOBAL",1)~ GOTO 1
  IF ~Global("BrielbaraMove","GLOBAL",1)~ THEN REPLY @4 GOTO 2
  IF ~Global("BrielbaraMove","GLOBAL",1)~ THEN REPLY @5 GOTO 4
  IF ~Global("JA#LOWLG","GLOBAL",1)~ THEN REPLY @3 GOTO 5
END

IF ~~ THEN BEGIN 1
  SAY @7
  IF ~NumInPartyAlive(6)~ THEN DO ~TakePartyGold(6)~ EXIT
  IF ~NumInPartyAliveLT(2)~ THEN DO ~TakePartyGold(1)~ EXIT
  IF ~NumInPartyAliveLT(3)~ THEN DO ~TakePartyGold(2)~ EXIT
  IF ~NumInPartyAliveLT(4)~ THEN DO ~TakePartyGold(3)~ EXIT
  IF ~NumInPartyAliveLT(5)~ THEN DO ~TakePartyGold(4)~ EXIT
  IF ~NumInPartyAliveLT(6)~ THEN DO ~TakePartyGold(5)~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @8
  IF ~Global("JA#LOWLG","GLOBAL",0)~ THEN REPLY @9 DO ~SetGlobal("JA#LOWLG","GLOBAL",1)~ GOTO 1
  IF ~Global("JA#LOWLG","GLOBAL",1)~ THEN REPLY @9 GOTO JA#LOWLG_1
  IF ~~ THEN REPLY @10 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @11
  IF ~Global("JA#LOWLG","GLOBAL",0)~ THEN REPLY @9 DO ~SetGlobal("JA#LOWLG","GLOBAL",1)~ GOTO 1
  IF ~Global("JA#LOWLG","GLOBAL",1)~ THEN REPLY @9 GOTO JA#LOWLG_1
  IF ~~ THEN REPLY @12 DO ~ActionOverride(Player1,LeaveAreaLUA("%BaldursGateDocks%","",[3464.3054],8))
ActionOverride(Player2,LeaveAreaLUA("%BaldursGateDocks%","",[2891.2715],8))
ActionOverride(Player3,LeaveAreaLUA("%BaldursGateDocks%","",[3416.3091],8))
ActionOverride(Player4,LeaveAreaLUA("%BaldursGateDocks%","",[3480.3090],8))
ActionOverride(Player5,LeaveAreaLUA("%BaldursGateDocks%","",[3384.3114],8))
ActionOverride(Player6,LeaveAreaLUA("%BaldursGateDocks%","",[3432.3150],8))~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @13
  IF ~~ THEN REPLY @12 DO ~SetGlobal("JA#LOWLG","GLOBAL",2)
ActionOverride(Player1,LeaveAreaLUA("%BaldursGateDocks%","",[3464.3054],8))
ActionOverride(Player2,LeaveAreaLUA("%BaldursGateDocks%","",[2891.2715],8))
ActionOverride(Player3,LeaveAreaLUA("%BaldursGateDocks%","",[3416.3091],8))
ActionOverride(Player4,LeaveAreaLUA("%BaldursGateDocks%","",[3480.3090],8))
ActionOverride(Player5,LeaveAreaLUA("%BaldursGateDocks%","",[3384.3114],8))
ActionOverride(Player6,LeaveAreaLUA("%BaldursGateDocks%","",[3432.3150],8))~ EXIT
END

IF ~~ THEN BEGIN JA#LOWLG_1
  SAY @14
  IF ~~ THEN EXIT
END