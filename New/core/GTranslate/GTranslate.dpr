library GTranslate;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  dxCore,
  Windows,
  SysUtils,
  Dialogs,
  Classes,
  Forms,
  UnitTranslate in '..\Google\UnitTranslate.pas' {FormGtranslater},
  UnitGoogleMaps in '..\Google\UnitGoogleMaps.pas',
  UnitProc in '..\UnitProc.pas',
  uLkJSON in '..\..\JSON\uLkJSON.pas';

{$R *.res}
function GTextTranslate( LngFrom, LngTo, TextForTranslate:WideString;
                         TextNeedConvertToUrl:Boolean ):WideString; stdcall;
var FrmOwner:TForm;
    GoogleTranslate : TGoogleTranslate;
begin
  try
   LoadHromiumLib;
   Application.CreateForm(TForm, FrmOwner);
   GoogleTranslate := TGoogleTranslate.Create( FrmOwner );
   result := GoogleTranslate.Translate( LngFrom, LngTo, TextForTranslate, TextNeedConvertToUrl, optTranslateText );

  finally
    GoogleTranslate.Close;
    FrmOwner.free;
    CloseHromiumLib;
  end;
end;

function GHtmlTranslate( LngFrom, LngTo, TextForTranslate:WideString;
                         TextNeedConvertToUrl:Boolean ):WideString; stdcall;
var FrmOwner:TForm;
    GoogleTranslate : TGoogleTranslate;
begin
  try
   LoadHromiumLib;
   Application.CreateForm( TForm, FrmOwner );
   GoogleTranslate := TGoogleTranslate.Create( FrmOwner );
   result := GoogleTranslate.Translate( LngFrom, LngTo, TextForTranslate, TextNeedConvertToUrl, optTranslateHTML );

  finally
    GoogleTranslate.Close;
    FrmOwner.free;
    CloseHromiumLib;
  end;
end;

exports GTextTranslate,
        GHtmlTranslate;

begin
   dxInitialize;
end.
