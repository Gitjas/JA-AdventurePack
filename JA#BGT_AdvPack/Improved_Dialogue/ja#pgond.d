
//Priest Gond PGOND

ALTER_TRANS PGOND // file name
BEGIN 0 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO 1~
END