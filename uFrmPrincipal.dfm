object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Apolo Relat'#243'rios Extras'
  ClientHeight = 145
  ClientWidth = 268
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
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object Label2: TLabel
    Left = 40
    Top = 54
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object btnRelacaoFaturamento: TButton
    Left = 40
    Top = 113
    Width = 201
    Height = 25
    Caption = 'Vendas por formas pag. por vendedor'
    TabOrder = 2
    OnClick = btnRelacaoFaturamentoClick
  end
  object dataInicial: TDateTimePicker
    Left = 40
    Top = 27
    Width = 186
    Height = 21
    Date = 43445.597661087970000000
    Time = 43445.597661087970000000
    TabOrder = 0
  end
  object dataFinal: TDateTimePicker
    Left = 40
    Top = 73
    Width = 186
    Height = 21
    Date = 43445.598218506940000000
    Time = 43445.598218506940000000
    TabOrder = 1
  end
end
