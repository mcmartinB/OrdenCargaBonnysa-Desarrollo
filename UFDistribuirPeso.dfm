object FDistribuirPesos: TFDistribuirPesos
  Left = 500
  Top = 166
  Caption = '   Distribuir Pesos'
  ClientHeight = 197
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblNombre1: TLabel
    Left = 25
    Top = 16
    Width = 100
    Height = 19
    AutoSize = False
    Caption = ' Cami'#243'n Lleno'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object LEmpresa_p: TLabel
    Left = 25
    Top = 38
    Width = 100
    Height = 19
    AutoSize = False
    Caption = ' Cami'#243'n Vac'#237'o'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object lblNombre2: TLabel
    Left = 24
    Top = 68
    Width = 347
    Height = 13
    Caption = 
      'Este programa calcula el peso aproximado de fruta segun el peso ' +
      'cami'#243'n,'
  end
  object lblNombre3: TLabel
    Left = 24
    Top = 81
    Width = 313
    Height = 13
    Caption = 
      'Peso Producto =  Camion lleno - ( Camion Vacio + Palets + Cajas ' +
      ').'
  end
  object lblNombre4: TLabel
    Left = 24
    Top = 94
    Width = 349
    Height = 13
    Caption = 
      'Despues se calcula un peso medio por caja y se rellena el campo ' +
      'de peso'
  end
  object lblNombre5: TLabel
    Left = 24
    Top = 108
    Width = 263
    Height = 13
    Caption = 'de la orden de carga. Esto borra los pesos ya grabados.'
  end
  object lblNombre6: TLabel
    Left = 236
    Top = 16
    Width = 100
    Height = 19
    AutoSize = False
    Caption = ' Dif. Lleno - Vacio'
    Color = cl3DLight
    ParentColor = False
    Layout = tlCenter
  end
  object lblNombre8: TLabel
    Left = 24
    Top = 128
    Width = 345
    Height = 13
    Caption = 
      'Si se dejan los pesos a 0 se recalcular'#225'n los pesos te'#243'ricos de ' +
      'comercial.'
  end
  object eCamionLleno: TBEdit
    Left = 132
    Top = 16
    Width = 100
    Height = 21
    InputType = itReal
    MaxDecimals = 3
    MaxLength = 10
    TabOrder = 0
    OnChange = ePesoCamionChange
  end
  object eCamionVacio: TBEdit
    Left = 132
    Top = 38
    Width = 100
    Height = 21
    InputType = itReal
    MaxDecimals = 3
    MaxLength = 10
    TabOrder = 1
    OnChange = ePesoCamionChange
  end
  object btnAceptar: TButton
    Left = 225
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 305
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object ePesoBruto: TBEdit
    Left = 236
    Top = 38
    Width = 100
    Height = 21
    InputType = itReal
    MaxDecimals = 3
    Enabled = False
    MaxLength = 10
    TabOrder = 4
  end
  object QAux: TQuery
    DatabaseName = 'Database'
    Left = 56
    Top = 24
  end
end
