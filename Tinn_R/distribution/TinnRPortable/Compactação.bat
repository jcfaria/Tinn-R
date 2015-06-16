@echo off
title BAT COMPACTACAO 
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
xcopy /s binPortable distribution\TinnRPortable\TinnR\App\binPortable /e
xcopy /s data distribution\TinnRPortable\TinnR\App\data /e
xcopy /s doc distribution\TinnRPortable\TinnR\App\doc /e
xcopy /s latex distribution\TinnRPortable\TinnR\App\latex /e
xcopy /s package distribution\TinnRPortable\TinnR\App\package /e
xcopy /s project distribution\TinnRPortable\TinnR\App\project /e
xcopy /s res distribution\TinnRPortable\TinnR\App\res /e
xcopy /s sample distribution\TinnRPortable\TinnR\App\sample /e
xcopy /s sumatra distribution\TinnRPortable\TinnR\App\sumatra /e
xcopy /s templates distribution\TinnRPortable\TinnR\App\templates /e
xcopy /s utils distribution\TinnRPortable\TinnR\App\utils /e
cd distribution\TinnRPortable
rename TinnR\App\binPortable\Tinn_RPortable.exe Tinn-RPortable.exe
xcopy /s TinnR\App\doc\"User guide.pdf" TinnR  /e
xcopy /s Tools\"Tinn-RPortable.exe" TinnR  /e
cd TinnR
rmdir /s /q 7-Zip 
cd..

for /d %%X in (*TinnR) do "Tools\7-Zip\7z.exe" a "%%X.zip" "TinnR\"

rmdir /s /q TinnR 


pause




exit
