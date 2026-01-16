object fMain: TfMain
  Left = 184
  Top = 229
  Width = 1036
  Height = 758
  Caption = #1069#1082#1079#1072#1084#1077#1085#1072#1090#1086#1088' v1.0'
  Color = 14201227
  Constraints.MinHeight = 575
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1028
    704)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 5
    Top = 554
    Width = 999
    Height = 17
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 8
    Top = 12
    Width = 82
    Height = 18
    Caption = #1042#1086#1087#1088#1086#1089' 1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBackground
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 138
    Width = 164
    Height = 18
    Caption = #1042#1072#1088#1080#1072#1085#1090#1099' '#1086#1090#1074#1077#1090#1086#1074
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBackground
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 841
    Top = 12
    Width = 58
    Height = 18
    Anchors = [akTop, akRight]
    Caption = 'Label4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Sh1: TShape
    Left = 8
    Top = 171
    Width = 996
    Height = 340
    Anchors = [akLeft, akTop, akRight, akBottom]
    Brush.Color = 14201227
    Pen.Color = clMedGray
  end
  object Sh2: TShape
    Left = 9
    Top = 172
    Width = 994
    Height = 338
    Anchors = [akLeft, akTop, akRight, akBottom]
    Brush.Color = 14201227
    Pen.Color = clWhite
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 685
    Width = 1028
    Height = 19
    AutoHint = True
    Panels = <>
    SimplePanel = True
  end
  object rg: TRadioGroup
    Left = 8
    Top = 171
    Width = 996
    Height = 338
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object Memo: TMemo
    Left = 5
    Top = 40
    Width = 1001
    Height = 88
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = 16444111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 778
    Top = 584
    Width = 227
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1090#1077#1089#1090' '#1080' '#1087#1086#1082#1072#1079#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
    Enabled = False
    ModalResult = 4
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555590955555555555990F09555555555930F0F095555555900FFF0F0
      95555990FFFF0F0F0955930F0FF0F0F0F09500FFF0FF0FFF0F090FFF0F0FFF0F
      F0F050F0FFF0F0FFFF05550F0F0F0FFF00555550F0FFF000555555550FFF0555
      5555555550005555555555555555555555555555555555555555}
  end
  object sg: TStringGrid
    Left = 0
    Top = 642
    Width = 1028
    Height = 43
    Align = alBottom
    Color = 16444111
    ColCount = 500
    DefaultColWidth = 20
    DefaultRowHeight = 20
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goAlwaysShowEditor]
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 6
    OnClick = sgClick
    OnDrawCell = sgDrawCell
    OnKeyUp = sgKeyUp
    OnMouseUp = sgMouseUp
  end
  object BitBtn4: TBitBtn
    Left = 440
    Top = 528
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Enabled = False
    TabOrder = 7
    OnClick = BitBtn4Click
    Kind = bkOK
  end
  object gbe: TGroupBox
    Left = 8
    Top = 171
    Width = 996
    Height = 340
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    Visible = False
    object Edit1: TEdit
      Left = 300
      Top = 170
      Width = 321
      Height = 21
      TabOrder = 0
    end
  end
  object gb: TGroupBox
    Left = 8
    Top = 171
    Width = 996
    Height = 340
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    DesignSize = (
      996
      340)
    object clb: TCheckListBox
      Left = 17
      Top = 15
      Width = 977
      Height = 323
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      HeaderColor = 14201227
      HeaderBackgroundColor = 14201227
      ItemHeight = 13
      ParentColor = True
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 576
    Top = 528
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1080#1089#1091#1085#1086#1082
    TabOrder = 8
    Visible = False
    OnClick = BitBtn1Click
    Kind = bkIgnore
  end
  object gblb: TGroupBox
    Left = 8
    Top = 171
    Width = 996
    Height = 340
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 9
    Visible = False
    object lb1: TListBox
      Left = 32
      Top = 40
      Width = 400
      Height = 130
      Color = 16444111
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
    end
    object lb2: TListBox
      Left = 578
      Top = 40
      Width = 400
      Height = 130
      Color = 16444111
      ItemHeight = 13
      Sorted = True
      TabOrder = 1
    end
    object lb3: TListBox
      Left = 176
      Top = 211
      Width = 633
      Height = 130
      Color = 16444111
      ItemHeight = 13
      TabOrder = 2
    end
    object BitBtn3: TBitBtn
      Left = 448
      Top = 88
      Width = 113
      Height = 25
      Caption = #1057#1086#1087#1086#1089#1090#1072#1074#1080#1090#1100
      TabOrder = 3
      OnClick = BitBtn3Click
      Kind = bkRetry
    end
    object BitBtn5: TBitBtn
      Left = 400
      Top = 353
      Width = 169
      Height = 25
      Caption = #1056#1072#1079#1073#1080#1090#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077
      TabOrder = 4
      OnClick = BitBtn5Click
      Kind = bkCancel
    end
  end
  object BitBtn6: TBitBtn
    Left = 225
    Top = 528
    Width = 209
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1072#1074#1080#1083#1072' '#1079#1072#1087#1080#1089#1080' '#1092#1086#1088#1084#1091#1083
    TabOrder = 10
    Visible = False
    OnClick = BitBtn6Click
    Kind = bkHelp
  end
  object MainMenu1: TMainMenu
    Left = 472
    Top = 24
    object N3: TMenuItem
      Bitmap.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888880000000000000880BFBFBFBFBFBF0880FBFBFBFBFBF0080FBFBFBFBFB
        FB0080BFBFBFBFBFB0700BFBFBFBFBFB80700FBFBFBFBFBF0770088888888888
        077080BFBFBFBFBF080080FBFBFBFBFBFB0780BFBFBF00000008880BFBF07888
        8888888000078888888888888888888888888888888888888888}
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1090#1077#1089#1090
      Hint = 
        #1050#1083#1080#1082#1085#1080#1090#1077' '#1084#1077#1085#1102' '#1092#1072#1081#1083' '#1095#1090#1086#1073#1099' '#1086#1090#1082#1088#1099#1090#1100' '#1085#1086#1074#1099#1081' '#1090#1077#1089#1090' '#1080#1083#1080' '#1074#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084 +
        #1084#1099
      OnClick = N3Click
    end
    object N1: TMenuItem
      Bitmap.Data = {
        EE000000424DEE0000000000000076000000280000000F0000000F0000000100
        04000000000078000000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3330330000000000033033011111111103303301111111110330330111111111
        033033011111111103303301111111B103303301111111110330330111111111
        033033011EEEEE11033033011EEEEE11033033011EEEEE110330330111111111
        033033011111111103303300000000000330}
      Caption = #1042#1099#1093#1086#1076
      OnClick = N1Click
    end
  end
  object OD: TOpenDialog
    Left = 432
    Top = 144
  end
  object XPManifest1: TXPManifest
    Left = 384
    Top = 80
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 336
    Top = 24
  end
  object ActionList1: TActionList
    Left = 264
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16460
    end
  end
end
