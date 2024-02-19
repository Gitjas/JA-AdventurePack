ADD_STATE_TRIGGER IRLENT 0 ~Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",0)~
REPLACE_STATE_TRIGGER IRLENT 6 ~Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",5)~
REPLACE_STATE_TRIGGER IRLENT 5 ~!Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",2)
!Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",5)
OR(2) AreaCheck("%SWBaldursGate_MerchantLeague_L1%") AreaCheck("%SWBaldursGate_MerchantLeague_L3%")~

ALTER_TRANS IRLENT // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("ZorlParty","GLOBAL",1)
AddJournalEntry(%aldeth5%,QUEST)~
END

/* Irlentree remains at the 1st level
ALTER_TRANS IRLENT // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~MoveToPoint([394.342])
DestroySelf()~
END
*/

ALTER_TRANS IRLENT // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#IRLENT_02~
END


APPEND IRLENT

IF ~Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",2)~ THEN BEGIN JA#IRLENT_01
SAY @0
= @1
IF ~~ THEN DO ~SetGlobal("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",3)
SetGlobal("JA#DOPPELGANGER_SPAWN","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN JA#IRLENT_02
SAY @2
IF ~~ THEN DO ~SetGlobal("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",6)SetGlobal("JA#SENDZORL","GLOBAL",1)
SetGlobal("C#JA#_CorpseDrop","GLOBAL",1)
EscapeAreaMove("%SWBaldursGate_MerchantLeague_L3%",622,563,7)~ UNSOLVED_JOURNAL @1027 EXIT
END


END







//ZORL

ADD_STATE_TRIGGER ZORL 0 ~AreaCheck("%SWBaldursGate_MerchantLeague_L2%")~
ADD_STATE_TRIGGER ZORL 4 ~AreaCheck("%SWBaldursGate_MerchantLeague_L3%")Global("JA#CUIRL","GLOBAL",50)PartyHasItem("SCRL2P")~
ADD_STATE_TRIGGER ZORL 5 ~AreaCheck("%SWBaldursGate_MerchantLeague_L2%")GlobalGT("JA#MERCLEAGUE_INSP","GLOBAL",1)Global("JA#ZORLSUSP","LOCALS",0)~
ADD_STATE_TRIGGER ZORL 10 ~AreaCheck("%SWBaldursGate_MerchantLeague_L2%")Global("JA#ZORLSUSP","LOCALS",1)~
ADD_STATE_TRIGGER ZORL 14 ~AreaCheck("%SWBaldursGate_MerchantLeague_L2%")GlobalLT("JA#MERCLEAGUE_INSP","GLOBAL",2)~


ALTER_TRANS ZORL // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#ZORL_01~
END

ALTER_TRANS ZORL // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 1 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~AddJournalEntry(@1028,QUEST)~
END


ALTER_TRANS ZORL // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("ZorlDopple","GLOBAL",1)AddJournalEntry(@1025,QUEST)~
END

ALTER_TRANS ZORL // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#ZORLSUSP","LOCALS",1)~
END

ALTER_TRANS ZORL // file name
BEGIN 10 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@9~
  "EPILOGUE" ~EXIT~
END

ALTER_TRANS ZORL // file name
BEGIN 11 END // state number (can be more than one)
BEGIN 0  END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#ALDETH_KNOWDOPP","GLOBAL",3)~
END

ALTER_TRANS ZORL // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@9~
  "EPILOGUE" ~EXIT~
END


EXTEND_BOTTOM ZORL 5
IF ~Global("JA#SENDZORL","GLOBAL",1)~ THEN REPLY @3 DO ~SetGlobal("JA#ZORLSUSP","LOCALS",1)~ GOTO JA#ZORL_03
END

EXTEND_BOTTOM ZORL 10
IF ~Global("JA#SENDZORL","GLOBAL",1)~ THEN REPLY @3 GOTO JA#ZORL_03
END

EXTEND_BOTTOM ZORL 14
IF ~Global("JA#SENDZORL","GLOBAL",1)~ THEN REPLY @3 GOTO JA#ZORL_03
END

EXTEND_BOTTOM ZORL 14
IF ~Global("JA#ZORL_ASK","LOCALS",0)~ THEN REPLY @4 GOTO JA#ZORL_02
END


APPEND ZORL

IF ~~ THEN BEGIN JA#ZORL_01
SAY @5
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA#ZORL_02
SAY @6
IF ~~ THEN DO ~SetGlobal("JA#ZORL_ASK","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN JA#ZORL_03
SAY @7
IF ~~ THEN DO ~SetGlobal("JA#SENDZORL","GLOBAL",2)EscapeAreaMove("%SWBaldursGate_MerchantLeague_L3%",674,464,6)~ EXIT
END

IF ~AreaCheck("%SWBaldursGate_MerchantLeague_L3%")Global("JA#CUIRL","GLOBAL",0)!PartyHasItem("SCRL2P")~ THEN BEGIN JA#ZORL_04
SAY @8
IF ~~ THEN EXIT
END


END