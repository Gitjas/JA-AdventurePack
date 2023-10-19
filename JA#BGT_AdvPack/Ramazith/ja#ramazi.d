ALTER_TRANS RAMAZI
BEGIN 11 END
BEGIN 0 END
BEGIN
  "ACTION" ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
		Wait(1)
		SetGlobal("RamazithMove","GLOBAL",2)
		ForceSpell(Myself,DRYAD_TELEPORT)
		Wait(1)
		DestroySelf()~
END

ALTER_TRANS RAMAZI
BEGIN 9 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("HelpRamazith","GLOBAL",1)
MoveToObjectNoInterrupt("Door0137")
Wait(1)
Unlock("Door0137")
OpenDoor("Door0137")
SetGlobal("RamazithMove","GLOBAL",1)
Wait(1)
EscapeAreaMove("%NBaldursGate_RamazithsTower_L1%",328,234,0)~
END


ADD_STATE_TRIGGER RAMAZI 0
~!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

ADD_STATE_TRIGGER RAMAZI 2
~!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

ADD_STATE_TRIGGER RAMAZI 11
~Global("JA#RAMAZ_1","LOCALS",0)
Global("JA#ABELA_FREE","GLOBAL",0)
!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

ADD_STATE_TRIGGER RAMAZI 13
~!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

ADD_STATE_TRIGGER RAMAZI 22
~GlobalLT("HelpRamazith","GLOBAL",2)
Global("JA#ABELA_FREE","GLOBAL",0)
!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

ALTER_TRANS RAMAZI
BEGIN 11 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@14~ 
END

EXTEND_BOTTOM RAMAZI 11
IF ~~ THEN REPLY @0 GOTO JA#RAMAZITH_0
END

ALTER_TRANS RAMAZI
BEGIN 13 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("HelpRamazith","GLOBAL",2)
TakePartyItem("MISC68")
DestroyItem("MISC68")
CreateCreature("ABELA",[354.265],3)
ActionOverride("Abela",Dialogue([PC]))~ 
END

/* Taken out - this is bad for compatibility
ADD_TRANS_ACTION RAMAZI
BEGIN 15 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
~AddexperienceParty(400)
ReputationInc(-2)~


ALTER_TRANS RAMAZI
BEGIN 15 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "REPLY" ~@15~
END

EXTEND_BOTTOM RAMAZI 15
IF ~~ THEN REPLY @1 DO ~EraseJournalEntry(999999)
EraseJournalEntry(999998)
EraseJournalEntry(999997)
EraseJournalEntry(999996)
AddexperienceParty(400)
GiveItemCreate("BRAC02",LastTalkedToBy(Myself),0,0,0)
SetGlobal("HelpRamazith","GLOBAL",3)~ GOTO JA#RAMAZITH_6
END

EXTEND_BOTTOM RAMAZI 15
IF ~~ THEN REPLY @17 DO ~EraseJournalEntry(999999)
EraseJournalEntry(999998)
EraseJournalEntry(999997)
EraseJournalEntry(999996)
AddexperienceParty(400)
ReputationInc(-2)
GiveItemCreate("BRAC02",LastTalkedToBy(Myself),0,0,0)
SetGlobal("HelpRamazith","GLOBAL",3)~ GOTO JA#RAMAZITH_8
END

*/

EXTEND_BOTTOM RAMAZI 16
IF ~~ THEN REPLY @17 GOTO JA#RAMAZITH_8
END

/*
ALTER_TRANS RAMAZI
BEGIN 17 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~DialogInterrupt(FALSE)
ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
SetGlobal("RamazithMove","GLOBAL",2)
DialogInterrupt(TRUE)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~
  "REPLY" ~@14~
END



EXTEND_BOTTOM RAMAZI 17
IF ~~ THEN REPLY @2 GOTO JA#RAMAZITH_4
END
*/

EXTEND_BOTTOM RAMAZI 18
IF ~~ THEN REPLY @17 GOTO JA#RAMAZITH_8
END


ALTER_TRANS RAMAZI
BEGIN 19 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~DialogInterrupt(FALSE)
ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
SetGlobal("RamazithMove","GLOBAL",2)
DialogInterrupt(TRUE)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~
  "REPLY" ~@14~
END

EXTEND_BOTTOM RAMAZI 19
IF ~~ THEN REPLY @2 GOTO JA#RAMAZITH_4
END

EXTEND_BOTTOM RAMAZI 19
IF ~~ THEN REPLY @17 GOTO JA#RAMAZITH_8
END

ALTER_TRANS RAMAZI
BEGIN 22 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#RAMAZ_1","LOCALS",1)
Global("RamazithMove","GLOBAL",1)
!PartyHasItem("MISC68")
AreaCheck("%NBaldursGate_RamazithsTower_L1%")~
  "REPLY" ~@16~
END

EXTEND_BOTTOM RAMAZI 22
IF ~Global("JA#RAMAZ_1","LOCALS",1)
Global("RamazithMove","GLOBAL",1)
!PartyHasItem("MISC68")
AreaCheck("%NBaldursGate_RamazithsTower_L1%")~ THEN REPLY @3 DO ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
Wait(1)
SetGlobal("RamazithMove","GLOBAL",2)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END

REPLACE_ACTION_TEXT RAMAZI
~SetGlobalTimer("Ramazith","GLOBAL",ONE_MINUTE)~
~SmallWait(1)~

REPLACE_STATE_TRIGGER RAMAZI 16 ~AreaCheck("%NBaldursGate_RamazithsTower_L1%")
Global("RamazithMove","GLOBAL",1)
Global("HelpRamazith","GLOBAL",3)~


APPEND RAMAZI

IF ~GlobalTimerExpired("JA#RamazithItem","GLOBAL")
Global("JA#RamazithDeal","GLOBAL",1)~ THEN BEGIN JA#RAMAZITH_X0
SAY @20
IF ~~ THEN REPLY @21 DO ~ClearAllActions()StartCutSceneMode()StartCutScene("JA#CURA1")~ EXIT
IF ~~ THEN REPLY @22 GOTO JA#RAMAZITH_X1
END

IF ~~ THEN BEGIN JA#RAMAZITH_X1
SAY @23
IF ~~ THEN DO ~SetGlobal("JA#RamazithDeal","GLOBAL",10)
SetGlobal("RamazithMove","GLOBAL",2)
DialogueInterrupt(FALSE)
ForceSpell(Player1,DRYAD_TELEPORT)
ForceSpell(Player2,DRYAD_TELEPORT)
ForceSpell(Player3,DRYAD_TELEPORT)
ForceSpell(Player4,DRYAD_TELEPORT)
ForceSpell(Player5,DRYAD_TELEPORT)
ForceSpell(Player6,DRYAD_TELEPORT)
Wait(2)
Enemy()
ActionOverride(Player1,LeaveAreaLUA("%NBaldursGate_RamazithsTower_L1%","",[239.277],4))
ActionOverride(Player2,LeaveAreaLUA("%NBaldursGate_RamazithsTower_L1%","",[184.293],4))
ActionOverride(Player3,LeaveAreaLUA("%NBaldursGate_RamazithsTower_L1%","",[188.231],4))
ActionOverride(Player4,LeaveAreaLUA("%NBaldursGate_RamazithsTower_L1%","",[152.252],4))
ActionOverride(Player5,LeaveAreaLUA("%NBaldursGate_RamazithsTower_L1%","",[162.178],4))
ActionOverride(Player6,LeaveAreaLUA("%NBaldursGate_RamazithsTower_L1%","",[110.197],4))
DialogueInterrupt(TRUE)
~ EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",2)~ THEN BEGIN JA#RAMAZITH_X2
SAY @24
IF ~PartyGoldGT(199)~ THEN REPLY @25 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",4)~ GOTO JA#RAMAZITH_X3
IF ~~ THEN REPLY @26 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",3)~ GOTO JA#RAMAZITH_X4
END

IF ~~ THEN BEGIN JA#RAMAZITH_X3
SAY @27
IF ~~ THEN DO ~TakePartyGold(200)GiveItemCreate("CLCK07",LastTalkedToBy(Myself),0,0,0)~ EXIT
END

IF ~~ THEN BEGIN JA#RAMAZITH_X4
SAY @28
IF ~~ THEN EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",3)~ THEN BEGIN JA#RAMAZITH_X5
SAY @29
IF ~PartyGoldGT(199)~ THEN REPLY @25 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",4)~ GOTO JA#RAMAZITH_X3
IF ~~ THEN REPLY @30 EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",4)~ THEN BEGIN JA#RAMAZITH_X6
SAY @31
IF ~~ THEN EXIT
END

IF ~GlobalTimerNotExpired("JA#RamazithItem","GLOBAL")
Global("JA#RamazithDeal","GLOBAL",1)~ THEN BEGIN JA#RAMAZITH_X7
SAY @32
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JA#RAMAZITH_0
SAY @4
IF ~~ THEN DO ~SetGlobal("JA#RAMAZ_1","LOCALS",1)~ EXIT
END

IF ~AreaCheck("%NBaldursGate_RamazithsTower_L3%") 
Global("RamazithMove","GLOBAL",2)~ 
THEN BEGIN JA#RAMAZITH_1
SAY @5
IF ~~ THEN DO ~Wait(1)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END

IF ~AreaCheck("%NBaldursGate_RamazithsTower_L6%") 
Global("RamazithMove","GLOBAL",2)~ 
THEN BEGIN JA#RAMAZITH_2
SAY @6
IF ~~ THEN DO ~ForceSpell(Myself,WIZARD_STONE_SKIN)
Wait(1)
ForceSpell(Myself,SUMMON_SHADOW)~ EXIT
END

IF ~AreaCheck("%NBaldursGate_RamazithsTower_L5%") 
Global("RamazithMove","GLOBAL",2)~ 
THEN BEGIN JA#RAMAZITH_3
SAY @7
IF ~~ THEN DO ~Wait(1)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN JA#RAMAZITH_4
SAY @8
IF ~~ THEN DO ~SetGlobal("JA#RAMAZ_1","LOCALS",2)~ EXIT
END

IF ~Global("JA#RAMAZ_1","LOCALS",2)~ THEN BEGIN JA#RAMAZITH_5
SAY @9
IF ~~ THEN REPLY @10 GOTO JA#RAMAZITH_6
IF ~~ THEN REPLY @11 EXIT
END

IF ~~ THEN BEGIN JA#RAMAZITH_6
SAY @12
IF ~~ THEN DO ~DialogInterrupt(FALSE)
ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
SetGlobal("RamazithMove","GLOBAL",2)
DialogInterrupt(TRUE)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END

IF ~Global("JA#ABELA_FREE","GLOBAL",1)!PartyHasItem("MISC68")~ THEN BEGIN JA#RAMAZITH_7
SAY @13
IF ~~ THEN DO ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
Wait(1)
SetGlobal("RamazithMove","GLOBAL",2)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END


IF ~~ THEN BEGIN JA#RAMAZITH_8
SAY @19
IF ~~ THEN DO ~DialogInterrupt(FALSE)
SetGlobalTimer("JA#RamazithItem","GLOBAL",TWO_DAYS)
SetGlobal("JA#RamazithDeal","GLOBAL",1)
DialogInterrupt(TRUE)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ SOLVED_JOURNAL @18 EXIT
END

END



BEGIN JA#RAMAZ

IF ~NumTimesTalkedTo(0)~ THEN BEGIN JA#RAMAZ_0
SAY @33
IF ~~ THEN REPLY @34 GOTO JA#RAMAZ_1
IF ~~ THEN REPLY @35 GOTO JA#RAMAZ_2
IF ~~ THEN REPLY @36 GOTO JA#RAMAZ_1
END

IF ~~ THEN BEGIN JA#RAMAZ_1
SAY @37
IF ~~ THEN DO ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
Wait(1)
SetGlobal("RamazithMove","GLOBAL",2)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN JA#RAMAZ_2
SAY @38
IF ~~ THEN DO ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
Wait(1)
SetGlobal("RamazithMove","GLOBAL",2)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END