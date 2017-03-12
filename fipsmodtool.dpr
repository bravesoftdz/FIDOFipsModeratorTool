program fipsmodtool;

uses
  Forms,
  mainmodule in 'mainmodule.pas' {Form1},
  modclass in 'modclass.pas',
  paintfidotext in 'paintfidotext.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'F.I.P.S. Moderator''s Tool';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
