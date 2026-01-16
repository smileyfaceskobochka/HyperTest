object fmResults: TfmResults
  Left = 259
  Top = 263
  Width = 551
  Height = 320
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1090#1077#1089#1090#1072
  Color = 14201227
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    543
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 543
    Height = 154
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1090#1077#1089#1090#1072' ('#1087#1086' '#1090#1077#1084#1072#1084')'
    TabOrder = 0
    object sgResults: TStringGrid
      Left = 2
      Top = 15
      Width = 539
      Height = 137
      Align = alClient
      ColCount = 4
      FixedCols = 0
      TabOrder = 0
      OnDrawCell = sgResultsDrawCell
    end
  end
  object Panel1: TPanel
    Left = 2
    Top = 160
    Width = 539
    Height = 118
    Anchors = [akLeft, akRight, akBottom]
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 92
      Height = 13
      Caption = #1052#1072#1082#1089#1080#1084#1091#1084' '#1073#1072#1083#1083#1086#1074':'
    end
    object Label2: TLabel
      Left = 8
      Top = 23
      Width = 113
      Height = 13
      Caption = #1053#1072#1073#1088#1072#1085#1086' '#1074#1072#1084#1080' '#1073#1072#1083#1083#1086#1074':'
    end
    object Label3: TLabel
      Left = 8
      Top = 42
      Width = 157
      Height = 13
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1076#1072#1085#1080#1081':'
    end
    object Label4: TLabel
      Left = 8
      Top = 61
      Width = 138
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1103' '#1090#1077#1089#1090#1072':'
    end
    object Label5: TLabel
      Left = 8
      Top = 88
      Width = 47
      Height = 13
      Caption = #1054#1094#1077#1085#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPointsMax: TLabel
      Left = 224
      Top = 4
      Width = 57
      Height = 13
      Caption = 'lbPointsMax'
    end
    object lbPointsGained: TLabel
      Left = 224
      Top = 23
      Width = 70
      Height = 13
      Caption = 'lbPointsGained'
    end
    object lbProcent: TLabel
      Left = 224
      Top = 42
      Width = 45
      Height = 13
      Caption = 'lbProcent'
    end
    object lbTestTime: TLabel
      Left = 224
      Top = 61
      Width = 51
      Height = 13
      Caption = 'lbTestTime'
    end
    object lbMark: TLabel
      Left = 224
      Top = 88
      Width = 39
      Height = 13
      Caption = 'lbMark'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
