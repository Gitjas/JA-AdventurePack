@echo off
@ECHO Installing elfsong tavern movie

mkdir JA#BGT_AdvPack\Backup\Chitin-Key-Backup-Do-Not-Delete-For-The-Love-Of-God
copy chitin.key JA#BGT_AdvPack\Backup\Chitin-Key-Backup-Do-Not-Delete-For-The-Love-Of-God
mkdir JA#TAVER
copy JA#BGT_AdvPack\Miniquest\*.mve JA#TAVER
copy Setup-JA#BGT_AdvPack.exe JA#MOVIE.exe
JA#MOVIE --make-biff JA#TAVER
del JA#MOVIE.exe
rmdir JA#TAVER /S /Q

@ECHO Finished installing movies