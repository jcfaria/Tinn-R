::  Author: Philipe Silva Farias
:: 	File Version: 1.0.2
::	Description: This script file was developed to automate the release of a new Tinn-RPortable version.
::	To change the version on zip's name for the version release, just change "release_number" for release's number at line 40

::Turning off folder's patch echo on prompt screen
@echo off
::Naming prompt window title
title COMPRESSION SCRIPT 

::Folder structure organization 
md  "Tinn-R\App\binPortable"
md  "Tinn-R\App\data"
md  "Tinn-R\App\doc"
md  "Tinn-R\App\latex"
md  "Tinn-R\App\package"
md  "Tinn-R\App\project"
md  "Tinn-R\App\res"
md  "Tinn-R\App\sample"
md  "Tinn-R\App\sumatra"
md  "Tinn-R\App\templates"
md  "Tinn-R\App\utils"

::Moving script action focus two folders above
cd..\..

::Begin of file's copy
xcopy /s binPortable distribution\Tinn-RPortable\Tinn-R\App\binPortable /e
xcopy /s data\"data.zip" distribution\Tinn-RPortable\Tinn-R\App\data /e 
xcopy /s doc distribution\Tinn-RPortable\Tinn-R\App\doc /e
xcopy    latex\"latex.zip" distribution\Tinn-RPortable\Tinn-R\App\latex 
xcopy /s package distribution\Tinn-RPortable\Tinn-R\App\package /e 

::Deleting one not necessary file from package
del   /q distribution\Tinn-RPortable\Tinn-R\App\package\readme.txt

xcopy /s project\"project.zip" distribution\Tinn-RPortable\Tinn-R\App\project /e 
xcopy /s res distribution\Tinn-RPortable\Tinn-R\App\res /e 
xcopy /s sample distribution\Tinn-RPortable\Tinn-R\App\sample /e 
xcopy /s sumatra distribution\Tinn-RPortable\Tinn-R\App\sumatra /e 
xcopy /s templates distribution\Tinn-RPortable\Tinn-R\App\templates /e 
xcopy /s utils distribution\Tinn-RPortable\Tinn-R\App\utils /e 
::End of file's copy

::Moving script action focus to distribution\Tinn-RPortable
cd       distribution\Tinn-RPortable

::Renaming the main execution file
rename   Tinn-R\App\binPortable\Tinn_RPortable.exe Tinn-RPortable.exe

::Copying the user guide and the launcher to the front folder
xcopy /s Tinn-R\App\doc\"User guide.pdf" Tinn-R  /e
xcopy /s Tools\launcher\"Tinn-R Portable.exe" Tinn-R  /e

::Tinn-R folder compressing procedure
for /d %%X in (*Tinn-R) do "Tools\7-Zip\7z.exe" a "Tinn-RPortable.release_number.zip" "Tinn-R\"

::Deleting the not longer needed Tinn-R folder
rmdir /s /q Tinn-R 

::Script's pause
pause

