unit SMCnst;

interface

{English strings}
const
 strMessage = 'Yazd�r...';
 strSaveChanges = 'Database Server''a bilgileri yazmak istedi�inize emin misiniz?';
 strErrSaveChanges = 'Veriler kaydedilemedi. Veri taban� ba�lant�s�n� ve/veya datalar� kontrol ediniz.';
 strDeleteWarning = '%s tablosunu ger�ekten silmek istiyor musunuz?';
 strEmptyWarning = '%s tablosunu ger�ekten bo�altmak istiyor musunuz?';

const
 PopUpCaption: array [0..24] of string[33] = 
 ('Kay�t ekle', 
 'Araya ekle', 
 'Kayd� d�zelt', 
 'Kayd� sil', 
 '-', 
 'Yazd�r ...', 
 '�hra� ...', 
 'Filtreleme', 
 'Ara-Bul...', 
 '-', 
 'De�i�iklikleri kaydet', 
 'De�i�iklikleri iptal et', 
 'G�r�nt�y� Yenile', 
 '-', 
 'Kayd� se�/se�imi kald�r', 
 'Kayd� se�', 
 'T�m kay�tlar� se�', 
 '-', 
 'Se�imden ��kar', 
 'T�m Kay�t se�imini kald�r', 
 '-', 
 'S�tun yap�s�n� kaydet', 
 'S�tun yap�s�n� y�kle', 
 '-', 
 'Ayarlar...'); 
 
const //for TSMSetDBGridDialog
 SgbTitle = ' Ba�l�k ';
 SgbData = ' Veri ';
 STitleCaption ='Man�et';
 STitleAlignment = 'Y�n:';
 STitleColor = 'Arkaplan';
 STitleFont = 	'Yaz� karakteri';
 SWidth = 	'Geni�lik';
 SWidthFix = 	'karakter';
 SAlignLeft = 	'sol';
 SAlignRight = 'sa�';
 SAlignCenter = 'merkez';
 
const //for TSMDBFilterDialog
 strEqual =	'e�it';
 strNonEqual = 	'e�it de�il';
 strNonMore = 	'daha fazla de�il';
 strNonLess = 'daha az de�il';
 strLessThan = 'daha k���k';
 strLargeThan = 	'daha b�y�k';
 strExist =	'bo�';
 strNonExist = 	'bo� de�il';
 strIn = 'liste i�inde';
 strBetween = 'aras�nda';
 strLike = 'benzer';

 strOR = 	'VEYA';
 strAND = 		'VE';

 strField = 	'Alan';
 strCondition = 	'Kriter';
 strValue =	'De�er';

 strAddCondition = ' Ek kriteri tan�mlay�n:';
 strSelection = ' Di�er kritere dayanarak kay�tlar� se�in: ';
 strAddToList = 'Listeye ekle';
 strEditInList = 'Liste i�inde d�zenle';
 strDeleteFromList = 'Listeden sil';

 strTemplate = '�ablon diyalo�u s�z';
 strFLoadFrom = 'Dosyadan Y�kle';
 strFSaveAs = 'Farkl� kaydet...';
 strFDescription = 'Tan�m';
 strFFileName = 'Dosya ad�';
 strFCreate = '%s Yarat�ld�';
 strFModify = '%s De�i�tirildi';
 strFProtect = 'Yazmaya kar�� korumal�';
 strFProtectErr = 'Dosya korunuyor!';

const //for SMDBNavigator
 SFirstRecord = 	'�lk kay�t';
 SPriorRecord =	'�nceki kay�t';
 SNextRecord =	'Sonraki kay�t';
 SLastRecord =	'Son kay�t';
 SInsertRecord = 	'Kay�t ekle';
 SCopyRecord =		'Kayd� kopyala';
 SDeleteRecord =	'Kayd� sil';
 SEditRecord =	'Kayd� d�zenle';
 SFilterRecord = 	'Kriterlere g�re s�z';
 SFindRecord = 	'Kayd� ara';
 SPrintRecord = 'Kayd� bas';
 SExportRecord = 'Kay�tlar�n ihrac�';
 SPostEdit = 'De�i�iklikleri kaydet';
 SCancelEdit = 'De�i�iklikleri sil';
 SRefreshRecord = 'Veri g�ncelle';
 SChoice ='Bir kay�t se�';
 SClear = 'Se�ili kayd� temizle';
 SDeleteRecordQuestion = 'Kay�t silinsin mi?';
 SDeleteMultipleRecordsQuestion ='Se�ili kayd� silmek istedi�inizden emin misiniz?';
 SRecordNotFound = 'Kay�t bulunamad�';

 SFirstName = '�lk';
 SPriorName = '�nceki';	
 SNextName = 'Sonraki';
 SLastName = 'Son';
 SInsertName = 'Ekle';
 SCopyName = 'Kopyala';
 SDeleteName = 'Sil';
 SEditName = 'D�zenle';
 SFilterName = 'S�z';
 SFindName = 'Bul';
 SPrintName = 'Yazd�r';
 SExportName = 'Ta��';
 SPostName = 'Kaydet';
 SCancelName = '�ptal';
 SRefreshName = 'Yenile';
 SChoiceName ='Se�';
 SClearName = 'Temizle';

 SBtnOk = '&TAMAM';
 SBtnCancel = '&�ptal';
 SBtnLoad = 'Y�kle';
 SBtnSave = 'Kaydet';
 SBtnCopy = 'Kopyala';
 SBtnPaste = 'Yap��t�r';
 SBtnClear = 'Temizle';

 SRecNo = 'Kay�t No.';
 SRecOf = ' / ';
 SApplyAll = 'T�m�ne Uygula';

const //for EditTyped
 etValidNumber = 'gecerli say�';
 etValidInteger = 'gecerli tamsay�';
 etValidDateTime = 'ge�erli tarih/saat';
 etValidDate = 'ge�erli tarih';
 etValidTime = 'ge�erli saat';
 etValid = 'ge�erli';
 etIsNot = 'de�ildir';
 etOutOfRange = '%s de�eri (%s..%s aras�ndan)';
implementation

end.
