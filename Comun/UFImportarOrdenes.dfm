object FImportarOrdenes: TFImportarOrdenes
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Importar ordenes desde Web'
  ClientHeight = 635
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 119
    Width = 984
    Height = 225
    Align = alClient
    TabOrder = 0
    ExplicitTop = 117
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      FindPanel.DisplayMode = fpdmAlways
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = MuestraCargaDs
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = 'Sin datos'
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'Selec.'
        DataBinding.FieldName = 'sel'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
      object cxGrid1DBTableView1Column12: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id_orden'
      end
      object cxGrid1DBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'Empresa'
      end
      object cxGrid1DBTableView1Column3: TcxGridDBColumn
        DataBinding.FieldName = 'Orden'
      end
      object cxGrid1DBTableView1Column4: TcxGridDBColumn
        DataBinding.FieldName = 'Fecha'
        PropertiesClassName = 'TcxDateEditProperties'
      end
      object cxGrid1DBTableView1Column5: TcxGridDBColumn
        Caption = 'Cod. Cliente'
        DataBinding.FieldName = 'Cliente'
      end
      object cxGrid1DBTableView1Column6: TcxGridDBColumn
        Caption = 'Nombre Cliente'
        DataBinding.FieldName = 'nombre_c'
      end
      object cxGrid1DBTableView1Column7: TcxGridDBColumn
        Caption = 'Direc.'
        DataBinding.FieldName = 'direccion'
      end
      object cxGrid1DBTableView1Column8: TcxGridDBColumn
        Caption = 'Lugar'
        DataBinding.FieldName = 'nombre_ds'
      end
      object cxGrid1DBTableView1Column9: TcxGridDBColumn
        Caption = 'N/ Pedido'
        DataBinding.FieldName = 'Pedido'
      end
      object cxGrid1DBTableView1Column10: TcxGridDBColumn
        Caption = 'S/ Pedido'
        DataBinding.FieldName = 'pedido_cliente'
      end
      object cxGrid1DBTableView1Column11: TcxGridDBColumn
        Caption = 'Transporte'
        DataBinding.FieldName = 'transporte'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 119
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 26
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label2: TLabel
      Left = 10
      Top = 53
      Width = 33
      Height = 13
      Caption = 'Centro'
    end
    object Label3: TLabel
      Left = 8
      Top = 81
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object sbImportar: TSpeedButton
      Left = 882
      Top = 7
      Width = 87
      Height = 32
      Caption = 'Importar'
      OnClick = sbImportarClick
    end
    object sbSalir: TSpeedButton
      Left = 882
      Top = 45
      Width = 87
      Height = 32
      Caption = 'Salir'
      OnClick = sbSalirClick
    end
    object edtEmpresaCod: TEdit
      Left = 57
      Top = 23
      Width = 39
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtEmpresaDes: TEdit
      Left = 102
      Top = 24
      Width = 252
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edtCentroCod: TEdit
      Left = 57
      Top = 50
      Width = 39
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edtCentroDes: TEdit
      Left = 102
      Top = 51
      Width = 252
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object FiltroFechaEdit: TcxDateEdit
      Left = 57
      Top = 78
      EditValue = 0d
      Properties.Nullstring = 'Sin fecha'
      Properties.PostPopupValueOnTab = True
      Properties.ShowOnlyValidDates = True
      Properties.ShowTime = False
      Properties.ValidationOptions = [evoRaiseException, evoShowErrorIcon]
      TabOrder = 4
      Width = 121
    end
    object BuscarBtn: TButton
      Left = 198
      Top = 78
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 5
      OnClick = BuscarBtnClick
    end
    object MarcarTodosBtn: TButton
      Left = 279
      Top = 76
      Width = 159
      Height = 25
      Caption = 'Marcar Todos'
      Enabled = False
      TabOrder = 6
      OnClick = MarcarTodosBtnClick
    end
    object DesmarcarTodosBtn: TButton
      Left = 455
      Top = 76
      Width = 159
      Height = 25
      Caption = 'Desmarcar todos'
      Enabled = False
      TabOrder = 7
      OnClick = DesmarcarTodosBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 344
    Width = 984
    Height = 291
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 2
    object lblProgreso: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 26
      Width = 976
      Height = 13
      Margins.Top = 25
      Align = alTop
      Caption = 'Descargados %d de %d'
      ExplicitWidth = 117
    end
    object Memo: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 75
      Width = 976
      Height = 212
      Align = alClient
      Lines.Strings = (
        'Memo')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object pb: TProgressBar
      AlignWithMargins = True
      Left = 4
      Top = 52
      Width = 976
      Height = 17
      Margins.Top = 10
      Align = alTop
      TabOrder = 1
    end
  end
  object MuestraCargaDs: TDataSource
    Left = 451
    Top = 152
  end
end
