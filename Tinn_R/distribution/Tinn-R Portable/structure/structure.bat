::  Author: Philipe Silva Farias and José Cláudio Faria
:: 	File Version: 1.0.3
::  Date: 2015/06/19
::	Description: This script file was developed to automate the release of a new Tinn-R Portable version.
::	To change the version on zip's name for the version release, just change "release_number" for release's number at line 63

::Turning off folder's patch echo on prompt screen
@echo off

::Naming prompt window title
title COMPRESSION SCRIPT 

::Moving script action focus to zip folder
cd ..\zip

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
cd..\..\..

::Begin of file's copy
xcopy    binPortable\Tinn_RPortable_simple.exe distribution\"Tinn-R Portable"\zip\Tinn-R\App\binPortable /e
xcopy    binPortable\Tinn_RPortable.exe.manifest distribution\"Tinn-R Portable"\zip\Tinn-R\App\binPortable /e
xcopy /s data\"data.zip" distribution\"Tinn-R Portable"\zip\Tinn-R\App\data /e
xcopy /s doc distribution\"Tinn-R Portable"\zip\Tinn-R\App\doc /e
xcopy    latex\"latex.zip" distribution\"Tinn-R Portable"\zip\Tinn-R\App\latex
xcopy /s package distribution\"Tinn-R Portable"\zip\Tinn-R\App\package /e

::Deleting one not necessary file from package
del   /q distribution\"Tinn-R Portable"\zip\Tinn-R\App\package\readme.txt

xcopy /s project\"project.zip" distribution\"Tinn-R Portable"\zip\Tinn-R\App\project /e
xcopy /s res distribution\"Tinn-R Portable"\zip\Tinn-R\App\res /e
xcopy /s sample distribution\"Tinn-R Portable"\zip\Tinn-R\App\sample /e
xcopy /s sumatra distribution\"Tinn-R Portable"\zip\Tinn-R\App\sumatra /e
xcopy /s templates distribution\"Tinn-R Portable"\zip\Tinn-R\App\templates /e
xcopy /s utils distribution\"Tinn-R Portable"\zip\Tinn-R\App\utils /e
::End of file's copy

::Moving script action focus to distribution\Tinn-RPortable
cd       distribution\"Tinn-R Portable"\zip

::Renaming the main execution and manifest files 
rename   Tinn-R\App\binPortable\Tinn_RPortable_simple.exe "Tinn-R Portable.exe"
rename   Tinn-R\App\binPortable\Tinn_RPortable.exe.manifest "Tinn-R Portable.exe.manifest"

::Copying the user guide and the launcher to the front folder
xcopy /s Tinn-R\App\doc\"User guide.pdf" Tinn-R  /e
xcopy /s ..\tools\launcher\"Tinn-R Portable.exe" Tinn-R  /e

::Tinn-R folder compressing procedure
for /d %%X in (*Tinn-R) do "..\tools\7-Zip\7z.exe" a "Tinn-R Portable_release_number.zip" "Tinn-R\"

::Deleting the not longer needed Tinn-R folder
rmdir /s /q Tinn-R

::Script's pause
pause
