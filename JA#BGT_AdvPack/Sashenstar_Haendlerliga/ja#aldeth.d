/*
REPLACE_STATE_TRIGGER ALDETH 28 ~!Global("Chapter","GLOBAL",%tutu_chapter_7%)Global("HelpAldeth","GLOBAL",2)~
*/
REPLACE_STATE_TRIGGER ALDETH 28 ~Global("HelpAldeth","GLOBAL",2)~


/* This will be moved into the tp2 to catch all instances 
REPLACE_TRANS_ACTION ALDETH
BEGIN 7 END
BEGIN 0 END
~GiveItem("POTN09",LastTalkedToBy)~ ~GiveItem("JA#ALDET",LastTalkedToBy(Myself))~
*/


ALTER_TRANS ALDETH // file name
BEGIN 13 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#ALDETH_00~
END

ALTER_TRANS ALDETH // file name
BEGIN 21 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
  "EPILOGUE" ~GOTO JA#ALDETH_32~
END

ALTER_TRANS ALDETH // file name
BEGIN 21 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~ClearAllActions()
StartCutSceneMode()
StartCutScene("JA#CUDED")~
  "EPILOGUE" ~EXIT~
END

ALTER_TRANS ALDETH // file name
BEGIN 22 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#ALDETH_33~
END

ALTER_TRANS ALDETH // file name
BEGIN 22 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#ALDETH_34~
END

ALTER_TRANS ALDETH // file name
BEGIN 22 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#ALDETH_35~
END

ALTER_TRANS ALDETH // file name
BEGIN 25 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("AldethMove","GLOBAL",2)
ClearAllActions()
StartCutSceneMode()
StartCutScene("JA#CUALD")~
END

ALTER_TRANS ALDETH // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("JA#MERLEA_MYST","GLOBAL",1)
Global("JA#PARTNER_MYST","LOCALS",0)~
  "ACTION" ~SetGlobal("JA#PARTNER_MYST","LOCALS",1)~
END

ALTER_TRANS ALDETH // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("ZorlParty","GLOBAL",1)
Global("JA#ALDETH_PARTY","LOCALS",0)~
  "ACTION" ~SetGlobal("JA#ALDETH_PARTY","LOCALS",1)~
END

ALTER_TRANS ALDETH // file name
BEGIN 17 END // state number (can be more than one)
BEGIN 1 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~False()~
END

ADD_STATE_TRIGGER ALDETH 14 ~!Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1) !Global("ZorlDopple","GLOBAL",1)~
ADD_STATE_TRIGGER ALDETH 21 ~!Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1)
Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",0)~
ADD_STATE_TRIGGER ALDETH 22 ~Global("Chapter","GLOBAL",%tutu_chapter_7%)
Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",1)~
ADD_STATE_TRIGGER ALDETH 24 ~!Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1)~
ADD_STATE_TRIGGER ALDETH 26 ~!Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1)~
ADD_STATE_TRIGGER ALDETH 27 ~!Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1)~

ADD_TRANS_ACTION ALDETH
BEGIN 27 END
BEGIN 0 END
~EraseJournalEntry(@1025)
EraseJournalEntry(@1026)
EraseJournalEntry(@1027)
EraseJournalEntry(@1028)
EraseJournalEntry(@1029)
EraseJournalEntry(@1030)~

ALTER_TRANS IRLENT // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN ALDETH JA#ALDETH_02~
END

ALTER_TRANS IRLENT // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN ZORL 7~
END

ALTER_TRANS ZORL // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN IRLENT 4~
END

ALTER_TRANS ZORL // file name
BEGIN 7 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO 11~
END

ALTER_TRANS ZORL // file name
BEGIN 7 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("ZorlDopple","GLOBAL",1)~
END

EXTEND_BOTTOM ALDETH 14
IF ~PartyHasItem("SCRL2P")~ THEN REPLY @1 DO ~SetGlobal("JA#ALDETH_KNOWDOPP","GLOBAL",1)~ UNSOLVED_JOURNAL @1025 GOTO JA#ALDETH_30
END

EXTEND_BOTTOM ALDETH 14
IF ~!PartyHasItem("SCRL2P")GlobalGT("JA#DOPPELGANGER_SPAWN","GLOBAL",0)Global("JA#SENDZORL","GLOBAL",2)~ THEN REPLY @2 GOTO JA#ALDETH_31
END

APPEND ALDETH

IF ~~ THEN BEGIN JA#ALDETH_00
SAY @21
IF ~~ THEN REPLY @22 DO ~AddJournalEntry(%aldeth2%,QUEST)~ GOTO 25
IF ~~ THEN REPLY @23 GOTO 10
END

IF ~Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1)Global("JA#ALDETH_KNOWDOPP","GLOBAL",0)~ THEN BEGIN JA#ALDETH_01
SAY @24
IF ~~ THEN EXTERN IRLENT 3
END

IF ~Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1)Global("JA#ALDETH_KNOWDOPP","GLOBAL",1)~ THEN BEGIN JA#ALDETH_Y1
SAY @25
= @26
IF ~~ THEN EXTERN ZORL JA#ZORL_100
END

IF ~~ THEN BEGIN JA#ALDETH_02
SAY @27
IF ~~ THEN EXTERN ZORL 6
END

IF ~~ THEN BEGIN JA#ALDETH_30
SAY @31
= @32
IF ~~ THEN DO ~SetGlobal("JA#CUIRL","GLOBAL",1)SetGlobal("JA#ALD_MOVE1","%SWBaldursGate_MerchantLeague_L2%",1)EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN JA#ALDETH_31
SAY @33
IF ~~ THEN DO ~SetGlobal("JA#CUIRL","GLOBAL",1)SetGlobal("JA#ALD_MOVE1","%SWBaldursGate_MerchantLeague_L2%",1)EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN JA#ALDETH_32
SAY @34
IF ~~ THEN DO ~ClearAllActions()StartCutSceneMode()StartCutScene("JA#CUDED")~ EXIT
END

IF ~~ THEN BEGIN JA#ALDETH_33
SAY @35
IF ~~ THEN DO ~SetGlobal("JA#ALDETHCHP8","GLOBAL",3)
SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",2)
CreateCreature("FLAMAL",[281.450],0)
CreateCreature("FFHUNT",[221.425],0)
CreateCreature("FFHUNT",[468.293],0)
CreateCreature("FFHUNT",[503.269],0)~ EXIT
END

IF ~~ THEN BEGIN JA#ALDETH_34
SAY @36
IF ~~ THEN DO ~SetGlobal("JA#ALDETHCHP8","GLOBAL",3)
SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",2)
CreateCreature("FLAMAL",[281.450],0)
CreateCreature("FFHUNT",[221.425],0)
CreateCreature("FFHUNT",[468.293],0)
CreateCreature("FFHUNT",[503.269],0)~ EXIT
END

IF ~~ THEN BEGIN JA#ALDETH_35
SAY @37
IF ~~ THEN DO ~SetGlobal("JA#ALDETHCHP8","GLOBAL",3)
SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",2)
CreateCreature("FLAMAL",[281.450],0)
CreateCreature("FFHUNT",[221.425],0)
CreateCreature("FFHUNT",[468.293],0)
CreateCreature("FFHUNT",[503.269],0)~ EXIT
END

/* new dialogue state - if PC attacked Zorl or Irlentree and forced them to change without the invitation to the 2nd floor */

IF WEIGHT #-1
~Global("ZorlDopple","GLOBAL",1) GlobalLT("AldethDopple","GLOBAL",6)
Global("Chapter","GLOBAL",%tutu_chapter_5%)
Global("HelpAldeth","GLOBAL",1)~ THEN fight_started
SAY @69
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~!Global("Chapter","GLOBAL",%tutu_chapter_7%)
Global("HelpAldeth","GLOBAL",2)
OR(2)
	PartyHasItem("JA#DIRLE")
	PartyHasItem("JA#DZORL")~ THEN bringback_bodies
SAY @70
IF ~PartyHasItem("JA#DIRLE")~ THEN DO ~TakePartyItem("JA#DIRLE") DestroyItem("JA#DIRLE") AddexperienceParty(250)~ EXIT
IF ~PartyHasItem("JA#DZORL")~ THEN DO ~TakePartyItem("JA#DZORL") DestroyItem("JA#DZORL") AddexperienceParty(250)~ EXIT
IF ~PartyHasItem("JA#DIRLE")
PartyHasItem("JA#DZORL")~ THEN DO ~TakePartyItem("JA#DZORL") DestroyItem("JA#DZORL") TakePartyItem("JA#DIRLE") DestroyItem("JA#DIRLE") AddexperienceParty(500)~ EXIT
END

IF WEIGHT #-1
~Global("Chapter","GLOBAL",%tutu_chapter_7%)Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",2)~ THEN BEGIN JA#ALDETH_36
SAY @38
IF ~~ THEN REPLY @39 DO ~SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ EXIT
IF ~~ THEN REPLY @40 DO ~SetGlobal("JA#MGUAR","GLOBAL",1)Enemy()~ EXIT
++ @71 /* ~Dachtet Ihr, ich würde diese Sache auf sich beruhen lassen, Aldeth? Ihr solltet mir besser einen guten Grund für Eurer Verhalten liefern – ich habe Euch oft geholfen und Ihr vergeltet es mir mit Verrat!~ */ + versoehnung
END

END //APPEND ALDETH

/* take this out to activate the original dialogue state again, for compatibility with other mods 

IF WEIGHT #-1
~Global("Chapter","GLOBAL",%tutu_chapter_7%)
Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ THEN BEGIN JA#ALDETH_37
SAY @41*/
// ++ @72  /*~Ich gehe hier nicht so einfach weg. Ihr solltet mir besser einen guten Grund für Euren Verrat liefern – ich habe Euch oft geholfen und Ihr vergeltet es mir mit Verrat!~ */ /*+ versoehnung*/
// ++ @73 /* ~Lebt wohl.~ */ EXIT
// ++ @74 /* ~Ich habe es mir anders überlegt. Ihr werdet für Euren Verrat bezahlen!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
// END

/* patch it to state 28 instead */
ADD_TRANS_TRIGGER ALDETH 28 ~False()~ DO 0

EXTEND_BOTTOM ALDETH 28
+ ~Global("Chapter","GLOBAL",%tutu_chapter_7%)
Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ + @72 /* ~Ich gehe hier nicht so einfach weg. Ihr solltet mir besser einen guten Grund für Euren Verrat liefern – ich habe Euch oft geholfen und Ihr vergeltet es mir mit Verrat!~ */ + versoehnung
+ ~Global("Chapter","GLOBAL",%tutu_chapter_7%)
Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ + @74 /* ~Ich habe es mir anders überlegt. Ihr werdet für Euren Verrat bezahlen!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT

/* Baldurdash: in case Baldurdash is installed, this variable is set to 1. If not, it is 0 and this reply option will not show. */
+ ~Global("VP_MyBank","GLOBAL",1)~ + @110 DO ~StartStore("aldeth",LastTalkedToBy(Myself))~ EXIT
++ @73 /* ~Lebt wohl.~ */ EXIT
END

APPEND ALDETH


IF ~~ THEN versoehnung
SAY @75 /* ~Bitte missversteht mich nicht, <CHARNAME> – ich habe nicht vergessen, was Ihr alles für mich getan habt und ich bin Euch sehr dankbar dafür... aber ich bin auch ein ehrbarer Mann und kann somit niemanden gewähren lassen, der einfach so ehrbare Geschäftsleute ermordet!~ */
= @76 /* ~Ihr werdet sicher verstehen, dass ich nicht anders handeln konnte – sowohl der Ruf der Händlerliga als auch mein eigener stünden auf dem Spiel, wenn ich die Machenschaften von Mördern dulden würde...~ */
+ ~!Dead("Rieltar")~ + @77 /* ~Ich habe Euch bereits gesagt, dass ich nichts mit den Morden in Kerzenburg zu tun habe! Es sollte nur so aussehen, dass ich es war!~ */ + versoehnung_01
+ ~!Dead("Rieltar")~ + @78 /* ~Nichts hätte ich lieber getan, als diese verbrecherischen Bastarde zu töten, aber ich hatte wirklich nichts damit zu tun. Diesen Mord hat jemand begangen, um mir etwas anzuhängen!~ */ + versoehnung_01
+ ~Dead("Rieltar")~ + @79 /* ~Ehrenhafte Leute? Der Eisenthron selbst steckt überhaupt hinter der Eisenkrise und verübt Verbrechen, ohne bestraft zu werden! Ihr solltet froh sein, dass ich diese Hunde getötet habe!~ */ + versoehnung_05
+ ~Dead("Rieltar")~ + @80 /* ~Das verstehe ich, aber es war kein Mord. Der Eisenthron steckt hinter der Eisenkrise, und ich bin ihnen zu ungemütlich geworden. Ich habe mein eigenes Leben verteidigt!~ */ + versoehnung_05
++ @74 /* ~Ich habe es mir anders überlegt. Ihr werdet für Euren Verrat bezahlen!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN versoehnung_01
SAY @81 /* ~Wie gerne würde ich Euch glauben, <CHARNAME>. Ihr könnt Euch sicher vorstellen, wie es für mich war, meine Freunde und Wohlltäter verraten zu müssen ... aber Ihr wurdet nunmal von vertrauenswürdigen Personen dabei gesehen, wie Ihr die Morde begangen habt und das kann ich nicht ignorieren!~ */
++ @82 /* ~Kam Euch nie in den Sinn, dass es sich um das Werk von Doppelgänger gehandelt haben könnte? Wie Ihr wisst, haben sie es zumindest teilweise geschafft, Euch zu unterwandern und Dinge getan, welche der Händlerliga schaden!~ */ + versoehnung_02
++ @83 /* ~Aldeth, ich bin einer ganz großen Sache auf der Spur. Eure "vertrauenswürdigen Personen" sind nicht so vertrauenswürdig, wie Ihr meint. Ich habe Euch bereits mehrfach geholfen. Ihr müsst mir glauben!~ */ + versoehnung_02
++ @84 /* ~Mit Euch zu reden ist reine Zeitverschwendung! Nun werdet Ihr für Euren Verrat sterben!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1)Enemy()~ EXIT 
END

IF ~~ THEN versoehnung_02
SAY @85 /* ~Ihr ... habt Recht, mit dem, was Ihr sagt, <CHARNAME>. Doch selbst, wenn ich Euch glauben sollte, wie wollt Ihr beweisen, dass die Tat offensichtlich verübt wurde, um Euch in Verruf zu bringen?~ */
++ @86 /* ~Ich konnte mehrere Doppelgänger in Kerzenburg töten, die viele Bekannte von mir ersetzt hatten, doch ich weiß nicht, ob die Kadaver nicht schon verbrannt wurden oder die Leichen der Opfer gefunden wurden...~ */ + versoehnung_03
++ @87 /* ~Ich bin dabei, die Beweise gegen den Eisenthron zu sammeln. Deswegen war ich ja in Kerzenburg! Dort waren auch Doppelgänger, Aldeth. Es wimmelte nur so von ihnen!~ */ + versoehnung_03
++ @84 /* ~Mit Euch zu reden ist reine Zeitverschwendung! Nun werdet Ihr für Euren Verrat sterben!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1)Enemy()~ EXIT 
END

IF ~~ THEN versoehnung_03
SAY @88 /* ~Das ... tut mir sehr leid. Ich denke, ich kann meine Kontakte nutzen, um herauszufinden, ob dort Leichen seltsamer Kreaturen oder vermisster Burgbewohner gefunden wurden...~ */
++ @89 /* ~Ich danke Euch, Aldeth. Dafür, dass Ihr Euch zumindest bemüht, mir zu glauben.~ */ + versoehnung_04
++ @90 /* ~Wenn Ihr mir dann besser glauben könnt, dann tut das.~ */ + versoehnung_04
++ @84 /* ~Mit Euch zu reden ist reine Zeitverschwendung! Nun werdet Ihr für Euren Verrat sterben!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1)Enemy()~ EXIT 
END

IF ~~ THEN versoehnung_04
SAY @91 /* ~Das ist das mindeste, was ich nach den Ereignissen in der letzten Zeit tun kann. Eigentlich kam es mir selbst schon seltsam vor, dass Ihr so etwas Leichtsinniges tun solltet – der Eisenthron hat sehr viel Macht. Und das würde erklären, dass Ihr Euch nach Baldurs Tor wagt, obwohl Ihr von der Flammenden Faust gesucht werdet.~ */
= @92 /* ~Mir ist klar, dass Ihr Euch nun auf die Suche nach dem Verursacher für Eure Misere machen werdet. Leider kann ich nicht viel für Euch tun, um Euch zu helfen. Passt Auf Euch auf, meine Freunde ... ich habe Euch hier nie gesehen.~ */
IF ~~ THEN + versoehnung_09
END

IF ~~ THEN versoehnung_05
SAY @93 /* ~Es ranken sich in der Tat viele Gerüchte über dunkle Machenschaften innerhalb des Eisenthrons ... doch Behauptungen wie Eure rechtfertigen – selbst, wenn sie war sind -  keinen kaltblütigen Mord! Und schon gar nicht an hochangesehenen Leuten! Gerechtigkeit ist Sache der Großherzöge und der Flammenden Faust.~ */
++ @94 /* ~Ihr wisst selbst, wieviel Macht der Eisenthron hat. Ihr habt Recht, mit dem, was Ihr sagt, aber das Gesetz sieht nicht in jeden dunklen Winkel – vor allem nicht, wenn genug klingende Münze in die richtigen Taschen fließt oder die richtigen Stellen passend besetzt werden.~ */ + versoehnung_06
++ @95 /* ~Aldeth, nochmal - ich habe die Anführer des Eisenthrons getötet, aber es war kein *Mord*! Streng genommen haben sie mich zuerst angegriffen. Genauso, wie sie andere aus dem Weg geräumt haben, die ihnen lästig waren.~ */ + versoehnung_07
++ @96 /* ~Ich sehe, dass es nichts bringt, Euch überzeugen zu wollen. Ich bin mit Euch fertig, Ihr Verräter. Solltet Ihr je wieder Hilfe brauchen, seid Ihr auf Euch gestellt!~ */ DO ~SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ EXIT
++ @97 /* ~Genug von Euren Ausflüchten! Für Euren Verrat werdet Ihr sterben!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1)Enemy()~ EXIT 
END

IF ~~ THEN versoehnung_06
SAY @98 /* ~Ihr... habt leider Recht, mit dem was Ihr sagt. Ich habe mich immer für einen seriösen Ruf der Händlerliga eingesetzt, aber ich kenne die Methoden einiger Handelshäuser, um sich Vorteile zu sichern.~ */
++ @99 /* ~Was ich tat, mag wohl für viele als Mord gelten, doch wieviele sind durch die angeheuerten Räuberbanden umgekommen – oder bei der Zwangsarbeit in der Mantelwaldmine? Ganz zu schweigen von den ermordeten Bergleuten in den Minen von Nashkel ... Durch die Habgier dieser Leute droht uns nun der Krieg mit Amn!~ */ + versoehnung_07
++ @100 /* ~Der Eisenthron ist noch schlimmer, glaubt mir. Und es ist noch nicht vorbei!~ */ + versoehnung_07
END

IF ~~ THEN versoehnung_07
SAY @101 /* ~Ich gebe zu ... das würde in der Tat zu vielen Gerüchten passen, die mir bereits zu Ohren gekommen sind. Das alles und die beseitigung von Konkurrenten wie der Händlerliga würden dem Thron sicher eine größere Vormachtstellung geben...~ */
= @102 /* ~Ihr habt viel für mich getan, meine Freunde. Ich sollte Euch mittlerweile besser kennen, um zu wissen, dass Ihr nicht einfach so Unschuldige ermordet und dann solche Geschichten erfindet. Nicht nach allem, was ich mit Euch erlebt habe!~ */
++ @103 /* ~Ich danke Euch, Aldeth. Ich bin froh, dass Ihr meine Gründe versteht – auch ich bedauere, dass es soweit gekommen ist. Doch noch ist es nicht vorbei. Der eigentliche Drahtzieher spinnt weiterhin seine Intrigen!~ */ + versoehnung_08
++ @104 /* ~Das beruhigt mich. Ich hätte Euch ungern bekämpfen müssen.~ */ + versoehnung_08
++ @105 /* ~Na endlich.~ */ + versoehnung_08
++ @106 /* ~Das heißt aber nicht, dass ich Euch nicht für Euren Verrat bezahlen lasse! Zieht Eure Klinge und verteidigt Euch!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1)Enemy()~ EXIT 
END

IF ~~ THEN versoehnung_08
SAY @107 /* ~Ich verstehe. Obwohl ich Euren Weg wirklich nicht gutheiße, fürchte ich, dass Ihr den richtigen geht. Leider kann ich Euch nur damit helfen, dass niemand erfährt, dass Ihr hier wart.~ */
IF ~~ THEN + versoehnung_09
END

IF ~~ THEN versoehnung_09
SAY @108 /* ~Hier, nehmt wenigstens diese Tränke als geringe Entschädigung für das, was Ihr durchmachen musstet.~ */
IF ~~ THEN DO ~SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",4) GiveItemCreate("POTN52",Player1,6,0,0)
GiveItemCreate("POTN10",Player1,3,0,0)~ EXIT
END

/* this will show once, so the original greetings dialogue is available again for other mods */

IF WEIGHT #-1
~Global("Chapter","GLOBAL",%tutu_chapter_7%) Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",4) Global("C#JAP_AldethGreetingCH8","LOCALS",0)~ THEN versoehnung_10
SAY @109 /* ~Schön, Euch wohlbehalten zu sehen meine Freunde. Allerdings solltet Ihr hier nicht zu lange verweilen.~ */
IF ~~ THEN DO ~SetGlobal("C#JAP_AldethGreetingCH8","LOCALS",1)~ + 28
END

/* DO ~StartStore("aldeth",LastTalkedToBy(Myself))~ -> Baldurdash store is added via tp2 if existing */


END

APPEND ZORL

IF ~~ THEN BEGIN JA#ZORL_100
SAY @42
IF ~~ THEN EXTERN IRLENT 4
END

END


ALTER_TRANS MERLEA // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MERLEA_CHARM","LOCALS",1)
IncrementGlobal("JA#MERCLEAGUE_INSP","GLOBAL",1)
AddJournalEntry(@1030,QUEST)~
END


ADD_STATE_TRIGGER MERLEA 0 ~Global("JA#MERLEA_DESK","MYAREA",0) !Global("HelpAldeth","GLOBAL",2)~
ADD_STATE_TRIGGER MERLEA 5 ~Global("JA#MERLEA_MYST","GLOBAL",0)~
ADD_STATE_TRIGGER MERLEA 6 ~Global("JA#MERLEA_CHARM","LOCALS",0)~

ALTER_TRANS MERLEA // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MERLEA_DESK","MYAREA",1)~
END

ALTER_TRANS MERLEA // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MERLEA_MYST","GLOBAL",1)~
END





ADD_STATE_TRIGGER BART10 0 ~Global("JA#MERLEA_MYST","GLOBAL",0)~

ALTER_TRANS BART10 // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MERLEA_MYST","GLOBAL",1)~
  "REPLY" ~@59~
  "EPILOGUE" ~GOTO JA#BART10_00~
END


EXTEND_BOTTOM BART10 0
IF ~~ THEN REPLY @43 EXIT
END

APPEND BART10

IF ~~ THEN BEGIN JA#BART10_00
SAY @44 
IF ~~ THEN DO ~IncrementGlobal("JA#MERCLEAGUE_INSP","GLOBAL",1)AddJournalEntry(@1030,QUEST)~ EXIT
END

IF ~!Global("HelpAldeth","GLOBAL",2)~ THEN BEGIN JA#BART10_01
SAY @45
IF ~~ THEN EXIT
END

IF ~Global("HelpAldeth","GLOBAL",2)Global("JA#BART10","LOCALS",0)~ THEN BEGIN JA#BART10_02
SAY @46
IF ~~ THEN REPLY @47 DO ~SetGlobal("JA#BART10","LOCALS",1)StartStore("ja#mlbar",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY @48 DO ~SetGlobal("JA#BART10","LOCALS",1)~ EXIT
END

IF ~Global("HelpAldeth","GLOBAL",2)Global("JA#BART10","LOCALS",1)~ THEN BEGIN JA#BART10_03
SAY @49
IF ~~ THEN REPLY @50 DO ~StartStore("ja#mlbar",LastTalkedToBy(Myself))~ EXIT
IF ~~ THEN REPLY @48 EXIT
END


END



ADD_STATE_TRIGGER MERCHG 0 ~NumTimesTalkedTo(0)~
ADD_STATE_TRIGGER MERCHG 1 ~Global("JA#MERCHG_HELP","%SWBaldursGate_MerchantLeague_L1%",0)~
ADD_STATE_TRIGGER MERCHG 5 ~!Global("HelpAldeth","GLOBAL",2)Global("JA#MERCHG_HELP","%SWBaldursGate_MerchantLeague_L1%",0)~
ADD_STATE_TRIGGER MERCHG 6 ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~



ALTER_TRANS MERCHG // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MERCHG_HELP","%SWBaldursGate_MerchantLeague_L1%",1)~
END

ALTER_TRANS MERCHG // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~IncrementGlobal("JA#MERCLEAGUE_INSP","GLOBAL",1)AddJournalEntry(@1030,QUEST)~
END


ALTER_TRANS MERCHG // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MERCHG_HELP","%SWBaldursGate_MerchantLeague_L1%",1)IncrementGlobal("JA#MERCLEAGUE_INSP","GLOBAL",1)AddJournalEntry(@1030,QUEST)~
END

BEGIN ~JA#MLCOK~

IF ~!Global("HelpAldeth","GLOBAL",2)NumTimesTalkedTo(0)~ THEN BEGIN JA#MLCOK_1
SAY @51
IF ~~ THEN REPLY @52 GOTO JA#MLCOK_2
IF ~~ THEN REPLY @53 EXIT
END

IF ~~ THEN BEGIN JA#MLCOK_2
SAY @54
IF ~~ THEN REPLY @55 DO ~SetGlobal("JA#MLCOK","LOCALS",1)~ GOTO JA#MLCOK_4
IF ~~ THEN REPLY @56 EXIT
END

IF ~!Global("HelpAldeth","GLOBAL",2)NumTimesTalkedToGT(0)~ THEN BEGIN JA#MLCOK_3
SAY @57
IF ~Global("JA#MLCOK","LOCALS",0)~ THEN REPLY @52 GOTO JA#MLCOK_2
IF ~~ THEN REPLY @53 EXIT
END

IF ~~ THEN BEGIN JA#MLCOK_4
SAY @58
IF ~~ THEN REPLY @59 DO ~IncrementGlobal("JA#MERCLEAGUE_INSP","GLOBAL",1)~ UNSOLVED_JOURNAL @1026 GOTO JA#MLCOK_5
END

IF ~~ THEN BEGIN JA#MLCOK_5
SAY @60
= @61
IF ~~ THEN REPLY @62 GOTO JA#MLCOK_6
IF ~~ THEN REPLY @63 GOTO JA#MLCOK_7
END

IF ~~ THEN BEGIN JA#MLCOK_6
SAY @64
IF ~~ THEN REPLY @65 GOTO JA#MLCOK_7
END

IF ~~ THEN BEGIN JA#MLCOK_7
SAY @66
IF ~~ THEN EXIT
END

IF ~Global("HelpAldeth","GLOBAL",2)~ THEN BEGIN JA#MLCOK_8
SAY @67
IF ~~ THEN EXIT
END
