unit Twain;

interface

uses Windows, Graphics;

type
  PDIB              =  Pointer;

type
  TCallBackfunction        = function (I        : Smallint;
                                      d_object : longint): Smallint cdecl;
  TWAINDibCallBackfunction = function (HDIB     : Thandle;
                                      d_object : longint): Smallint cdecl;

implementation

var
 CrdeDLLHandle    : THandle;
 //TIFFDLLHandle    : THandle;
 //DXFDLLHandle     : THandle;

const
{$IFDEF WIN32}
       {$IFDEF ILTRIAL}
           ImageLibDLL = 'CRDEV3DE.DLL';
           TIFFDLL = 'I3TIF32D.DLL';
           DXFDLL  = 'I3DXF32D.DLL';
           DLeft   = ' days left to order ImageLib. Call (818) 766-3900 or (800) 404-3832';
       {$ELSE}
           ImageLibDLL = 'CRDE96V3.DLL';
           TIFFDLL = 'I3TIF32.DLL';
           DXFDLL  = 'I3DXF32.DLL';
       {$ENDIF}
{$ELSE}
       {$IFDEF ILTRIAL}
           ImageLibDLL = 'CRDE31DE.DLL';
           TIFFDLL = 'I3TIF16D.DLL';
           DXFDLL  = 'ILDXF16.DLL';
           DLeft   = ' days left to order ImageLib. Call (818) 766-3900 or (800) 404-3832';
       {$ELSE}
           ImageLibDLL = 'CRDE31V3.DLL';
           TIFFDLL = 'I3TIF16.DLL';
           DXFDLL  = 'ILDXF16.DLL';
       {$ENDIF}
{$ENDIF}

function GetDllProc(Var DllHandle : THandle;
                        DllName   : String;
                        ProcName  : String;
                    Var FarProc   : Pointer) : Boolean; forward;

function LowLevelDIBScan(Var  BitMap : TBitmap;
                              iLeft,
                              iTop,
                              iright,
                              iBottom     : Single;
                              iDPI,
                              iResolution,
                              iDither,
                              iBrightness,
                              iContrast,
                              iPages,
                              iPixtypes,
                              iFlags      : Integer;
                              TwainCall   : TWAINDibCallBackfunction;
                              FCallBack   : TCallBackfunction;
                              d_object    : longint) : boolean;

Var
  MultiDib: HGlobal;
  Dib  : PDib;
  Hw   : THandle;
  HPAL : HPalette;
  hBMP : HBitmap;
  Res  : SmallInt;
begin
 if not GetDllProc(CRDEDllHandle, ImageLibDLL, 'twain_nu_dib', @twain_nu_dib) then begin
      result:=false;
      FreeMyLibrary(CRDEDllHandle);
      exit;
 end;
 MultiDib:=0;
 Hw:=GetActiveWindow;
 ILProgressMessage:=LoadResString(@PMScanning);
 try
  Res := twain_nu_dib(Hw, 
                      TWLG_USA,  {Language}
                      TWCY_USA,  {iCountry}
                      iLeft,
                      iTop,
                      iright,
                      iBottom,
                      SmallInt(iDPI),
                      SmallInt(iResolution),
                      SmallInt(iDither),
                      SmallInt(iBrightness),
                      SmallInt(iContrast),
                      SmallInt(iPages),
                      SmallInt(iPixtypes),
                      SmallInt(iFlags),
                      @MultiDib,    {Pointer to Dib Handle Only if one page}
                      TwainCall,    {TWAINDibCallBackfunction}
                      FCallBack,    {TCallBackfunction}
                      d_object,
                      ShowErrorInDll);{ShowDllErrorMsg}
 except
    FreeMyLibrary(CRDEDllHandle);
    ShowMessage(LoadResString(@iERDLLError));
    Result:=False;
    exit;
 end;
 If Res < 0 then begin
   DllErrorProc(Res);
   FreeMyLibrary(CRDEDllHandle);
   Result:=False
 end else begin
   Result:=True;
   FreeMyLibrary(CRDEDllHandle);
   if assigned(TwainCall) then exit;
   Dib:=GlobalLock(MultiDib);
   if Dib = nil then exit;
   DIBTODDB(Dib,hBMP,HPAL);
   GlobalFreePtr(Dib);
   Bitmap.Handle := hBMP;
   Bitmap.Palette := HPAL;
 end;
{$IFDEF ILTRIAL}
 Validate;
{$ENDIF}
end;

end.
 