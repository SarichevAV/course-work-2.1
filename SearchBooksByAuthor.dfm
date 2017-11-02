object BooksForm: TBooksForm
  Left = 0
  Top = 0
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1085#1080#1075#1072#1093
  ClientHeight = 145
  ClientWidth = 141
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
  object Label1: TLabel
    Left = 8
    Top = 35
    Width = 124
    Height = 13
    Caption = #1044#1080#1072#1087#1072#1079#1086#1085' '#1076#1072#1090#1099' '#1080#1079#1076#1072#1085#1080#1103
  end
  object authorEdit: TEdit
    Left = 8
    Top = 8
    Width = 124
    Height = 21
    TabOrder = 0
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1072#1074#1090#1086#1088#1072'...'
  end
  object FromEdit: TEdit
    Left = 8
    Top = 54
    Width = 124
    Height = 21
    TabOrder = 1
    Text = #1086#1090'...'
  end
  object BeforeEdit: TEdit
    Left = 8
    Top = 81
    Width = 124
    Height = 21
    TabOrder = 2
    Text = #1076#1086'...'
  end
  object Button1: TButton
    Left = 8
    Top = 108
    Width = 124
    Height = 25
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1082#1085#1080#1075#1080
    TabOrder = 3
    OnClick = Button1Click
  end
  object StringGridTable1: TStringGrid
    Left = 152
    Top = 8
    Width = 762
    Height = 125
    ColCount = 7
    FixedCols = 0
    TabOrder = 4
  end
end
