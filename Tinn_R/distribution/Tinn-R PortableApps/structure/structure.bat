::  Author: Philipe Silva Farias 
:: 	File Version: 1.0
::  Date: 2015/06/29
::	Description: This script file was developed to automate PortableApps release structure

::Turning off folder's patch echo on prompt screen
@echo off

::Naming prompt window title
title STRUCTURE SCRIPT 

::Folder structure organization 
md  "Tinn-RPortable\App\AppInfo\Launcher"
md  "Tinn-RPortable\App\DefaultData"
md  "Tinn-RPortable\App\Tinn-R\binPortable"
md  "Tinn-RPortable\App\Tinn-R\data"
md  "Tinn-RPortable\App\Tinn-R\doc"
md  "Tinn-RPortable\App\Tinn-R\latex"
md  "Tinn-RPortable\App\Tinn-R\package"
md  "Tinn-RPortable\App\Tinn-R\project"
md  "Tinn-RPortable\App\Tinn-R\res"
md  "Tinn-RPortable\App\Tinn-R\sample"
md  "Tinn-RPortable\App\Tinn-R\sumatra"
md  "Tinn-RPortable\App\Tinn-R\templates"
md  "Tinn-RPortable\App\Tinn-R\utils"
md  "Tinn-RPortable\Data"
md  "Tinn-RPortable\Other\Help\images"
md  "Tinn-RPortable\Other\Source"


::Moving script action focus three folders above
cd ..\..\.. 


::Begin of file's copy
xcopy    binPortable\Tinn_RPortable_apps.exe distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\binPortable /e
xcopy    binPortable\Tinn_RPortable.exe.manifest distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\binPortable /e
xcopy /s data\"data.zip" distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\data /e 
xcopy /s doc distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\doc /e
xcopy    latex\"latex.zip" distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\latex 
xcopy /s package distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\package /e 

::Deleting one not necessary file from package
del   /q distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\package\readme.txt

xcopy /s project\"project.zip" distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\project /e 
xcopy /s res distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\res /e 
xcopy /s sample distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\sample /e 
xcopy /s sumatra distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\sumatra /e 
xcopy /s templates distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\templates /e 
xcopy /s utils distribution\"Tinn-R PortableApps"\structure\Tinn-RPortable\App\Tinn-R\utils /e 
::End of file's copy

::Moving script action focus to distribution\Tinn-RPortable
cd       distribution\"Tinn-R PortableApps"

::Renaming the main execution and manifest files 
rename   structure\Tinn-RPortable\App\Tinn-R\binPortable\Tinn_RPortable_apps.exe "Tinn-R Portable.exe"
rename   structure\Tinn-RPortable\App\Tinn-R\binPortable\Tinn_RPortable.exe.manifest "Tinn-R Portable.exe.manifest"

::Copying the launcher to the front folder
xcopy /s source\launcher\"Tinn-R Portable.exe" structure\Tinn-RPortable  /e

::Copying essential files to fit into Portableapps structure
xcopy /s source\other\Help\images structure\Tinn-RPortable\Other\Help\images /e
xcopy /s source\other\Source structure\Tinn-RPortable\Other\Source /e
xcopy /s source\appinfo structure\Tinn-RPortable\App\AppInfo /e
xcopy /s source\defaultdata structure\Tinn-RPortable\App\DefaultData
xcopy source\"help.html" structure\Tinn-RPortable


::Script's pause
pause
