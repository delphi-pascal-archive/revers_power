program RevPower;

uses
  Forms,
  Main in 'Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Revers Power';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
