unit CSAPI;

//{$A-}

//* CSAPI.H - API entry header file for CSAPI
//*
//* See Csapi.Doc for details on the CSAPI.
//* Note that the double slash comment // should not be used in this file
//*  since THINK_C does not support this format.
//*/

interface

uses
  Windows;

///* CSAPILOC.H is not part of the public CSAPI,
//   normally CSAPILOC_H shouldn't be defined */
//#ifndef CSAPILOC_H
//#ifdef WIN
//#define Windows(x)        x
//#define NotWindows(x)
//#define Dos(x)
//#define NotDos(x)         x
//#define Macintosh(x)
//#define NotMacintosh(x)   x
//#endif
//#ifdef MAC
//#define Windows(x)
//#define NotWindows(x)     x
//#define Dos(x)
//#define NotDos(x)         x
//#define Macintosh(x)      x
//#define NotMacintosh(x)
//#endif
//#ifdef DOS
//#define Windows(x)
//#define NotWindows(x)     x
//#define Dos(x)            x
//#define NotDos(x)
//#define Macintosh(x)
//#define NotMacintosh(x)   x
//#endif
//#endif /* CSAPILOC_H */


type
//* Typedefs: Note: Also in csapiloc.h (ensure always match) */
//#ifndef CSAPILOC_H
//#ifdef NT
//typedef unsigned     MDR;            	/* main dictionary reference*/
  TMDR = Cardinal;
//typedef unsigned     UDR;            	/* user dictionary reference*/
  TUDR = Cardinal;
//#else
//typedef unsigned short    MDR;			/* main dictionary reference*/
//typedef unsigned short    UDR;          /* user dictionary reference*/
//#endif
//typedef unsigned short    SCCC;         /* Spell Check Command Code */
  TSCCC = Word;

///* SPLID is the replacement for SID due to a conflict with the Windows NT
//	header files.  References to sid i.e. sidSA are left unchanged for
//	the sake of less required code changes. */
//typedef unsigned long     SPLID;        /* Spell Id type */
  TSPLID = Cardinal;
//typedef unsigned short    SCIS;         /* SpellCheckInputStatus*/
  TSCIS = Word;
//typedef unsigned short    SCRS;         /* SpellCheckReturnStatus */
  TSCRS = Word;

//typedef unsigned short LID;  			/* two byte language identifier code */
  TLID = Word;

///* Comment out duplicate definitions as needed */
//typedef unsigned char CHAR;
//typedef unsigned char BYTE;
//typedef unsigned short WORD;
//typedef short BOOL;

///* All undefined or unused chars should be mapped to bIgnore. */
//typedef struct WizSpecChars
//{
//	BYTE bIgnore;
//	BYTE bHyphenHard;
//	BYTE bHyphenSoft;
//	BYTE bHyphenNonBreaking;
//	BYTE bEmDash;
//	BYTE bEnDash;
//	BYTE bEllipsis;
//	BYTE rgLineBreak[2];
//	BYTE rgParaBreak[2];
//}WSC;
  TWSC = packed record
    bIgnore,
    bHyphenHard,
    bHyphenSoft,
    bHyphenNonBreaking,
    bEmDash,
    bEnDash,
    bEllipsis: Char;
    rgLineBreak: array[0..1]of Char;
    rgParaBreak: array[0..1]of Char;
  end;

//#ifndef FAR
//#ifdef MAC
//#define FAR
//#else
//#define FAR  far
//#endif
//#endif


//#endif /* CSAPILOC_H */


///************************** Structure Typedefs *************/

//typedef WORD SEC;  /* Spell Error Code.  Low byte for major code, High byte for minor.*/
  TSEC = Word;

//typedef struct SpellInputBuffer
//{
//    unsigned short       cch;        /* Total characters in buffer area  */
//    unsigned short       cMdr;       /* Count of MDR's specified in lrgMdr */
//    unsigned short       cUdr;       /* Should not reference Exclusion UDR's.
//	                                     Count of UDR's specified in lrgUdr */
//	unsigned short       wSpellState; /* State relative to previous SpellCheck() call */
//    CHAR       FAR       *lrgch;     /* ptr to buf area of text to be spell checked */
//    MDR        FAR       *lrgMdr;    /* List of main dicts to use when spelling the buffer */
//    UDR        FAR       *lrgUdr;    /* Should not reference Exclusion UDR's.
//	                                     List of user dicts to use when spelling the buffer */
//} SIB;
//typedef SIB FAR * LPSIB;
  TSIB = packed record
    cch: Word;
    cMdr,
    cUdr: Word;
    wSpellState: Word;
    lrgch: PChar;
    lrgMdr: ^TMDR;
    lrgUdr: ^TUDR;
  end;
  PSIB = ^TSIB;

//typedef struct SpellReturnBuffer
//{
//	/* These fields are set by the SpellCheck() function */
//    /* reference word in error or flagged into SIB. */
//    unsigned short       ichError;   /*position in the SIB */
//    unsigned short       cchError;   /*Length of error "word" in SIB.*/
//
//    /* These fields are set by the SpellCheck() function. */
//    SCRS                 scrs;       /*spell check return status. Set by SC()*/
//    unsigned short       csz;        /*count of sz's put in buffer. Set by SC*/
//    unsigned short       cchMac;     /* Current total of chars in buffer. */
//
//
//	/* These fields MUST be set by the app, NULL pointers are invalid */
//    unsigned short       cch;        /* total space in lrgch.  Set by App. */
//    CHAR     FAR         *lrgsz;     /* ptr to alternatives.
//                                        format: word\0word\0...word\0\0*/
//    BYTE     FAR         *lrgbRating;/* ptr to Rating value for each sugg. returned.
//										Parallel to lrgsz array.  Allocated by App.*/
//    unsigned short       cbRate;     /* Number of elements in lrgbRating.
//	                                    Set by App. lrgbRating must be this long.*/
//} SRB;
//typedef SRB FAR * LPSRB;
  TSRB = packed record
    ichError: Word;
    cchError: Word;
    scrs: TSCRS;
    csz: Word;
    cchMac: Word;
    cch: Word;
    lrgsz: PChar;
    lrgbRating: ^Byte;
    cbRate: Word;
  end;
  PSRB= ^TSRB;

//typedef struct mdrs
//{
//    MDR                  mdr;
//    LID                  lid;
//    UDR                  udrExc;
//} MDRS;
//typedef MDRS FAR * LPMDRS;
  TMDRS = packed record
    mdr: TMDR;
    lid: TLID;
    udrExc: TUDR;
  end;
  PMDRS = ^TMDRS;

//#ifndef MAC
//typedef CHAR FAR * LPSPATH;    /* ptr to full Sz path string. */
//#else
//typedef struct spath
//    {
//    short volRefNum;
//	long dirID;
//    CHAR *lpszFilePath;        /* lpSzFile is local Sz path string for MAC,
//                                  it is the local file path which will be
//                                  used with the volRefNum.
//                               */
//    } SPATH;
//typedef SPATH * LPSPATH;
//#endif /* !MAC */
  TLPSPATH = PChar;

const
///*-------------------------------------------------------*/
///* All Defines*/

///* Explicit word delimeters. */
//#define chSpaceSpell   0x20    /* ' ' space.  Also used to delimit
//                                  "change always" pairs */
  chSpaceSpell = #$20;
//#define chTabSpell     0x09    /* TAB.  Can be word delimeter or a
//                                  string delimiter for "change once" lists.*/
  chTabSpell = #$09;
///*** Additional Word Delimeters. */
///* [] {} () <> /  EmDash EnDash Ellipsis New_Paragraph */

//#define chLParenSpell       0x28
//#define chRParenSpell       0x29
//#define chLBracketSpell     0x7B
//#define chRBracketSpell     0x7D
//#define chLBraceSpell       0x5B
//#define chRBraceSpell       0x5D
//#define chLessThanSpell     0x3C
//#define chGreaterThanSpell  0x3E
//#define chForwardSlashSpell 0x2F
  chLParenSpell = #$28;
  chRParenSpell = #$29;
  chLBracketSpell = #$7B;
  chRBracketSpell = #$7D;
  chLBraceSpell = #$5B;
  chRBraceSpell = #$5D;
  chLessThanSpell = #$3C;
  chGreaterThanSpell = #$3E;
  chForwardSlashSpell = #$2F;


///* Spell Id Engine Defines */
//#define sidSA    1    /* SoftArt */
//#define sidHM    2    /* Houghton-Mifflin (InfoSoft) */
//#define sidML    3    /* MicroLytics */
//#define sidLS    4    /* LanSer Data */
//#define sidCT    5    /* Center of Educational Technology */
//#define sidHS    6    /* HSoft */
//#define sidMO    7    /* MorphoLogic */
//#define sidTI    8    /* TiP */
//#define sidKF    9    /* Korea Foreign Language University */
//#define sidPI   10    /* Priberam Informatica Lince */
//#define sidGS   11    /* Glyph Systems */
//#define sidRA   12    /* Radiar */
//#define sidIN   13    /* Intracom */
  sidSA = 1;
  sidHM = 2;
  sidML = 3;
  sidLS = 4;
  sidCT = 5;
  sidHS = 6;
  sidMO = 7;
  sidTI = 8;
  sidKF = 9;
  sidPI = 10;
  sidGS = 11;
  sidRA = 12;
  sidIN = 13;


///* IPG two byte language id's.  Returned in LID field. */
//#define lidAmerican         0x0409  /* "AM" American English   */
//#define lidAustralian       0x0c09  /* "EA" English Australian */
//#define lidBritish          0x0809  /* "BR" English            */
//#define lidCatalan          0x0403  /* "CT" Catalan            */
//#define lidDanish           0x0406  /* "DA" Danish             */
//#define lidDutch            0x0413  /* "NL" Dutch              */
//#define lidFinnish          0x040b  /* "FI" Finish             */
//#define lidFrench           0x040c  /* "FR" French             */
//#define lidFrenchCanadian   0x0c0c  /* "FC" French Canadian    */
//#define lidGerman           0x0407  /* "GE" German             */
//#define lidItalian          0x0410  /* "IT" Italian            */
//#define lidNorskBokmal      0x0414  /* "NO" Norwegian Bokmal   */
//#define lidNorskNynorsk     0x0814  /* "NN" Norwegian Nynorsk  */
//#define lidPortBrazil       0x0416  /* "PB" Portuguese Brazil  */
//#define lidPortIberian      0x0816  /* "PT" Portuguese Iberian */
//#define lidSpanish          0x040a  /* "SP" Spanish            */
//#define lidSwedish          0x041d  /* "SW" Swedish            */
//#define lidRussian          0x0419  /* "RU" Russian            */
//#define lidCzech            0x0405  /* "CZ" Czech              */
//#define lidHungarian        0x040e  /* "HU" Hungarian          */
//#define lidPolish           0x0415  /* "PL" Polish             */
  lidAmerican       = $0409;
  lidAustralian     = $0c09;
  lidBritish        = $0809;
  lidCatalan        = $0403;
  lidDanish         = $0406;
  lidDutch          = $0413;
  lidFinnish        = $040b;
  lidFrench         = $040c;
  lidFrenchCanadian = $0c0c;
  lidGerman         = $0407;
  lidItalian        = $0410;
  lidNorskBokmal    = $0414;
  lidNorskNynorsk   = $0814;
  lidPortBrazil     = $0416;
  lidPortIberian    = $0816;
  lidSpanish        = $040a;
  lidSwedish        = $041d;
  lidRussian        = $0419;
  lidCzech          = $0405;
  lidHungarian      = $040e;
  lidPolish         = $0415;

//#define LID_UNKNOWN 		0xffff
//#define lidUnknown			0xffff
  lidUnknown        = $FFFF;

///* Ram Cache User Dictionary Reference. */
//#define udrChangeOnce       0xfffc  /* UDR reserved reference for Change Once list    */
//#define udrChangeAlways     0xfffd  /* UDR reserved reference for Change Always list  */
//#define udrIgnoreAlways     0xfffe  /* UDR reserved reference for Ingore Always list. */
  udrChangeOnce = $FFFC;
  udrChangeAlways = $FFFD;
  udrIgnoreAlways = $FFFE;

///* Word List property types.  Note: Code relies on being == to above udr's! */
//#define ChangeOnceProp       udrChangeOnce
//#define ChangeAlwaysProp     udrChangeAlways
//#define IgnoreAlwaysProp     udrIgnoreAlways
  ChangeOnceProp = udrChangeOnce;
  ChangeAlwaysProp = udrChangeAlways;
  IgnoreAlwaysProp = udrIgnoreAlways;

///* Bitfield definitions for SpellInit() Status */
//#define fscisWildCardSupport        0x0001
//#define fscisMultiDictSupport       0x0002
//#define fscisHyphenationSupport     0x0004
//#define scisNULL                    0x0000
  fscisWildCardSupport = $0001;
  fscisMultiDictSupport = $0002;
  fscishyphenationSupport = $0004;
  scisNull = $0000;

///* Spell Check Command Definitions */
//#define sccVerifyWord        1
//#define sccVerifyBuffer      2
//#define sccSuggest           3
//#define sccSuggestMore       4
//#define sccHyphInfo          5
//#define sccWildcard			 6
//#define sccAnagram			 7
  sccVerifyWord = 1;
  sccVerifyBuffer = 2;
  sccSuggest = 3;
  sccSuggestMore = 4;
  sccHyphInfo = 5;
  sccWildCard = 6;
  sccAnagram = 7;

///* Flag values for SpellState field in Sib. */
//#define fssIsContinued            0x0001
//    /* Call is continuing from where last call returned.  Must be cleared
//       for first call into SpellCheck().
//    */
  fssIsContinued = $0001;

//#define fssStartsSentence         0x0002
//   /* First word in buffer is known to be start of
//      sentence/paragraph/document.  This is only used if the
//      fSibIsContinued bit is not set.  It should not be needed if the
//      fSibIsContinued bit is being used.  If this bit is set during a
//      suggestion request, suggestions will be capitalized.
//   */
  fssStartsSentence = $0002;

//#define fssIsEditedChange         0x0004
//   /* The run of text represented in the SIB is a change from either
//      a change pair (change always or change once) edit, or from a
//      user specified change, possibly from a suggestion list presented
//      to the user.  This text should be checked for repeat word
//      problems, and possibly sentence status, but should not be subject
//      to subsequent spell verification or change pair substitutions.
//      Note that if an app is not using the fSibIsContinued support,
//      they do not need to pass in these edited changes, thus bypassing
//      the potential problem, and working faster.
//   */
  fssIsEditedChange = $0004;

//#define fssNoStateInfo            0x0000
//   /* App is responsible for checking for all repeat word and sentence
//	  punctuation, and avoiding processing loops such as change always
//	  can=can can.
//   */
///* End of Sib Spell State flag definitions. */
  fssNoStateInfo = $0000;


///* Spell Check return status identifiers */
//#define scrsNoErrors                      0  /* All buffer processed. */
//#define scrsUnknownInputWord              1  /* Unknown word. */
//#define scrsReturningChangeAlways         2  /* Returning a Change Always word in SRB. */
//#define scrsReturningChangeOnce           3  /* Returning a Change Once word in SRB. */
//#define scrsInvalidHyphenation            4  /* Error in hyphenation point.*/
//#define scrsErrorCapitalization           5  /* Cap pattern not valid. */
//#define scrsWordConsideredAbbreviation    6  /* Word is considered an abbreviation. */
//#define scrsHyphChangesSpelling           7  /* Word changes spelling when not hyphenated. */
//#define scrsNoMoreSuggestions             8  /* All methods used. */
//#define scrsMoreInfoThanBufferCouldHold   9  /* More return data than fit in buffer */
//#define scrsNoSentenceStartCap           10  /* Start of sentence was not capitalized. */
//#define scrsRepeatWord                   11  /* Repeat word found. */
//#define scrsExtraSpaces                  12  /* Too many spaces for context.*/
//#define scrsMissingSpace                 13  /* Too few space(s) between words or sentences. */
//#define scrsInitialNumeral				 14  /* Word starts with numeral & soFlagInitialNumeral set */
  scrsNoErrors                    = 0;
  scrsUnknownInputWord            = 1;
  scrsReturningChangeAlways       = 2;
  scrsReturningChangeOnce         = 3;
  scrsInvalidHyphenation          = 4;
  scrsErrorCapitalization         = 5;
  scrsWordConsideredAbbreviation  = 6;
  scrsHyphChangesSpelling         = 7;
  scrsNoMoreSuggestions           = 8;
  scrsMoreInfoThanBufferCouldHold = 9;
  scrsNoSentenceStartCap          =10;
  scrsRepeatWord                  =11;
  scrsExtraSpaces                 =12;
  scrsMissingSpace                =13;
  scrsInitialNumeral		  =14;

///* Spell Error Codes */
//#define secNOERRORS                 0
  secNoErrors = 0;
///* Major Error Codes. Low Byte of SEC*/
//#define secOOM                      1
//#define secModuleError              2  /* Something wrong with parameters, or state of spell module. */
//#define secIOErrorMdr               3  /* Read,write,or share error with Mdr. */
//#define secIOErrorUdr               4  /* Read,write,or share error with Udr. */
  secOOM = 1;
  secModuleError = 2;
  secIOErrorMdr = 3;
  secIOErrorUdr = 4;

///* Minor Error Codes. Not set unless major code also set. */
///* High Byte of SEC word var. */
//#define secModuleAlreadyBusy      (128<<8)   /* For non-reentrant code */
//#define secInvalidID              (129<<8)   /* Not yet inited or already terminated.*/
//#define secInvalidWsc             (130<<8)	/* Illegal values in WSC struct */
//#define secInvalidMdr             (131<<8)   /* Mdr not registered with spell session */
//#define secInvalidUdr             (132<<8)   /* Udr not registered with spell session */
//#define secInvalidSCC             (133<<8)   /* SCC unknown (spellcheck() only ) */
//#define secInvalidMainDict        (134<<8)   /* Specified dictionary not correct format */
//#define secOperNotMatchedUserDict (135<<8)   /* Illegal operation for user dictionary type. */
//#define secFileReadError          (136<<8)   /* Generic read error */
//#define secFileWriteError         (137<<8)   /* Generic write error */
//#define secFileCreateError        (138<<8)   /* Generic create error */
//#define secFileShareError         (139<<8)   /* Generic share error */
//#define secModuleNotTerminated    (140<<8)   /* Module not able to be terminated completely.*/
//#define secUserDictFull           (141<<8)   /* Could not update Udr without exceeding limit.*/
//#define secInvalidUdrEntry        (142<<8)   /* invalid chars in string(s) */
//#define secUdrEntryTooLong        (143<<8)   /* Entry too long, or invalid chars in string(s) */
//#define secMdrCountExceeded       (144<<8)   /* Too many Mdr references */
//#define secUdrCountExceeded       (145<<8)   /* Too many udr references */
//#define secFileOpenError          (146<<8)   /* Generic Open error */
//#define secFileTooLargeError	  (147<<8)	 /* Generic file too large error */
//#define secUdrReadOnly            (148<<8)   /* Attempt to add to or write RO udr */
  secModuleAlreadyBusy     =(128 shl 8);
  secInvalidID             =(129 shl 8);
  secInvalidWsc            =(130 shl 8);
  secInvalidMdr            =(131 shl 8);
  secInvalidUdr            =(132 shl 8);
  secInvalidSCC            =(133 shl 8);
  secInvalidMainDict       =(134 shl 8);
  secOperNotMatchedUserDict=(135 shl 8);
  secFileReadError         =(136 shl 8);
  secFileWriteError        =(137 shl 8);
  secFileCreateError       =(138 shl 8);
  secFileShareError        =(139 shl 8);
  secModuleNotTerminated   =(140 shl 8);
  secUserDictFull          =(141 shl 8);
  secInvalidUdrEntry       =(142 shl 8);
  secUdrEntryTooLong       =(143 shl 8);
  secMdrCountExceeded      =(144 shl 8);
  secUdrCountExceeded      =(145 shl 8);
  secFileOpenError         =(146 shl 8);
  secFileTooLargeError	   =(147 shl 8);
  secUdrReadOnly           =(148 shl 8);


///* Spell Options bitfield definitions */
//#define soSuggestFromUserDict    0x0001 /* Scan Udr's as well as Mdr(s) */
//#define soIgnoreAllCaps          0x0002 /* Ignore a word if all upppercase.*/
//#define soIgnoreMixedDigits      0x0004 /* Ignore word if has any numbers in it.*/
//#define soIgnoreRomanNumerals    0x0008 /* Ignore word composed of all roman numerals.*/
//#define soFindUncappedSentences  0x0010 /* Flag sentences which don't start with a cap.*/
//#define soFindMissingSpaces      0x0020 /* Find missing spaces between words/sentences. */
//#define soFindRepeatWord         0x0040 /* CSAPI to flag repeated words. */
//#define soFindExtraSpaces        0x0080 /* CSAPI to flag extra spaces between words.*/
//#define soFindSpacesBeforePunc   0x0100 /* CSAPI to flag space preceeding certain
//                                           punc.  ex. (the ) is flagged.
//                                           the following chars are flagged.
//                                           ) ] } > , ; % . ? !
//                                        */
//#define soFindSpacesAfterPunc    0x0200 /* CSAPI to flag space after certain
//                                           punc. ex. ( the) is flagged.  The
//                                           following chars are flagged.
//                                           ( [ { $
//                                        */
//#define soRateSuggestions        0x0400
//   /* All suggestions returned should be given some scaled value
//      corresponding to liklihood of being correct alternative.
//      Scale is 1..255, 255 most likely correction and 1 least likely
//   */
//#define soFindInitialNumerals	 0x0800 /* Flag words starting with number(s) */
//#define soReportUDHits           0x1000 /* Report (via scrsNoErrorsUDHit) where
//										*  user dict was used during verification
//										*/
//#define soQuickSuggest           0x2000 /* Don't use typo suggest code (Soft-Art only) */
//#define soUseAllOpenUdr          0x4000 /* Automatically use all udr's opened
//										* after this option is set, or all opened udr's
//										* with mdr's opened after this option is set.
//										* This option does not allow exclusion dicts to
//										* be edited.
//										* (HM only)
//										*/
//#define soSwapMdr                0x8000 /* Keep the most recent 2 mdr's around.
//										* swap between them instead of actually closing
//										* and reopening mdr's.
//										* (HM only)
//										*/
//#define soSglStepSugg           0x10000 /* Break after each suggestion task for faster
//										* return of control to the application.
//										* (HM only)
//										*/
//
//#define soLangMode                    0xF0000000L /* Language Mode mask */
///* Hebrew Language Modes -- (CT only) */
//#define soHebrewFullScript            0x00000000L
//#define soHebrewPartialScript         0x10000000L
//#define soHebrewMixedScript           0x20000000L
//#define soHebrewMixedAuthorizedScript 0x30000000L
///* French Language Modes -- (HM only) */
//#define soFrenchDialectDefault        0x00000000L
//#define soFrenchUnaccentedUppercase   0x10000000L
//#define soFrenchAccentedUppercase     0x20000000L
///* Russian Language Modes -- (HM only) */
//#define soRussianDialectDefault       0x00000000L
//#define soRussianIE                   0x10000000L
//#define soRussianIO                   0x20000000L
  soSuggestFromUserDict  = $0001;
  soIgnoreAllCaps        = $0002;
  soIgnoreMixedDigits    = $0004;
  soIgnoreRomanNumerals  = $0008;
  soFindUncappedSentences= $0010;
  soFindMissingSpaces    = $0020;
  soFindRepeatWord       = $0040;
  soFindExtraSpaces      = $0080;
  soFindSpacesBeforePunc = $0100;
  soFindSpacesAfterPunc  = $0200;
  soRateSuggestions      = $0400;
  soFindInitialNumerals	 = $0800;
  soReportUDHits         = $1000;
  soQuickSuggest         = $2000;
  soUseAllOpenUdr        = $4000;
  soSwapMdr              = $8000;
  soSglStepSugg         = $10000;
  soLangMode            = $F0000000;
  soHebrewFullScript          = $00000000;
  soHebrewPartialScript       = $10000000;
  soHebrewMixedScript         = $20000000;
  soHebrewMixedAuthorizedScript = $30000000;
  soFrenchDialectDefault      = $00000000;
  soFrenchUnaccentedUppercase = $10000000;
  soFrenchAccentedUppercase   = $20000000;
  soRussianDialectDefault     = $00000000;
  soRussianIE                 = $10000000;
  soRussianIO                 = $20000000;


//#ifdef DEBUG
//
//#define sdcDumpRCAll     200
//#define sdcDumpRCIgnore  201
//#define sdcDumpRCOnce    202
//#define sdcDumpRCAlways  203
//
//#define sdcDumpUdrAll    300
//#define sdcDumpUdr1      301
//#define sdcDumpUdr2      302
//#define sdcDumpUdr3      303
//#define sdcDumpUdr4      304
//
//#define sdcDumpMdrAll    400
//#define sdcDumpMdr1      401
//#endif /* DEBUG */
  sdcDumpRCAll   = 200;
  sdcDumpRCIgnore= 201;
  sdcDumpRCOnce  = 202;
  sdcDumpRCAlways= 203;
  sdcDumpUdrAll  = 300;
  sdcDumpUdr1    = 301;
  sdcDumpUdr2    = 302;
  sdcDumpUdr3    = 303;
  sdcDumpUdr4    = 304;
  sdcDumpMdrAll  = 400;
  sdcDumpMdr1    = 401;

//#ifndef PASCAL
//#define PASCAL pascal
//#endif
type
//#define GLOBAL		FAR PASCAL
//#define GLOBALSEC	SEC FAR PASCAL

//#ifdef MAC

///******************* Exported function prototypes **********************/
//extern GLOBALSEC SpellVer(         WORD FAR *lpwVer,
//                                   WORD FAR *lpwIdEngine,
//                                   WORD FAR *lpwSpellType);
  TSpellVerFunc = function (var Ver, IdEngine, SpellType: Word): TSEC; cdecl;
//extern GLOBALSEC SpellInit(        SPLID FAR *lpSid,
//                                   WSC FAR  *lpWsc);
  TSpellInitFunc = function (var Sid: TSPLID; var Wsc: TWSC): TSEC; cdecl;
//extern GLOBALSEC SpellOptions(     SPLID    splid,
//                                   long     lSpellOptions);
  TSpellOptionsFunc = function (splid: TSPLID; SpellOptions: Integer): TSEC; cdecl;
//extern GLOBALSEC SpellCheck(       SPLID    splid,
//                                   SCCC     iScc,
//                                   LPSIB    lpSib,
//                                   LPSRB    lpSrb);
  TSpellCheckFunc = function (splid: TSPLID; Scc: TSCCC; var Sib: TSIB;
                              var Srb: TSRB): TSEC; cdecl;
//extern GLOBALSEC SpellTerminate(   SPLID    splid,
//                                   BOOL     fForce);
  TSpellTerminateFunc = function(splid: TSPLID; Force: Boolean): TSEC; cdecl;
//extern GLOBALSEC SpellVerifyMdr(   LPSPATH  lpspathMdr,
//				   LID		lidExpected,
//                                   LID FAR  *lpLid);
  TSpellVerifyMdrFunc = function(PathMdr: PChar; LidExpected: TLID; var Lid: TLID): TSEC; cdecl;
//extern GLOBALSEC SpellOpenMdr(     SPLID    splid,
//                                   LPSPATH  lpspathMain,
//                                   LPSPATH  lpspathExc,
//                                   BOOL     fCreateUdrExc,
//				   BOOL		fCache,
//				   LID		lidExpected,
//                                   LPMDRS   lpMdrs);
  TSpellOpenMdrFunc = function(splid: TSPLID; PathMain, PathExc: PChar; CreateUdrExc,
                           Cache: Boolean; lidExpected: TLID; var Mdrs: TMDRS): TSEC; cdecl;
//extern GLOBALSEC SpellOpenUdr(     SPLID    splid,
//                                   LPSPATH  lpspathUdr,
//                                   BOOL     fCreateUdr,
//                                   WORD     udrpropType,
//                                   UDR FAR  *lpUdr,
//				   BOOL FAR *lpfReadonly);
  TSpellOpenUdrFunc = function(splid: TSPLID; PathUdr: PChar; CreateUdr: Boolean;
                               udrPropType: Word; var Udr: TUDR; var ReadOnly: Boolean): TSEC; cdecl;
//extern GLOBALSEC SpellAddUdr(      SPLID    splid,
//                                   UDR      udr,
//                                   CHAR FAR *lpszAdd);
  TSpellAddUdrFunc = function(splid: TSPLID; udr: TUDR; Add: PChar): TSEC; cdecl;
//extern GLOBALSEC SpellAddChangeUdr(SPLID    splid,
//                                   UDR      udr,
//                                   CHAR FAR *lpszAdd,
//                                   CHAR FAR *lpszChange);
  TSpellAddChangeUdrFunc = function(splid: TSPLID; udr: TUDR; Add, Change: PChar): TSEC; cdecl;
//extern GLOBALSEC SpellDelUdr(      SPLID    splid,
//                                   UDR      udr,
//                                   CHAR FAR *lpszDel);
  TSpellDelUdrFunc = function(splid: TSPLID; udr: TUDR; Del: PChar): TSEC; cdecl;
//extern GLOBALSEC SpellClearUdr(    SPLID    splid,
//                                   UDR      udr);
  TSpellClearUdrFunc = function(splid: TSPLID; udr: TUDR): TSEC; cdecl;
//extern GLOBALSEC SpellGetSizeUdr(  SPLID    splid,
//                                   UDR      udr,
//                                   WORD FAR  *lpcWords);
  TSpellGetSizeUdrFunc = function(splid: TSPLID; udr: TUDR; var Words): TSEC; cdecl;
//extern GLOBALSEC SpellGetListUdr(  SPLID    splid,
//                                   UDR      udr,
//                                   WORD     iszStart,
//                                   LPSRB    lpSrb);
  TSpellGetListUdrFunc = function(splid: TSPLID; udr: TUDR; Start: Word; var Srb: TSRB): TSEC; cdecl;
//extern GLOBALSEC SpellCloseMdr(    SPLID    splid,
//                                   LPMDRS   lpMdrs);
  TSpellCloseMdrFunc = function(splif: TSPLID; var Mdrs: TMDRS): TSEC; cdecl;
//extern GLOBALSEC SpellCloseUdr(    SPLID    splid,
//                                   UDR      udr,
//                                   BOOL     fForce);
  TSpellCloseUdrFunc = function(splid: TSPLID; udr: TUDR; Force: Boolean): TSEC; cdecl;
//extern Handle HCsapiResInit(char *stzFileName, short vRef, long dirId);
  THCsapiResInit = function(FileName: PChar; vRef: SmallInt; dirId: Integer): THandle; cdecl;
//extern void CsapiResTerm(void);
  TCsapiResTermProc = procedure; cdecl;
//extern void CsapiResFlush(void);
  TCsapiResFlushProc = procedure; cdecl;

implementation

end.
