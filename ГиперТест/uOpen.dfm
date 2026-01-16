object fOpenTest: TfOpenTest
  Left = 376
  Top = 231
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1090#1077#1089#1090#1072
  ClientHeight = 198
  ClientWidth = 305
  Color = 14201227
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 160
    Width = 289
    Height = 17
    Shape = bsTopLine
    Style = bsRaised
  end
  object fl: TFileListBox
    Left = 8
    Top = 8
    Width = 289
    Height = 145
    ItemHeight = 16
    ShowGlyphs = True
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 168
    Width = 145
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 168
    Width = 137
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
