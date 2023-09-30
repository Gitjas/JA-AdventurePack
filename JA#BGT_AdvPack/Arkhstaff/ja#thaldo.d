ALTER_TRANS THALDO // file name
BEGIN 2 3 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#SAVETHALDO","GLOBAL",1)EscapeAreaDestroy(90)~
END

ALTER_TRANS THALDO // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#SAVETHALDO","GLOBAL",1)EscapeAreaDestroy(90)~
END

ALTER_TRANS THALDO // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~EraseJournalEntry(@1010)~
END

ADD_STATE_TRIGGER THALDO 6 ~NumTimesTalkedToGT(0)~

ALTER_TRANS THALDO // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@1~
  "EPILOGUE" ~GOTO 1~
END

EXTEND_BOTTOM THALDO 6
IF ~~ THEN REPLY @0 EXIT
END