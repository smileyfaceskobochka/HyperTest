unit uPict;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfPict = class(TForm)
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    pic:TBitmap;
  end;

var
  fPict: TfPict;

implementation

{$R *.dfm}

procedure TfPict.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    pic.Free;
end;

procedure TfPict.FormShow(Sender: TObject);
begin
    fPict.Width:=pic.Width+5;
    fPict.Height:=pic.Height+33;
    image1.Picture.Bitmap:=pic;
end;

end.
