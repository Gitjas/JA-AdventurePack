ADD_STATE_TRIGGER BRANDI 0 ~NumTimesTalkedTo(0)~

/* Brandilar will only inquire about the investigation if the doppelgangers aren't in the open yet */
ADD_STATE_TRIGGER BRANDI 7 ~Global("ZorlDopple","GLOBAL",0)~

/* add state trigger so Brandilar recognise the doppelganger change */
ADD_STATE_TRIGGER BRANDI 11 ~Global("ZorlDopple","GLOBAL",1) !Global("HelpBrandilar","GLOBAL",2)~


ADD_STATE_TRIGGER BRANDI 13 ~Global("HelpBrandilar","GLOBAL",3)~
REPLACE_STATE_TRIGGER BRANDI 13 ~Global("HelpAldeth","GLOBAL",2)~

ADD_STATE_TRIGGER BRANDI 14 ~NumTimesTalkedToGT(0)
!Global("HelpAldeth","GLOBAL",2)
Global("HelpBrandilar","GLOBAL",0)~

EXTEND_BOTTOM BRANDI 7
IF ~Global("JA#BRANDIHELP1","LOCALS",0)
Global("ZorlParty","GLOBAL",1)
Global("HelpBrandilar","GLOBAL",1)~ THEN REPLY @0 GOTO JA#BRANDI_00
END

EXTEND_BOTTOM BRANDI 14
IF ~~ THEN REPLY @1 GOTO 4
END

ALTER_TRANS BRANDI // file name
BEGIN 7 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#MERLEA_MYST","GLOBAL",1)~
END

ALTER_TRANS BRANDI // file name
BEGIN 10 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#BRANDI_01~
END

ALTER_TRANS BRANDI // file name
BEGIN 11 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("HelpBrandilar","GLOBAL",2)SetGlobal("JA#CUIRL","GLOBAL",1)AddJournalEntry(@1025,QUEST)~
END

ALTER_TRANS BRANDI // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@6~
END

ALTER_TRANS BRANDI // file name
BEGIN 16 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpAldeth","GLOBAL",1)~
  "EPILOGUE" ~EXIT~
END

ALTER_TRANS BRANDI // file name
BEGIN 16 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HelpAldeth","GLOBAL",2)~
  "EPILOGUE" ~EXIT~
END



APPEND BRANDI

IF ~~ THEN BEGIN JA#BRANDI_00
SAY @2
= @3
= @4
IF ~~ THEN DO ~SetGlobal("JA#BRANDIHELP1","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN JA#BRANDI_01
SAY @5
IF ~~ THEN EXIT
END


END
