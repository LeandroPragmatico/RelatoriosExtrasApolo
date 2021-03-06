object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 405
  Width = 906
  object conn: TFDConnection
    Params.Strings = (
      'ConnectionDef=apolo')
    Connected = True
    LoginPrompt = False
    Left = 13
    Top = 14
  end
  object qrVenda: TFDQuery
    Active = True
    Connection = conn
    SQL.Strings = (
      'select v.codvendedor, vend.nome,'
      ''
      'sum(v.total) as venda,'
      ''
      'case'
      '    when v.meio_dinheiro >0 then '#39'Dinheiro'#39
      '    when v.meio_chequeav >0 then '#39'Cheque avista'#39
      '    when v.meio_chequeap >0 then '#39'Cheque aprazo'#39
      '    when v.meio_cartaocred >0 then '#39'Cartao credito'#39
      '    when v.meio_cartaodeb >0 then '#39'Cartao debito'#39
      '    when v.meio_crediario >0 then '#39'Crediario'#39
      '    when v.meio_convenio >0 then '#39'Convenio'#39
      '    when v.meio_financeira >0 then '#39'Financeira'#39
      '        else '#39'sem forma'#39
      '        end as Pagamento'
      ''
      'from c000048 v'
      'inner join c000008 vend on (vend.codigo = v.codvendedor)'
      
        'where v.situacao=1 and ((v.codvendedor <>'#39#39') or(v.codvendedor <>' +
        ' null))'
      'and v.data between :pDataInicial and :pDataFinal'
      'group by v.codvendedor, Pagamento, vend.nome'
      'ORDER by v.codvendedor asc')
    Left = 72
    Top = 16
    ParamData = <
      item
        Name = 'PDATAINICIAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'PDATAFINAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end>
  end
  object frxVendas: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43445.636949178200000000
    ReportOptions.LastChange = 43445.731221678200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 72
    Top = 136
    Datasets = <
      item
        DataSet = frxDBEmpresa
        DataSetName = 'frxDBEmpresa'
      end
      item
        DataSet = frxDBPeriodo
        DataSetName = 'frxDBPeriodo'
      end
      item
        DataSet = frxDBVendas
        DataSetName = 'frxDBVendas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxDBVendas
        DataSetName = 'frxDBVendas'
        RowCount = 0
        object frxDBVendasVENDA: TfrxMemoView
          Left = 124.724490000000000000
          Top = 3.779529999999994000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendas."VENDA"]')
          ParentFont = False
        end
        object frxDBVendasPAGAMENTO: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'PAGAMENTO'
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBVendas."PAGAMENTO"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 714.331170000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de Vendas por Vendedor')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 502.677490000000000000
          Top = 49.133889999999990000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Data Impress'#227'o: [Date]')
          ParentFont = False
        end
        object frxDBEmpresaFILIAL: TfrxMemoView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          DataField = 'FILIAL'
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBEmpresa."FILIAL"]')
          ParentFont = False
        end
        object frxDBEmpresaCNPJ: TfrxMemoView
          Left = 506.457020000000000000
          Top = 26.456710000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'CNPJ'
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBEmpresa."CNPJ"]')
          ParentFont = False
        end
        object frxDBPeriodoLINHA2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 45.354360000000000000
          Width = 487.559370000000000000
          Height = 18.897650000000000000
          DataField = 'LINHA2'
          DataSet = frxDBPeriodo
          DataSetName = 'frxDBPeriodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPeriodo."LINHA2"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBVendas."CODVENDEDOR"'
        object frxDBVendasCODVENDEDOR: TfrxMemoView
          Left = 3.779530000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vendedor: [frxDBVendas."NOME"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 124.724490000000000000
          Top = 22.677179999999990000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677179999999990000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haRight
          Memo.UTF8W = (
            'Forma de Pag.')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 3.779530000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haRight
          Memo.UTF8W = (
            'Total: [SUM(<frxDBVendas."VENDA">,MasterData1)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 18.897650000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBVendas: TfrxDBDataset
    UserName = 'frxDBVendas'
    CloseDataSource = False
    DataSet = qrVenda
    BCDToCurrency = False
    Left = 72
    Top = 80
  end
  object qrEmpresa: TFDQuery
    Active = True
    Connection = conn
    SQL.Strings = (
      'select * from C000004')
    Left = 160
    Top = 16
  end
  object qrPeriodo: TFDQuery
    Active = True
    Connection = conn
    SQL.Strings = (
      'select * from L000003')
    Left = 240
    Top = 16
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'frxDBEmpresa'
    CloseDataSource = False
    DataSet = qrEmpresa
    BCDToCurrency = False
    Left = 160
    Top = 80
  end
  object frxDBPeriodo: TfrxDBDataset
    UserName = 'frxDBPeriodo'
    CloseDataSource = False
    DataSet = qrPeriodo
    BCDToCurrency = False
    Left = 240
    Top = 80
  end
end
