@echo off
REM In order to use this batch file, you need to install Wget and 7zip and add them to the PATH.

REM Please set the path of ...\Chiitrans Lite\Data
set "chiitrans_path=C:\Program Files (x86)\Chiitrans Lite\data"
set "backup_path=%chiitrans_path%\Backup"
set "download_path=%chiitrans_path%\Download"

if not exist "%backup_path%" mkdir "%backup_path%"
if not exist "%download_path%" mkdir "%download_path%"

REM JMdict: Japanese/English Dictionary
wget -N http://ftp.monash.edu/pub/nihongo/JMdict_e.gz -P "%download_path%" 2>"%download_path%\log.txt" 
find "304 Not Modified" "%download_path%\log.txt" > nul
if %ERRORLEVEL% NEQ 0 (
xcopy "%chiitrans_path%\JMdict.xml" "%backup_path%" /d /y
7z x "%download_path%\JMdict_e.gz" -aoa -o"%download_path%"
move /y "%download_path%\JMdict_e" "%chiitrans_path%\JMdict.xml"
)
del "%download_path%\log.txt"
 
REM JMnedict: Japanese Proper Names Dictionary
wget -N http://ftp.monash.edu/pub/nihongo/JMnedict.xml.gz -P "%download_path%" 2> "%download_path%\log.txt"
find "304 Not Modified" "%download_path%\log.txt" > nul
if %ERRORLEVEL% NEQ 0 (
xcopy "%chiitrans_path%\JMnedict.xml" "%backup_path%" /d /y
7z x "%download_path%\JMnedict.xml.gz" -aoa -o"%download_path%"
move /y "%download_path%\JMnedict.xml" "%chiitrans_path%\JMnedict.xml"
)
del "%download_path%\log.txt"