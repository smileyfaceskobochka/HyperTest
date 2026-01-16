unit uHelp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfHelp = class(TForm)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    path:string;
  end;

var
  fHelp: TfHelp;

implementation

{$R *.dfm}

procedure TfHelp.FormShow(Sender: TObject);
begin
     image1.Picture.LoadFromFile(path+'help_f.bmp');
     fHelp.Width:=image1.Width+2;
     fHelp.Height:=image1.Height+2;
end;

end.
