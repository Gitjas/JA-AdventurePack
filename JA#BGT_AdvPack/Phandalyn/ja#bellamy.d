//Bellamy

ALTER_TRANS BELLAM // file name
BEGIN 3 4 END // state number (can be more than one)
BEGIN END // transition number (can be more than one)
BEGIN // list of changes, see below for flagsdu
  "ACTION" ~SetGlobal("JA#PHANDA","GLOBAL",1)~
END

REPLACE_STATE_TRIGGER BELLAM 5 ~Global("JA#PHANDA","GLOBAL",1)~
