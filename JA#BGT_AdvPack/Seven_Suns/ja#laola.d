//Laola Axehand

ALTER_TRANS LAOLA // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 1 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("ScarMission","GLOBAL",0)~
END

EXTEND_BOTTOM LAOLA 0
IF ~Global("ScarMission","GLOBAL",1)~ THEN REPLY @0 GOTO JA#LAOLA_1
END

APPEND LAOLA

IF ~~ THEN BEGIN JA#LAOLA_1
SAY @1
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

END