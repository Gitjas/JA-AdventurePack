//Paladin Phandalyn

REPLACE_STATE_TRIGGER PHANDA 2 ~NumTimesTalkedToGT(0)
InParty([0.0.0.0.0.0.MASK_EVIL])
See([PC.0.0.0.0.0.MASK_EVIL])~

ALTER_TRANS PHANDA // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~Attack([0.0.0.0.0.0.MASK_EVIL])~
  "JOURNAL" ~@3~
END

REPLACE_STATE_TRIGGER PHANDA 3 ~NumTimesTalkedToGT(0)~

ALTER_TRANS PHANDA // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@4~
END

EXTEND_BOTTOM PHANDA 3
IF ~~ THEN REPLY @1 GOTO JA#PHANDA_1
END

APPEND PHANDA

IF ~~ THEN BEGIN JA#PHANDA_1
SAY @2
IF ~~ THEN DO ~Enemy()
Attack(NearestEnemyOf(Myself))~ JOURNAL @7 EXIT
END
END