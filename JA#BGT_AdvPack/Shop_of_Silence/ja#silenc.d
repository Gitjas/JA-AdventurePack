ADD_TRANS_ACTION SILENC // file name
BEGIN 0 END // state number (can be more than one)
BEGIN END // transition number (can be more than one)
~SetGlobal("JA#SILENCE_STO","LOCALS",1)~

ALTER_TRANS SILENC // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 0 %check_for_garrick% END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@8~
END

EXTEND_BOTTOM SILENC 0
IF ~~ THEN REPLY @0 DO ~SetGlobal("JA#SILENCE_STO","LOCALS",1)~ EXIT
END

ADD_TRANS_ACTION SILENC // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 1 %check_for_garrick1% END // transition number (can be more than one)
~SetGlobal("JA#SILENCE_STO","LOCALS",1)~

ALTER_TRANS SILENC // file name
BEGIN 1 END // state number (can be more than one)
BEGIN %check_for_garrick1% END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~#%garrick1%~
END

ADD_STATE_TRIGGER SILENC 3
~GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%)Global("JA#SILENCE_STO","LOCALS",0)~

ALTER_TRANS SILENC // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~TakePartyGold(5)
		SetGlobal("JA#SILENCE_STO","LOCALS",1)
		StartStore("stosilen",LastTalkedToBy(Myself))~
  "REPLY" ~@9~
END

ADD_STATE_TRIGGER SILENC 5
~GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%)ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)Global("JA#SILENCE_STO","LOCALS",0)~

ADD_STATE_TRIGGER SILENC 0
~GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%)~

ADD_STATE_TRIGGER SILENC 1
~GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%)~

ADD_STATE_TRIGGER SILENC 2
~GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%)~

ALTER_TRANS SILENC // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
END

REPLACE_STATE_TRIGGER SILENC 6 ~Global("Chapter","GLOBAL",%tutu_chapter_7%)Global("JA#SILENCE_STO","LOCALS",0)Global("JA#SILENCE_CH8","LOCALS",0)~

REPLACE_STATE_TRIGGER SILENC 7 ~Global("Chapter","GLOBAL",%tutu_chapter_7%)Global("JA#SILENCE_STO","LOCALS",1)Global("JA#SILENCE_CH8","LOCALS",0)~

ALTER_TRANS SILENC // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#SILENCE_STO","LOCALS",1)
		SetGlobal("JA#SILENCE_CH8","LOCALS",1)
		StartStore("stosilen",LastTalkedToBy(Myself))~
  "REPLY" ~@10~
  "JOURNAL" ~@1032~
END

EXTEND_BOTTOM SILENC 6
IF ~~ THEN REPLY @0 DO ~SetGlobal("JA#SILENCE_STO","LOCALS",1)
SetGlobal("JA#SILENCE_CH8","LOCALS",1)~ JOURNAL @1032 EXIT
END

ALTER_TRANS SILENC // file name
BEGIN 7 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#SILENCE_CH8","LOCALS",1)
			StartStore("stosilen",LastTalkedToBy(Myself))~
  "REPLY" ~@10~
  "JOURNAL" ~@1032~
END

EXTEND_BOTTOM SILENC 7
IF ~Global("JA#SILENCE_MASK","LOCALS",1)!InParty("TIAX")~ THEN REPLY @2 DO ~StartStore("JA#MASK1",LastTalkedToBy(Myself))~ JOURNAL @1032 EXIT
IF ~Global("JA#SILENCE_MASK","LOCALS",1)InParty("TIAX")~ THEN REPLY @2 JOURNAL @1032 GOTO JA#SILENC_3
IF ~~ THEN REPLY @0 JOURNAL @1032 DO ~SetGlobal("JA#SILENCE_CH8","LOCALS",1)~ EXIT
END

ADD_STATE_TRIGGER SILENC 8
~Global("JA#SILENCE_STO","LOCALS",1)
!Global("JA#KNOW_MASKTEMPLE","GLOBAL",1)~

ALTER_TRANS SILENC // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~StartStore("stosilen",LastTalkedToBy(Myself))~
  "REPLY" ~@10~
END

EXTEND_BOTTOM SILENC 8
IF ~Global("JA#SILENCE_MASK","LOCALS",1)!InParty("TIAX")~ THEN REPLY @2 DO ~StartStore("JA#MASK1",LastTalkedToBy(Myself))~ EXIT
IF ~Global("JA#SILENCE_MASK","LOCALS",1)InParty("TIAX")~ THEN REPLY @2 GOTO JA#SILENC_3
IF ~~ THEN REPLY @0 EXIT
END

ALTER_TRANS SILENC // file name
BEGIN 9 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#SILENCE_STO","LOCALS",1)
		StartStore("stosilen",LastTalkedToBy(Myself))~
END

ADD_STATE_TRIGGER SILENC 10
~Global("Chapter","GLOBAL",%tutu_chapter_7%)ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~


APPEND SILENC

IF ~Global("JA#SILENCE_MASK","LOCALS",0)Global("JA#KNOW_MASKTEMPLE","GLOBAL",1)~ THEN BEGIN JA#SILENC_1
SAY @3
IF ~~ THEN REPLY @4 DO ~StartStore("stosilen",LastTalkedToBy(Myself))~ EXIT
IF ~!InParty("TIAX")~ THEN REPLY @5 DO ~SetGlobal("JA#SILENCE_MASK","LOCALS",1)SetGlobal("JA#KNOW_MASKTEMPLE","GLOBAL",0)~ GOTO JA#SILENC_2
IF ~InParty("TIAX")~ THEN REPLY @5 DO ~SetGlobal("JA#SILENCE_MASK","LOCALS",1)SetGlobal("JA#KNOW_MASKTEMPLE","GLOBAL",0)~ GOTO JA#SILENC_3
IF ~~ THEN REPLY @0 EXIT
END

IF ~~ THEN BEGIN JA#SILENC_2
SAY @6
IF ~~ THEN DO ~StartStore("JA#MASK1",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN JA#SILENC_3
SAY @7
IF ~~ THEN EXIT
END

END
