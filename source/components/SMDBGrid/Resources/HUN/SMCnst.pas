unit SMCnst;

interface

{Hungarian strings}
const
  strMessage = 'Nyomtat�s...';
  strSaveChanges = 'A v�ltoz�sokat val�ban t�rolni akarod az adatb�zis szerveren?';
  strErrSaveChanges = 'Az adatokat nem lehet menteni! Ellen�rizd a szerver kapcsolatot vagy az adatot!';
  strDeleteWarning = 'Val�ban t�r�lni akarod a(z) %s t�bl�t?';
  strEmptyWarning = 'Val�ban �r�teni akarod a(z) %s t�bl�t?';

const
  PopUpCaption: array [0..22] of string[44] =
   ('�j rekord',
    'Rekord besz�r�s',
    'Rekord jav�t�s',
    'Rekord t�rl�s',
    '-',
    'Nyomtat�s ...',
    'Export ...',
    '-',
    'Jav�t�sok ment�se',
    'Jav�t�sok elhagy�sa',
    'Friss�t�s',
    '-',
    'Rekordok kijel�l�se',
       'Rekord jel�l�se',
       'Minden rekord jel�l�se',
       '-',
       'A rekord jel�l�s megsz�ntet�se',
       'Az �sszes rekord jel�l�s megsz�ntet�se',
    '-',
    'Az oszlop helyzet�nek ment�se',
    'Az oszlop helyzet�nek vissza�ll�t�sa',
    '-',
    'Be�ll�t�s...');

const //for TSMSetDBGridDialog
  SgbTitle = ' C�m ';
  SgbData = ' Adat ';
  STitleCaption = 'Felirat:';
  STitleAlignment = 'Kijel�l�s:';
  STitleColor = 'H�tt�r:';
  STitleFont = 'Bet�:';
  SWidth = 'Sz�less�g:';
  SWidthFix = 'karakter';
  SAlignLeft = 'bal';
  SAlignRight = 'jobb';
  SAlignCenter = 'k�z�p';
  // added Varga Zolt�n varga.zoltan@nml.hu
  SApplyAll ='Mindre';

const //for TSMDBFilterDialog
  strEqual = '= egyenl�';
  strNonEqual = '<> nem egyenl�';
  strNonMore = 'nem nagyobb';
  strNonLess = 'nem kisebb';
  strLessThan = '< kisebb';
  strLargeThan = '> nagyobb';
  strExist = '�res';
  strNonExist = 'nem �res';
  strIn = 'list�ban';
  strBetween = 'k�z�tt';

  strOR = 'VAGY';
  strAND = '�S';

  strField = 'Mez�';
  strCondition = 'Felt�tel';
  strValue = '�rt�k';

  strAddCondition = ' A k�vetkez� felt�tel megad�sa:';
  strSelection = ' A rekord kijel�l�se a k�vetkez� felt�tel szerint:';

  strAddToList = 'Hozz�ad�s a list�hoz';
  strEditInList = 'Lista szerkeszt�se';
  strDeleteFromList = 'T�rl�s a list�b�l';

  strTemplate = 'Sz�r� dial�gus';
  strFLoadFrom = 'Bet�lt...';
  strFSaveAs = 'Ment�s m�s n�ven..';
  strFDescription = 'Ler�s';
  strFFileName = '�llom�ny n�v';
  strFCreate = 'L�trehozva: %s';
  strFModify = 'M�dos�tva: %s';
  strFProtect = '�r�sv�dett';
  strFProtectErr = 'V�dett �llom�ny!';

const //for SMDBNavigator
  SFirstRecord = 'Els� rekord';
  SPriorRecord = 'El�z� rekord';
  SNextRecord = 'K�vetkez� rekord';
  SLastRecord = 'Utols� rekord';
  SInsertRecord = 'Rekord besz�r�sa';
  SCopyRecord = 'Rekord m�sol�sa';
  SDeleteRecord = 'Rekord t�rl�se';
  SEditRecord = 'Rekord jav�t�sa';
  SFilterRecord = 'Sz�r� felt�tel';
  SFindRecord = 'Rekord keres�s';
  SPrintRecord = 'Rekord nyomtsat�s';
  SExportRecord = 'Rekord export�l�sa';
  SPostEdit = 'V�ltoz�sok ment�se';
  SCancelEdit = 'V�ltoz�sok elhagy�sa';
  SRefreshRecord = 'Adatok friss�t�se';
  SChoice = 'Rekord kijel�l�s';
  SClear = 'Rekord kijel�l�s megsz�ntet�se';
  SDeleteRecordQuestion = 'T�rl�d a rekordot?';
  SDeleteMultipleRecordsQuestion = 'Val�ban t�r�lni akarod a kijel�lt rekordokat?';
  SRecordNotFound = 'nincs tal�lat';

  SFirstName = 'Els�';
  SPriorName = 'El�z�';
  SNextName = 'K�vetkez�';
  SLastName = 'Utols�';
  SInsertName = 'Besz�r';
  SCopyName = 'M�sol';
  SDeleteName = 'T�r�l';
  SEditName = 'Jav�t';
  SFilterName = 'Sz�r�';
  SFindName = 'Keres';
  SPrintName = 'Nyomtat';
  SExportName = 'Export';
  SPostName = 'Ment';
  SCancelName = 'Elhagy';
  SRefreshName = 'Friss�t';
  SChoiceName = 'V�laszt';
  SClearName = 'T�r�l';

  SBtnOk = '&OK';
  SBtnCancel = '&Elhagy';
  SBtnLoad = 'T�lt';
  SBtnSave = 'Ment';
  SBtnCopy = 'M�sol';
  SBtnPaste = 'Beilleszt';
  SBtnClear = 'T�r�l';

  SRecNo = ' # ';
  SRecOf = ' / ';

const //for EditTyped
  etValidNumber = '�rv�nyes sz�m';
  etValidInteger = '�rv�nyes eg�sz sz�m';
  etValidDateTime = '�rv�nyes d�tum/id�';
  etValidDate = '�rv�nyes d�tum';
  etValidTime = '�rv�nyes id�';
  etValid = '�rv�nyes';
  etIsNot = 'nem egy';
  etOutOfRange = 'Az �rt�k %s az �rt�khat�ron k�v�l esik %s..%s';

  dbanOf = '';

implementation

end.
