
ALTER_TRANS SCAR // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",0)~
END

ALTER_TRANS SCAR // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",1)
!Dead("Jhasso")~
END

ALTER_TRANS SCAR // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("Doppleganger","GLOBAL",1)
Dead("Jhasso")~
END

ALTER_TRANS SCAR // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",0)~
END

ALTER_TRANS SCAR // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("CheckedSevenSuns","GLOBAL",2)
Global("JA#DOPPSE_TALK","GLOBAL",0)~
END

ALTER_TRANS SCAR // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",1)
!Dead("jhasso")~
END

EXTEND_TOP SCAR 8 #3
+ ~Global("Doppleganger","GLOBAL",1)
Dead("jhasso")~ + @0 DO ~GiveGoldForce(4000)AddexperienceParty(4000)~ GOTO 17
END