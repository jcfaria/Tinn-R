unit SMCnst;

interface

{Chinese GB strings}

const
  strMessage = '��ӡ...';
  strSaveChanges = '�Ƿ�ȷ�ϱ����������ݿ���?';
  strErrSaveChanges = '����ʧ��, �������ݿ�����.';
  strDeleteWarning = '�Ƿ�ȷ��ɾ���� %s?';
  strEmptyWarning = '�Ƿ�ȷ����ձ� %s?';

const
  PopUpCaption: array [0..24] of string[33] =  // I think "string" is better
   ('���Ӽ�¼',
    '�����¼',
    '�༭��¼',
    'ɾ����¼',
    '-',
    '��ӡ...',
    '����...',
    '����...',
    '����...',
    '-',
    '������',
    '����������',
    'ˢ��',
    '-',
    '��¼ѡȡ',
       'ѡȡ��ǰ��¼',
       'ȫѡ',
       '-',
       '��ѡȡ��ǰ��¼',
       'ȫ��ѡ',
    '-',
    '�����в���',
    '�ָ��в���',
    '-',
    '����...');

const //for TSMSetDBGridDialog
  SgbTitle = ' ���� ';
  SgbData = ' ���� ';
  STitleCaption = '����:';
  STitleAlignment = '����:';
  STitleColor = '����:';
  STitleFont = '����:';
  SWidth = '���:';
  SWidthFix = '�ַ�';
  SAlignLeft = '��';
  SAlignRight = '��';
  SAlignCenter = '����';

const //for TSMDBFilterDialog
  strEqual = '����';
  strNonEqual = '������';
  strNonMore = '������';
  strNonLess = '��С��';
  strLessThan = 'С��';
  strLargeThan = '����';
  strExist = 'Ϊ��';
  strNonExist = '��Ϊ��';
  strIn = '���б���';
  strBetween = '�ڷ�Χ��';
  strLike = '����'; // ģ��ƥ��

  strOR = '����';
  strAND = '����';

  strField = '�ֶ�';
  strCondition = '����';
  strValue = 'ֵ';

  strAddCondition = ' �����������:';
  strSelection = ' ѡ����һ�����ļ�¼:';

  strAddToList = '��ӵ��б�';
  strEditInList = '�༭�б���';
  strDeleteFromList = '���б���ɾ��';

  strTemplate = '����ģ��Ի���';
  strFLoadFrom = 'װ��...';
  strFSaveAs = '���Ϊ..';
  strFDescription = '����';
  strFFileName = '�ļ���';
  strFCreate = '����: %s';
  strFModify = '�޸�: %s';
  strFProtect = '��д����';
  strFProtectErr = '�ļ�������!';

const //for SMDBNavigator
  SFirstRecord = '��һ����¼';
  SPriorRecord = '��һ����¼';
  SNextRecord = '��һ����¼';
  SLastRecord = '���һ����¼';
  SInsertRecord = '�����¼';
  SCopyRecord = '���Ƽ�¼';
  SDeleteRecord = 'ɾ����¼';
  SEditRecord = '�༭��¼';
  SFilterRecord = '��������';
  SFindRecord = '���Ҽ�¼';
  SPrintRecord = '��ӡ��¼';
  SExportRecord = '������¼';
  SPostEdit = '������';
  SCancelEdit = 'ȡ�����';
  SRefreshRecord = 'ˢ������';
  SChoice = 'ѡ��һ����¼';
  SClear = '���ѡ���¼';
  SDeleteRecordQuestion = 'ɾ����¼?';
  SDeleteMultipleRecordsQuestion = '�Ƿ�ȷ��ɾ��ѡȡ�ļ�¼?';
  SRecordNotFound = '��¼������';

  SFirstName = '��һ';
  SPriorName = '��һ';
  SNextName = '��һ';
  SLastName = '���';
  SInsertName = '����';
  SCopyName = '����';
  SDeleteName = 'ɾ��';
  SEditName = '�༭';
  SFilterName = '����';
  SFindName = '����';
  SPrintName = '��ӡ';
  SExportName = '����';
  SPostName = '����';
  SCancelName = 'ȡ��';
  SRefreshName = 'ˢ��';
  SChoiceName = 'ѡ��';
  SClearName = '���'; //???

  SBtnOk = 'ȷ��(&O)';
  SBtnCancel = 'ȡ��(&C)';
  SBtnLoad = 'װ��';
  SBtnSave = '����';
  SBtnCopy = '����';
  SBtnPaste = 'ճ��';
  SBtnClear = '���';

  SRecNo = '��¼ ';
  SRecOf = ' �� ';

const //for EditTyped
  etValidNumber = '�Ϸ�������';
  etValidInteger = '�Ϸ�������';
  etValidDateTime = '�Ϸ�������/ʱ��';
  etValidDate = '�Ϸ�������';
  etValidTime = '�Ϸ���ʱ��';
  etValid = '�Ϸ���';
  etIsNot = '����һ��';
  etOutOfRange = 'ֵ %s ������Χ %s..%s';

  SApplyAll = 'Ӧ�õ�����';

implementation

end.