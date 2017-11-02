object DisciplineTableForm: TDisciplineTableForm
  Left = 0
  Top = 0
  Caption = 'DisciplineTableForm'
  ClientHeight = 240
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DisciplineEdit: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072'...'
  end
  object SearchButton: TButton
    Left = 144
    Top = 6
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 1
    OnClick = SearchButtonClick
  end
  object StringGridDisciplineTable: TStringGrid
    Left = 8
    Top = 37
    Width = 762
    Height = 196
    ColCount = 7
    FixedCols = 0
    TabOrder = 2
  end
end
