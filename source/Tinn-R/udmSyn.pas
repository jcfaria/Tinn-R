(*
 Tinn is a ASCII file editor primarily intended as a better replacement
 of the default Notepad.exe under Windows.

 This software is distributed under the terms of the GNU General
 Public License, either Version 2, June 1991 or Version 3, June 2007.
 The terms of version 2 and of the license are in a folder called
 doc (licence_gpl2.txt and licence_gpl2.txt)
 which you should have received with this software.

 See http://www.opensource.org/licenses/gpl-license.html or
 http://www.fsf.org/copyleft/gpl.html for further information.

 Copyright
  Russell May - http://www.solarvoid.com

 Tinn-R is an extension of Tinn that provides additional tools to control R
 (http://cran.r-project.org). The project is coordened by José Cláudio Faria
 (joseclaudio.faria@gmail.com).

 As such, Tinn-R is a feature-rich replacement of the basic script editor
 provided with Rgui. It provides syntax-highlighting, submission of code in
 whole, or line-by-line, and many other useful tools to ease writting and
 debugging of R code.

 Copyright
  Tinn-R team - http://nbcgib.uesc.br/lec/software/editores/tinn-r/en

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 and 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

unit udmSyn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynEditHighlighter,

  {
   Below the original SynEdit Highlighters:
  }
  SynHighlighterAsm,
  SynHighlighterBat,
  SynHighlighterCpp,
  SynHighlighterCS,
  SynHighlighterCss,
  SynHighlighterFortran,
  SynHighlighterGeneral,
  SynHighlighterHaskell,
  SynHighlighterHP48,
  SynHighlighterHTML,
  SynHighlighterIni,
  SynHighlighterJava,
  SynHighlighterJScript,
  SynHighlighterMulti,
  SynHighlighterPas,
  SynHighlighterPerl,
  SynHighlighterPHP,
  SynHighlighterPython,
  SynHighlighterRuby,
  SynHighlighterSQL,
  SynHighlighterST,
  SynHighlighterTclTk,
  SynHighlighterTeX,
  SynHighlighterURI,
  SynHighlighterVB,
  SynHighlighterVBScript,
  SynHighlighterXML,

  {
   Below the Highlighters developed/adapted for the project Tinn-R:
  }
  SynHighlighterAll,
  SynHighlighterR,
  SynHighlighterText
  ;

type
  TdmSyn = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    boolLoadedFileFromStartUp: boolean;
    iHigCount                : integer;

    // highlighters alphabetically ordered:
    synAll        : TSynAllSyn;
    synAsm        : TSynAsmSyn;
    synBat        : TSynBatSyn;
    synCpp        : TSynCppSyn;
    synCS         : TSynCSSyn;
    synCss        : TSynCssSyn;
    synFortran    : TSynFortranSyn;
    synHaskell    : TSynHaskellSyn;
    synHTML       : TSynHTMLSyn;
    synHTMLcomplex: TSynMultiSyn;
    synIni        : TSynIniSyn;
    synJava       : TSynJavaSyn;
    synJScript    : TSynJScriptSyn;
    synPas        : TSynPasSyn;
    synPerl       : TSynPerlSyn;
    synPHP        : TSynPHPSyn;
    synPHPcomplex : TSynMultiSyn;
    synPython     : TSynPythonSyn;
    synR          : TSynRSyn;
    synR_term     : TSynRSyn;
    synRcomplex   : TSynMultiSyn;
    synRdoc       : TSynMultiSyn;
    synRhtml      : TSynMultiSyn;
    synRmarkdown  : TSynMultiSyn;
    synRnoweb     : TSynMultiSyn;
    synRuby       : TSynRubySyn;
    synSQL        : TSynSQLSyn;
    synST         : TSynSTSyn;
    synTclTk      : TSynTclTkSyn;
    synTeX        : TSynTeXSyn;
    synText       : TSynTextSyn;
    synText_term  : TSynTextSyn;
    synURI        : TSynURISyn;
    synVB         : TSynVBSyn;
    synVBScript   : TSynVBScriptSyn;
    synXML        : TSynXMLSyn;

    procedure pLoadSyntaxFromIni;
  end;

var
  dmSyn: TdmSyn;

const

  aSynMultiSyn: array [0..6] of string = (
                                          'HTML complex',
                                          'PHP complex',
                                          'R complex',
                                          'R doc',
                                          'R html',
                                          'R markdown',
                                          'R noweb'
                                          );

  sSampleHTMLcomplex: string =
    '<!-- HTML complex highlighter sample-->'#13#10 +
    '<html>'#13#10 +
    '  <body>'#13#10 +
    '    <h1>My First Web Page</h1>'#13#10 +
    '    <p id="demo">My First Paragraph.</p>'#13#10 +
    '    <script>'#13#10 +
    '      function myFunction()'#13#10 +
    '      {'#13#10 +
    '      var x="",i=0;'#13#10 +
    '      for (i=0;i<10;i++)'#13#10 +
    '        {'#13#10 +
    '        if (i==3)'#13#10 +
    '          {'#13#10 +
    '          continue;'#13#10 +
    '          }'#13#10 +
    '        x=x + "The number is " + i + "<br>";'#13#10 +
    '        }'#13#10 +
    '      document.getElementById("demo").innerHTML=x;'#13#10 +
    '      }'#13#10 +
    '    </script>'#13#10 +
    '  </body>'#13#10 +
    '</html>';

  sSamplePHPcomplex: string =
    '<!-- PHP complex highlighter sample -->'#13#10 +
    '<html>'#13#10 +
    '  <body>'#13#10 +
    '    <h1>My First Web Page</h1>'#13#10 +
    '    <p id="demo">My First Paragraph.</p>'#13#10 +
    '    <script>'#13#10 +
    '      function myFunction()'#13#10 +
    '      {'#13#10 +
    '      var x="",i=0;'#13#10 +
    '      for (i=0;i<10;i++)'#13#10 +
    '        {'#13#10 +
    '        if (i==3)'#13#10 +
    '          {'#13#10 +
    '          continue;'#13#10 +
    '          }'#13#10 +
    '        x=x + "The number is " + i + "<br>";'#13#10 +
    '        }'#13#10 +
    '      document.getElementById("demo").innerHTML=x;'#13#10 +
    '      }'#13#10 +
    '    </script>'#13#10 +
    '  </body>'#13#10 +
    '  <?php'#13#10 +
    '  # Comment'#13#10 +
    '  // Comment'#13#10 +
    '  /* Comment */'#13#10 +
    ''#13#10 +
    '  include(''code.php'');'#13#10 +
    '  include ''code.php'';'#13#10 +
    '  require(''code.php'');'#13#10 +
    '  require_once(''code.php'');'#13#10 +
    ''#13#10 +
    '  echo ''abc'';'#13#10 +
    '  print ''abc'';'#13#10 +
    '  $res = print ''abc'';'#13#10 +
    ''#13#10 +
    '  $x = 2; # Variables'#13#10 +
    '  if ($x >= 1 && $x < 3) {'#13#10 +
    '    echo ''Hello Word!'';'#13#10 +
    '  } else {'#13#10 +
    '    print(''Good by Word!'');'#13#10 +
    '  }'#13#10 +
    '  ?>'#13#10 +
    '</html>';

  sSampleRcomplex: string =
    '# R complex highlighter sample'#13#10 +
    '<<< joseclaudio.faria@gmail.com >>>'#13#10 +
    '<<< www.uesc.br >>>'#13#10 + #13#10 +
    '#! Note                                     # Note'#13#10 +
    '#!. Note_1                                  # Note_1'#13#10 +
    '#!.. Note_2                                 # Note_2'#13#10 +
    'pB <- 3.5E2                                 # Float number'#13#10 +
    '0 1 2 3 4 5 6 8 9                           # Numbers'#13#10 +
    #13#10 +
    'variable_a = 1:100                          # Identifier'#13#10 +
    'variable.b <- 1:100                         # Identifier'#13#10 +
    #13#10 +
    '+ - * / %*% ^ = <- -> <> ~ $ ? ! & :        # Operator'#13#10 +
    '() {} [] ; ,                                # Symbol'#13#10 +
    #13#10 +
    'NA  NULL  TRUE  T  FALSE  F  if  tryCatch   # Programing'#13#10 +
    #13#10 +
    'mean(Y)  var(Y)  sd(Y)                      # Function'#13#10 +
    'xtfrm.numeric_version                       # Function'#13#10 +
    'as.data.frame.model.matrix                  # Function'#13#10 +
    'as.character.numeric_version                # Function'#13#10 +
    #13#10 +
    'plot(Y ~ X, ylab = ''Y'', xlab = ''X'',         # Plotting'#13#10 +
    '     col = ''blue'', cex = 0.5, pch = ''*'')'#13#10 +
    #13#10 +
    'airquality  iris  Harman74.cor mtcars       # Datasets'#13#10 +
    #13#10 +
    'cat(''\nI - Basics measures:''); cat(''\n\n'')  # String'#13#10 +
    'he''s isn''t we''ve they''d (''all not string'')  # Shorttned forms'#13#10 +
    'string <- "This is" ''a string''              # String';

  sSampleRdoc: string =
    '% R doc highlighter sample'#13#10 +
    '% file MASS/man/caith.Rd'#13#10 +
    '% copyright (C) 1999 W. N. Venables and B. D. Ripley'#13#10 +
    ''#13#10 +
    '\name{caith}'#13#10 +
    '\alias{caith}'#13#10 +
    '\title{'#13#10 +
    '  Colours of Eyes and Hair of People in Caithness'#13#10 +
    '}'#13#10 +
    '\description{'#13#10 +
    '  Data on the cross-classification of people in Caithness, Scotland, by'#13#10 +
    '  eye and hair colour. The region of the UK is particularly interesting'#13#10 +
    '  as there is a mixture of people of Nordic, Celtic and Anglo-Saxon origin.'#13#10 +
    '}'#13#10 +
    '\usage{'#13#10 +
    'caith'#13#10 +
    '}'#13#10 +
    '\format{'#13#10 +
    '  A 4 by 5 table with rows the eye colours (blue, light, medium, dark) and'#13#10 +
    '  columns the hair colours (fair, red, medium, dark, black).'#13#10 +
    '}'#13#10 +
    '\source{'#13#10 +
    '  Fisher, R.A. (1940) The precision of discriminant functions.'#13#10 +
    '  \emph{Annals of Eugenics (London)} \bold{10}, 422--429.'#13#10 +
    '}'#13#10 +
    '\references{'#13#10 +
    '  Venables, W. N. and Ripley, B. D. (2002)'#13#10 +
    '  \emph{Modern Applied Statistics with S.} Fourth edition.  Springer.'#13#10 +
    '}'#13#10 +
    '\examples{'#13#10 +
    'corresp(caith)'#13#10 +
    'dimnames(caith)[[2]] <- c("F", "R", "M", "D", "B")'#13#10 +
    'par(mfcol=c(1,3))'#13#10 +
    'plot(corresp(caith, nf=2)); title("symmetric")'#13#10 +
    'plot(corresp(caith, nf=2), type="rows"); title("rows")'#13#10 +
    'plot(corresp(caith, nf=2), type="col"); title("columns")'#13#10 +
    'par(mfrow=c(1,1))'#13#10 +
    '}'#13#10 +
    '\keyword{datasets}';

  sSampleRHtml: string =
    '<!-- R html highlighter sample -->'#13#10 +
    '<html>'#13#10 +
    ''#13#10 +
    '<head>'#13#10 +
    '<title>Title</title>'#13#10 +
    '</head>'#13#10 +
    ''#13#10 +
    '<p>This is an R html document.</p>'#13#10 +
    ''#13#10 +
    'You can embed an R code chunk like this:'#13#10 +
    '<!--begin.rcode'#13#10 +
    '#! Note                                     # Note'#13#10 +
    '#!. Note_1                                  # Note_1'#13#10 +
    '#!.. Note_2                                 # Note_2'#13#10 +
    'pB <- 3.5E2                                 # Float number'#13#10 +
    '0 1 2 3 4 5 6 8 9                           # Numbers'#13#10 +
    #13#10 +
    'variable_a = 1:100                          # Identifier'#13#10 +
    'variable.b <- 1:100                         # Identifier'#13#10 +
    #13#10 +
    '+ - * / %*% ^ = <- -> <> ~ $ ? ! & :        # Operator'#13#10 +
    '() {} [] ; ,                                # Symbol'#13#10 +
    #13#10 +
    'NA  NULL  TRUE  T  FALSE  F  if  tryCatch   # Programing'#13#10 +
    #13#10 +
    'mean(Y)  var(Y)  sd(Y)                      # Function'#13#10 +
    'xtfrm.numeric_version                       # Function'#13#10 +
    'as.data.frame.model.matrix                  # Function'#13#10 +
    'as.character.numeric_version                # Function'#13#10 +
    #13#10 +
    'plot(Y ~ X, ylab = ''Y'', xlab = ''X'',         # Plotting'#13#10 +
    '     col = ''blue'', cex = 0.5, pch = ''*'')'#13#10 +
    #13#10 +
    'airquality  iris  Harman74.cor mtcars       # Datasets'#13#10 +
    #13#10 +
    'cat(''\nI - Basics measures:''); cat(''\n\n'')  # String'#13#10 +
    'he''s isn''t we''ve they''d (''all not string'')  # Shorttned forms'#13#10 +
    'string <- "This is" ''a string''              # String'#13#10 +
    'end.rcode-->'#13#10 +
    '</body>'#13#10 +
    '</html>'#13#10;

  sSampleRmarkdown: string =
    '<!-- R markdown highlighter sample -->'#13#10 +
    'Title'#13#10 +
    '====='#13#10 +
    '<!--'#13#10 +
    ' This is a markdown comment!'#13#10 +
    '-->'#13#10 +
    'This is an R markdown document.'#13#10 +
    ''#13#10 +
    'You can embed an R code chunk like this:'#13#10 +
    '```{r}'#13#10 +
    '#! Note                                     # Note'#13#10 +
    '#!. Note_1                                  # Note_1'#13#10 +
    '#!.. Note_2                                 # Note_2'#13#10 +
    'pB <- 3.5E2                                 # Float number'#13#10 +
    '0 1 2 3 4 5 6 8 9                           # Numbers'#13#10 +
    #13#10 +
    'variable_a = 1:100                          # Identifier'#13#10 +
    'variable.b <- 1:100                         # Identifier'#13#10 +
    #13#10 +
    '+ - * / %*% ^ = <- -> <> ~ $ ? ! & :        # Operator'#13#10 +
    '() {} [] ; ,                                # Symbol'#13#10 +
    #13#10 +
    'NA  NULL  TRUE  T  FALSE  F  if  tryCatch   # Programing'#13#10 +
    #13#10 +
    'mean(Y)  var(Y)  sd(Y)                      # Function'#13#10 +
    'xtfrm.numeric_version                       # Function'#13#10 +
    'as.data.frame.model.matrix                  # Function'#13#10 +
    'as.character.numeric_version                # Function'#13#10 +
    #13#10 +
    'plot(Y ~ X, ylab = ''Y'', xlab = ''X'',         # Plotting'#13#10 +
    '     col = ''blue'', cex = 0.5, pch = ''*'')'#13#10 +
    #13#10 +
    'airquality  iris  Harman74.cor mtcars       # Datasets'#13#10 +
    #13#10 +
    'cat(''\nI - Basics measures:''); cat(''\n\n'')  # String'#13#10 +
    'he''s isn''t we''ve they''d (''all not string'')  # Shorttned forms'#13#10 +
    'string <- "This is" ''a string''              # String'#13#10 +
    '```'#13#10;

  sSampleRnoweb: string =
    '% R noweb highlighter sample'#13#10 +
    '\documentclass{article}'#13#10 +
    '\usepackage{amsmath}'#13#10 +
    '\usepackage{amscd}'#13#10 +
    '\begin{document}'#13#10 +
    ''#13#10 +
    '\title{An R noweb demo}'#13#10 +
    '\author{J.C. Faria and P. Grosjean}'#13#10 +
    '\maketitle'#13#10 +
    ''#13#10 +
    'This is a demo for using the \verb@R noweb@ command in R.'#13#10 +
    '<<echo=FALSE>>='#13#10 +
    '#! Note                                     # Note'#13#10 +
    '#!. Note_1                                  # Note_1'#13#10 +
    '#!.. Note_2                                 # Note_2'#13#10 +
    'pB <- 3.5E2                                 # Float number'#13#10 +
    '0 1 2 3 4 5 6 8 9                           # Numbers'#13#10 +
    #13#10 +
    'variable_a = 1:100                          # Identifier'#13#10 +
    'variable.b <- 1:100                         # Identifier'#13#10 +
    #13#10 +
    '+ - * / %*% ^ = <- -> <> ~ $ ? ! & :        # Operator'#13#10 +
    '() {} [] ; ,                                # Symbol'#13#10 +
    #13#10 +
    'NA  NULL  TRUE  T  FALSE  F  if  tryCatch   # Programing'#13#10 +
    #13#10 +
    'mean(Y)  var(Y)  sd(Y)                      # Function'#13#10 +
    'xtfrm.numeric_version                       # Function'#13#10 +
    'as.data.frame.model.matrix                  # Function'#13#10 +
    'as.character.numeric_version                # Function'#13#10 +
    #13#10 +
    'plot(Y ~ X, ylab = ''Y'', xlab = ''X'',         # Plotting'#13#10 +
    '     col = ''blue'', cex = 0.5, pch = ''*'')'#13#10 +
    #13#10 +
    'airquality  iris  Harman74.cor mtcars       # Datasets'#13#10 +
    #13#10 +
    'cat(''\nI - Basics measures:''); cat(''\n\n'')  # String'#13#10 +
    'he''s isn''t we''ve they''d (''all not string'')  # Shorttned forms'#13#10 +
    'string <- "This is" ''a string''              # String'#13#10 +
    '@'#13#10 +
    '\end{document}';

  sSampleST: string =
    '// Structured Text highlighter sample'#13#10 +
    'IF tank_on = TRUE THEN'#13#10 +
    '  IF tank_temp < max_temp AND set_point < max_temp THEN'#13#10 +
    '    // The user has enabled the tank so switch on the heater'#13#10 +
    '    // and monitor the temperature'#13#10 +
    '    IF tank_temp > set_point THEN'#13#10 +
    '        // The set point has been reached, notify user via a flag'#13#10 +
    '        // and switch off the heater'#13#10 +
    '        set_pint_reached := TRUE;'#13#10 +
    '        heater_on:= FALSE;'#13#10 +
    '    ELSE'#13#10 +
    '        // Temp may have dropped below set point'#13#10 +
    '        // or it may not have reached it yet. If it had'#13#10 +
    '        // reached it and is falling then switch the heater back on'#13#10 +
    '        // note we do not reset the set point flag'#13#10 +
    '        heater_on:= TRUE;'#13#10 +
    '    END_IF;'#13#10 +
    '    // ALL IS OK SO CLEAR ALARM FLAG'#13#10 +
    '    tank_alarm:= FALSE;'#13#10 +
    '  ELSE'#13#10 +
    '    // either the tank is too hot or the set point is above'#13#10 +
    '    // the max allowed temp, warn user'#13#10 +
    '    tank_alarm:= TRUE;'#13#10 +
    '  END_IF;'#13#10 +
    'END_IF;';

  sSampleFortran: string =
    'C Fortran highlighter sample'#13#10 +
    'C AREA OF A TRIANGLE - HERON''''S FORMULA'#13#10 +
    'C INPUT - CARD READER UNIT 5, INTEGER INPUT'#13#10 +
    'C OUTPUT - LINE PRINTER UNIT 6, REAL OUTPUT'#13#10 +
    'C INPUT ERROR DISPAYS ERROR MESSAGE ON OUTPUT'#13#10 +
    '  501 FORMAT(3I5)'#13#10 +
    '  601 FORMAT(" A= ",I5,"  B= ",I5,"  C= ",I5,"  AREA= ")'#13#10 +
    '  602 FORMAT("NORMAL END")'#13#10 +
    '  603 FORMAT("INPUT ERROR OR ZERO VALUE ERROR")'#13#10 +
    '      INTEGER A,B,C'#13#10 +
    '   10 READ(5,501,END=50,ERR=90) A,B,C'#13#10 +
    '      IF(A=0 .OR. B=0 .OR. C=0) GO TO 90'#13#10 +
    '      S = (A + B + C) / 2.0'#13#10 +
    '      AREA = SQRT( S * (S - A) * (S - B) * (S - C))'#13#10 +
    '      WRITE(6,601) A,B,C,AREA'#13#10 +
    '      GO TO 10'#13#10 +
    '   50 WRITE(6,602)'#13#10 +
    '      STOP'#13#10 +
    '   90 WRITE(6,603)'#13#10 +
    '      STOP'#13#10 +
    '      END';

  sSampleCSS: string =
    '/* Cascading Style Sheets (CSS) highlighter sample */'#13#10 +
    'BODY{ background: white;'#13#10 +
    '      color: black }'#13#10 +
    ''#13#10 +
    'A:link{ background: white;'#13#10 +
    '        color: blue }'#13#10 +
    ''#13#10 +
    'A:visited{ background: white;'#13#10 +
    '           color: rgb(50%, 0%, 50%) }'#13#10 +
    ''#13#10 +
    'H1{ background: white;'#13#10 +
    '    color: rgb(55%, 55%, 55%);'#13#10 +
    '    font-family: monospace;'#13#10 +
    '    font-size: x-large;'#13#10 +
    '    text-align: center }'#13#10 +
    ''#13#10 +
    'H2{ background: white;'#13#10 +
    '    color: rgb(40%, 40%, 40%);'#13#10 +
    '    font-family: monospace;'#13#10 +
    '    font-size: large;'#13#10 +
    '    text-align: center }'#13#10 +
    ''#13#10 +
    'H3{ background: white;'#13#10 +
    '    color: rgb(40%, 40%, 40%);'#13#10 +
    '    font-family: monospace;'#13#10 +
    '    font-size: large }'#13#10 +
    ''#13#10 +
    'H4{ background: white;'#13#10 +
    '    color: rgb(40%, 40%, 40%);'#13#10 +
    '    font-family: monospace;'#13#10 +
    '    font-style: italic;'#13#10 +
    '    font-size: large }'#13#10 +
    ''#13#10 +
    'IMG.toplogo{ vertical-align: middle }'#13#10 +
    ''#13#10 +
    'IMG.arrow{ width: 30px;'#13#10 +
    '           height: 30px;'#13#10 +
    '           border: 0 }'#13#10 +
    ''#13#10 +
    'span.acronym{font-size: small}'#13#10 +
    'span.env{font-family: monospace}'#13#10 +
    'span.file{font-family: monospace}'#13#10 +
    'span.option{font-family: monospace}'#13#10 +
    'span.pkg{font-weight: bold}'#13#10 +
    'span.samp{font-family: monospace}';

  sSampleCSharp: string =
    '// C# highlighter sample'#13#10 +
    '/* Comment */'#13#10 +
    'enum Days {P1, P2, P3};'#13#10 +
    ''#13#10 +
    'public class Stack: IEdit, IEdit2'#13#10 +
    '{'#13#10 +
    '  public delegate int[] DelDemo();'#13#10 +
    '  private Node first = null;'#13#10 +
    '  public bool Empty {'#13#10 +
    '    //property'#13#10 +
    '    get {'#13#10 +
    '      return (first == null);'#13#10 +
    '    }'#13#10 +
    '  }'#13#10 +
    '  public object IEdit.Pop() {'#13#10 +
    '    if (first == null)'#13#10 +
    '      throw new Exception("Can''t Pop from an empty Stack.");'#13#10 +
    '    else {'#13#10 +
    '      object temp = first.Value;'#13#10 +
    '      first = first.Next;'#13#10 +
    '      return temp;'#13#10 +
    '    }'#13#10 +
    '  }'#13#10 +
    ''#13#10 +
    '  static void RegisterFunction(Type reg1; Type2 reg2)'#13#10 +
    '  {'#13#10 +
    '    CategoryRegistration(registerType);'#13#10 +
    '  }'#13#10 +
    ''#13#10 +
    '  [ComUnregisterFunction()]'#13#10 +
    '  [ComVisible(false)]'#13#10 +
    '  static void UnregisterFunction(Type reg1; Type[] regs; Type2 reg2)'#13#10 +
    '  {'#13#10 +
    '    CategoryUnregistration(registerType);'#13#10 +
    '  }'#13#10 +
    '}';

  sSampleUnknowed: string =
    'Sorry,'#13#10 +
    'was not possible to find a sample'#13#10 +
    'for this highlighter!'#13#10 +
    ''#13#10 +
    'Please, see the proper sample in the main editor.';

implementation

uses ufrmMain;

{$R *.DFM}

procedure TdmSyn.DataModuleCreate(Sender: TObject);
begin
(*----------------------------------------------------------------------------------
  The instances of the class below can be declared and created in any order due to

  slFilters:= TStringList.Create;
  with slFilters do begin
    LineBreak:= '|';
    Sorted:= True;
  end;

  inside of TfrmMain.FormCreate
----------------------------------------------------------------------------------*)

  synAll        := TSynAllSyn.Create(Self);
  synAsm        := TSynAsmSyn.Create(Self);
  synBat        := TSynBatSyn.Create(Self);
  synCpp        := TSynCppSyn.Create(Self);
  synCS         := TSynCSSyn.Create(Self);
  synCss        := TSynCssSyn.Create(Self);
  synFortran    := TSynFortranSyn.Create(Self);
  synHaskell    := TSynHaskellSyn.Create(Self);
  synHTML       := TSynHTMLSyn.Create(Self);
  synHTMLcomplex:= TSynMultiSyn.Create(Self);
  synIni        := TSynIniSyn.Create(Self);
  synJava       := TSynJavaSyn.Create(Self);
  synJScript    := TSynJScriptSyn.Create(Self);
  synPas        := TSynPasSyn.Create(Self);
  synPerl       := TSynPerlSyn.Create(Self);
  synPHP        := TSynPHPSyn.Create(Self);
  synPHPcomplex := TSynMultiSyn.Create(Self);
  synPython     := TSynPythonSyn.Create(Self);
  synR          := TSynRSyn.Create(Self);
  synR.SetType();
  synR_term     := TSynRSyn.Create(Self);
  synR_term.SetType(False);
  synRcomplex   := TSynMultiSyn.Create(Self);
  synRdoc       := TSynMultiSyn.Create(Self);
  synRhtml      := TSynMultiSyn.Create(Self);
  synRmarkdown  := TSynMultiSyn.Create(Self);
  synRnoweb     := TSynMultiSyn.Create(Self);
  synRuby       := TSynRubySyn.Create(Self);
  synSQL        := TSynSQLSyn.Create(Self);
  synST         := TSynSTSyn.Create(Self);
  synTclTk      := TSynTclTkSyn.Create(Self);
  synTeX        := TSynTeXSyn.Create(Self);
  synText       := TSynTextSyn.Create(Self);
  synText.SetType();
  synText_term  := TSynTextSyn.Create(Self);
  synText_term.SetType(False);
  synURI        := TSynURISyn.Create(Self);
  synVB         := TSynVBSyn.Create(Self);
  synVBScript   := TSynVBScriptSyn.Create(Self);
  synXML        := TSynXMLSyn.Create(Self);

  //---------------------------------------------------------------
  // Begin MultiHighlighters
  //---------------------------------------------------------------
  // HTML complex
  with SynHTMLcomplex do begin
    DefaultLanguageName:= 'HTML complex';
    DefaultFilter      := 'HTML complex (*.html; *.htm)|*.html; *.htm';
    DefaultHighlighter := synHTML;
    with Schemes do begin
      Add.Index:= 0;
      with Items[0] do begin
        Highlighter:= synJScript;
        SchemeName := 'JavaScript';
        StartExpr  := '<script';
        EndExpr    := '</script>';
        with MarkerAttri do
          Background:= clNone;
      end;
    end;
  end;

  // PHP complex
  with SynPHPcomplex do begin
    DefaultLanguageName:= 'PHP complex';
    DefaultFilter      := 'PHP complex (*.php; *.php3; *.phtml; *.inc)|*.php; *.php3; *.phtml; *.inc';
    DefaultHighlighter := synHTML;
    with Schemes do begin
      Add.Index:= 0;
      with Items[0] do begin
        Highlighter:= synPHP;
        SchemeName := 'PHP';
        StartExpr  := '<\?';
        EndExpr    := '\?>';
        with MarkerAttri do
          Background:= clNone;
      end;
      Add.Index:= 1;
      with Items[1] do begin
        Highlighter:= synJScript;
        SchemeName := 'JavaScript';
        StartExpr  := '<script';
        EndExpr    := '</script>';
        with MarkerAttri do
          Background:= clNone;
      end;
    end;
  end;

  // R complex
  with SynRcomplex do begin
    DefaultLanguageName:= 'R complex';
    DefaultFilter      := 'R complex (*.R; *.r; *.Rhistory; *.q; *.s; *.ssc)|*.R; *.r; *.Rhistory; *.q; *.s; *.ssc';
    DefaultHighlighter := synR;
    with Schemes do begin
      Add.Index:= 0;
      with Items[0] do begin
        Highlighter:= synURI;
        SchemeName := 'URI';
        StartExpr  := '<<<';
        EndExpr    := '>>>';
        with MarkerAttri do
          Background:= clNone;
      end;
    end;
  end;

  // R doc
  with SynRdoc do begin
    DefaultLanguageName:= 'R doc';
    DefaultFilter      := 'R doc (*.Rd)|*.Rd';
    DefaultHighlighter := synTex;
    with Schemes do begin
      Add.Index:= 0;
      with Items[0] do begin
        Highlighter:= synR;
        SchemeName := 'R';
        StartExpr  := 'examples{';
        EndExpr    := 'keyword{';
        with MarkerAttri do
          Background:= clNone;
      end;
    end;
  end;

  // R html
  with synRhtml do begin
    DefaultLanguageName:= 'R html';
    DefaultFilter      := 'R html (*.Rhtml)|*.Rhtml';
    DefaultHighlighter := synHTML;
    with Schemes do begin
      Add.Index:= 0;
      with Items[0] do begin
        Highlighter:= synR;
        SchemeName := 'R';
        StartExpr  := '<!--begin.rcode';
        EndExpr    := 'end.rcode-->';
        with MarkerAttri do
          Background:= clNone;
      end;
    end;
  end;

  // R markdown
  with synRmarkdown do begin
    DefaultLanguageName:= 'R markdown';
    DefaultFilter      := 'R markdown (*.Rmd)|*.Rmd';
    DefaultHighlighter := synURI;
    with Schemes do begin
      Add.Index:= 0;
      with Items[0] do begin
        Highlighter:= synR;
        SchemeName := 'R';
        StartExpr  := '```{';
        EndExpr    := '```';
        with MarkerAttri do
          Background:= clNone;
      end;
    end;
  end;

  // R noweb
  with synRnoweb do begin
    DefaultLanguageName:= 'R noweb';
    DefaultFilter      := 'R noweb (*.Rnw; *.rnw; *.Snw; *.snw)|*.Rnw; *.rnw; *.Snw; *.snw';
    DefaultHighlighter := synTex;
    with Schemes do begin
      Add.Index:= 0;
      with Items[0] do begin
        Highlighter:= synR;
        SchemeName := 'R';
        StartExpr  := '>>=';
        EndExpr    := '@';
        with MarkerAttri do
          Background:= clNone;
      end;
    end;
  end;
  //---------------------------------------------------------------
  // End MultiHighlighters
  //---------------------------------------------------------------

  iHigCount:= ComponentCount;
  pLoadSyntaxFromIni;
end;

procedure TdmSyn.pLoadSyntaxFromIni;
var
  i: integer;

  sSyntax: string;

begin
  // Load all colors from ini
  for i:= 0 to (iHigCount - 1) do begin
    sSyntax:= (Components[i] as TSynCustomHighlighter).GetFriendlyLanguageName;
    if (sSyntax = 'General_Multi-Highlighter') then begin
      sSyntax:= (Components[i] as TSynMultiSyn).DefaultLanguageName;
      (Components[i] as TSynMultiSyn).LoadFromFile(frmMain.sPath_Syntax +
                                                   '\' +
                                                   sSyntax +
                                                   '.ini');
    end
    else
    if (sSyntax = 'C/C++') then
      (Components[i] as TSynCustomHighlighter).LoadFromFile(frmMain.sPath_Syntax +
                                                            '\C++.ini')
    else if (sSyntax = 'R term') then
      (Components[i] as TSynCustomHighlighter).LoadFromFile(frmMain.sPath_Syntax +
                                                            '\R.ini')
    else if (sSyntax = 'Text term') then
      (Components[i] as TSynCustomHighlighter).LoadFromFile(frmMain.sPath_Syntax +
                                                            '\Text.ini')
    else
      (Components[i] as TSynCustomHighlighter).LoadFromFile(frmMain.sPath_Syntax +
                                                            '\' +
                                                            sSyntax +
                                                            '.ini')
  end;
end;

end.
