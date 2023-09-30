/* These are not necessary because of the introduced weighted states below. This is for compatibility with bg1npc (independent of install order.)
REPLACE_STATE_TRIGGER NIEMAI 0
~InParty("XZAR")
!Dead("XZAR")
AreaCheck("%EBaldursGate_SorcerousSundries_L2%")~

REPLACE_STATE_TRIGGER NIEMAI 5
~InParty("MONTARON")
!Dead("MONTARON")
AreaCheck("%EBaldursGate_SorcerousSundries_L2%")~

REPLACE_STATE_TRIGGER NIEMAI 8
~!InParty("JAHEIRA")
Global("JA#TalkedNiemai","LOCALS",0)
AreaCheck("%EBaldursGate_SorcerousSundries_L2%")~
*/

EXTEND_BOTTOM NIEMAI 9
IF ~~ THEN REPLY @0 DO ~SetGlobal("JA#TalkedNiemai","LOCALS",1)~ EXIT
END


ALTER_TRANS NIEMAI // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#NIEMAI_1~
END


ALTER_TRANS NIEMAI // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
  "EPILOGUE" ~GOTO JA#NIEMAI_2~
END

ALTER_TRANS NIEMAI // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
  "EPILOGUE" ~GOTO JA#NIEMAI_3~
END


ALTER_TRANS NIEMAI // file name
BEGIN 6 7 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#ZENTEXIT","%EBaldursGate_SorcerousSundries_L2%",2)~
END

ALTER_TRANS NIEMAI // file name
BEGIN 13 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#TalkedNiemai","LOCALS",1)~
END


APPEND NIEMAI

/* Xzar is in party. Start a weighted dialogue so the content shows if bg1npc is installed. */

IF WEIGHT #-1 
~InParty("XZAR")
!Dead("XZAR")
AreaCheck("%EBaldursGate_SorcerousSundries_L2%")~ THEN niemei_xzargreeting
SAY @54
IF ~~ THEN + 0
END

/* Montaron but no Xzar */
IF WEIGHT #-1 
~InParty("MONTARON")
!Dead("MONTARON")
AreaCheck("%EBaldursGate_SorcerousSundries_L2%")~ THEN BEGIN niemai_montarongreeting
SAY @54
IF ~~ THEN + 5
END

/* Neither Xzar nor Montaron nor Jaheira in party */
IF WEIGHT #-1 
~!InParty("JAHEIRA")
Global("JA#TalkedNiemai","LOCALS",0)
AreaCheck("%EBaldursGate_SorcerousSundries_L2%")~ THEN BEGIN miemai_greeting
SAY @55
IF ~~ THEN + 8
END


IF ~~ THEN BEGIN JA#NIEMAI_1
SAY @1
IF ~~ THEN DO ~SetGlobal("JA#ZENTEXIT","%EBaldursGate_SorcerousSundries_L2%",1)~ UNSOLVED_JOURNAL 
@1024 EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_2
SAY @3
IF ~~ THEN DO ~SetGlobal("JA#ZENTEXIT","%EBaldursGate_SorcerousSundries_L2%",1)~ UNSOLVED_JOURNAL 
@1024 EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_3
SAY @4
IF ~~ THEN DO ~SetGlobal("JA#ZENTEXIT","%EBaldursGate_SorcerousSundries_L2%",1)~ UNSOLVED_JOURNAL 
@1024 EXIT
END

IF ~!InParty("XZAR")InParty("JAHEIRA") InMyArea("JAHEIRA")!StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN BEGIN JA#NIEMAI_4
SAY @5
IF ~~ THEN GOTO JA#NIEMAI_5
END

IF ~~ THEN BEGIN JA#NIEMAI_5
SAY @6
IF ~~ THEN EXTERN %JAHEIRA_JOINED% Jaheira_1
END

IF WEIGHT #-1
~Global("JA#TalkedNiemai","LOCALS",1)~ THEN BEGIN JA#NIEMAI_6
SAY @7
IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#TalkedNiemai","LOCALS",2)~ GOTO JA#NIEMAI_7
IF ~~ THEN REPLY @9 GOTO JA#NIEMAI_8
IF ~~ THEN REPLY @10 EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_7
SAY @11
IF ~~ THEN REPLY @12 GOTO JA#NIEMAI_9
IF ~~ THEN REPLY @13 GOTO JA#NIEMAI_10
IF ~~ THEN REPLY @14 EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_8
SAY @15
IF ~~ THEN DO ~ActionOverride("OULAM",Enemy())
ActionOverride("WHEBER",Enemy())
ActionOverride("WILLIAM",Enemy())
Enemy()~ EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_9
SAY @16
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_10
SAY @17
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~Global("JA#TalkedNiemai","LOCALS",2)~ THEN BEGIN JA#NIEMAI_11
SAY @18
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_12
SAY @19
IF ~~ THEN DO ~ActionOverride("OULAM",Enemy())
ActionOverride("WHEBER",Enemy())
ActionOverride("WILLIAM",Enemy())
Enemy()~ EXIT
END

END


BEGIN JA#NIEMA

IF ~AreaCheck("%EBaldursGate_ElfsongTavern_L2%")Dead("XZAR")~ THEN BEGIN JA#NIEMAI_13
SAY 
@20
= 
@21
IF ~~ THEN DO ~EraseJournalEntry(@1024)
EscapeAreaDestroy(90)~ EXIT
END

IF ~AreaCheck("%EBaldursGate_ElfsongTavern_L2%")InParty("XZAR")InParty("JAHEIRA")InMyArea("JAHEIRA")!StateCheck("JAHEIRA",CD_STATE_NOTVALID)Global("JA#7706JAHNIEMAIN","LOCALS",0)~ THEN BEGIN JA#NIEMAI_14
SAY 
@22
= 
@23
IF ~~ THEN DO ~SetGlobal("JA#7706JAHNIEMAIN","LOCALS",1)~ EXTERN %JAHEIRA_JOINED% Jaheira_2
END

IF ~AreaCheck("%EBaldursGate_ElfsongTavern_L2%")InParty("XZAR")~ THEN BEGIN JA#NIEMAI_15
SAY 
@24
IF ~Global("SearchIronThrone","GLOBAL",1)~ THEN REPLY 
@25 GOTO JA#NIEMAI_18
IF ~~ THEN REPLY 
@26 EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_16
SAY 
@27
IF ~~ THEN EXTERN %JAHEIRA_JOINED% Jaheira_3
END

IF ~~ THEN BEGIN JA#NIEMAI_17
SAY 
@28
IF ~Global("SearchIronThrone","GLOBAL",1)~ THEN REPLY 
@25 GOTO JA#NIEMAI_18 
IF ~~ THEN REPLY 
@26 EXIT
END

IF ~~ THEN BEGIN JA#NIEMAI_18
SAY 
@29
= @30
IF ~~ THEN DO ~EraseJournalEntry(
@1024)AddexperienceParty(400)EscapeAreaDestroy(90)~ SOLVED_JOURNAL @31 EXIT
END

IF ~AreaCheck("%EBaldursGate_ElfsongTavern_L2%")!InParty("XZAR")~ THEN BEGIN JA#NIEMAI_xx0
SAY @47
IF ~~ THEN DO ~EraseJournalEntry(
@1024)EscapeAreaDestroy(90)~ EXIT
END

IF ~Global("JA#NIEMAIN_SPWN","GLOBAL",3)~ THEN BEGIN JA#NIEMAI_x19
SAY @48
IF ~~ THEN REPLY @49 GOTO JA#NIEMAI_x20
IF ~~ THEN REPLY @50 GOTO JA#NIEMAI_x21
END

IF ~~ THEN BEGIN JA#NIEMAI_x20
SAY @51
IF ~~ THEN GOTO JA#NIEMAI_x21
END

IF ~~ THEN BEGIN JA#NIEMAI_x21
SAY @52
IF ~~ THEN DO ~SetGlobal("JA#NIEMAIN_SPWN","GLOBAL",4)EscapeAreaDestroy(90)~ JOURNAL @53 EXIT
END




APPEND %JAHEIRA_JOINED%

IF ~~ THEN BEGIN Jaheira_1
SAY @32
IF ~~ THEN EXTERN NIEMAI JA#NIEMAI_12
END

IF ~~ THEN BEGIN Jaheira_2
SAY @33
= @34
IF ~~ THEN EXTERN JA#NIEMA JA#NIEMAI_16
END

IF ~~ THEN BEGIN Jaheira_3
SAY @35
IF ~~ THEN EXTERN JA#NIEMA JA#NIEMAI_17
END

END


INTERJECT_COPY_TRANS2 NIEMAI 0 JA#Xzar_Niemain1
== "%XZAR_JOINED%" IF ~InParty("XZAR") InMyArea("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN
@36
END

INTERJECT_COPY_TRANS2 NIEMAI 5 JA#Monti_Niemain1
== "%MONTARON_JOINED%" IF ~InParty("MONTARON") InMyArea("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID) Dead("XZAR")~ THEN
@37
== NIEMAI IF ~~ THEN
@38
== "%MONTARON_JOINED%" IF ~~ THEN
@39
== NIEMAI IF ~~ THEN
@40
END

INTERJECT_COPY_TRANS2 NIEMAI 6 JA#Monti_Niemain2
== "%MONTARON_JOINED%" IF ~InParty("MONTARON") InMyArea("MONTARON") !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN
@41
END


BEGIN JA#ZENT1

IF ~InParty("XZAR")!Dead("XZAR")~ THEN BEGIN JA#ZENT1_1
SAY @42
IF ~~ THEN EXTERN NIEMAI 0
END

IF ~!InParty("XZAR")InParty("MONTARON")!Dead("MONTARON")~ THEN BEGIN JA#ZENT1_2
SAY @42
IF ~~ THEN EXTERN NIEMAI 5
END

IF ~!InParty("JAHEIRA")~ THEN BEGIN JA#ZENT1_3
SAY @43
IF ~~ THEN EXTERN NIEMAI 8
END

IF ~!InParty("XZAR")InParty("JAHEIRA")~ THEN BEGIN JA#ZENT1_4
SAY @44
IF ~~ THEN EXTERN NIEMAI JA#NIEMAI_4
END

IF ~Global("JA#TalkedNiemai","LOCALS",1)~ THEN BEGIN JA#ZENT1_5
SAY @45
IF ~~ THEN EXIT
END

IF ~Global("JA#TalkedNiemai","LOCALS",2)~ THEN BEGIN JA#ZENT1_6
SAY @46
IF ~~ THEN EXIT
END