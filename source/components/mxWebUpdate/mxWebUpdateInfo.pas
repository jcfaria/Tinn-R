// ****************************************************************************
// * mxWebUpdate Component for Delphi 5,6,7
// ****************************************************************************
// * CopyRight 2002-2005, Bitvadász Kft. All Rights Reserved.
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

Unit mxWebUpdateInfo;

Interface

Uses
     Windows,
     Forms,
     ImgList,
     Controls,
     StdCtrls,
     Graphics,
     ExtCtrls,
     Classes,
     OleCtrls,
     SHDocVw;

Type
     Tfrm_ShowInfoUpdate = Class( TForm )

          Panel_Bottom: TPanel;
          Panel2: TPanel;
          chk_FutureUpdate: TCheckBox;
          btn_OK: TButton;
          btn_Cancel: TButton;
          Panel1: TPanel;
          WebBrowser: TWebBrowser;
          Procedure Panel_BottomResize( Sender: TObject );
     Private

     Public

     End;

//**************************************************************************
//* I M P L E M E N T A T I O N
//**************************************************************************

Implementation

Uses Sysutils;

{$R *.DFM}

Procedure Tfrm_ShowInfoUpdate.Panel_BottomResize( Sender: TObject );
Begin
     btn_OK.Left := ( Panel_Bottom.Width - ( btn_OK.Width + btn_Cancel.Width + 6 ) ) Div 2;
     btn_Cancel.Left := btn_OK.Left + btn_OK.Width + 3;
End;

End.

