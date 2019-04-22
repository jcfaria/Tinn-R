:: Author: Philipe Silva Farias and José Cláudio Faria
:: File Version: 1.0.4
:: Date: 2018/10/17
::	Description: This script file was developed to automate the release of a new Tinn-R_portable version.
::	To change the version on zip's name for the version release, just change "release_number" for release's number at line 64

::Turning off folder's patch echo on prompt screen
@echo off

::Naming prompt window title
title COMPRESSION SCRIPT 

::Moving script action focus to zip folder
cd ..\zip

::Folder structure organization 
md "Tinn-R\bin"
md "Tinn-R\data"
md "Tinn-R\doc"
md "Tinn-R\latex"
md "Tinn-R\packages"
md "Tinn-R\project"
md "Tinn-R\res"
md "Tinn-R\sample"
md "Tinn-R\sumatra"
md "Tinn-R\templates"
md "Tinn-R\updater"
md "Tinn-R\utils"

::Moving script action focus two folders above
cd..\..\..

::Begin of file's copy
xcopy    bin\Tinn_R_portable.exe distribution\Tinn-R_portable\zip\Tinn-R\bin /e
xcopy    bin\Tinn_R_portable.exe.manifest distribution\Tinn-R_portable\zip\Tinn-R\bin /e
xcopy /s data\"data.zip" distribution\Tinn-R_portable\zip\Tinn-R\data /e
xcopy /s doc distribution\Tinn-R_portable\zip\Tinn-R\doc /e
xcopy    latex\"latex.zip" distribution\Tinn-R_portable\zip\Tinn-R\latex
xcopy /s packages distribution\Tinn-R_portable\zip\Tinn-R\packages /e

::Deleting one not necessary file from packages
::del   /q distribution\Tinn-R_portable\zip\Tinn-R\packages\readme.txt

xcopy /s project\"project.zip" distribution\Tinn-R_portable\zip\Tinn-R\project /e
xcopy /s res distribution\Tinn-R_portable\zip\Tinn-R\res /e
xcopy /s sample distribution\Tinn-R_portable\zip\Tinn-R\sample /e
xcopy /s sumatra distribution\Tinn-R_portable\zip\Tinn-R\sumatra /e
xcopy /s templates distribution\Tinn-R_portable\zip\Tinn-R\templates /e
xcopy /s updater distribution\Tinn-R_portable\zip\Tinn-R\updater /e
xcopy /s utils distribution\Tinn-R_portable\zip\Tinn-R\utils /e
::End of file's copy

::Moving script action focus to distribution\Tinn-R_portable\zip
cd distribution\Tinn-R_portable\zip

::Renaming the main execution and manifest files 
rename   Tinn-R\bin\Tinn_R_portable.exe "Tinn-R_portable.exe"
rename   Tinn-R\bin\Tinn_R_portable.exe.manifest "Tinn-R_portable.exe.manifest"

::Tinn-R folder compressing procedure
:: To test, step by step, it is necessary to remove an '%'
::for /d %X in (*Tinn-R) do "..\tools\7-Zip\7z.exe" a "Tinn-R_5.02.03.00_portable.zip" "Tinn-R\"
::for /d %%X in (*Tinn-R) do "..\tools\7-Zip\7z.exe" a "Tinn-R_5.03.01.01_portable.zip" "Tinn-R\"
::for /d %%X in (*Tinn-R) do "..\tools\7-Zip\7z.exe" a "Tinn-R_5.03.02.01_portable.zip" "Tinn-R\"
::for /d %%X in (*Tinn-R) do "..\tools\7-Zip\7z.exe" a "Tinn-R_5.03.03.01_portable.zip" "Tinn-R\"
for /d %%X in (*Tinn-R) do "..\tools\7-Zip\7z.exe" a "Tinn-R_5.03.04.01_portable.zip" "Tinn-R\"

::Deleting the not longer needed Tinn-R folder
rmdir /s /q Tinn-R

::Script's pause
pause
