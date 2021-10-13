object FAsignarAlbaran: TFAsignarAlbaran
  Left = 674
  Top = 181
  BorderStyle = bsDialog
  Caption = '    Asignar Orden de Carga a un Albar'#225'n Existente'
  ClientHeight = 207
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblEmpresa: TLabel
    Left = 40
    Top = 56
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object lblCentro: TLabel
    Left = 40
    Top = 79
    Width = 31
    Height = 13
    Caption = 'Centro'
  end
  object lblFecha: TLabel
    Left = 40
    Top = 101
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object lblAlbaran: TLabel
    Left = 40
    Top = 124
    Width = 36
    Height = 13
    Caption = 'Albaran'
  end
  object lblCliente: TLabel
    Left = 40
    Top = 146
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object lblSuministro: TLabel
    Left = 40
    Top = 169
    Width = 48
    Height = 13
    Caption = 'Suministro'
  end
  object lblDesEmpresa: TLabel
    Left = 141
    Top = 56
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object lbldesCentro: TLabel
    Left = 141
    Top = 79
    Width = 31
    Height = 13
    Caption = 'Centro'
  end
  object lblDesCliente: TLabel
    Left = 141
    Top = 146
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object lblDesSuministro: TLabel
    Left = 141
    Top = 169
    Width = 48
    Height = 13
    Caption = 'Suministro'
  end
  object btnAceptar: TButton
    Left = 294
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 0
    TabStop = False
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 372
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    TabStop = False
    OnClick = btnCancelarClick
  end
  object edtEmpresa: TEdit
    Left = 104
    Top = 52
    Width = 33
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edtCentro: TEdit
    Left = 104
    Top = 75
    Width = 33
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edtFecha: TEdit
    Left = 104
    Top = 97
    Width = 89
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edtCliente: TEdit
    Left = 104
    Top = 142
    Width = 33
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edtSuminisro: TEdit
    Left = 104
    Top = 165
    Width = 33
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edtAlbaran: TEdit
    Left = 104
    Top = 120
    Width = 89
    Height = 21
    Color = clMoneyGreen
    MaxLength = 6
    TabOrder = 7
  end
  object QAux: TQuery
    DatabaseName = 'Database'
    Left = 296
    Top = 40
  end
end
