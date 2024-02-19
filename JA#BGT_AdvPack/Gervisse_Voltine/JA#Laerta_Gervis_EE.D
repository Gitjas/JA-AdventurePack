ALTER_TRANS LAERTA // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#QUESTDONE","%NWBaldursGate_LaertasHouse_L1%",1)
			SetGlobal("HelpLaerta","GLOBAL",2)
			AddexperienceParty(500)
			GiveItem("SCRL78",LastTalkedToBy)~
END

ALTER_TRANS GERVIS
BEGIN 2 END
BEGIN 0 END
BEGIN 
"ACTION"
~SetGlobal("HelpLaerta","GLOBAL",1)
EraseJournalEntry(%gervis1%)
EraseJournalEntry(%gervis2%)
EraseJournalEntry(%gervis3%)
EscapeAreaDestroy(90)~
"SOLVED_JOURNAL" ~@1043~
END
