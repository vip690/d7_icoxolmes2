program holm1;

uses
  Forms,
  Unit1holm in 'Unit1holm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
