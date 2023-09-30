EXTEND_TOP HALBAZ 0 #2
+ ~PartyHasItem("MISC51")Global("JA#MISC51","LOCALS",1)~ + @0 GOTO 8
END

ADD_STATE_TRIGGER HALBAZ 1 ~Global("JA#MISC51","LOCALS",0)~

ALTER_TRANS HALBAZ // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MISC51","LOCALS",100)~
END

ALTER_TRANS HALBAZ // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MISC51","LOCALS",1)~
END

ALTER_TRANS HALBAZ // file name
BEGIN 3 8 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MISC51","LOCALS",100)~
END

ALTER_TRANS HALBAZ // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~TakePartyGold(100)
SetGlobal("JA#MISC51","LOCALS",0)~
END

EXTEND_BOTTOM HALBAZ 3
IF ~~ THEN REPLY @1 DO ~SetGlobal("JA#MISC51","LOCALS",0)GiveGoldForce(500)TakePartyItem("MISC51")~ EXIT
END

ALTER_TRANS HALBAZ // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MISC51","LOCALS",0)~
  "REPLY" ~@4~ 
END

EXTEND_BOTTOM HALBAZ 8
IF ~~ THEN REPLY @2 DO ~SetGlobal("JA#MISC51","LOCALS",0)GiveGoldForce(500)TakePartyItem("MISC51")~ EXIT
END

EXTEND_BOTTOM HALBAZ 8
IF ~~ THEN REPLY @3 DO ~StartStore("Sto0703",LastTalkedToBy(Myself))~ EXIT
END



