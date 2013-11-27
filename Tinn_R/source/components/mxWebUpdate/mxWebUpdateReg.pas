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

Unit mxWebUpdateReg;

Interface

{$I MAX.INC}

// *************************************************************************************
// ** Component registration
// *************************************************************************************

Procedure Register;

Implementation

// *************************************************************************************
// ** List of used units
// *************************************************************************************

Uses SysUtils,
     Classes,
{$IFDEF Delphi6_Up}
     DesignIntf,
     DesignEditors,
{$ELSE}
     Dsgnintf,
{$ENDIF}
     Dialogs,
     Forms,
     mxWebUpdate,
     mxWebUpdateAbout;

Type

     TDesigner = IDesigner;

{$IFDEF Delphi6_Up}
     TFormDesigner = IDesigner;
{$ELSE}
     TFormDesigner = IFormDesigner;
{$ENDIF}

// *************************************************************************************
// ** Component Editor
// *************************************************************************************

     TmxWebUpdateEditor = Class( TComponentEditor )

          Function GetVerbCount: integer; Override;
          Function GetVerb( Index: integer ): String; Override;
          Procedure ExecuteVerb( Index: integer ); Override;
     End;

// *************************************************************************************
// ** GetVerbCount
// *************************************************************************************

Function TmxWebUpdateEditor.GetVerbCount: integer;
Begin
     Result := 1;
End;

// *************************************************************************************
// ** GetVerb
// *************************************************************************************

Function TmxWebUpdateEditor.GetVerb( Index: integer ): String;
Begin
     Case Index Of
          0: Result := 'WebUpdate (C) 2002-2005 Bitvadász Kft.';
     End;
End;

// *************************************************************************************
// ** ExecuteVerb
// *************************************************************************************

Procedure TmxWebUpdateEditor.ExecuteVerb( Index: integer );
Begin
     Case Index Of
          0: ShowAboutBox( 'Max''s WebUpdate Component' );
     End;
End;

// *************************************************************************************
// ** Register, 4/5/01 11:46:42 AM
// *************************************************************************************

Procedure Register;
Begin
     RegisterComponents( 'Max', [ TmxWebUpdate ] );
     RegisterComponentEditor( TmxWebUpdate, TmxWebUpdateEditor );
End;

End.

