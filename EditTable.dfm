object FTable: TFTable
  Left = 0
  Top = 0
  Caption = #1058#1072#1073#1083#1080#1094#1072
  ClientHeight = 492
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGridTable: TStringGrid
    Left = 111
    Top = 8
    Width = 762
    Height = 473
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object SaveButton: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = SaveButtonClick
  end
  object AddRowButton: TButton
    Left = 24
    Top = 78
    Width = 25
    Height = 25
    Caption = '+'
    TabOrder = 2
    OnClick = AddRowButtonClick
  end
  object RemoveRowButton: TButton
    Left = 55
    Top = 78
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 3
    OnClick = RemoveRowButtonClick
  end
  object DownloadButton: TButton
    Left = 16
    Top = 47
    Width = 75
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 4
    OnClick = DownloadButtonClick
  end
  object ClearTable: TButton
    Left = 16
    Top = 109
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 5
    OnClick = ClearTableClick
  end
  object Button1: TButton
    Left = 16
    Top = 160
    Width = 75
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1085#1080#1075#1091
    TabOrder = 6
    WordWrap = True
  end
  object Button2: TButton
    Left = 16
    Top = 208
    Width = 75
    Height = 33
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1082#1085#1080#1075#1080
    TabOrder = 7
    WordWrap = True
  end
  object InfoAdoutBookButton: TButton
    Left = 16
    Top = 256
    Width = 75
    Height = 33
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1085#1080#1075#1077
    TabOrder = 8
    WordWrap = True
    OnClick = InfoAdoutBookButtonClick
  end
  object BooksByAuthorButton: TButton
    Left = 16
    Top = 304
    Width = 75
    Height = 33
    Caption = #1053#1072#1081#1090#1080' '#1082#1085#1080#1075#1080' '#1087#1086' '#1072#1074#1090#1086#1088#1091
    TabOrder = 9
    WordWrap = True
    OnClick = BooksByAuthorButtonClick
  end
  object BooksByDisciplineButton: TButton
    Left = 16
    Top = 352
    Width = 75
    Height = 41
    Caption = #1053#1072#1081#1090#1080' '#1082#1085#1080#1075#1080' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
    TabOrder = 10
    WordWrap = True
    OnClick = BooksByDisciplineButtonClick
  end
  object DiagramButton: TButton
    Left = 16
    Top = 408
    Width = 75
    Height = 25
    Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072
    TabOrder = 11
    OnClick = DiagramButtonClick
  end
  object SaveDialog1: TSaveDialog
    Left = 48
    Top = 456
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 456
  end
end
