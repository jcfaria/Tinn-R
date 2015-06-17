::  Author: Philipe Silva Farias
:: 	File Version: 1.0.1
::	Description: This script file was developed to automate the release of a new Tinn-RPortable version.
::	To change the version on zip's name for the version release, just change "release_number" for release's number at line 40

@echo off
title COMPRESSION SCRIPT 

md  "TinnR\App\binPortable"
md  "TinnR\App\data"
md  "TinnR\App\doc"
md  "TinnR\App\latex"
md  "TinnR\App\package"
md  "TinnR\App\project"
md  "TinnR\App\res"
md  "TinnR\App\sample"
md  "TinnR\App\sumatra"
md  "TinnR\App\templates"
md  "TinnR\App\utils"
cd..
cd..
xcopy /s binPortable distribution\Tinn-RPortable\TinnR\App\binPortable /e
xcopy /s data\"data.zip" distribution\Tinn-RPortable\TinnR\App\data /e 
xcopy /s doc distribution\Tinn-RPortable\TinnR\App\doc /e
xcopy    latex\"latex.zip" distribution\Tinn-RPortable\TinnR\App\latex 
xcopy /s package distribution\Tinn-RPortable\TinnR\App\package /e 
del   /q distribution\Tinn-RPortable\TinnR\App\package\readme.txt
xcopy /s project\"project.zip" distribution\Tinn-RPortable\TinnR\App\project /e 
xcopy /s res distribution\Tinn-RPortable\TinnR\App\res /e 
xcopy /s sample distribution\Tinn-RPortable\TinnR\App\sample /e 
xcopy /s sumatra distribution\Tinn-RPortable\TinnR\App\sumatra /e 
xcopy /s templates distribution\Tinn-RPortable\TinnR\App\templates /e 
xcopy /s utils distribution\Tinn-RPortable\TinnR\App\utils /e 
cd       distribution\Tinn-RPortable
rename   TinnR\App\binPortable\Tinn_RPortable.exe Tinn-RPortable.exe
xcopy /s TinnR\App\doc\"User guide.pdf" TinnR  /e
xcopy /s Tools\launcher\"Tinn-RPortable.exe" TinnR  /e
rename   TinnR Tinn-R

for /d %%X in (*Tinn-R) do "Tools\7-Zip\7z.exe" a "Tinn-RPortable.release_number.zip" "Tinn-R\"

rmdir /s /q Tinn-R 

pause


exit