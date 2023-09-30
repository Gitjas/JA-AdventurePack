//Dunkin

ALTER_TRANS DUNKIN
BEGIN 7 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~ClearAllActions()~
END

//misc.d
REPLACE_STATE_TRIGGER DUNKIN 5 ~Global("JA#DUNKIN","%Beregost_FeldepostsInn_L1%",1)~

ALTER_TRANS DUNKIN // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#DUNKIN","%Beregost_FeldepostsInn_L1%",2)~
END

