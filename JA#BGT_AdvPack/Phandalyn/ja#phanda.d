//Paladin Phandalyn

REPLACE_STATE_TRIGGER PHANDA 0 ~IfValidForPartyDialogue([0.0.0.0.0.0.MASK_EVIL])
See([PC.0.0.0.0.0.MASK_EVIL])~

ALTER_TRANS PHANDA // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~~
  "EPILOGUE" ~GOTO 2~
END

ALTER_TRANS PHANDA // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~ChangeClass(Myself,PALADIN)
Enemy()~
  "JOURNAL" ~@1036~
END

REPLACE_STATE_TRIGGER PHANDA 3 ~NumTimesTalkedToGT(0)~

ALTER_TRANS PHANDA // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@3~
  "ACTION" ~NoAction()~
END

EXTEND_BOTTOM PHANDA 3
IF ~~ THEN REPLY @0 GOTO JA#PHANDA_1
END

APPEND PHANDA

IF ~~ THEN BEGIN JA#PHANDA_1
SAY @1
IF ~~ THEN DO ~Enemy()~ JOURNAL @1036 EXIT
END
END