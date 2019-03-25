// ****************************************************************************
// * mxWebUpdate Component for Delphi 5,6,7
// ****************************************************************************
// * Copyright 2002-2005, Bitvadász Kft. All Rights Reserved.
// ****************************************************************************
// * This component can be freely used and distributed in commercial and
// * private environments, provied this notice is not modified in any way.
// ****************************************************************************
// * Feel free to contact me if you have any questions, comments or suggestions
// * at support@maxcomponents.net
// ****************************************************************************
// * Web page: www.maxcomponents.net
// ****************************************************************************
// * Description:
// *
// * TmxWebUpdate helps you to add automatic update support to your application.
// * It retrieves information from the web, if a newer version available, it
// * can download a file via HTTP and run the update.
// *
// ****************************************************************************

Unit mxWebUpdate;

Interface

Uses
  Windows,
  Messages,
  SysUtils,
  Forms,
  Classes,
  Controls,
  WinInet,
  mxWebUpdateInfo;

{$I MAX.INC}

Const

  mxWebUpdateVersion = $0102;

Type
  TDownloadEvent = Procedure( Sender: TObject; Total, Downloaded: Integer ) Of Object;
  TShowInfoEvent = Procedure( Sender: TObject; Var ShowInfo: Boolean; Var CheckForUpdate: Boolean ) Of Object;
  TAfterShowInfoEvent = Procedure( Sender: TObject; CheckForUpdate: Boolean ) Of Object;
  TGetClientFileNameEvent = Procedure( Sender: TObject; Var FileName: String ) Of Object;
  TDownloadFileEvent = Procedure( Sender: TObject; FileName: String ) Of Object;
  TClientFileExistsEvent = Procedure( Sender: TObject; Var FileName: String; Var Overwrite: Boolean ) Of Object;
  TUpdateAvailableEvent = Procedure( Sender: TObject; ActualVersion, NewVersion: String; Var CanUpdate: Boolean ) Of Object;

  TmxUpdateOption = ( uoRunUpdate, uoTerminate, uoOverwrite );
  TmxUpdateOptions = Set Of TmxUpdateOption;

  TmxVersionFormat = ( vfStandard, vfString, vfNumber );

     // ******************************************************************************
     // ******************************************************************************
     // ******************************************************************************

  TmxProductInfo = Class( TPersistent )
  Private

    FURL: String;
    FVersion: String;
    FVersionFormat: TmxVersionFormat;

    Procedure SetURL( AValue: String );

  Public

    Constructor Create; Virtual;
    Destructor Destroy; Override;

  Published

    Property URL: String Read FURL Write SetURL;
    Property Version: String Read FVersion Write FVersion;
    Property VersionFormat: TmxVersionFormat Read FVersionFormat Write FVersionFormat Default vfStandard;

  End;

     // ******************************************************************************
     // ******************************************************************************
     // ******************************************************************************

  TmxTagInfo = Class( TPersistent )
  Private

    FAuthor: String;
    FEmail: String;
    FClientFileName: String;
    FDownload: String;
    FProductName: String;
    FRedirection: String;
    FRunParameters: String;
    FVersion: String;

  Public

    Constructor Create; Virtual;
    Destructor Destroy; Override;

  Published

    Property Author: String Read FAuthor Write FAuthor Stored True;
    Property Email: String Read FEmail Write FEmail Stored True;
    Property ClientFileName: String Read FClientFileName Write FClientFileName;
    Property Download: String Read FDownload Write FDownload Stored True;
    Property ProductName: String Read FProductName Write FProductName Stored True;
    Property Redirection: String Read FRedirection Write FRedirection Stored True;
    Property RunParameters: String Read FRunParameters Write FRunParameters Stored True;
    Property Version: String Read FVersion Write FVersion Stored True;

  End;

     // ******************************************************************************
     // ******************************************************************************
     // ******************************************************************************

  TmxInfoCaption = Class( TPersistent )
  Private

    FOk: String;
    FCancel: String;
    FCheckforUpdate: String;

  Public

    Constructor Create; Virtual;

  Published

    Property OkButton: String Read FOk Write FOk Stored True;
    Property CancelButton: String Read FCancel Write FCancel Stored True;
    Property CheckForUpdate: String Read FCheckforUpdate Write FCheckforUpdate;

  End;

     // ******************************************************************************
     // ******************************************************************************
     // ******************************************************************************

  TmxWebUpdate = Class( TComponent )
  Private

    FVersion: Integer;
    FProductInfo: TmxProductInfo;
    FTagInfo: TmxTagInfo;
    FOptions: TmxUpdateOptions;
    FInfoCaption: TmxInfoCaption;
    FActive: Boolean;

    FFileName: String;

    FUserName: String;
    FPassword: String;

    FInfo: TStringList;

    FOnDownload: TDownloadEvent;
    FOnDownloadError: TNotifyEvent;
    FOnNoUpdateFound: TNotifyEvent;
    FOnBeforeGetInfo: TNotifyEvent;
    FOnAfterGetInfo: TNotifyEvent;
    FOnCannotExecute: TNotifyEvent;
    FOnBeforeShowInfo: TShowInfoEvent;
    FOnAfterShowInfo: TAfterShowInfoEvent;
    FOnBeforeDownload: TDownloadFileEvent;
    FOnAfterDownload: TDownloadFileEvent;
    FOnClientFileExists: TClientFileExistsEvent;
    FOnGetClientFileName: TGetClientFileNameEvent;

    FOnUpdateAvailable: TUpdateAvailableEvent;

    FAborting: Boolean;

          // *** Info Window ***

    frm_ShowInfoUpdate: Tfrm_ShowInfoUpdate;

          // *** Downloaded information ***

    FProductVersion: String;
    FUpdateURL: String;
    FClientFileName: String;
    FRedirectionURL: String;
    FAuthor: String;
    FEMail: String;
    FProductName: String;
    FRunParameters: String;

          // *** Parameters for Download ***

    FDownloadResult: Boolean;
    FFileSize: Integer;
    FDownloadSize: DWord;
    FDownloadedSize: DWord;

          // *******************************

    Procedure SetVersion( AValue: String );
    Function GetVersion: String;

  Protected

    Procedure DoDownload; Virtual;
    Procedure DoDownloadError; Virtual;
    Procedure DoBeginDownload( Const FileName: String ); Virtual;
    Procedure DoDownloadComplete( Const FileName: String ); Virtual;
    Procedure DoNoUpdateFound; Virtual;
    Procedure DoAfterGetInfo; Virtual;
    Procedure DoBeforeGetInfo; Virtual;
    Procedure DoCannotExecute; Virtual;

    Procedure GetInfoFile;
    Procedure GetUpdateFile;

    Procedure ParseInfoFile;
    Function IsValidUpdate: Boolean;
    Function ShowInformation: Boolean; Virtual;

    Function CreateTempFileName: String; Virtual;
    Procedure ParseURL( AURL: String; Var HostName, FileName: String ); Virtual;
    Procedure DownloadFile( FURL: String; FUserName: String; FPassword: String; FBinary: Boolean; FSaveToFile: Boolean; FFileName: String );

  Public

    Property ProductVersion: String Read FProductVersion;
    Property UpdateURL: String Read FUpdateURL;
    Property ClientFileName: String Read FClientFileName;
    Property RedirectionURL: String Read FRedirectionURL;
    Property Author: String Read FAuthor;
    Property EMail: String Read FEMail;
    Property ProductName: String Read FProductName;
    Property RunParameters: String Read FRunParameters;

    Property Active: Boolean Read FActive;

    Constructor Create( AOwner: TComponent ); Override;
    Destructor Destroy; Override;

    Function CheckForAnUpdate: Boolean;

    Procedure Abort;

  Published

    Property TagInfo: TmxTagInfo Read FTagInfo Write FTagInfo;
    Property ProductInfo: TmxProductInfo Read FProductInfo Write FProductInfo;
    Property InfoCaption: TmxInfoCaption Read FInfoCaption Write FInfoCaption;
    Property UserName: String Read FUserName Write FUserName;
    Property Password: String Read FPassword Write FPassword;
    Property Options: TmxUpdateOptions Read FOptions Write FOptions;
    Property Version: String Read GetVersion Write SetVersion;

    Property OnBeforeDownload: TDownloadFileEvent Read FOnBeforeDownload Write FOnBeforeDownload;
    Property OnAfterDownload: TDownloadFileEvent Read FOnAfterDownload Write FOnAfterDownload;
    Property OnUpdateAvailable: TUpdateAvailableEvent Read FOnUpdateAvailable Write FOnUpdateAvailable;
    Property OnGetClientFileName: TGetClientFileNameEvent Read FOnGetClientFileName Write FOnGetClientFileName;
    Property OnClientFileExists: TClientFileExistsEvent Read FOnClientFileExists Write FOnClientFileExists;
    Property OnBeforeShowInfo: TShowInfoEvent Read FOnBeforeShowInfo Write FOnBeforeShowInfo;
    Property OnAfterShowInfo: TAfterShowInfoEvent Read FOnAfterShowInfo Write FOnAfterShowInfo;
    Property OnBeforeGetInfo: TNotifyEvent Read FOnBeforeGetInfo Write FOnBeforeGetInfo;
    Property OnCannotExecute: TNotifyEvent Read FOnCannotExecute Write FOnCannotExecute;
    Property OnAfterGetInfo: TNotifyEvent Read FOnAfterGetInfo Write FOnAfterGetInfo;
    Property OnNoUpdateFound: TNotifyEvent Read FOnNoUpdateFound Write FOnNoUpdateFound;
    Property OnDownload: TDownloadEvent Read FOnDownload Write FOnDownload;
    Property OnDownloadError: TNotifyEvent Read FOnDownloadError Write FOnDownloadError;

  End;

     // ******************************************************************************
     // ******************************************************************************
     // ******************************************************************************

Implementation

Uses ShellApi;

// *************************************************************************************
// *************************************************************************************
// *************************************************************************************
// * TmxProductInfo
// *************************************************************************************
// *************************************************************************************
// *************************************************************************************

Constructor TmxProductInfo.Create;
Begin
  Inherited Create;

  SetURL( '' );
  FVersion := '1.0';
  FVersionFormat := vfStandard;
End;

Destructor TmxProductInfo.Destroy;
Begin
  Inherited Destroy;
End;

Procedure TmxProductInfo.SetURL( AValue: String );
Begin
  If AnsiCompareText( Copy( AValue, 1, 7 ), 'http://' ) <> 0 Then AValue := 'http://' + AValue;
  FURL := AValue;
End;

// *************************************************************************************
// *************************************************************************************
// *************************************************************************************
// * TmxInfoCaption
// *************************************************************************************
// *************************************************************************************
// *************************************************************************************

Constructor TmxInfoCaption.Create;
Begin
  Inherited Create;

  FOk := 'OK';
  FCancel := 'Cancel';
  FCheckforUpdate := 'Check for updates in the future';
End;

// *************************************************************************************
// *************************************************************************************
// *************************************************************************************
// * TmxTagInfo
// *************************************************************************************
// *************************************************************************************
// *************************************************************************************

Constructor TmxTagInfo.Create;
Begin
  Inherited Create;

  FAuthor := 'mxAuthor';
  FEmail := 'mxEmail';
  FDownload := 'mxDownload';
  FClientFileName := 'mxClientSideName';
  FProductName := 'mxProduct';
  FRedirection := 'mxRedirection';
  FRunParameters := 'mxRunParameters';
  FVersion := 'mxVersion';
End;

Destructor TmxTagInfo.Destroy;
Begin
  Inherited Destroy;
End;

// *************************************************************************************
// *************************************************************************************
// *************************************************************************************
// * TmxWebUpdate
// *************************************************************************************
// *************************************************************************************
// *************************************************************************************

Constructor TmxWebUpdate.Create( AOwner: TComponent );
Begin
  Inherited Create( AOwner );

  FVersion := mxWebUpdateVersion;
  FOptions := [ uoRunUpdate, uoTerminate ];
  FProductInfo := TmxProductInfo.Create;
  FTagInfo := TmxTagInfo.Create;
  FInfoCaption := TmxInfoCaption.Create;

  FRedirectionURL := '';

  FInfo := TStringList.Create;
End;

Destructor TmxWebUpdate.Destroy;
Begin
  Abort;
  FInfo.Free;
  FTagInfo.Free;
  FInfoCaption.Free;
  FProductInfo.Free;
  If Assigned( frm_ShowInfoUpdate ) Then frm_ShowInfoUpdate.Free;
  Inherited Destroy;
End;

Procedure TmxWebUpdate.SetVersion( AValue: String );
Begin
     // *** Does nothing ***
End;

Function TmxWebUpdate.GetVersion: String;
Begin
{$WARNINGS OFF}
  Result := Format( '%d.%d', [ Hi( FVersion ), Lo( FVersion ) ] );
{$WARNINGS ON}
End;

Procedure TmxWebUpdate.Abort;
Begin
  FAborting := True;
End;

Procedure TmxWebUpdate.DoDownloadError;
Begin
  If Assigned( FOnDownloadError ) Then FOnDownloadError( Self );
End;

Procedure TmxWebUpdate.DoBeginDownload( Const FileName: String );
Begin
  If Assigned( FOnBeforeDownload ) Then FOnBeforeDownload( Self, FileName );
End;

Procedure TmxWebUpdate.DoDownloadComplete( Const FileName: String );
Begin
  If Assigned( FOnAfterDownload ) Then FOnAfterDownload( Self, FileName );
End;

Procedure TmxWebUpdate.DoDownload;
Begin
  If Assigned( FOnDownload ) Then FOnDownload( Self, FFileSize, FDownloadedSize );
End;

Procedure TmxWebUpdate.DoNoUpdateFound;
Begin
  If Assigned( FOnNoUpdateFound ) Then FOnNoUpdateFound( Self );
End;

Procedure TmxWebUpdate.DoCannotExecute;
Begin
  If Assigned( FOnCannotExecute ) Then FOnCannotExecute( Self );
End;

Procedure TmxWebUpdate.DoAfterGetInfo;
Begin
  If Assigned( FOnAfterGetInfo ) Then FOnAfterGetInfo( Self );
End;

Procedure TmxWebUpdate.DoBeforeGetInfo;
Begin
  If Assigned( FOnBeforeGetInfo ) Then FOnBeforeGetInfo( Self );
End;

Function TmxWebUpdate.CreateTempFileName: String;
Var
  TempPath: String;
  R: Cardinal;
Begin
  Result := '';
  R := GetTempPath( 0, Nil );
  SetLength( TempPath, R );
{$WARNINGS OFF}
  R := GetTempPath( R, PChar( TempPath ) );
{$WARNINGS ON}

  If R <> 0 Then
  Begin
{$WARNINGS OFF}
    SetLength( TempPath, StrLen( PChar( TempPath ) ) );
{$WARNINGS ON}
    Result := TempPath + FClientFileName;
  End;
End;

Procedure TmxWebUpdate.GetUpdateFile;
Var
  Overwrite: Boolean;
Begin
  FFileName := CreateTempFileName;
  If Assigned( FOnGetClientFileName ) Then FOnGetClientFileName( Self, FFileName );
  FDownloadResult := False;

  If FileExists( FFileName ) Then
  Begin
    Overwrite := uoOverwrite In FOptions;
    If Assigned( FOnClientFileExists ) Then FOnClientFileExists( Self, FFileName, Overwrite );
    If Not Overwrite Then
    Begin
      DoDownloadError;
      Exit;
    End;
  End;

  DoBeginDownload( FFileName );
  DownloadFile( FUpdateURL, FUserName, FPassword, True, True, FFileName );
  DoDownloadComplete( FFileName );
End;

Procedure TmxWebUpdate.ParseInfoFile;
Var
  I: Integer;
  Offset: Integer;
  TagName: String;
  TagLength: Integer;

  Function GetData( ALine: String ): String;
  Var
    Offset: Integer;
    DataLength: Integer;
  Begin
    Offset := Pos( 'CONTENT=', UpperCase( ALine ) ) + 9;
    DataLength := Pos( '"', Copy( ALine, Offset, 255 ) ) - 1;
    Result := Copy( ALine, Offset, DataLength );
  End;

Begin
  FRedirectionURL := '';
  FProductVersion := '';
  FUpdateURL := '';
  FClientFileName := '';
  FAuthor := '';
  FEMail := '';
  FProductName := '';
  FRunParameters := '';

  For I := 0 To FInfo.Count - 1 Do
  Begin
    Offset := Pos( 'META NAME', UpperCase(FInfo.Strings[ I ]) );
    //Offset := Pos( 'meta name', FInfo.Strings[ I ] );  //JCFaria
    If Offset = 0 Then Continue;
    Inc( Offset, 11 );
    TagLength := Pos( '"', Copy( FInfo.Strings[ I ], Offset, 255 ) ) - 1;
    TagName := Copy( FInfo.Strings[ I ], Offset, TagLength );

    If tagName = TagInfo.ProductName Then FProductName := GetData( FInfo.Strings[ I ] );
    If tagName = TagInfo.ClientFileName Then FClientFileName := GetData( FInfo.Strings[ I ] );
    If tagName = TagInfo.Version Then FProductVersion := GetData( FInfo.Strings[ I ] );
    If tagName = TagInfo.Author Then FAuthor := GetData( FInfo.Strings[ I ] );
    If tagName = TagInfo.EMail Then FEMail := GetData( FInfo.Strings[ I ] );
    If tagName = TagInfo.Download Then FUpdateURL := GetData( FInfo.Strings[ I ] );
    If tagName = TagInfo.Redirection Then FRedirectionURL := GetData( FInfo.Strings[ I ] );
    If tagName = TagInfo.RunParameters Then FRunParameters := GetData( FInfo.Strings[ I ] );
  End;
End;

Procedure TmxWebUpdate.GetInfoFile;
Var
  URL: String;
Begin
  FProductVersion := '';
  FUpdateURL := '';
  FAuthor := '';
  FEMail := '';
  FProductName := '';
  FRunParameters := '';

  If FRedirectionURL = '' Then
    URL := FProductInfo.URL Else
    URL := FRedirectionURL;

  DownloadFile( URL, FUserName, FPassword, False, False, '' );

  If FDownloadResult Then
  Begin
    ParseInfoFile;
    If FRedirectionURL <> '' Then GetInfoFile;
  End;
End;

Function TmxWebUpdate.IsValidUpdate: Boolean;
Var
  Version_Actual: String;
  Version_Update: String;
  V_A, V_U: Real;
  Code: Integer;

  Actual_Version: Integer;
  Update_Version: Integer;
  Position_Actual: Integer;
  Position_Update: Integer;
Begin
  Result := False;

  Version_Actual := FProductInfo.Version;
  Version_Update := FProductVersion;

  Case FProductInfo.VersionFormat Of
    vfStandard:
      Begin
        Repeat
          Position_Actual := Pos( '.', Version_Actual );
          Position_Update := Pos( '.', Version_Update );

          If Position_Actual > 0 Then
            Actual_Version := StrToIntDef( Copy( Version_Actual, 1, Position_Actual - 1 ), 0 ) Else
            Actual_Version := StrToIntDef( Version_Actual, 0 );

          If Position_Update > 0 Then
            Update_Version := StrToIntDef( Copy( Version_Update, 1, Position_Update - 1 ), 0 ) Else
            Update_Version := StrToIntDef( Version_Update, 0 );

          If Update_Version > Actual_Version Then
          Begin
            Result := True;
            Exit;
          End;

          If Update_Version < Actual_Version Then
          Begin
            Result := False;
            DoNoUpdateFound;
            Exit;
          End;

          System.Delete( Version_Actual, 1, Position_Actual );
          System.Delete( Version_Update, 1, Position_Update );

        Until Position_Actual = 0;
      End;

    vfString: Result := Version_Update > Version_Actual;
    vfNumber:
      Begin
        Val( Version_Actual, V_A, Code );
        Result := Code = 0;
        If Not Result Then
        Begin
          DoNoUpdateFound;
          Exit;
        End;
        Val( Version_Update, V_U, Code );
        Result := Code = 0;
        If Not Result Then
        Begin
          DoNoUpdateFound;
          Exit;
        End;

        Result := V_U > V_A;
      End;
  End;

  If Not Result Then DoNoUpdateFound;
End;

Function TmxWebUpdate.ShowInformation: Boolean;
Var
  ShowInfo: Boolean;
  Check: Boolean;
Begin
  Result := True;
  ShowInfo := True;
  Check := True;
  If Assigned( FOnBeforeShowInfo ) Then FOnBeforeShowInfo( Self, ShowInfo, Check );
  If Not ShowInfo Then Exit;

  If Not Assigned( frm_ShowInfoUpdate ) Then frm_ShowInfoUpdate := Tfrm_ShowInfoUpdate.Create( Nil );
  frm_ShowInfoUpdate.chk_FutureUpdate.Checked := Check;
  frm_ShowInfoUpdate.btn_OK.Caption := FInfoCaption.OkButton;
  frm_ShowInfoUpdate.btn_Cancel.Caption := FInfoCaption.CancelButton;
  frm_ShowInfoUpdate.chk_FutureUpdate.Caption := FInfoCaption.CheckForUpdate;

  If FRedirectionURL = '' Then
    frm_ShowInfoUpdate.WebBrowser.Navigate( FProductInfo.URL ) Else
    frm_ShowInfoUpdate.WebBrowser.Navigate( FRedirectionURL );

  Result := frm_ShowInfoUpdate.ShowModal = mrOK;

  If Assigned( FOnAfterShowInfo ) Then FOnAfterShowInfo( Self, frm_ShowInfoUpdate.chk_FutureUpdate.Checked );
End;

Procedure TmxWebUpdate.ParseURL( AURL: String; Var HostName, FileName: String );
Var
  I: Integer;
Begin
  If Pos( 'http://', LowerCase( AURL ) ) <> 0 Then System.Delete( AURL, 1, 7 );
  I := Pos( '/', AURL );
  HostName := Copy( AURL, 1, I );
  FileName := Copy( AURL, I, Length( AURL ) - I + 1 );
  If ( Length( HostName ) > 0 ) And ( HostName[ Length( HostName ) ] = '/' ) Then SetLength( HostName, Length( HostName ) - 1 );
End;

Procedure TmxWebUpdate.DownloadFile( FURL: String; FUserName: String; FPassword: String; FBinary: Boolean; FSaveToFile: Boolean; FFileName: String );
Var
{$WARNINGS OFF}
  hSession, hConnect, hRequest: hInternet;
  HostName, FileName: String;
  AcceptType: LPStr;
  Buffer: Pointer;
  BufferLength, Index: DWord;
  Data: Array[ 0..1024 ] Of Char;
  Agent: String;
  InternetFlag: DWord;
  RequestMethod: PChar;
  FReferer: String;
  TempStr: String;
  FStringResult: String;
  F: File;

  Procedure CloseHandles;
  Begin
    InternetCloseHandle( hRequest );
    InternetCloseHandle( hConnect );
    InternetCloseHandle( hSession );
  End;
{$WARNINGS ON}

Begin
  Try
    FAborting := False;
    ParseURL( FURL, HostName, FileName );

    Agent := 'mxWebUpdate';
{$WARNINGS OFF}
    hSession := InternetOpen( PChar( Agent ), INTERNET_OPEN_TYPE_PRECONFIG, Nil, Nil, 0 );
    hConnect := InternetConnect( hSession, PChar( HostName ), INTERNET_DEFAULT_HTTP_PORT, PChar( FUserName ), PChar( FPassword ), INTERNET_SERVICE_HTTP, 0, 0 );

    RequestMethod := 'GET';
    InternetFlag := INTERNET_FLAG_RELOAD;
    AcceptType := PChar( 'Accept: ' + '*/*' );

    hRequest := HttpOpenRequest( hConnect, RequestMethod, PChar( FileName ), 'HTTP/1.0', PChar( FReferer ), @AcceptType, InternetFlag, 0 );

    HttpSendRequest( hRequest, Nil, 0, Nil, 0 );
{$WARNINGS ON}

    If FAborting Then
    Begin
      CloseHandles;
      FDownloadResult := False;
      Exit;
    End;

    Index := 0;
    BufferLength := 1024;
{$WARNINGS OFF}
    GetMem( Buffer, BufferLength );
    FDownloadResult := HttpQueryInfo( hRequest, HTTP_QUERY_CONTENT_LENGTH, Buffer, BufferLength, Index );
{$WARNINGS ON}

    If FAborting Then
    Begin
{$WARNINGS OFF}
      FreeMem( Buffer );
{$WARNINGS ON}
      CloseHandles;
      FDownloadResult := False;
      Exit;
    End;

    If FDownloadResult Or Not FBinary Then
    Begin
{$WARNINGS OFF}
      If FDownloadResult Then FFileSize := StrToInt( StrPas( Buffer ) );
{$WARNINGS ON}

      FDownloadedSize := 0;

      If FSaveToFile Then
      Begin
        AssignFile( F, FFileName );
        ReWrite( F, 1 );
      End
      Else FStringResult := '';

      While True Do
      Begin
        If FAborting Then
        Begin
          If FSaveToFile Then CloseFile( F );
{$WARNINGS OFF}
          FreeMem( Buffer );
{$WARNINGS ON}
          CloseHandles;
          FDownloadResult := False;
          Exit;
        End;

{$WARNINGS OFF}
        If Not InternetReadFile( hRequest, @Data, SizeOf( Data ), FDownloadSize ) Then Break
{$WARNINGS ON}
        Else
        Begin
          If FDownloadSize = 0 Then Break Else
          Begin
{$WARNINGS OFF}
            If FSaveToFile Then BlockWrite( f, Data, FDownloadSize ) Else
{$WARNINGS ON}
            Begin
              TempStr := Data;
              SetLength( TempStr, FDownloadSize );
              FStringResult := FStringResult + TempStr;
            End;

            Inc( FDownloadedSize, FDownloadSize );

            DoDownload;
            Application.ProcessMessages;
          End;
        End;
      End;

      If FSaveToFile Then
      Begin
        FDownloadResult := FFileSize = Integer( FDownloadedSize )
      End
      Else
      Begin
        SetLength( FStringResult, FDownloadedSize );
        FDownloadResult := FDownloadedSize <> 0;
      End;

      If FSaveToFile Then CloseFile( f );
    End;

{$WARNINGS OFF}
    FreeMem( Buffer );
{$WARNINGS ON}
    CloseHandles;

    If FDownloadResult Then
    Begin
      If Not FSaveToFile Then
      Begin
        FInfo.Clear;
        FInfo.Text := FStringResult;
      End;
    End
    Else DoDownloadError;

  Except
    FDownloadResult := False;
  End;
End;

Function TmxWebUpdate.CheckForAnUpdate: Boolean;
Var
  CanUpdate: Boolean;
Begin
  Result := False;

  If FActive Then Exit;
  FActive := True;

  FRedirectionURL := '';

  DoBeforeGetInfo;
  GetInfoFile;
  DoAfterGetInfo;

  If ( FProductName = '' ) Or ( FProductVersion = '' ) Then
  Begin
    DoDownloadError;
    FDownloadResult := False;
  End;

  If Not FDownloadResult Then
  Begin
    FActive := False;
    Exit;
  End;

  If Not IsValidUpdate Then
  Begin
    FActive := False;
    Exit;
  End;

  CanUpdate := True;
  If Assigned( FOnUpdateAvailable ) Then FOnUpdateAvailable( Self, FProductInfo.Version, FProductVersion, CanUpdate );

  If Not CanUpdate Then
  Begin
    FActive := False;
    Exit;
  End;

  If Not ShowInformation Then
  Begin
    FActive := False;
    Exit;
  End;

  GetUpdateFile;
  If Not FDownloadResult Then
  Begin
    FActive := False;
    Exit;
  End;

  If uoRunUpdate In FOptions Then
  Begin
{$WARNINGS OFF}
    If ShellExecute( Application.MainForm.Handle, PChar( 'open' ), PChar( FFileName ), PChar( FRunParameters ), PChar( '' ), SW_SHOWNORMAL ) <= 32 Then DoCannotExecute;
{$WARNINGS ON}
    If uoTerminate In FOptions Then Application.Terminate;
  End;

  FActive := False;
  Result := True;
End;

End.

