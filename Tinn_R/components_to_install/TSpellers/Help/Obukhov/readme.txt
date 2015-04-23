TSpellChecker is native Delphi 3.0 component which implements
MS Office 97 compatible spell-checker for any language in 
paneuropean platform. Package contains files:

Spellers.pas - source code for TSpellChecker.
Spellers.dcu - compiled unit.
Spellers.dcr - resource file.
Spellers.dfm - speller dialog window.
Langs.pas    - unit which contains some useful declarations and functions.
Langs.dcu    - compiled unit.
CSAPI.pas    - my translation of CSAPI.H.
CSAPI.dcu    - compiled unit.
SpellRes.rus - Russian language-dependent string resources for 
               speller dialog.
SpellRes.eng - English language-dependent string resources for 
               speller dialog.
SpellRes.pol - Polish language-dependent string resources for 
               speller dialog (by Rafal Platek <platekr@chimera.ae.krakow.pl>).
Help.txt     - flat manual.
Readme.txt   - this file.
History.txt  - revisions list.
OrfoReg.reg  - Registry file for users of WinOrfo 4.5 or 5.0 (see note below).
Demo/*.*     - TSpellChecker demo program.

To install component in Delphi 3:
1) rename needed SpellRes.* into SpellRes.pas. You can rewrite
   this module with your native language.
2) add Spellers.pas to any package you want and compile it.

Find TSpellChecker in Additional page of components palette.

The software is absolutely freeware.

Thanks to 
  Rafal Platek
  Doyoung Na
  Jan Hulala
  Michael Engesgaard
  Chris Forbis

Author will be grateful for any notes and proposals. Also author
interested in any information concerned API of MS Office and
Corel spellers, thesaurus, grammar, hyphenation and "all word 
forms" capability.

Note for users of Orfo for Windows 4.5 or 5.0:
If you want to add words with all forms and check English words
within Russian text with TSpellChecker you should make some changes
in registry. Open OrfoReg.reg for editing with any text editor,
change all occurences of SPELLDEMO in the file with name of your 
exe-file without extension, then save and merge OrfoReg.reg with
Registry by double-clicking on it in Explorer window.

Alexander Obukhov
Minsk, Belarus
E-mail alex@niiomr.belpak.minsk.by