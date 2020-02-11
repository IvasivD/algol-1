unit ExtStream;

interface

uses
  Classes, ActiveX;

type
  TExternStream = class(TStream)
  protected
    FSource : IStream;
    procedure SetSize(const NewSize: Int64); override;
  public
    constructor Create(Source : IStream);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
  end;
implementation

{ TExternStream }
constructor TExternStream.Create(Source: IStream);
begin
  inherited Create;
  FSource := Source;
end;
destructor TExternStream.Destroy;
begin
  FSource := nil;
  inherited;
end;
function TExternStream.Read(var Buffer; Count: Integer): Longint;
begin
  if FSource.Read(@Buffer, Count, @Result) <> S_OK
  then
    Result := 0;
end;
function TExternStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  FSource.Seek(Offset, byte(Origin), Result);
end;
procedure TExternStream.SetSize(const NewSize: Int64);
begin
  FSource.SetSize(NewSize);
end;
function TExternStream.Write(const Buffer; Count: Integer): Longint;
begin
  if FSource.Write(@Buffer, Count, @Result) <> S_OK
  then
    Result := 0;
end;

end.
 