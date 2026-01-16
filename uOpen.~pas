unit uOpen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, FileCtrl;

type
  TfOpenTest = class(TForm)
    fl: TFileListBox;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOpenTest: TfOpenTest;

implementation

{$R *.dfm}

procedure TfOpenTest.FormShow(Sender: TObject);
begin
  if fl.Items.Count>0 then fl.Selected[0]:=true;
end;

end.
