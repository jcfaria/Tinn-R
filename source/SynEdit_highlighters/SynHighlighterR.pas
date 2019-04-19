{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: SynHighlighterPython.pas, released 2000-06-23.
The Original Code is based on the odPySyn.pas file from the
mwEdit component suite by Martin Waldenburg and other developers, the Initial
Author of this file is Olivier Deckmyn.
Portions created by M.Utku Karatas and Dennis Chuah.
Unicode translation by Maël Hörz.
Adapted to R language by José Cláudio Faria (Tinn-R Team)

All Rights Reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynHighlighterPython.pas, v 1.18.2.7 2008/09/14 16:25:02 maelh Exp $
$Id: SynHighlighterR.pas, v 1.19.0.0 2016/06/05 00:36:00 J.C.Faria $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}
{
@abstract(A Python language highlighter for SynEdit)
@author(Olivier Deckmyn, converted to SynEdit by David Muir <dhmn@dmsoftware.co.uk>)
@created(unknown, converted to SynEdit on 2000-06-23)
The SynHighlighterPython implements a highlighter for Python for the SynEdit projects.
@lastmod(2013-08-19)
The SynHighlighterR implements a highlighter for R for the SynEdit projects.
}

{$IFNDEF QSYNHIGHLIGHTERR}
unit SynHighlighterR;
{$ENDIF}

{$I SynEdit.inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynEditHighlighter,
  QSynEditTypes,
  QSynUnicode,
{$ELSE}
  Graphics,
  SynEditHighlighter,
  SynEditTypes,
  SynUnicode,
{$ENDIF}
  SysUtils,
  Classes;

type
  TtkTokenKind = (
                  tkComment,
                  tkNote,
                  tkNote_1,
                  tkNote_2,
                  tkDatasets,
                  tkFloat,
                  tkFunctions,
                  tkHex,
                  tkIdentifier,
                  tkNull,
                  tkNumber,
                  tkOct,
                  tkOperator,
                  tkPlotting,
                  tkPrograming,
                  tkSpace,
                  tkString,
                  tkSymbol,
                  tkUnknown
                 );

  TRangeState = (
                 rsANil,
                 rsComment,
                 rsMultilineString,
                 rsUnKnown
                );

type
  TSynRSyn = class(TSynCustomHighLighter)

  private
    fCommentAttri: TSynHighlighterAttributes;
    fNoteAttri: TSynHighlighterAttributes;
    fNote_1Attri: TSynHighlighterAttributes;
    fNote_2Attri: TSynHighlighterAttributes;
    fDatasetsAttri: TSynHighlighterAttributes;
    fFloatAttri: TSynHighlighterAttributes;
    fFunctionsAttri: TSynHighlighterAttributes;
    fHexAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    FKeywords: TUnicodeStringList;
    fNumberAttri: TSynHighlighterAttributes;
    fOctalAttri: TSynHighlighterAttributes;
    fOperatorAttri: TSynHighlighterAttributes;
    fPlottingAttri: TSynHighlighterAttributes;
    fProgramingAttri: TSynHighlighterAttributes;
    fRange: TRangeState;
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fStringStarter: WideChar;  // used only for rsMultilineString stuff
    fSymbolAttri: TSynHighlighterAttributes;
    FTokenID: TtkTokenKind;

    function IdentKind(MayBe: PWideChar): TtkTokenKind;
    procedure CommentProc;
    procedure CRProc;
    procedure IdentProc;
    procedure LFProc;
    procedure NullProc;
    procedure NumberProc;
    procedure OperatorProc;
    procedure SpaceProc;
    procedure String34Proc;
    procedure String39Proc;
    procedure StringEndProc(EndChar: WideChar);
    procedure SymbolProc;
    procedure UnknownProc;

  protected
    function GetKeywordIdentifiers: TUnicodeStringList;
    function GetSampleSource: UnicodeString; override;
    function IsFilterStored: Boolean; override;

    property Keywords: TUnicodeStringList read FKeywords;
    property TokenID: TtkTokenKind read FTokenID;

  public
    class function GetFriendlyLanguageName: UnicodeString; override;
    class function GetLanguageName: string; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetRange: Pointer; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenKind: integer; override;
    function IsIdentChar(AChar: WideChar): Boolean; override;

    procedure Next; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;

  published
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri write fCommentAttri;
    property NoteAttri: TSynHighlighterAttributes read fNoteAttri write fNoteAttri;
    property Note_1Attri: TSynHighlighterAttributes read fNote_1Attri write fNote_1Attri;
    property Note_2Attri: TSynHighlighterAttributes read fNote_2Attri write fNote_2Attri;
    property DatasetsAttri: TSynHighlighterAttributes read fDatasetsAttri write fDatasetsAttri;
    property FloatAttri: TSynHighlighterAttributes read fFloatAttri write fFloatAttri;
    property FunctionsAttri: TSynHighlighterAttributes read fFunctionsAttri write fFunctionsAttri;
    property HexAttri: TSynHighlighterAttributes read fHexAttri write fHexAttri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property NumberAttri: TSynHighlighterAttributes read fNumberAttri write fNumberAttri;
    property OctalAttri: TSynHighlighterAttributes read fOctalAttri write fOctalAttri;
    property OperatorAttri: TSynHighlighterAttributes read fOperatorAttri write fOperatorAttri;
    property PlottingAttri: TSynHighlighterAttributes read fPlottingAttri write fPlottingAttri;
    property ProgramingAttri: TSynHighlighterAttributes read fProgramingAttri 	                                                write fProgramingAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property SymbolAttri: TSynHighlighterAttributes read fSymbolAttri write fSymbolAttri;
  end;

implementation

uses
{$IFDEF SYN_CLX}
  QSynEditStrConst;
{$ELSE}
  SynEditStrConst;
{$ENDIF}

var
  GlobalKeywords: TUnicodeStringList;

function TSynRSyn.IsIdentChar(AChar: WideChar): Boolean;
begin
  case AChar of
    'A'..'Z', 'a'..'z', '_', '0'..'9', 'À'..'Ö', 'Ø'..'ö', 'ø'..'ÿ':
      Result := True;
    else
      Result := False;
  end;
end;

function TSynRSyn.GetKeywordIdentifiers: TUnicodeStringList;
const
  // No need to localise keywords!

 (*
  The keywords is related only to the R packages below:
    1 - stats
    2 - graphics
    3 - grDevices
    4 - datasets
    5 - svSocket
    6 - utils
    7 - methods
    8 - base

  The keywords below are special cases (duplicated differing only in case):
    ----------------------------------------------
    Not Contemplated           Contemplated
    ----------------------------------------------
    as.POSIXct.Date            as.POSIXct.date
    as.POSIXlt.Date            as.POSIXlt.date
    Axis                       axis
    C                          c
    co2                        CO2
    Complex                    complex
    Encoding                   encoding
    Filter                     filter
    Find                       find
    Gamma                      gamma
    LETTERS                    letters
    NCOL                       ncol
    NROW                       nrow
    Quote                      quote
    R.Version                  R.version
    Summary                    summary
    Summary.data.frame         summary.data.frame
    Summary.Date               summary.Date
    Summary.factor             summary.factor
    Summary.POSIXct            summary.POSIXct
    Summary.POSIXlt            summary.POSIXlt
    t                          T
    X11                        x11
    ----------------------------------------------
 *)

  // List of keywords: Programing
  Programing_Count = 33;
  Programing: array [1..Programing_Count] of UnicodeString =
    (
    'break',
    'class',
    'do',
    'done',
    'else',
    'F',
    'FALSE',
    'for',
    'function',
    'if',
    'ifelse',
    'in',
    'Inf',
    'inherits',
    'NA',
    'NaN',
    'next',
    'NULL',
    'repeat',
    'return',
    'stop',
    'stopifnot',
    'switch',
    'T',
    'then',
    'TRUE',
    'try',
    'tryCatch',
    'tryNew',
    'unclass',
    'warning',
    'warnings',
    'while'
    );

  // List of keywords: Functions
  Functions_Count = 2144;
  Functions: array [1..Functions_Count] of UnicodeString =
    (
    'abline',
    'abs',
    'acf',
    'acf2AR',
    'acos',
    'acosh',
    'add.scope',
    'add1',
    'addmargins',
    'addNA',
    'addNextMethod',
    'addTaskCallback',
    'adist',
    'adjustcolor',
    'aggregate',
    'aggregate.data.frame',
    'aggregate.default',
    'aggregate.ts',
    'agrep',
    'AIC',
    'alarm',
    'alias',
    'alist',
    'all',
    'all.equal',
    'all.equal.character',
    'all.equal.default',
    'all.equal.factor',
    'all.equal.formula',
    'all.equal.language',
    'all.equal.list',
    'all.equal.numeric',
    'all.equal.POSIXct',
    'all.equal.raw',
    'all.names',
    'all.vars',
    'allGenerics',
    'allNames',
    'anova',
    'anova.glm',
    'anova.glmlist',
    'anova.lm',
    'anova.lmlist',
    'anova.mlm',
    'ansari.test',
    'any',
    'anyDuplicated',
    'anyDuplicated.array',
    'anyDuplicated.data.frame',
    'anyDuplicated.default',
    'anyDuplicated.matrix',
    'aov',
    'aperm',
    'aperm.default',
    'aperm.table',
    'append',
    'apply',
    'approx',
    'approxfun',
    'apropos',
    'ar',
    'ar.burg',
    'ar.mle',
    'ar.ols',
    'ar.yw',
    'aregexec',
    'Arg',
    'args',
    'argsAnywhere',
    'arima',
    'arima.sim',
    'arima0',
    'arima0.diag',
    'Arith',
    'ARMAacf',
    'ARMAtoMA',
    'arrangeWindows',
    'array',
    'arrayInd',
    'arrows',
    'as',
    'as.array',
    'as.array.default',
    'as.call',
    'as.character',
    'as.character.condition',
    'as.character.Date',
    'as.character.default',
    'as.character.error',
    'as.character.factor',
    'as.character.hexmode',
    'as.character.numeric_version',
    'as.character.octmode',
    'as.character.POSIXt',
    'as.character.srcref',
    'as.complex',
    'as.data.frame',
    'as.data.frame.array',
    'as.data.frame.AsIs',
    'as.data.frame.character',
    'as.data.frame.complex',
    'as.data.frame.data.frame',
    'as.data.frame.Date',
    'as.data.frame.default',
    'as.data.frame.difftime',
    'as.data.frame.factor',
    'as.data.frame.integer',
    'as.data.frame.list',
    'as.data.frame.logical',
    'as.data.frame.matrix',
    'as.data.frame.model.matrix',
    'as.data.frame.numeric',
    'as.data.frame.numeric_version',
    'as.data.frame.ordered',
    'as.data.frame.POSIXct',
    'as.data.frame.POSIXlt',
    'as.data.frame.raw',
    'as.data.frame.table',
    'as.data.frame.ts',
    'as.data.frame.vector',
    'as.Date',
    'as.Date.character',
    'as.Date.date',
    'as.Date.dates',
    'as.Date.default',
    'as.Date.factor',
    'as.Date.numeric',
    'as.Date.POSIXct',
    'as.Date.POSIXlt',
    'as.dendrogram',
    'as.difftime',
    'as.dist',
    'as.double',
    'as.double.difftime',
    'as.double.POSIXlt',
    'as.environment',
    'as.expression',
    'as.expression.default',
    'as.factor',
    'as.formula',
    'as.function',
    'as.function.default',
    'as.graphicsAnnot',
    'as.hclust',
    'as.hexmode',
    'as.integer',
    'as.list',
    'as.list.data.frame',
    'as.list.Date',
    'as.list.default',
    'as.list.environment',
    'as.list.factor',
    'as.list.function',
    'as.list.numeric_version',
    'as.list.POSIXct',
    'as.logical',
    'as.logical.factor',
    'as.matrix',
    'as.matrix.data.frame',
    'as.matrix.default',
    'as.matrix.noquote',
    'as.matrix.POSIXlt',
    'as.name',
    'as.null',
    'as.null.default',
    'as.numeric',
    'as.numeric_version',
    'as.octmode',
    'as.ordered',
    'as.package_version',
    'as.pairlist',
    'as.person',
    'as.personList',
    'as.POSIXct',
    'as.POSIXct.date',
    'as.POSIXct.dates',
    'as.POSIXct.default',
    'as.POSIXct.numeric',
    'as.POSIXct.POSIXlt',
    'as.POSIXlt',
    'as.POSIXlt.character',
    'as.POSIXlt.date',
    'as.POSIXlt.dates',
    'as.POSIXlt.default',
    'as.POSIXlt.factor',
    'as.POSIXlt.numeric',
    'as.POSIXlt.POSIXct',
    'as.qr',
    'as.raster',
    'as.raw',
    'as.relistable',
    'as.roman',
    'as.single',
    'as.single.default',
    'as.stepfun',
    'as.symbol',
    'as.table',
    'as.table.default',
    'as.ts',
    'as.vector',
    'as.vector.factor',
    'asin',
    'asinh',
    'asMethodDefinition',
    'asNamespace',
    'asOneSidedFormula',
    'aspell',
    'aspell_package_C_files',
    'aspell_package_R_files',
    'aspell_package_Rd_files',
    'aspell_package_vignettes',
    'aspell_write_personal_dictionary_file',
    'asS3',
    'asS4',
    'assign',
    'assignClassDef',
    'assignInMyNamespace',
    'assignInNamespace',
    'assignMethodsMetaData',
    'assocplot',
    'atan',
    'atan2',
    'atanh',
    'attach',
    'attachNamespace',
    'attr',
    'attr.all.equal',
    'attributes',
    'autoload',
    'autoloader',
    'available.packages',
    'ave',
    'axis',
    'axis.Date',
    'axis.POSIXct',
    'axisTicks',
    'axTicks',
    'backsolve',
    'balanceMethodsList',
    'bandwidth.kernel',
    'barplot',
    'barplot.default',
    'bartlett.test',
    'baseenv',
    'basename',
    'besselI',
    'besselJ',
    'besselK',
    'besselY',
    'beta',
    'bibentry',
    'BIC',
    'bindingIsActive',
    'bindingIsLocked',
    'bindtextdomain',
    'binom.test',
    'binomial',
    'biplot',
    'bitmap',
    'bitwAnd',
    'bitwNot',
    'bitwOr',
    'bitwShiftL',
    'bitwShiftR',
    'bitwXor',
    'blues9',
    'bmp',
    'body',
    'box',
    'Box.test',
    'boxplot',
    'boxplot.default',
    'boxplot.matrix',
    'boxplot.stats',
    'bquote',
    'bringToTop',
    'browseEnv',
    'browser',
    'browserCondition',
    'browserSetDebug',
    'browserText',
    'browseURL',
    'browseVignettes',
    'bug.report',
    'builtins',
    'bw.bcv',
    'bw.nrd',
    'bw.nrd0',
    'bw.SJ',
    'bw.ucv',
    'bxp',
    'by',
    'by.data.frame',
    'by.default',
    'bzfile',
    'c',
    'c.Date',
    'c.noquote',
    'c.numeric_version',
    'c.POSIXct',
    'c.POSIXlt',
    'cacheGenericsMetaData',
    'cacheMetaData',
    'cacheMethod',
    'cairo_pdf',
    'cairo_ps',
    'call',
    'callCC',
    'callGeneric',
    'callNextMethod',
    'canCoerce',
    'cancor',
    'capabilities',
    'capture.output',
    'case.names',
    'casefold',
    'cat',
    'cbind',
    'cbind.data.frame',
    'cbind2',
    'ccf',
    'cdplot',
    'ceiling',
    'char.expand',
    'character',
    'charmatch',
    'charToRaw',
    'chartr',
    'check.options',
    'check_tzones',
    'checkAtAssignment',
    'checkCRAN',
    'checkSlotAssignment',
    'chisq.test',
    'chol',
    'chol.default',
    'chol2inv',
    'choose',
    'choose.dir',
    'choose.files',
    'chooseBioCmirror',
    'chooseCRANmirror',
    'chull',
    'CIDFont',
    'citation',
    'cite',
    'citeNatbib',
    'citEntry',
    'citFooter',
    'citHeader',
    'classesToAM',
    'classLabel',
    'classMetaName',
    'className',
    'clearPushBack',
    'clip',
    'close',
    'close.connection',
    'close.screen',
    'close.socket',
    'close.srcfile',
    'close.srcfilealias',
    'closeAllConnections',
    'closeSocketClients',
    'cm',
    'cm.colors',
    'cmdscale',
    'co.intervals',
    'coef',
    'coefficients',
    'coerce',
    'col2rgb',
    'colMeans',
    'colnames',
    'colorConverter',
    'colorRamp',
    'colorRampPalette',
    'colors',
    'colorspaces',
    'colours',
    'colSums',
    'combn',
    'commandArgs',
    'comment',
    'Compare',
    'compareVersion',
    'complete.cases',
    'completeClassDefinition',
    'completeExtends',
    'completeSubclasses',
    'complex',
    'computeRestarts',
    'conditionCall',
    'conditionCall.condition',
    'conditionMessage',
    'conditionMessage.condition',
    'confint',
    'confint.default',
    'conflicts',
    'conformMethod',
    'Conj',
    'constrOptim',
    'contour',
    'contour.default',
    'contourLines',
    'contr.helmert',
    'contr.poly',
    'contr.SAS',
    'contr.sum',
    'contr.treatment',
    'contrasts',
    'contrib.url',
    'contributors',
    'convertColor',
    'convolve',
    'cooks.distance',
    'cophenetic',
    'coplot',
    'cor',
    'cor.test',
    'cos',
    'cosh',
    'count.fields',
    'cov',
    'cov.wt',
    'cov2cor',
    'covratio',
    'cpgram',
    'CRAN.packages',
    'create.post',
    'crossprod',
    'Cstack_info',
    'cummax',
    'cummin',
    'cumprod',
    'cumsum',
    'curve',
    'cut',
    'cut.Date',
    'cut.default',
    'cut.POSIXt',
    'cutree',
    'cycle',
    'D',
    'data',
    'data.class',
    'data.entry',
    'data.frame',
    'data.matrix',
    'dataentry',
    'date',
    'dbeta',
    'dbinom',
    'dcauchy',
    'dchisq',
    'de',
    'de.ncols',
    'de.restore',
    'de.setup',
    'debug',
    'debugger',
    'debugonce',
    'decompose',
    'default.stringsAsFactors',
    'defaultDumpName',
    'defaultPrototype',
    'delayedAssign',
    'delete.response',
    'deltat',
    'demo',
    'dendrapply',
    'densCols',
    'density',
    'density.default',
    'deparse',
    'deriv',
    'deriv.default',
    'deriv.formula',
    'deriv3',
    'deriv3.default',
    'deriv3.formula',
    'det',
    'detach',
    'determinant',
    'determinant.matrix',
    'dev.capabilities',
    'dev.capture',
    'dev.control',
    'dev.copy',
    'dev.copy2eps',
    'dev.copy2pdf',
    'dev.cur',
    'dev.flush',
    'dev.hold',
    'dev.interactive',
    'dev.list',
    'dev.new',
    'dev.next',
    'dev.off',
    'dev.prev',
    'dev.print',
    'dev.set',
    'dev.size',
    'dev2bitmap',
    'devAskNewPage',
    'deviance',
    'deviceIsInteractive',
    'dexp',
    'df',
    'df.kernel',
    'df.residual',
    'dfbeta',
    'dfbetas',
    'dffits',
    'dgamma',
    'dgeom',
    'dget',
    'dhyper',
    'diag',
    'diff',
    'diff.Date',
    'diff.default',
    'diff.POSIXt',
    'diff.ts',
    'diffinv',
    'difftime',
    'digamma',
    'dim',
    'dim.data.frame',
    'dimnames',
    'dimnames.data.frame',
    'dir',
    'dir.create',
    'dirname',
    'dist',
    'DLL.version',
    'dlnorm',
    'dlogis',
    'dmultinom',
    'dnbinom',
    'dnorm',
    'do.call',
    'doPrimitiveMethod',
    'dotchart',
    'double',
    'download.file',
    'download.packages',
    'dpois',
    'dput',
    'dQuote',
    'drop',
    'drop.scope',
    'drop.terms',
    'drop1',
    'droplevels',
    'droplevels.data.frame',
    'droplevels.factor',
    'dsignrank',
    'dt',
    'dummy.coef',
    'dump',
    'dump.frames',
    'dumpMethod',
    'dumpMethods',
    'dunif',
    'duplicated',
    'duplicated.array',
    'duplicated.data.frame',
    'duplicated.default',
    'duplicated.matrix',
    'duplicated.numeric_version',
    'duplicated.POSIXlt',
    'dweibull',
    'dwilcox',
    'dyn.load',
    'dyn.unload',
    'eapply',
    'ecdf',
    'edit',
    'eff.aovlist',
    'effects',
    'eigen',
    'el',
    'elNamed',
    'emacs',
    'embed',
    'embedFonts',
    'empty.dump',
    'emptyenv',
    'emptyMethodsList',
    'enc2native',
    'enc2utf8',
    'encodeString',
    'end',
    'enquote',
    'env.profile',
    'environment',
    'environmentIsLocked',
    'environmentName',
    'erase.screen',
    'estVar',
    'eval',
    'eval.parent',
    'evalOnLoad',
    'evalq',
    'evalqOnLoad',
    'evalServer',
    'evalSource',
    'example',
    'exists',
    'existsFunction',
    'existsMethod',
    'exp',
    'expand.grid',
    'expand.model.frame',
    'expm1',
    'expression',
    'extendrange',
    'extends',
    'extractAIC',
    'factanal',
    'factor',
    'factor.scope',
    'factorial',
    'family',
    'fft',
    'fifo',
    'file',
    'file.access',
    'file.append',
    'file.choose',
    'file.copy',
    'file.create',
    'file.edit',
    'file.exists',
    'file.info',
    'file.link',
    'file.path',
    'file.remove',
    'file.rename',
    'file.show',
    'file.symlink',
    'file_test',
    'filled.contour',
    'filter',
    'Filters',
    'finalDefaultMethod',
    'find',
    'find.package',
    'findClass',
    'findFunction',
    'findInterval',
    'findLineNum',
    'findMethod',
    'findMethods',
    'findMethodSignatures',
    'findPackageEnv',
    'findRestart',
    'findUnique',
    'fisher.test',
    'fitted',
    'fitted.values',
    'fivenum',
    'fix',
    'fixInNamespace',
    'fixPre1.8',
    'fligner.test',
    'floor',
    'flush',
    'flush.connection',
    'flush.console',
    'force',
    'formalArgs',
    'formals',
    'format',
    'format.AsIs',
    'format.data.frame',
    'format.Date',
    'format.default',
    'format.difftime',
    'format.factor',
    'format.hexmode',
    'format.info',
    'format.libraryIQR',
    'format.numeric_version',
    'format.octmode',
    'format.packageInfo',
    'format.POSIXct',
    'format.POSIXlt',
    'format.pval',
    'format.summaryDefault',
    'formatC',
    'formatDL',
    'formatOL',
    'formatUL',
    'formula',
    'forwardsolve',
    'fourfoldplot',
    'frame',
    'frequency',
    'friedman.test',
    'ftable',
    'functionBody',
    'gamma',
    'gaussian',
    'gc',
    'gc.time',
    'gcinfo',
    'gctorture',
    'gctorture2',
    'generic.skeleton',
    'get',
    'get_all_vars',
    'getAccess',
    'getAllConnections',
    'getAllMethods',
    'getAllSuperClasses',
    'getAnywhere',
    'getCall',
    'getCallingDLL',
    'getCallingDLLe',
    'getClass',
    'getClassDef',
    'getClasses',
    'getClassName',
    'getClassPackage',
    'getClipboardFormats',
    'getConnection',
    'getCRANmirrors',
    'getDataPart',
    'getDLLRegisteredRoutines',
    'getDLLRegisteredRoutines.character',
    'getDLLRegisteredRoutines.DLLInfo',
    'getElement',
    'geterrmessage',
    'getExportedValue',
    'getExtends',
    'getFromNamespace',
    'getFunction',
    'getGeneric',
    'getGenerics',
    'getGraphicsEvent',
    'getGraphicsEventEnv',
    'getGroup',
    'getGroupMembers',
    'getHook',
    'getIdentification',
    'getInitial',
    'getLoadActions',
    'getLoadedDLLs',
    'getMethod',
    'getMethods',
    'getMethodsForDispatch',
    'getMethodsMetaData',
    'getNamespace',
    'getNamespaceExports',
    'getNamespaceImports',
    'getNamespaceInfo',
    'getNamespaceName',
    'getNamespaceUsers',
    'getNamespaceVersion',
    'getNativeSymbolInfo',
    'getOption',
    'getPackageName',
    'getParseData',
    'getParseText',
    'getProperties',
    'getPrototype',
    'getRefClass',
    'getRversion',
    'getS3method',
    'getSlots',
    'getSocketClients',
    'getSocketClientsNames',
    'getSocketServerName',
    'getSocketServers',
    'getSrcDirectory',
    'getSrcFilename',
    'getSrcLines',
    'getSrcLocation',
    'getSrcref',
    'getSubclasses',
    'getTaskCallbackNames',
    'gettext',
    'gettextf',
    'getTxtProgressBar',
    'getValidity',
    'getVirtual',
    'getwd',
    'getWindowsHandle',
    'getWindowsHandles',
    'getWindowTitle',
    'getWinProgressBar',
    'gl',
    'glm',
    'glm.control',
    'glm.fit',
    'glob2rx',
    'globalenv',
    'globalVariables',
    'graphics.off',
    'gray',
    'gray.colors',
    'grconvertX',
    'grconvertY',
    'gregexpr',
    'grep',
    'grepl',
    'grepRaw',
    'grey',
    'grey.colors',
    'grid',
    'gsub',
    'gzcon',
    'gzfile',
    'hasArg',
    'hasLoadAction',
    'hasMethod',
    'hasMethods',
    'hasTsp',
    'hat',
    'hatvalues',
    'hatvalues.lm',
    'hcl',
    'hclust',
    'head',
    'head.matrix',
    'heat.colors',
    'heatmap',
    'help',
    'help.request',
    'help.search',
    'help.start',
    'Hershey',
    'hist',
    'hist.default',
    'history',
    'HoltWinters',
    'hsv',
    'I',
    'iconv',
    'iconvlist',
    'icuSetCollate',
    'identical',
    'identity',
    'Im',
    'image',
    'image.default',
    'implicitGeneric',
    'importIntoEnv',
    'influence',
    'influence.measures',
    'inheritedSlotNames',
    'initFieldArgs',
    'initialize',
    'initRefFields',
    'insertClassMethods',
    'insertMethod',
    'insertSource',
    'install.packages',
    'installed',
    'installed.packages',
    'integer',
    'integrate',
    'interaction',
    'interaction.plot',
    'interactive',
    'intersect',
    'intToBits',
    'intToUtf8',
    'inverse.gaussian',
    'inverse.rle',
    'invisible',
    'invokeRestart',
    'invokeRestartInteractively',
    'IQR',
    'is',
    'is.array',
    'is.atomic',
    'is.call',
    'is.character',
    'is.complex',
    'is.data.frame',
    'is.double',
    'is.element',
    'is.empty.model',
    'is.environment',
    'is.expression',
    'is.factor',
    'is.finite',
    'is.function',
    'is.infinite',
    'is.integer',
    'is.language',
    'is.leaf',
    'is.list',
    'is.loaded',
    'is.logical',
    'is.matrix',
    'is.mts',
    'is.na',
    'is.na.data.frame',
    'is.na.numeric_version',
    'is.na.POSIXlt',
    'is.name',
    'is.nan',
    'is.null',
    'is.numeric',
    'is.numeric.Date',
    'is.numeric.difftime',
    'is.numeric.POSIXt',
    'is.numeric_version',
    'is.object',
    'is.ordered',
    'is.package_version',
    'is.pairlist',
    'is.primitive',
    'is.qr',
    'is.R',
    'is.raster',
    'is.raw',
    'is.recursive',
    'is.relistable',
    'is.single',
    'is.stepfun',
    'is.symbol',
    'is.table',
    'is.ts',
    'is.tskernel',
    'is.unsorted',
    'is.vector',
    'isatty',
    'isBaseNamespace',
    'isClass',
    'isClassDef',
    'isClassUnion',
    'isdebugged',
    'isGeneric',
    'isGrammarSymbol',
    'isGroup',
    'isIncomplete',
    'isNamespace',
    'ISOdate',
    'ISOdatetime',
    'isOpen',
    'isoreg',
    'isRestart',
    'isS4',
    'isSealedClass',
    'isSealedMethod',
    'isSeekable',
    'isSymmetric',
    'isSymmetric.matrix',
    'isTRUE',
    'isVirtualClass',
    'isXS3Class',
    'jitter',
    'jpeg',
    'julian',
    'julian.Date',
    'julian.POSIXt',
    'KalmanForecast',
    'KalmanLike',
    'KalmanRun',
    'KalmanSmooth',
    'kappa',
    'kappa.default',
    'kappa.lm',
    'kappa.qr',
    'kernapply',
    'kernel',
    'kmeans',
    'knots',
    'kronecker',
    'kruskal.test',
    'ks.test',
    'ksmooth',
    'l10n_info',
    'La.svd',
    'labels',
    'labels.default',
    'lag',
    'lag.plot',
    'languageEl',
    'lapply',
    'layout',
    'layout.show',
    'lazyLoad',
    'lazyLoadDBexec',
    'lazyLoadDBfetch',
    'lbeta',
    'lchoose',
    'lcm',
    'legend',
    'length',
    'length.POSIXlt',
    'letters',
    'levels',
    'levels.default',
    'lfactorial',
    'lgamma',
    'library',
    'library.dynam',
    'library.dynam.unload',
    'licence',
    'license',
    'limitedLabels',
    'line',
    'linearizeMlist',
    'lines',
    'lines.default',
    'lines.ts',
    'list',
    'list.dirs',
    'list.files',
    'list2env',
    'listFromMethods',
    'listFromMlist',
    'lm',
    'lm.fit',
    'lm.influence',
    'lm.wfit',
    'load',
    'loadedNamespaces',
    'loadhistory',
    'loadingNamespaceInfo',
    'loadings',
    'loadMethod',
    'loadNamespace',
    'loadRconsole',
    'local',
    'localeToCharset',
    'locator',
    'lockBinding',
    'lockEnvironment',
    'loess',
    'loess.control',
    'loess.smooth',
    'log',
    'log10',
    'log1p',
    'log2',
    'logb',
    'Logic',
    'logical',
    'logLik',
    'loglin',
    'lower.tri',
    'lowess',
    'ls',
    'ls.diag',
    'ls.print',
    'ls.str',
    'lsf.str',
    'lsfit',
    'mad',
    'mahalanobis',
    'maintainer',
    'make.link',
    'make.names',
    'make.packages.html',
    'make.rgb',
    'make.socket',
    'make.unique',
    'makeActiveBinding',
    'makeARIMA',
    'makeClassRepresentation',
    'makeExtends',
    'makeGeneric',
    'makeMethodsList',
    'makepredictcall',
    'makePrototypeFromClassDef',
    'makeRweaveLatexCodeRunner',
    'makeStandardGeneric',
    'manova',
    'mantelhaen.test',
    'Map',
    'mapply',
    'margin.table',
    'mat.or.vec',
    'match',
    'match.arg',
    'match.call',
    'match.fun',
    'matchSignature',
    'Math',
    'Math.data.frame',
    'Math.Date',
    'Math.difftime',
    'Math.factor',
    'Math.POSIXt',
    'Math2',
    'matlines',
    'matplot',
    'matpoints',
    'matrix',
    'mauchly.test',
    'max',
    'max.col',
    'mcnemar.test',
    'mean',
    'mean.Date',
    'mean.default',
    'mean.difftime',
    'mean.POSIXct',
    'mean.POSIXlt',
    'median',
    'median.default',
    'medpolish',
    'mem.limits',
    'memCompress',
    'memDecompress',
    'memory.limit',
    'memory.profile',
    'memory.size',
    'menu',
    'merge',
    'merge.data.frame',
    'merge.default',
    'mergeMethods',
    'message',
    'metaNameUndo',
    'method.skeleton',
    'MethodAddCoerce',
    'methods',
    'methodSignatureMatrix',
    'MethodsList',
    'MethodsListSelect',
    'methodsPackageMetaName',
    'mget',
    'min',
    'mirror2html',
    'missing',
    'missingArg',
    'mlistMetaName',
    'Mod',
    'mode',
    'model.extract',
    'model.frame',
    'model.frame.aovlist',
    'model.frame.default',
    'model.frame.glm',
    'model.frame.lm',
    'model.matrix',
    'model.matrix.default',
    'model.matrix.lm',
    'model.offset',
    'model.response',
    'model.tables',
    'model.weights',
    'modifyList',
    'month.abb',
    'month.name',
    'monthplot',
    'months',
    'months.Date',
    'months.POSIXt',
    'mood.test',
    'mosaicplot',
    'msgWindow',
    'mtext',
    'multipleClasses',
    'mvfft',
    'n2mfrow',
    'na.action',
    'na.contiguous',
    'na.exclude',
    'na.fail',
    'na.omit',
    'na.pass',
    'names',
    'names.POSIXlt',
    'namespaceExport',
    'namespaceImport',
    'namespaceImportClasses',
    'namespaceImportFrom',
    'namespaceImportMethods',
    'napredict',
    'naprint',
    'naresid',
    'nargs',
    'nchar',
    'nclass.FD',
    'nclass.scott',
    'nclass.Sturges',
    'ncol',
    'necessary',
    'Negate',
    'new',
    'new.env',
    'new.packages',
    'newBasic',
    'newClassRepresentation',
    'newEmptyObject',
    'news',
    'NextMethod',
    'nextn',
    'ngettext',
    'nlevels',
    'nlm',
    'nlminb',
    'nls',
    'nls.control',
    'NLSstAsymptotic',
    'NLSstClosestX',
    'NLSstLfAsymptote',
    'NLSstRtAsymptote',
    'nobs',
    'noquote',
    'norm',
    'normalizePath',
    'nrow',
    'numeric',
    'numeric_version',
    'numericDeriv',
    'nzchar',
    'object.size',
    'objects',
    'offset',
    'old.packages',
    'old.path',
    'oldClass',
    'on.exit',
    'oneway.test',
    'open',
    'open.connection',
    'open.srcfile',
    'open.srcfilealias',
    'open.srcfilecopy',
    'Ops',
    'Ops.data.frame',
    'Ops.Date',
    'Ops.difftime',
    'Ops.factor',
    'Ops.numeric_version',
    'Ops.ordered',
    'Ops.POSIXt',
    'optim',
    'optimHess',
    'optimise',
    'optimize',
    'options',
    'order',
    'order.dendrogram',
    'ordered',
    'outer',
    'p.adjust',
    'p.adjust.methods',
    'pacf',
    'package.skeleton',
    'package_version',
    'packageDescription',
    'packageEvent',
    'packageHasNamespace',
    'packageName',
    'packageSlot',
    'packageStartupMessage',
    'packageStatus',
    'packageVersion',
    'packBits',
    'page',
    'pairlist',
    'pairs',
    'pairs.default',
    'pairwise.prop.test',
    'pairwise.t.test',
    'pairwise.table',
    'pairwise.wilcox.test',
    'palette',
    'panel.smooth',
    'par',
    'parent.env',
    'parent.frame',
    'parse',
    'parseNamespaceFile',
    'parSocket',
    'paste',
    'paste0',
    'paths',
    'path.expand',
    'path.package',
    'pbeta',
    'pbinom',
    'pbirthday',
    'pcauchy',
    'pchisq',
    'pdf',
    'pdf.options',
    'pdfFonts',
    'person',
    'personList',
    'persp',
    'pexp',
    'pf',
    'pgamma',
    'pgeom',
    'phyper',
    'pi',
    'pico',
    'pictex',
    'pie',
    'pipe',
    'plclust',
    'plnorm',
    'plogis',
    'plot',
    'plot.default',
    'plot.density',
    'plot.design',
    'plot.ecdf',
    'plot.function',
    'plot.lm',
    'plot.mlm',
    'plot.new',
    'plot.spec',
    'plot.spec.coherency',
    'plot.spec.phase',
    'plot.stepfun',
    'plot.ts',
    'plot.TukeyHSD',
    'plot.window',
    'plot.xy',
    'pmatch',
    'pmax',
    'pmax.int',
    'pmin',
    'pmin.int',
    'pnbinom',
    'png',
    'pnorm',
    'points',
    'points.default',
    'poisson',
    'poisson.test',
    'poly',
    'polygon',
    'polym',
    'polypath',
    'polyroot',
    'pos.to.env',
    'Position',
    'possibleExtends',
    'postscript',
    'postscriptFonts',
    'power',
    'power.anova.test',
    'power.prop.test',
    'power.t.test',
    'PP.test',
    'ppoints',
    'ppois',
    'ppr',
    'prcomp',
    'predict',
    'predict.glm',
    'predict.lm',
    'predict.mlm',
    'predict.poly',
    'preplot',
    'pretty',
    'pretty.default',
    'prettyNum',
    'princomp',
    'print',
    'print.anova',
    'print.AsIs',
    'print.by',
    'print.condition',
    'print.connection',
    'print.data.frame',
    'print.Date',
    'print.default',
    'print.density',
    'print.difftime',
    'print.DLLInfo',
    'print.DLLInfoList',
    'print.DLLRegisteredRoutines',
    'print.factor',
    'print.family',
    'print.formula',
    'print.ftable',
    'print.function',
    'print.glm',
    'print.hexmode',
    'print.infl',
    'print.integrate',
    'print.libraryIQR',
    'print.listof',
    'print.lm',
    'print.logLik',
    'print.NativeRoutineList',
    'print.noquote',
    'print.numeric_version',
    'print.octmode',
    'print.packageInfo',
    'print.POSIXct',
    'print.POSIXlt',
    'print.proc_time',
    'print.restart',
    'print.rle',
    'print.simple.list',
    'print.srcfile',
    'print.srcref',
    'print.summary.table',
    'print.summaryDefault',
    'print.table',
    'print.terms',
    'print.ts',
    'print.warnings',
    'printCoefmat',
    'prmatrix',
    'proc.time',
    'process.events',
    'processSocket',
    'prod',
    'profile',
    'prohibitGeneric',
    'proj',
    'promax',
    'prompt',
    'promptClass',
    'promptData',
    'promptMethods',
    'promptPackage',
    'prop.table',
    'prop.test',
    'prop.trend.test',
    'prototype',
    'provideDimnames',
    'ps.options',
    'psigamma',
    'psignrank',
    'pt',
    'ptukey',
    'punif',
    'pushBack',
    'pushBackLength',
    'pweibull',
    'pwilcox',
    'q',
    'qbeta',
    'qbinom',
    'qbirthday',
    'qcauchy',
    'qchisq',
    'qexp',
    'qf',
    'qgamma',
    'qgeom',
    'qhyper',
    'qlnorm',
    'qlogis',
    'qnbinom',
    'qnorm',
    'qpois',
    'qqline',
    'qqnorm',
    'qqnorm.default',
    'qqplot',
    'qr',
    'qr.coef',
    'qr.default',
    'qr.fitted',
    'qr.Q',
    'qr.qty',
    'qr.qy',
    'qr.R',
    'qr.resid',
    'qr.solve',
    'qr.X',
    'qsignrank',
    'qt',
    'qtukey',
    'quade.test',
    'quantile',
    'quantile.default',
    'quarters',
    'quarters.Date',
    'quarters.POSIXt',
    'quasi',
    'quasibinomial',
    'quasipoisson',
    'quit',
    'qunif',
    'quote',
    'qweibull',
    'qwilcox',
    'R.home',
    'R.version',
    'R.version.string',
    'R_system_version',
    'r2dtable',
    'rainbow',
    'range',
    'range.default',
    'rank',
    'rapply',
    'rasterImage',
    'raw',
    'rawConnection',
    'rawConnectionValue',
    'rawShift',
    'rawToBits',
    'rawToChar',
    'rbeta',
    'rbind',
    'rbind.data.frame',
    'rbind2',
    'rbinom',
    'rc.getOption',
    'rc.options',
    'rc.settings',
    'rc.status',
    'rcauchy',
    'rchisq',
    'rcond',
    'Re',
    'read.csv',
    'read.csv2',
    'read.dcf',
    'read.delim',
    'read.delim2',
    'read.DIF',
    'read.fortran',
    'read.ftable',
    'read.fwf',
    'read.socket',
    'read.table',
    'readBin',
    'readChar',
    'readCitationFile',
    'readClipboard',
    'readline',
    'readLines',
    'readRDS',
    'readRegistry',
    'readRenviron',
    'Recall',
    'reconcilePropertiesAndPrototype',
    'recordGraphics',
    'recordPlot',
    'recover',
    'rect',
    'rect.hclust',
    'Reduce',
    'reformulate',
    'reg.finalizer',
    'regexec',
    'regexpr',
    'registerImplicitGenerics',
    'registerS3method',
    'registerS3methods',
    'regmatches',
    'relevel',
    'relist',
    'rematchDefinition',
    'remove',
    'remove.packages',
    'removeClass',
    'removeGeneric',
    'removeMethod',
    'removeMethods',
    'removeMethodsObject',
    'removeSource',
    'removeTaskCallback',
    'reorder',
    'rep',
    'rep.Date',
    'rep.factor',
    'rep.int',
    'rep.numeric_version',
    'rep.POSIXct',
    'rep.POSIXlt',
    'rep_len',
    'replace',
    'replayPlot',
    'replicate',
    'replications',
    'representation',
    'require',
    'requireMethods',
    'requireNamespace',
    'resetClass',
    'resetGeneric',
    'reshape',
    'resid',
    'residuals',
    'residuals.default',
    'residuals.glm',
    'residuals.lm',
    'restartDescription',
    'restartFormals',
    'retracemem',
    'rev',
    'rev.default',
    'rexp',
    'rf',
    'rgamma',
    'rgb',
    'rgb2hsv',
    'rgeom',
    'rhyper',
    'rle',
    'rlnorm',
    'rlogis',
    'rm',
    'rmultinom',
    'rnbinom',
    'RNGkind',
    'RNGversion',
    'rnorm',
    'round',
    'round.Date',
    'round.POSIXt',
    'row',
    'row.names',
    'row.names.data.frame',
    'row.names.default',
    'rowMeans',
    'rownames',
    'rowsum',
    'rowsum.data.frame',
    'rowsum.default',
    'rowSums',
    'rpois',
    'Rprof',
    'Rprofmem',
    'RShowDoc',
    'rsignrank',
    'RSiteSearch',
    'rstandard',
    'rstandard.glm',
    'rstandard.lm',
    'rstudent',
    'rstudent.glm',
    'rstudent.lm',
    'rt',
    'rtags',
    'Rtangle',
    'RtangleSetup',
    'RtangleWritedoc',
    'rug',
    'runif',
    'runmed',
    'RweaveChunkPrefix',
    'RweaveEvalWithOpt',
    'RweaveLatex',
    'RweaveLatexFinish',
    'RweaveLatexOptions',
    'RweaveLatexSetup',
    'RweaveLatexWritedoc',
    'RweaveTryStop',
    'rweibull',
    'rwilcox',
    'rWishart',
    'S3Class',
    'S3Part',
    'sample',
    'sample.int',
    'sapply',
    'save',
    'save.image',
    'savehistory',
    'savePlot',
    'saveRDS',
    'scale',
    'scale.default',
    'scan',
    'scatter.smooth',
    'screen',
    'screeplot',
    'sd',
    'se.contrast',
    'sealClass',
    'search',
    'searchpaths',
    'seek',
    'seek.connection',
    'seemsS4Object',
    'segments',
    'select.list',
    'selectMethod',
    'selectSuperClasses',
    'selfStart',
    'sendSocketClients',
    'seq',
    'seq.Date',
    'seq.default',
    'seq.int',
    'seq.POSIXt',
    'seq_along',
    'seq_len',
    'sequence',
    'serialize',
    'sessionInfo',
    'set.seed',
    'setAs',
    'setBreakpoint',
    'setClass',
    'setClassUnion',
    'setDataPart',
    'setdiff',
    'setEPS',
    'setequal',
    'setGeneric',
    'setGenericImplicit',
    'setGraphicsEventEnv',
    'setGraphicsEventHandlers',
    'setGroupGeneric',
    'setHook',
    'setInternet2',
    'setIs',
    'setLoadAction',
    'setLoadActions',
    'setMethod',
    'setNames',
    'setNamespaceInfo',
    'setOldClass',
    'setPackageName',
    'setPrimitiveMethods',
    'setPS',
    'setRefClass',
    'setReplaceMethod',
    'setRepositories',
    'setSessionTimeLimit',
    'setStatusBar',
    'setTimeLimit',
    'setTxtProgressBar',
    'setValidity',
    'setwd',
    'setWindowTitle',
    'setWinProgressBar',
    'shapiro.test',
    'shell',
    'shell.exec',
    'shortPathName',
    'show',
    'showClass',
    'showConnections',
    'showDefault',
    'showExtends',
    'showMethods',
    'showMlist',
    'shQuote',
    'sign',
    'signalCondition',
    'signature',
    'SignatureMethod',
    'signif',
    'sigToEnv',
    'simpleCondition',
    'simpleError',
    'simpleMessage',
    'simpleWarning',
    'simplify2array',
    'simulate',
    'sin',
    'single',
    'sinh',
    'sink',
    'sink.number',
    'slice.index',
    'slot',
    'slotNames',
    'slotsFromS3',
    'smooth',
    'smooth.spline',
    'smoothEnds',
    'smoothScatter',
    'socketClientConnection',
    'socketConnection',
    'socketSelect',
    'solve',
    'solve.default',
    'solve.qr',
    'sort',
    'sort.default',
    'sort.int',
    'sort.list',
    'sort.POSIXlt',
    'sortedXyData',
    'source',
    'spec.ar',
    'spec.pgram',
    'spec.taper',
    'spectrum',
    'spineplot',
    'spline',
    'splinefun',
    'splinefunH',
    'split',
    'split.data.frame',
    'split.Date',
    'split.default',
    'split.POSIXct',
    'split.screen',
    'sprintf',
    'sqrt',
    'sQuote',
    'srcfile',
    'srcfilealias',
    'srcfilecopy',
    'srcref',
    'SSasymp',
    'SSasympOff',
    'SSasympOrig',
    'SSbiexp',
    'SSD',
    'SSfol',
    'SSfpl',
    'SSgompertz',
    'SSlogis',
    'SSmicmen',
    'SSweibull',
    'stack',
    'standardGeneric',
    'Stangle',
    'stars',
    'start',
    'startSocketServer',
    'stat.anova',
    'stderr',
    'stdin',
    'stdout',
    'stem',
    'step',
    'stepfun',
    'stl',
    'stopSocketServer',
    'storage.mode',
    'str',
    'strftime',
    'strheight',
    'stripchart',
    'strOptions',
    'strptime',
    'strsplit',
    'strtoi',
    'strtrim',
    'StructTS',
    'structure',
    'strwidth',
    'strwrap',
    'sub',
    'subset',
    'subset.data.frame',
    'subset.default',
    'subset.matrix',
    'substitute',
    'substituteDirect',
    'substituteFunctionArgs',
    'substr',
    'substring',
    'sum',
    'summary',
    'summary.aov',
    'summary.aovlist',
    'summary.connection',
    'summary.data.frame',
    'summary.Date',
    'summary.default',
    'Summary.difftime',
    'summary.factor',
    'summary.glm',
    'summary.infl',
    'summary.lm',
    'summary.manova',
    'summary.matrix',
    'summary.mlm',
    'Summary.numeric_version',
    'Summary.ordered',
    'summary.POSIXct',
    'summary.POSIXlt',
    'summary.proc_time',
    'summary.srcfile',
    'summary.srcref',
    'summary.stepfun',
    'summary.table',
    'summaryRprof',
    'sunflowerplot',
    'superClassDepth',
    'suppressMessages',
    'suppressPackageStartupMessages',
    'suppressWarnings',
    'supsmu',
    'svd',
    'svg',
    'Sweave',
    'SweaveHooks',
    'SweaveSyntaxLatex',
    'SweaveSyntaxNoweb',
    'SweaveSyntConv',
    'sweep',
    'symbols',
    'symnum',
    'sys.call',
    'sys.calls',
    'Sys.chmod',
    'Sys.Date',
    'sys.frame',
    'sys.frames',
    'sys.function',
    'Sys.getenv',
    'Sys.getlocale',
    'Sys.getpid',
    'Sys.glob',
    'Sys.info',
    'Sys.junction',
    'sys.load.image',
    'Sys.localeconv',
    'sys.nframe',
    'sys.on.exit',
    'sys.parent',
    'sys.parents',
    'Sys.readlink',
    'sys.save.image',
    'Sys.setenv',
    'Sys.setFileTime',
    'Sys.setlocale',
    'Sys.sleep',
    'sys.source',
    'sys.status',
    'Sys.time',
    'Sys.timezone',
    'Sys.umask',
    'Sys.unsetenv',
    'Sys.which',
    'system',
    'system.file',
    'system.time',
    'system2',
    't.data.frame',
    't.default',
    't.test',
    'table',
    'tabulate',
    'tail',
    'tail.matrix',
    'tan',
    'tanh',
    'tapply',
    'tar',
    'taskCallbackManager',
    'tcrossprod',
    'tempdir',
    'tempfile',
    'termplot',
    'terms',
    'terms.aovlist',
    'terms.default',
    'terms.formula',
    'terms.terms',
    'terrain.colors',
    'testInheritedMethods',
    'testPlatformEquivalence',
    'testVirtual',
    'text',
    'text.default',
    'textConnection',
    'textConnectionValue',
    'tidy.dir',
    'tidy.eval',
    'tidy.gui',
    'tidy.source',
    'tiff',
    'time',
    'timestamp',
    'title',
    'toBibtex',
    'toeplitz',
    'toLatex',
    'tolower',
    'topenv',
    'topo.colors',
    'toString',
    'toString.default',
    'toupper',
    'trace',
    'traceback',
    'tracemem',
    'traceOff',
    'traceOn',
    'tracingState',
    'trans3d',
    'transform',
    'transform.data.frame',
    'transform.default',
    'trArgs',
    'trComplete',
    'trExport',
    'trigamma',
    'trObjList',
    'trObjSearch',
    'trStartIDEabbreviate',
    'trunc',
    'trunc.Date',
    'trunc.POSIXt',
    'truncate',
    'truncate.connection',
    'ts',
    'ts.intersect',
    'ts.plot',
    'ts.union',
    'tsdiag',
    'tsp',
    'tsSmooth',
    'TukeyHSD',
    'TukeyHSD.aov',
    'txtProgressBar',
    'type.convert',
    'Type1Font',
    'typeof',
    'undebug',
    'union',
    'unique',
    'unique.array',
    'unique.data.frame',
    'unique.default',
    'unique.matrix',
    'unique.numeric_version',
    'unique.POSIXlt',
    'uniroot',
    'units',
    'units.difftime',
    'unix.time',
    'unlink',
    'unlist',
    'unloadNamespace',
    'unlockBinding',
    'unname',
    'unRematchDefinition',
    'unserialize',
    'unsplit',
    'unstack',
    'untar',
    'untrace',
    'untracemem',
    'unz',
    'unzip',
    'update',
    'update.default',
    'update.formula',
    'update.packages',
    'update.packageStatus',
    'upgrade',
    'upper.tri',
    'url',
    'url.show',
    'URLdecode',
    'URLencode',
    'usage',
    'UseMethod',
    'utf8ToInt',
    'validObject',
    'validSlotNames',
    'vapply',
    'var',
    'var.test',
    'variable.names',
    'varimax',
    'vcov',
    'vector',
    'Vectorize',
    'version',
    'vi',
    'View',
    'vignette',
    'weekdays',
    'weekdays.Date',
    'weekdays.POSIXt',
    'weighted.mean',
    'weighted.residuals',
    'weights',
    'which',
    'which.max',
    'which.min',
    'wilcox.test',
    'win.graph',
    'win.metafile',
    'win.print',
    'win.version',
    'winDialog',
    'winDialogString',
    'window',
    'windows',
    'windows.options',
    'windowsFont',
    'windowsFonts',
    'winMenuAdd',
    'winMenuAddItem',
    'winMenuDel',
    'winMenuDelItem',
    'winMenuItems',
    'winMenuNames',
    'winProgressBar',
    'with',
    'with.default',
    'withCallingHandlers',
    'within',
    'within.data.frame',
    'within.list',
    'withRestarts',
    'withVisible',
    'write',
    'write.csv',
    'write.csv2',
    'write.dcf',
    'write.ftable',
    'write.socket',
    'write.table',
    'writeBin',
    'writeChar',
    'writeClipboard',
    'writeLines',
    'x11',
    'xedit',
    'xemacs',
    'xfig',
    'xinch',
    'xor',
    'xor.hexmode',
    'xor.octmode',
    'xpdrows.data.frame',
    'xspline',
    'xtabs',
    'xtfrm',
    'xtfrm.AsIs',
    'xtfrm.Date',
    'xtfrm.default',
    'xtfrm.difftime',
    'xtfrm.factor',
    'xtfrm.numeric_version',
    'xtfrm.POSIXct',
    'xtfrm.POSIXlt',
    'xtfrm.Surv',
    'xy.coords',
    'xyinch',
    'xyTable',
    'xyz.coords',
    'xzfile',
    'yinch',
    'zapsmall',
    'zip',
    'zip.unpack'
    );

  // List of keywords: Datasets
  Datasets_Count = 101;
  Datasets: array [1..Datasets_Count] of UnicodeString =
    (
    'ability.cov',
    'airmiles',
    'AirPassengers',
    'airquality',
    'anscombe',
    'attenu',
    'attitude',
    'austres',
    'beaver1',
    'beaver2',
    'BJsales',
    'BJsales.lead',
    'BOD',
    'cars',
    'ChickWeight',
    'chickwts',
    'CO2',
    'crimtab',
    'discoveries',
    'DNase',
    'esoph',
    'euro',
    'euro.cross',
    'eurodist',
    'EuStockMarkets',
    'faithful',
    'fdeaths',
    'Formaldehyde',
    'freeny',
    'freeny.x',
    'freeny.y',
    'HairEyeColor',
    'Harman23.cor',
    'Harman74.cor',
    'Indometh',
    'infert',
    'InsectSprays',
    'iris',
    'iris3',
    'islands',
    'JohnsonJohnson',
    'LakeHuron',
    'ldeaths',
    'lh',
    'LifeCycleSavings',
    'Loblolly',
    'longley',
    'lynx',
    'mdeaths',
    'morley',
    'mtcars',
    'nhtemp',
    'Nile',
    'nottem',
    'occupationalStatus',
    'Orange',
    'OrchardSprays',
    'PlantGrowth',
    'precip',
    'presidents',
    'pressure',
    'Puromycin',
    'quakes',
    'randu',
    'rivers',
    'rock',
    'Seatbelts',
    'sleep',
    'stack.loss',
    'stack.x',
    'stackloss',
    'state.abb',
    'state.area',
    'state.center',
    'state.division',
    'state.name',
    'state.region',
    'state.x77',
    'sunspot.month',
    'sunspot.year',
    'sunspots',
    'swiss',
    'Theoph',
    'Titanic',
    'ToothGrowth',
    'treering',
    'trees',
    'UCBAdmissions',
    'UKDriverDeaths',
    'UKgas',
    'USAccDeaths',
    'USArrests',
    'USJudgeRatings',
    'USPersonalExpenditure',
    'uspop',
    'VADeaths',
    'volcano',
    'warpbreaks',
    'women',
    'WorldPhones',
    'WWWusage'
    );

  // List of keywords: Plotting
  Plotting_Count = 76;
  Plotting: array [1..Plotting_Count] of UnicodeString =
    (
    'adj',
    'ann',
    'ask',
    'asp',
    'bg',
    'bty',
    'cex',
    'cex.axis',
    'cex.lab',
    'cex.main',
    'cex.names',
    'cex.sub',
    'cin',
    'col',
    'col.axis',
    'col.lab',
    'col.main',
    'col.sub',
    'cra',
    'crt',
    'csi',
    'cxy',
    'din',
    'err',
    'fg',
    'fig',
    'fin',
    'font',
    'font.axis',
    'font.lab',
    'font.main',
    'font.sub',
    'lab',
    'las',
    'lend',
    'lheight',
    'ljoin',
    'lmitre',
    'lty',
    'lwd',
    'mai',
    'main',
    'mar',
    'mex',
    'mfcol',
    'mfg',
    'mfrow',
    'mgp',
    'mkh',
    'oma',
    'omd',
    'omi',
    'pch',
    'pin',
    'plt',
    'ps',
    'pty',
    'smo',
    'srt',
    'tck',
    'tcl',
    'usr',
    'xaxp',
    'xaxs',
    'xaxt',
    'xlab',
    'xlim',
    'xlog',
    'xpd',
    'yaxp',
    'yaxs',
    'yaxt',
    'ylab',
    'ylim',
    'ylbias',
    'ylog'
    );

var
  f: Integer;

begin
  if not Assigned (GlobalKeywords) then begin
    // Create the string list of keywords - only once
    GlobalKeywords:= TUnicodeStringList.Create;

    for f:= 1 to Programing_Count do
      GlobalKeywords.AddObject(Programing[f],
                               Pointer(Ord(tkPrograming)));

    for f:= 1 to Functions_Count do
      GlobalKeywords.AddObject(Functions[f],
                               Pointer(Ord(tkFunctions)));

    for f:= 1 to Datasets_Count do
      GlobalKeywords.AddObject(Datasets[f],
                               Pointer(Ord(tkDatasets)));
    for f:= 1 to Plotting_Count do
      GlobalKeywords.AddObject(Plotting[f],
                               Pointer(Ord(tkPlotting)));

{
    // Tests: OK
    GlobalKeywords.InsertObject(1, 'aa', Pointer(Ord(tkPlotting)));
    GlobalKeywords.InsertObject(1, 'aa', Pointer(Ord(tkPlotting)));
}
  end; // if
  Result:= GlobalKeywords;
end;

function TSynRSyn.IdentKind(MayBe: PWideChar): TtkTokenKind;
var
  i:    Integer;
  temp: PWideChar;
  s:    UnicodeString;

begin
  // Extract the identifier out - it is assumed to terminate in a
  // non-alphanumeric character
  fToIdent:= MayBe;
  temp:= MayBe;

  (*
  // It is not good for R!
  while IsIdentChar(temp^) do
    Inc(temp);
  *)

  // J.C.Faria
  // ----------------------------------------------------------------------------------------------------------------------
  i:= 0;
  while IsIdentChar(temp^) or      // '_', '0'..'9', 'A'..'Z', 'a'..'z':
        (MayBe[i] = '.') do begin  // R: an keyword (Programing, Function, Dataset or Plotting) can has a point '.' inside
    Inc(temp);
    Inc(i);
  end;
  // ----------------------------------------------------------------------------------------------------------------------

  fStringLen:= temp - fToIdent;

  // Check to see if it is a keyword
  SetString(s,
            fToIdent,
            fStringLen);
  if FKeywords.Find(s,
                    i) then begin
    // TUnicodeStringList is not case sensitive!
    if s <> FKeywords[i] then
      i:= -1;
  end
  else
    i:= -1;

  if i <> -1 then
    Result:= TtkTokenKind(FKeywords.Objects[i])
  else
    Result:= tkIdentifier;
end;

constructor TSynRSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fCaseSensitive:= True;

  FKeywords:= TUnicodeStringList.Create;
  FKeywords.Sorted:= True;
  FKeywords.Duplicates:= dupIgnore; //dupError, dupIgnore, dupAccept
  FKeywords.Assign(GetKeywordIdentifiers);

  fRange:= rsUnknown;

  fCommentAttri:= TSynHighlighterAttributes.Create(SYNS_AttrComment,
                                                   SYNS_FriendlyAttrComment);
  fCommentAttri.Foreground:= clGray;
  fCommentAttri.Style:= [fsItalic];
  AddAttribute(fCommentAttri);

  fNoteAttri:= TSynHighlighterAttributes.Create(SYNS_AttrNote,
                                                SYNS_FriendlyAttrNote);
  fNoteAttri.Foreground:= clRed;
  fNoteAttri.Style:= [fsItalic, fsUnderline, fsBold];
  AddAttribute(fNoteAttri);

  fNote_1Attri:= TSynHighlighterAttributes.Create(SYNS_AttrNote_1,
                                                  SYNS_FriendlyAttrNote_1);
  fNote_1Attri.Foreground:= clBlue;
  fNote_1Attri.Style:= [fsItalic, fsBold];
  AddAttribute(fNote_1Attri);

  fNote_2Attri:= TSynHighlighterAttributes.Create(SYNS_AttrNote_2,
                                                  SYNS_FriendlyAttrNote_2);
  fNote_2Attri.Foreground:= clGreen;
  fNote_2Attri.Style:= [fsItalic];
  AddAttribute(fNote_2Attri);

  fIdentifierAttri:= TSynHighlighterAttributes.Create(SYNS_AttrIdentifier,
                                                      SYNS_FriendlyAttrIdentifier);
  AddAttribute(fIdentifierAttri);

  fProgramingAttri:= TSynHighlighterAttributes.Create(SYNS_AttrPrograming,
                                                      SYNS_FriendlyAttrPrograming);
  fProgramingAttri.Foreground:= clRed;
  //fProgramingAttri.Style:= [fsBold];
  AddAttribute(fProgramingAttri);

  fFunctionsAttri:= TSynHighlighterAttributes.Create(SYNS_AttrFunction,
                                                     SYNS_FriendlyAttrFunction);
  fFunctionsAttri.Foreground:= clGreen;
  //fFunctionsAttri.Style:= [fsBold];
  AddAttribute(fFunctionsAttri);

  fDatasetsAttri:= TSynHighlighterAttributes.Create (SYNS_AttrDatasets,
                                                     SYNS_FriendlyAttrDatasets);
  fDatasetsAttri.Foreground:= clTeal;
  fDatasetsAttri.Style:= [fsBold];
  AddAttribute(fDatasetsAttri);

  fPlottingAttri:= TSynHighlighterAttributes.Create (SYNS_AttrPlotting,
                                                     SYNS_FriendlyAttrPlotting);
  fPlottingAttri.Foreground:= clFuchsia;
  //fPlottingAttri.Style:= [fsBold];
  AddAttribute(fPlottingAttri);

  fNumberAttri:= TSynHighlighterAttributes.Create(SYNS_AttrNumber,
                                                  SYNS_FriendlyAttrNumber);
  fNumberAttri.Foreground:= clBlue;
  AddAttribute(fNumberAttri);

  fHexAttri:= TSynHighlighterAttributes.Create(SYNS_AttrHexadecimal,
                                               SYNS_FriendlyAttrHexadecimal);
  fHexAttri.Foreground:= clBlue;
  AddAttribute(fHexAttri);

  fOctalAttri:= TSynHighlighterAttributes.Create(SYNS_AttrOctal,
                                                 SYNS_FriendlyAttrOctal);
  fOctalAttri.Foreground:= clBlue;
  AddAttribute(fOctalAttri);

  fFloatAttri:= TSynHighlighterAttributes.Create(SYNS_AttrFloat,
                                                 SYNS_FriendlyAttrFloat);
  fFloatAttri.Foreground:= clBlue;
  AddAttribute(fFloatAttri);

  fSpaceAttri:= TSynHighlighterAttributes.Create(SYNS_AttrSpace,
                                                 SYNS_FriendlyAttrSpace);
  AddAttribute(fSpaceAttri);

  fStringAttri:= TSynHighlighterAttributes.Create(SYNS_AttrString,
                                                  SYNS_FriendlyAttrString);
  fStringAttri.Foreground:= clOlive;
  AddAttribute(fStringAttri);

  fSymbolAttri:= TSynHighlighterAttributes.Create(SYNS_AttrSymbol,
                                                  SYNS_FriendlyAttrSymbol);
  fSymbolAttri.Foreground:= clMaroon;
  AddAttribute(fSymbolAttri);

  fOperatorAttri:= TSynHighlighterAttributes.Create(SYNS_AttrOperator,
                                                    SYNS_FriendlyAttrOperator);
  fOperatorAttri.Foreground:= clOlive;
  AddAttribute(fOperatorAttri);

  SetAttributesOnChange(DefHighlightChange);
  fDefaultFilter:= SYNS_FilterR;
end; { Create }

destructor TSynRSyn.Destroy;
begin
  FKeywords.Free;
  inherited;
end;

procedure TSynRSyn.SymbolProc;
begin
  Inc(Run);
  fTokenID:= tkSymbol;
end;

procedure TSynRSyn.OperatorProc;
begin
  Inc(Run);
  fTokenID:= tkOperator;
end;

procedure TSynRSyn.CRProc;
begin
  fTokenID:= tkSpace;
  case FLine[Run + 1] of
    #10: Inc(Run, 2);
  else
    Inc(Run);
  end;
end;

procedure TSynRSyn.CommentProc;
begin
{
  fTokenID:= tkComment;
  Inc(Run);
  while not IsLineEnd(Run) do
    Inc(Run);
}
  // J.C.Faria
  if (FLine[Run+1] = '!') then
  begin
    fTokenID:= tkNote;
    if (FLine[Run+2] = '.') then fTokenID:= tkNote_1;
    if (FLine[Run+3] = '.') then fTokenID:= tkNote_2;
  end
  else
    fTokenID:= tkComment;

  while not IsLineEnd(Run) do
    Inc(Run);
end;

procedure TSynRSyn.IdentProc;
begin
  fTokenID:= IdentKind((fLine + Run));
  Inc(Run,
      fStringLen);
end;

procedure TSynRSyn.LFProc;
begin
  fTokenID:= tkSpace;
  Inc(Run);
end;

procedure TSynRSyn.NullProc;
begin
  fTokenID:= tkNull;
  Inc(Run);
end;

{
procedure TSynRSyn.NumberProc;
type
  TNumberState =
    (
    nsStart,
    nsDotFound,
    nsFloatNeeded,
    nsHex,
    nsOct,
    nsExpFound
    );

var
  temp:  WideChar;
  State: TNumberState;

  function CheckSpecialCases: Boolean;
  begin
    case temp of
      // Look for dot (.)
      '.': begin
        // .45
        if CharInSet(FLine[Run], ['0'..'9']) then begin
          Inc (Run);
          fTokenID:= tkFloat;
          State:= nsDotFound;

        // Non-number dot
        end
        else begin
          // Ellipsis
          if (FLine[Run] = '.') and (FLine[Run+1] = '.') then
            Inc (Run, 2);
          fTokenID:= tkSymbol;
          Result:= False;
          Exit;
        end; // if
      end; // DOT

      // Look for zero (0)
      '0': begin
        temp:= FLine[Run];
        // 0x123ABC
        if CharInSet(temp, ['x', 'X']) then begin
          Inc (Run);
          fTokenID:= tkHex;
          State:= nsHex;
        // 0.45
        end
        else if temp = '.' then begin
          Inc (Run);
          State:= nsDotFound;
          fTokenID:= tkFloat;
        end
        else if CharInSet(temp, ['0'..'9']) then begin
          Inc (Run);
          // 0123 or 0123.45
          if CharInSet(temp, ['0'..'7']) then begin
            fTokenID:= tkOct;
            State:= nsOct;
          // 0899.45
          end
          else begin
            fTokenID:= tkFloat;
            State:= nsFloatNeeded;
          end; // if
        end; // if
      end; // ZERO
    end; // case

    Result:= True;
  end; // CheckSpecialCases

  function HandleBadNumber: Boolean;
  begin
    Result:= False;
    fTokenID:= tkUnknown;
    // Ignore all tokens till end of "number"
    while IsIdentChar(FLine[Run]) or
          (FLine[Run] = '.') do
      Inc (Run);
  end; // HandleBadNumber

  function HandleExponent: Boolean;
  begin
    State:= nsExpFound;
    fTokenID:= tkFloat;
    // Skip e[+/-]
    if CharInSet(FLine[Run+1], ['+', '-']) then
      Inc (Run);
    // Invalid token : 1.0e
    if not CharInSet(FLine[Run+1], ['0'..'9']) then begin
      Inc (Run);
      Result:= HandleBadNumber;
      Exit;
    end; // if

    Result:= True;
  end; // HandleExponent

  function HandleDot: Boolean;
  begin
    // Check for ellipsis
    Result:= (FLine[Run+1] <> '.') or
             (FLine[Run+2] <> '.');
    if Result then begin
      State:= nsDotFound;
      fTokenID:= tkFloat;
    end; // if
  end; // HandleDot

  function CheckStart: Boolean;
  begin
    // 1234
    if CharInSet(temp, ['0'..'9']) then begin
      Result:= True;
    //123e4
    end
    else if CharInSet(temp, ['e', 'E']) then begin
      Result:= HandleExponent;
    // 123.45j
    end
    else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      fTokenID:= tkFloat;
      Result:= False;
    // 123.45
    end
    else if temp = '.' then begin
      Result:= HandleDot;
    // Error!
    end
    else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end
    else begin
      Result:= False;
    end; // if
  end; // CheckStart

  function CheckDotFound: Boolean;
  begin
    // 1.0e4
    if CharInSet(temp, ['e', 'E']) then begin
      Result:= HandleExponent;
    // 123.45
    end else if CharInSet(temp, ['0'..'9']) then begin
      Result:= True;
    // 123.45j
    end else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      Result:= False;
    // 123.45.45: Error!
    end else if temp = '.' then begin
      Result:= False;
      if HandleDot then
        HandleBadNumber;
    // Error!
    end else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end else begin
      Result:= False;
    end; // if
  end; // CheckDotFound

  function CheckFloatNeeded: Boolean;
  begin
    // 091.0e4
    if CharInSet(temp, ['e', 'E']) then begin
      Result:= HandleExponent;
    // 0912345
    end else if CharInSet(temp, ['0'..'9']) then begin
      Result:= True;
    // 09123.45
    end else if temp = '.' then begin
      Result:= HandleDot or HandleBadNumber; // Bad octal
    // 09123.45j
    end else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      Result:= False;
    // End of number (error: Bad oct number) 0912345
    end else begin
      Result:= HandleBadNumber;
    end;
  end; // CheckFloatNeeded

  function CheckHex: Boolean;
  begin
    // 0x123ABC
    if CharInSet(temp, ['a'..'f', 'A'..'F', '0'..'9']) then begin
      Result:= True;
    // 0x123ABCL
    end
    else if CharInSet(temp, ['l', 'L']) then begin
      Inc (Run);
      Result:= False;
    // 0x123.45: Error!
    end
    else if temp = '.' then begin
      Result:= False;
      if HandleDot then
        HandleBadNumber;
    // Error!
    end
    else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end
    else begin
      Result:= False;
    end; // if
  end; // CheckHex

  function CheckOct: Boolean;
  begin
    // 012345
    if CharInSet(temp, ['0'..'9']) then begin
      if not CharInSet(temp, ['0'..'7']) then begin
        State:= nsFloatNeeded;
        fTokenID:= tkFloat;
      end; // if
      Result:= True;
    // 012345L
    end else if CharInSet(temp, ['l', 'L']) then begin
      Inc (Run);
      Result:= False;
    // 0123e4
    end else if CharInSet(temp, ['e', 'E']) then begin
      Result:= HandleExponent;
    // 0123j
    end else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      fTokenID:= tkFloat;
      Result:= False;
    // 0123.45
    end else if temp = '.' then begin
      Result:= HandleDot;
    // Error!
    end else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end else begin
      Result:= False;
    end; // if
  end; // CheckOct

  function CheckExpFound: Boolean;
  begin
    // 1e+123
    if CharInSet(temp, ['0'..'9']) then begin
      Result:= True;
    // 1e+123j
    end else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      Result:= False;
    // 1e4.5: Error!
    end else if temp = '.' then begin
      Result:= False;
      if HandleDot then
        HandleBadNumber;
    // Error!
    end else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end else begin
      Result:= False;
    end; // if
  end; // CheckExpFound

begin
  State:= nsStart;
  fTokenID:= tkNumber;

  temp:= FLine[Run];
  Inc (Run);

  // Special cases
  if not CheckSpecialCases then
    Exit;

  // Use a state machine to parse numbers
  while True do begin
    temp:= FLine[Run];

    case State of
      nsStart:
        if not CheckStart then
          Exit;
      nsDotFound:
        if not CheckDotFound then
          Exit;
      nsFloatNeeded:
        if not CheckFloatNeeded then
          Exit;
      nsHex:
        if not CheckHex then
          Exit;
      nsOct:
        if not CheckOct then
          Exit;
      nsExpFound:
        if not CheckExpFound then
          Exit;
    end; // case

    Inc (Run);
  end; // while
end;
}

// Adapted from SynEdit SynHighlighterCpp
// by J.C.Faria
procedure TSynRSyn.NumberProc;

  function IsNumberChar(Run: Integer): Boolean;
  begin
    case fLine[Run] of
      '0'..'9', 'A'..'F', 'a'..'f', '.', 'u', 'U', 'l', 'L', 'x', 'X', '-', '+':
        Result := True;
      else
        Result := False;
    end;
  end;

  function IsDigitPlusMinusChar(Run: Integer): Boolean;
  begin
    case fLine[Run] of
      '0'..'9', '+', '-':
        Result := True;
      else
        Result := False;
    end;
  end;

  function IsHexDigit(Run: Integer): Boolean;
  begin
    case fLine[Run] of
      '0'..'9', 'a'..'f', 'A'..'F':
        Result := True;
      else
        Result := False;
    end;
  end;

  function IsAlphaUncerscore(Run: Integer): Boolean;
  begin
    case fLine[Run] of
      'A'..'Z', 'a'..'z', '_':
        Result := True;
      else
        Result := False;
    end;
  end;

var
  idx1, // token[1]
   i: integer;

begin
  idx1:= Run;
  Inc(Run);
  fTokenID:= tkNumber;

  // J.C.Faria
  if FLine[idx1] = '.' then
    fTokenID:= tkFloat; // In R .123 is also float, not only 0.123!

  while IsNumberChar(Run) do
  begin
    case FLine[Run] of
      '.':
        if FLine[Succ(Run)] = '.' then
          Break
        else
          if (fTokenID <> tkHex) then
            fTokenID:= tkFloat
          else // invalid
          begin
            fTokenID:= tkUnknown;
            Exit;
          end;
      '-', '+':
        begin
          if fTokenID <> tkFloat then // number <> float. an arithmetic operator
            Exit;
          if not CharInSet(FLine[Pred(Run)], ['e', 'E']) then
            Exit; // number = float, but no exponent. an arithmetic operator
          if not IsDigitPlusMinusChar(Succ(Run)) then // invalid
          begin
            Inc(Run);
            fTokenID:= tkUnknown;
            Exit;
          end
        end;
      '0'..'7':
        if (Run = Succ(idx1)) and
           (FLine[idx1] = '0') then // octal number
          fTokenID:= tkOct;
      '8', '9':
        if (FLine[idx1] = '0') and
           ((fTokenID <> tkHex) and
            (fTokenID <> tkFloat)) then // invalid octal char
             fTokenID:= tkUnknown;
     'a'..'d', 'A'..'D':
        if fTokenID <> tkHex then // invalid char
          Break;
      'e', 'E':
        if (fTokenID <> tkHex) then
          if CharInSet(FLine[Pred(Run)], ['0'..'9']) then // exponent
          begin
            for i:= idx1 to Pred(Run) do
              if CharInSet(FLine[i], ['e', 'E']) then // too many exponents
              begin
                fTokenID:= tkUnknown;
                Exit;
              end;
            if not IsDigitPlusMinusChar(Succ(Run)) then
              Break
            else
              fTokenID:= tkFloat
          end
          else // invalid char
            Break;
      'f', 'F':
        if fTokenID <> tkHex then
        begin
          for i:= idx1 to Pred(Run) do
            if CharInSet(FLine[i], ['f', 'F']) then // declaration syntax error
            begin
              fTokenID:= tkUnknown;
              Exit;
            end;
          if fTokenID = tkFloat then
          begin
            if CharInSet(fLine[Pred(Run)], ['l', 'L']) then // can't mix
              Break;
          end
          else
            fTokenID:= tkFloat;
        end;
      'l', 'L':
        begin
          for i:= idx1 to Run - 2 do
            if CharInSet(FLine[i], ['l', 'L']) then // declaration syntax error
            begin
              fTokenID:= tkUnknown;
              Exit;
            end;
          if fTokenID = tkFloat then
            if CharInSet(fLine[Pred(Run)], ['f', 'F']) then // can't mix
              Break;
        end;
      'u', 'U':
        if fTokenID = tkFloat then // not allowed
          Break
        else
          for i:= idx1 to Pred(Run) do
            if CharInSet(FLine[i], ['u', 'U']) then // declaration syntax error
            begin
              fTokenID:= tkUnknown;
              Exit;
            end;
      'x', 'X':
        if (Run = Succ(idx1)) and   // 0x... 'x' must be second char
           (FLine[idx1] = '0') and  // 0x...
           IsHexDigit(Succ(Run)) then // 0x... must be continued with a number
             fTokenID:= tkHex
           else // invalid char
           begin
             if not IsIdentChar(fLine[Succ(Run)]) and
                CharInSet(FLine[Succ(idx1)], ['x', 'X']) then
             begin
               Inc(Run); // highlight 'x' too
               fTokenID:= tkUnknown;
             end;
             Break;
           end;
    end; // case
    Inc(Run);
  end; // while

  if IsAlphaUncerscore(Run) then
    fTokenID:= tkUnknown;
end;

procedure TSynRSyn.SpaceProc;
begin
  Inc(Run);
  fTokenID:= tkSpace;
  while (FLine[Run] <= #32) and
        not IsLineEnd(Run) do
    Inc(Run);
end;

procedure TSynRSyn.String34Proc;

  // J.C.Faria
  function IsTheEndOfString: Boolean;
  begin
    Result:= False;

    case fLine[Run] of
      #34: if fLine[Run-1] = '\' then Result:= False
      else
        Result:= True;
    end;
  end;

begin
  fTokenID:= tkString;

  repeat
    case FLine[Run] of
      #0, #10, #13: begin
                      fStringStarter:= #34;
                      fRange:= rsMultilineString;
                      Break;
                    end;
               {')': begin  // (") cases
                     if (Fline[Run-2] = '(') then begin
                        fTokenID:= tkSymbol;
                        Exit;
                      end;
                    end;}
      else
        Inc(Run);
    end; //case
  //until FLine[Run] = #34
  until IsTheEndOfString = True;  //J.C.Faria

  if FLine[Run] <> #0 then
    Inc(Run);
end;

procedure TSynRSyn.String39Proc;
begin
  // J.C.Faria
  fTokenID:= tkString;

  // Trying a pattern (after and before ') of all shortened forms
  case Fline[Run+1] of
    'd': if CharInSet(Fline[Run-1], ['I', 'u', 'e', 't', 'y']) and
            (Fline[Run+2] = #0) or
            (Fline[Run+2] = ' ') then fTokenID:= tkUnknown;

    'l': if (Fline[Run+2] = 'l') and
            CharInSet(Fline[Run-1], ['I', 'u', 'e', 'y']) and
            (Fline[Run+3] = #0) or
            (Fline[Run+3] = ' ') then fTokenID:= tkUnknown;

    'm': if (Fline[Run-1] = 'I') then fTokenID:= tkUnknown;

    'r': if (Fline[Run+2] = 'e') and
            CharInSet(Fline[Run-1], ['u', 'e', 'y']) and
            (Fline[Run+3] = #0) or
            (Fline[Run+3] = ' ') then fTokenID:= tkUnknown;

    's': if CharInSet(Fline[Run-1], ['e', 't']) or
            (Fline[Run-1] <> ' ') and
            (Fline[Run+2] = #0) or
            (Fline[Run+2] = ' ') then fTokenID:= tkUnknown;

    't': if (Fline[Run-1] = 'n') and
            (Fline[Run+2] = #0) or
            (Fline[Run+2] = ' ') then fTokenID:= tkUnknown;

    'v': if (Fline[Run+2] = 'e') and
            CharInSet(Fline[Run-1], ['I', 'u', 'e', 'y']) and
            (Fline[Run+3] = #0) or
            (Fline[Run+3] = ' ') then fTokenID:= tkUnknown;

    ' ': if (Fline[Run-1] = 's') and
            (Fline[Run+1] = ' ') then fTokenID:= tkIdentifier;  // as in: pen's Jonh's Swami's ...

     #0: if (Fline[Run-1] = 's') then fTokenID:= tkIdentifier;  // ' in end of line as in: pencils' #10#13

    {')': if (Fline[Run-1] = '(') then fTokenID:= tkSymbol;  // (') cases}
  end;  //case

  // If the 'case' condition above set to tkUnknown: inc(Run) and Exit
  if (fTokenID <> tkString) then begin
    Inc(Run);
    Exit;
  end;

  repeat
    case FLine[Run] of
      #0, #10, #13 : begin
        //if fTokenID = tkUnknown then Break;  // J.C.Faria: End of line and not start tkString -> It is necessary to force to break!
        fStringStarter:= #39;
        fRange:= rsMultilineString;
        Break;
      end;
      else
        Inc(Run);
    end; //case
  until (FLine[Run] = #39) and
        (FLine[Run + 1] <> #39);  // It is necessary due to scape \ in some args, for example: read.table(quote='\'');

  if (FLine[Run] <> #0) then
    Inc(Run);
end;

procedure TSynRSyn.StringEndProc(EndChar: WideChar);
begin
  if fRange = rsMultilineString then
    fTokenID:= tkString;

  case FLine[Run] of
    #0: begin
          NullProc;
          Exit;
        end;

    #10: begin
           LFProc;
           Exit;
         end;

    #13: begin
           CRProc;
           Exit;
         end;
  end;

  if fRange = rsMultilineString then
    repeat
      if FLine[Run] = fStringStarter then begin
        Inc(Run);
        fRange:= rsUnknown;
        EXIT;
      end
      else
        Inc(Run);
    until IsLineEnd(Run);
end;

procedure TSynRSyn.UnknownProc;
begin
  Inc(Run);
  fTokenID:= tkUnknown;
end;

procedure TSynRSyn.Next;
begin
  fTokenPos:= Run;

  case fRange of
    rsMultilineString: StringEndProc(fStringStarter);
    else
      case fLine[Run] of
        '~', '$', '?', '!', '=', '|',
        '^', '*', '+', '-', '&', '<',
        '>', ':', '/', '%': OperatorProc;

        '{', '}', '(', ')', '[', ']',
        ';', ',': SymbolProc;

        '#': CommentProc;

        'A'..'Z', 'a'..'z', '_', 'À'..'Ö', 'Ø'..'ö', 'ø'..'ÿ': IdentProc;

        '.', '0'..'9': NumberProc;

        #0: NullProc;

        #1..#9, #11, #12, #14..#32: SpaceProc;

        #10: LFProc;

        #13: CRProc;

        #34: String34Proc;  // double quote

        #39: String39Proc;  // single quote

        else UnknownProc;
      end;
  end;
  inherited;
end;

function TSynRSyn.GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT:    Result:= fCommentAttri;
    SYN_ATTR_KEYWORD:    Result:= fProgramingAttri;
    SYN_ATTR_WHITESPACE: Result:= fSpaceAttri;
    SYN_ATTR_SYMBOL:     Result:= fSymbolAttri;
  else
    Result:= nil;
  end;
end;

function TSynRSyn.GetEol: Boolean;
begin
  Result:= Run = fLineLen + 1;
end;

function TSynRSyn.GetRange: Pointer;
begin
  Result:= Pointer(fRange);
end;

function TSynRSyn.GetTokenID: TtkTokenKind;
begin
  Result:= fTokenId;
end;

function TSynRSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case fTokenID of
    tkComment:             Result:= fCommentAttri;
    tkNote:              Result:= fNoteAttri;
    tkNote_1:              Result:= fNote_1Attri;
    tkNote_2:              Result:= fNote_2Attri;
    tkIdentifier:          Result:= fIdentifierAttri;
    tkPrograming:          Result:= fProgramingAttri;
    tkFunctions:           Result:= fFunctionsAttri;
    tkDatasets:            Result:= fDatasetsAttri;
    tkPlotting:            Result:= fPlottingAttri;
    tkNumber:              Result:= fNumberAttri;
    tkHex:                 Result:= fHexAttri;
    tkOct:                 Result:= fOctalAttri;
    tkFloat:               Result:= fFloatAttri;
    tkSpace:               Result:= fSpaceAttri;
    tkString:              Result:= fStringAttri;
    tkSymbol:              Result:= fSymbolAttri;
    tkOperator:            Result:= fOperatorAttri;
  else
    Result:= nil;
  end;
end;

function TSynRSyn.GetTokenKind: integer;
begin
  Result:= Ord(fTokenId);
end;

procedure TSynRSyn.ResetRange;
begin
  fRange:= rsUnknown;
end;

procedure TSynRSyn.SetRange(Value: Pointer);
begin
  fRange:= TRangeState(Value);
end;

function TSynRSyn.IsFilterStored: Boolean;
begin
  Result:= fDefaultFilter <> SYNS_FilterR;
end;

class function TSynRSyn.GetLanguageName: string;
begin
  Result:= SYNS_LangR;
end;

function TSynRSyn.GetSampleSource: UnicodeString;
begin
  Result:=
    '# R highlighter sample                      # Comment'#13#10 +
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
    'NA; NULL; TRUE; T; FALSE; F; if; tryCatch   # Programing'#13#10 +
    #13#10 +
    'mean(Y); var(Y); sd(Y)                      # Function'#13#10 +
    'xtfrm.numeric_version                       # Function'#13#10 +
    'as.data.frame.model.matrix                  # Function'#13#10 +
    'as.character.numeric_version                # Function'#13#10 +
    #13#10 +
    'plot(Y ~ X, ylab = ''Y'', xlab = ''X'',         # Plotting'#13#10 +
    '     col = ''blue'', cex = 0.5, pch = ''*'')'#13#10 +
    #13#10 +
    'airquality; iris; Harman74.cor              # Datasets'#13#10 +
    #13#10 +
    'cat(''\nI - Basics measures:''); cat(''\n\n'')  # String'#13#10 +
    'he''s isn''t we''ve they''d (''all not string'')  # Shorttned forms'#13#10 +
    'string <- "This is" ''a string''              # String';
end;

class function TSynRSyn.GetFriendlyLanguageName: UnicodeString;
begin
  Result:= SYNS_FriendlyLangR;
end;

initialization
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynRSyn);
{$ENDIF}
finalization
  GlobalKeywords.Free;
end.
