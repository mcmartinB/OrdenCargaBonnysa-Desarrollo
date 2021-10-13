object FCalendario: TFCalendario
  Left = 570
  Top = 378
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'SeleccioneFecha'
  ClientHeight = 153
  ClientWidth = 177
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Calendario: TMonthCalendar
    Left = 0
    Top = -1
    Width = 177
    Height = 153
    Date = 38786.4192668519
    TabOrder = 0
    WeekNumbers = True
    OnDblClick = CalendarioDblClick
  end
end
