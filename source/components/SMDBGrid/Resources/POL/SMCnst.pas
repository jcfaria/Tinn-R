unit SMCnst;

interface

{Polish strings}
const
  strMessage = 'Wydruk...';
  strSaveChanges = 'Prosz� potwierdzi� zapis zmian na serwerze.';
  strErrSaveChanges = 'Brak mo�liwo�ci zapisu danych! Sprawd� po��czenie z serwerem lub poprawno�� danych.';
  strDeleteWarning = 'Prosz� potwierdzi� usuni�cie tabeli %s.';
  strEmptyWarning = 'Prosz� potwierdzi� usuni�cie rekord�w z tabeli %s.';

const
  PopUpCaption: array [0..24] of string[40] =
   ('Dodawanie rekordu',
    'Wstawianie rekordu',
    'Edycja rekordu',
    'Kasowanie rekordu',
    '-',
    'Wydruk ...',
    'Eksport ...',
    'Filtr ...',
    'Wyszukiwanie ...',
    '-',
    'Zapis zmian',
    'Odrzucenie zmian',
    'Od�wie�enie',
    '-',
    'Wyb�r/Odrzucenie wyboru rekord�w',
       'Wyb�r rekordu',
       'Wyb�r wszystkich rekord�w',
       '-',
       'Odrzucenie wyboru rekordu',
       'Odrzucenie wyboru wszystkich rekord�w',
    '-',
    'Zapis uk�adu kolumn',
    'Przywr�cenie uk�adu kolumn',
    '-',
    'Ustawienia...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Tytu� ';
  SgbData = ' Data ';
  STitleCaption = 'Napis:';
  STitleAlignment = 'Wyr�wnanie:';
  STitleColor = 'T�o:';
  STitleFont = 'Czcionka:';
  SWidth = 'Szeroko��:';
  SWidthFix = 'znaki';
  SAlignLeft = 'Do lewej';
  SAlignRight = 'Do prawej';
  SAlignCenter = 'Wy�rodkowanie';

const //for TSMDBFilterDialog
  strEqual = 'r�wny';
  strNonEqual = 'r�ny';
  strNonMore = 'nie wi�kszy ni�';
  strNonLess = 'nie mniejszy ni�';
  strLessThan = 'mniejszy ni�';
  strLargeThan = 'wi�kszy ni�';
  strExist = 'pusty';
  strNonExist = 'nie pusty';
  strIn = 'na li�cie';
  strBetween = 'pomi�dzy';
  strLike = 'zawiera';

  strOR = 'OR';
  strAND = 'AND';

  strField = 'Pole';
  strCondition = 'Warunek';
  strValue = 'Warto��';

  strAddCondition = ' Zdefiniuj warunek dodatkowy:';
  strSelection = ' Wybierz rekordy za pomoc� dodatkowych warunk�w:';

  strAddToList = 'Dodaj do listy';
  strEditInList = 'Edytuj w li�cie';
  strDeleteFromList = 'Usu� z listy';

  strTemplate = 'Okno do okre�lenia szablonu filtra';
  strFLoadFrom = 'Wprowad� z ...';
  strFSaveAs = 'Zapisz jako...';
  strFDescription = 'Opis';
  strFFileName = 'Nazwa zbioru';
  strFCreate = 'Utworzono: %s';
  strFModify = 'Zmodyfikowano: %s';
  strFProtect = 'Zabezpieczenie przed zapisem';
  strFProtectErr = 'Zbi�r jest zabezpieczony!';

const //for SMDBNavigator
  SFirstRecord = 'Pierwszy rekord';
  SPriorRecord = 'Poprzedni rekord';
  SNextRecord = 'Nast�pny rekord';
  SLastRecord = 'Ostatni rekord';
  SInsertRecord = 'Wstawianie rekordu';
  SCopyRecord = 'Kopiowanie rekordu';
  SDeleteRecord = 'Kasowanie rekordu';
  SEditRecord = 'Edycja rekordu';
  SFilterRecord = 'Warunki filtra';
  SFindRecord = 'Wyszukanie rekordu';
  SPrintRecord = 'Wydruk rekord�w';
  SExportRecord = 'Eksport rekord�w';
  SPostEdit = 'Zapis zmian';
  SCancelEdit = 'Uniewa�nienie zmian';
  SRefreshRecord = 'Od�wie�enie danych';
  SChoice = 'Wybierz rekord';
  SClear = 'Uniewa�nij wyb�r rekordu';
  SDeleteRecordQuestion = 'Prosz� potwierdzi� usuni�cie rekordu.';
  SDeleteMultipleRecordsQuestion = 'Prosz� potwierdzi� usuni�cie wybranych rekord�w.';
  SRecordNotFound = 'Nie znaleziono rekordu.';

  SFirstName = 'Pierwszy';
  SPriorName = 'Poprzedni';
  SNextName = 'Nast�pny';
  SLastName = 'Ostatni';
  SInsertName = 'Wstawienie';
  SCopyName = 'Kopiowanie';
  SDeleteName = 'Kasowanie';
  SEditName = 'Edycja';
  SFilterName = 'Filtr';
  SFindName = 'Wyszukanie';
  SPrintName = 'Wydruk';
  SExportName = 'Eksport';
  SPostName = 'Zapis';
  SCancelName = 'Anulowanie';
  SRefreshName = 'Od�wie�enie';
  SChoiceName = 'Wyb�r';
  SClearName = 'Wyzerowanie';

  SBtnOk = '&OK';
  SBtnCancel = '&Anuluj';
  SBtnLoad = 'Otwarcie';
  SBtnSave = 'Zapis';
  SBtnCopy = 'Kopiowanie';
  SBtnPaste = 'Wklejenie';
  SBtnClear = 'Wyzerowanie';

  SRecNo = 'rek.';
  SRecOf = ' z ';

const //for EditTyped
  etValidNumber = 'poprawna liczba';
  etValidInteger = 'poprawna liczba ca�kowita';
  etValidDateTime = 'poprawna data/czas';
  etValidDate = 'poprawna data';
  etValidTime = 'poprawny czas';
  etValid = 'poprawny';
  etIsNot = 'nie jest';
  etOutOfRange = 'Warto�� %s jest poza zakresem %s..%s';

const //for DMDBAccessNavigator
  dbanOf = 'z';

  SApplyAll = 'Zastosuj do ca�o�ci';


implementation

end.
