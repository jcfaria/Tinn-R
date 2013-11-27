unit SMCnst;

interface

{Italian strings}
const
  strMessage = 'Stampa...';
  strSaveChanges = 'Salvare le modifiche sul  Database Server?';
  strErrSaveChanges = 'Impeossibile salvare i dati! Controllare la connessione al server o il metodo di verifica dei dati.';
  strDeleteWarning = 'Candellare la tabella %s?';
  strEmptyWarning = 'Svuotare la tabella %s?';

const
  PopUpCaption: array [0..24] of string[33] =
   ('Aggiungi record',
    'Inserisci record',
    'Modifica record',
    'Cancella record',
    '-',
    'Stampa ...',
    'Esporta ...',
    'Filtra ...',
    'Cerca ...',
    '-',
    'Salva modifiche',
    'Annulla modifiche',
    'Rileggi',
    '-',
    'Seleziona / Deseleziona records',
       'Seleziona record',
       'Seleziona tutti i records',
       '-',
       'Deseleziona record',
       'Deseleziona tutti i records',
    '-',
    'Salva colonne',
    'Ripristina colonne',
    '-',
    'Impostazioni...');

const //for TSMSetDBGridDialog
   SgbTitle = 'Titolo';
   SgbData = ' Dati ';
   STitleCaption = 'Intestazione:';
   STitleAlignment = 'Allineamento:';
   STitleColor = 'Sfondo:';
   STitleFont = 'Primo piano:';
   SWidth = 'Altezza:';
   SWidthFix = 'Caratteri';
   SAlignLeft = 'Sinistra';
   SAlignRight = 'Destra';
   SAlignCenter = 'Centro';
   SApplyAll = 'Applica a tutti';   

const //for TSMDBFilterDialog
  strEqual = 'uguale';
  strNonEqual = 'diverso';
  strNonMore = 'minore o uguale';
  strNonLess = 'maggiore  o uguale';
  strLessThan = 'minore';
  strLargeThan = 'maggiore';
  strExist = 'vuoto';
  strNonExist = 'non vuoto';
  strIn = 'nella lista';
  strBetween = 'compreso tra';
  strLike = 'contiene'; //LIKE added for

  strOR = 'OR';
  strAND = 'AND';

  strField = 'Campo';
  strCondition = 'Condizione';
  strValue = 'Valore';

  strAddCondition = ' Imposta altre condizioni:';
  strSelection = ' Seleziona i records in base alle seguenti condizioni:';

  strAddToList = 'Aggiungi';
  strEditInList = 'Modifica';
  strDeleteFromList = 'Elimina';

  strTemplate = 'Finestra filtri';
  strFLoadFrom = 'Carica da...';
  strFSaveAs = 'Salva in..';
  strFDescription = 'Descrizione';
  strFFileName = 'Nome file';
  strFCreate = 'Creato: %s';
  strFModify = 'Modificato: %s';
  strFProtect = 'Protetto da modifiche';
  strFProtectErr = 'Il file e protetto!';

const //for SMDBNavigator
  SFirstRecord = 'Primo record';
  SPriorRecord = 'Record precedente';
  SNextRecord = 'Record successivo';
  SLastRecord = 'Ultimo record';
  SInsertRecord = 'Inserisci record';
  SCopyRecord = 'Copia record';
  SDeleteRecord = 'Cancella record';
  SEditRecord = 'Modifica record';
  SFilterRecord = 'Filtri';
  SFindRecord = 'Ricerca';
  SPrintRecord = 'Stampa records';
  SExportRecord = 'Esporta records';
  SPostEdit = 'Salva modifiche';
  SCancelEdit = 'Elimina modifiche';
  SRefreshRecord = 'Refresh data';
  SChoice = 'Scegli un record';
  SClear = 'Elimina la scelta di un record';
  SDeleteRecordQuestion = 'Cancella il record?';
  SDeleteMultipleRecordsQuestion = 'Cancellare i records selezionati?';
  SRecordNotFound = 'Record non trovato';

  SFirstName = 'Primo';
  SPriorName = 'Prec.';
  SNextName = 'Succ.';
  SLastName = 'Ultimo';
  SInsertName = 'Nuovo';
  SCopyName = 'Copia';
  SDeleteName = 'Elimina';
  SEditName = 'Modifica';
  SFilterName = 'Filtro';
  SFindName = 'Trova';
  SPrintName = 'Stampa';
  SExportName = 'Esporta';
  SPostName = 'Salva';
  SCancelName = 'Annulla';
  SRefreshName = 'Aggiorna';
  SChoiceName = 'Scegli';
  SClearName = 'Cancella';

  SBtnOk = '&OK';
  SBtnCancel = '&Annulla';
  SBtnLoad = 'Apri';
  SBtnSave = 'Salva';
  SBtnCopy = 'Copia';
  SBtnPaste = 'Incolla';
  SBtnClear = 'Svuota';

  SRecNo = 'rec.';
  SRecOf = ' di ';

const //for EditTyped
  etValidNumber = 'numero valido';
  etValidInteger = 'numero intero valido';
  etValidDateTime = 'data/ora valida';
  etValidDate = 'data valida';
  etValidTime = 'ora valida';
  etValid = 'valido';
  etIsNot = 'non e un';
  etOutOfRange = 'Il valore %s non e compreso in %s..%s';


implementation

end.
