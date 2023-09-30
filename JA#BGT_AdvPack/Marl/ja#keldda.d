ALTER_TRANS KELDDA
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MARL_GUARD","GLOBAL",3)
ActionOverride("JA#GUAB1",EscapeArea())
ActionOverride("JA#GUAB2",EscapeArea())
ActionOverride("JA#GUAB3",EscapeArea())
TakePartyGold(300)~
END

ALTER_TRANS KELDDA
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MARL_GUARD","GLOBAL",3)
ActionOverride("JA#GUAB1",EscapeArea())
ActionOverride("JA#GUAB2",EscapeArea())
ActionOverride("JA#GUAB3",EscapeArea())
TakePartyGold(200)~
END

ADD_STATE_TRIGGER KELDDA 1 ~GlobalLT("JA#MARL_GUARD","GLOBAL",1)~

REPLACE_STATE_TRIGGER KELDDA 3 ~Dead("bassilus")
PartyHasItem("MISC04")
!Global("BassilusDead","GLOBAL",2)
GlobalGT("JA#MARL_GUARD","GLOBAL",0)~

ALTER_TRANS KELDDA
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("B!GavinBassilusQuest","GLOBAL",5)
GiveGoldForce(1000)
SetGlobal("BassilusDead","GLOBAL",2)
AddexperienceParty(500)
EraseJournalEntry(%kelddath1%)
EraseJournalEntry(%kelddath2%)
EraseJournalEntry(%kelddath3%)
EraseJournalEntry(%kelddath4%)
EraseJournalEntry(%kelddath5%)
EraseJournalEntry(%kelddath6%)
EraseJournalEntry(%kelddath7%)
TakePartyItem("MISC04")~
END

