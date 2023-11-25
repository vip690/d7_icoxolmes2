program holm2;

uses
  Forms,
  Unit2holm in 'Unit2holm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
