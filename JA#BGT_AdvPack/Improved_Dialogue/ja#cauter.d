REPLACE_STATE_TRIGGER CAUTER 0 ~NumTimesTalkedTo(0)~

REPLACE_STATE_TRIGGER CAUTER 3 ~NumTimesTalkedToGT(0)~


ALTER_TRANS CAUTER // file name
BEGIN 1 2 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
END

ALTER_TRANS CAUTER // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
  "REPLY" ~@5~
END

EXTEND_BOTTOM CAUTER 3
IF ~~ THEN REPLY @0 GOTO JA#CAUTER_1
END


APPEND CAUTER

IF ~~ THEN BEGIN JA#CAUTER_1
SAY @1
IF ~~ THEN REPLY @2 DO ~EscapeAreaDestroy(90)~ EXIT
IF ~~ THEN REPLY @3 GOTO JA#CAUTER_2
END

IF ~~ THEN BEGIN JA#CAUTER_2
SAY @4
IF ~~ THEN DO ~EscapeAreaDestroy(90)~ EXIT
END

END




