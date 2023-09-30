REPLACE_STATE_TRIGGER CONNOL 0 ~NumTimesTalkedTo(0)~

ALTER_TRANS CONNOL // file name
BEGIN 2 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
END

EXTEND_BOTTOM CONNOL 0
IF ~~ THEN REPLY @0 EXIT
END

EXTEND_BOTTOM CONNOL 1
IF ~~ THEN REPLY @1 EXIT
END


APPEND CONNOL

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN JA#CONNOL_1
SAY @2
IF ~~ THEN REPLY @3 GOTO 1
IF ~~ THEN REPLY @4 GOTO 2
IF ~~ THEN REPLY @5 GOTO 3
IF ~~ THEN REPLY @6 EXIT
END

END