object SearchElementForm: TSearchElementForm
  Left = 0
  Top = 0
  Caption = #1053#1072#1081#1090#1080' '#1082#1085#1080#1075#1091' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
  ClientHeight = 167
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object disciplineLabel: TLabel
    Left = 16
    Top = 48
    Width = 3
    Height = 13
  end
  object nameLabel: TLabel
    Left = 16
    Top = 67
    Width = 3
    Height = 13
  end
  object authorLabel: TLabel
    Left = 16
    Top = 86
    Width = 3
    Height = 13
  end
  object yearLabel: TLabel
    Left = 16
    Top = 105
    Width = 3
    Height = 13
  end
  object formatLabel: TLabel
    Left = 16
    Top = 124
    Width = 3
    Height = 13
  end
  object languageLabel: TLabel
    Left = 16
    Top = 143
    Width = 3
    Height = 13
  end
  object nameBook: TEdit
    Left = 8
    Top = 8
    Width = 201
    Height = 21
    TabOrder = 0
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080'...'
  end
  object SearchButton: TButton
    Left = 215
    Top = 6
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 1
    OnClick = SearchButtonClick
  end
end
