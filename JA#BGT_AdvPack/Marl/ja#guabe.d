BEGIN ~JA#GUAB1~

IF ~AreaCheck("%Temple_SongoftheMorning%")~ THEN BEGIN JA#GUAB1_0
  SAY @0
  IF ~Global("JA#MARL_GUARD","GLOBAL",2)~ THEN EXTERN KELDDA 4
  IF ~Global("JA#MARL_GUARD","GLOBAL",1)~ THEN EXTERN KELDDA 5
END

IF ~Global("JA#MARL_GUARD","GLOBAL",2)~ THEN BEGIN 12
  SAY @1
  IF ~~ THEN REPLY @2 DO ~ActionOverride("Marl",ChangeEnemyAlly(Myself,NEUTRAL))ActionOverride("Marl",NoAction())ClearAllActions()StartCutSceneMode()StartCutScene("JA#GBECU")~ EXIT
  IF ~~ THEN REPLY @3 DO ~ActionOverride("JA#GUAB2",Enemy())ActionOverride("JA#GUAB3",Enemy())Enemy()~ EXIT
END

IF ~Global("JA#MARL_GUARD","GLOBAL",1)~ THEN BEGIN 13
  SAY @4
  IF ~~ THEN REPLY @2 DO ~ActionOverride("Marl",ChangeEnemyAlly(Myself,NEUTRAL))ActionOverride("Marl",NoAction())ClearAllActions()StartCutSceneMode()StartCutScene("JA#GBECU")~ EXIT
  IF ~~ THEN REPLY @3 DO ~ActionOverride("JA#GUAB2",Enemy())ActionOverride("JA#GUAB3",Enemy())Enemy()~ EXIT
END
