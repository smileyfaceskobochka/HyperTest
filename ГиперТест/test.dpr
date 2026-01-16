program test;

uses
  Forms,
  uMain in 'uMain.pas' {fMain},
  uOpen in 'uOpen.pas' {fOpenTest},
  uPict in 'uPict.pas' {fPict},
  uHelp in 'uHelp.pas' {fHelp},
  uResult in 'uResult.pas' {fmResults};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Экзаменатор v1.0';
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfOpenTest, fOpenTest);
  Application.CreateForm(TfPict, fPict);
  Application.CreateForm(TfHelp, fHelp);
  Application.CreateForm(TfmResults, fmResults);
  Application.Run;
end.
