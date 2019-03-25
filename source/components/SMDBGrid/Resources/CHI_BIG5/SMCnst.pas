unit SMCnst;

interface

{Chinese Traditional strings}
const
  strMessage = '�C�L...';
  strSaveChanges = '�T�w�x�s�ܧ���Ʈw?';
  strErrSaveChanges = '�L�k�x�s���! ���ˬd���A���s�u�θ�ƥ��T��.';
  strDeleteWarning = '�T�w�n�R����ƪ� %s?';
  strEmptyWarning = '�T�w�n�M�Ÿ�ƪ� %s?';

const
  PopUpCaption: array [0..24] of string[33] =
   ('�s�W����',
    '���J����',
    '�s�����',
    '�R������',
    '-',
    '�C�L ...',
    '��X ...',
    '�L�o ...',
    '�j�M ...',
    '-',
    '�x�s�ܧ�',
    '�����ܧ�',
    '��s',
    '-',
    '���/������� ����',
       '�������',
       '�����������',
       '-',
       '�����������',
       '���������������',
    '-',
    '�x�s��� layout',
    '�٭���� layout',
    '-',
    '�]�w...');

const //for TSMSetDBGridDialog
  SgbTitle = ' ���D ';
  SgbData = ' ��� ';
  STitleCaption = '���D:';
  STitleAlignment = '���:';
  STitleColor = '�I��:'; 
  STitleFont = '�r��:';
  SWidth = '�e��:';
  SWidthFix = 'characters';
  SAlignLeft = '�V�����';
  SAlignRight = '�V�k���';
  SAlignCenter = '�m�����';
  
const //for TSMDBFilterDialog
  strEqual = '����';
  strNonEqual = '������';
  strNonMore = '���j��';
  strNonLess = '���p��';
  strLessThan = '�p��';
  strLargeThan = '�j��';
  strExist = '�ŭ�';
  strNonExist = '�D�ŭ�';
  strIn = '�b�M�椤';
  strBetween = '����';
  strLike = 'like';

  strOR = '��';
  strAND = '�B';

  strField = '���';
  strCondition = '����';
  strValue = '��';

  strAddCondition = ' �w�q��h����:';
  strSelection = ' �̷ӤU�C�����ܬ���:';

  strAddToList = '�s�W�M��';
  strEditInList = '�s��M��';
  strDeleteFromList = '�R���M��';

  strTemplate = '�L�o�˥�����';
  strFLoadFrom = '���J...';
  strFSaveAs = '�x�s��..';
  strFDescription = '�y�z';
  strFFileName = '�ɮצW��';
  strFCreate = '�s��: %s';
  strFModify = '�ק�: %s';
  strFProtect = '�����мg';
  strFProtectErr = '�ɮפ��i�мg!';

const //for SMDBNavigator
  SFirstRecord = '�Ĥ@������';
  SPriorRecord = '�W�@���O��';
  SNextRecord = '�U�@���O��';
  SLastRecord = '�̫�@���O��';
  SInsertRecord = '�s�W����';
  SCopyRecord = '�ƻs����';
  SDeleteRecord = '�R������';
  SEditRecord = '�s�����';
  SFilterRecord = '�L�o����';
  SFindRecord = '�j�M����';
  SPrintRecord = '�C�L����';
  SExportRecord = '�ץX����';
  SPostEdit = '�x�s�ܧ�';
  SCancelEdit = '�����ܧ�';
  SRefreshRecord = '��s���';
  SChoice = '��ܤ@���O��';
  SClear = '�M�����������';
  SDeleteRecordQuestion = '�R������?';
  SDeleteMultipleRecordsQuestion = '�T�w�n�R�����������?';
  SRecordNotFound = '�䤣�����';

  SFirstName = '�Ĥ@��';
  SPriorName = '�W�@��';
  SNextName = '�U�@��';
  SLastName = '�̫�@��';
  SInsertName = '�s�W';
  SCopyName = '�ƻs';
  SDeleteName = '�R��';
  SEditName = '�s��';
  SFilterName = '�L�o';
  SFindName = '�j�M';
  SPrintName = '�C�L';
  SExportName = '�ץX';
  SPostName = '�x�s';
  SCancelName = '����';
  SRefreshName = '��s';
  SChoiceName = '���';
  SClearName = '�M��';

  SBtnOk = '�T�w (&O)';
  SBtnCancel = '���� (&C)';
  SBtnLoad = '���J';
  SBtnSave = '�x�s';
  SBtnCopy = '�ƻs';
  SBtnPaste = '�K�W';
  SBtnClear = '�M��';

  SRecNo = 'rec.';
  SRecOf = ' of ';

const //for EditTyped
  etValidNumber = '�X�k�Ʀr';
  etValidInteger = '�X�k���';
  etValidDateTime = '�X�k���/�ɶ�';
  etValidDate = '�X�k���';
  etValidTime = '�X�k�ɶ�';
  etValid = '�X�k';
  etIsNot = '���O';
  etOutOfRange = '�ƭ� %s �W�X�d�� %s..%s';

  SApplyAll = '�M�Ψ����';
  
implementation

end.
