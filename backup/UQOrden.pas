unit UQOrden;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQOrden = class(TQuickRep)
    bndTitulo: TQRBand;
    bndCabLineas: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    bndCliente: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    bndDestino: TQRChildBand;
    bndTransporte: TQRChildBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    bndLineas: TQRSubDetail;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRSysData2: TQRSysData;
    bndPieHojas: TQRBand;
    QRSysData3: TQRSysData;
    bndPieLineas: TQRBand;
    bndPieLineasHija: TQRChildBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
  private
    iCajas: Integer;
    rKilos: Real;
  public

  end;

  procedure VisualizarOrden( const AOwner: TComponent; const AOrden: integer );


implementation

{$R *.DFM}

uses UDListados, UDDescripciones;

procedure VisualizarOrden( const AOwner: TComponent; const AOrden: integer );
var
  QOrden: TQOrden;
  DListados: TDListados;
begin
  DListados:= TDListados.Create( AOwner );
  try
    if DListados.DatosOrden( AOrden ) then
    begin
      QOrden:= TQOrden.Create( AOwner );
      try
        QOrden.bndCliente.Enabled:= DListados.QCabcentro_destino_occ.AsString = '';
        QOrden.bndDestino.Enabled:= not QOrden.bndCliente.Enabled;
        if QOrden.bndCliente.Enabled then
        begin
          QOrden.ReportTitle:= 'ORDEN CARGA SALIDA Nº ' + IntToStr( AOrden );
        end
        else
        begin
          QOrden.ReportTitle:= 'ORDEN CARGA TRÁNSITO Nº ' + IntToStr( AOrden );
        end;
        QOrden.Preview;
      finally
        FreeAndNil( QOrden );
      end;
    end;
  finally
    FreeAndNil( DListados );
  end;
end;

procedure TQOrden.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  iCajas:= 0;
  rKilos:= 0;
end;

procedure TQOrden.QRDBText1Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desEmpresa( Value );
end;

procedure TQOrden.QRDBText2Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCentro( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrden.QRDBText3Print(sender: TObject; var Value: String);
begin
  Value:= 'FECHA GRABACIÓN: ' + Value + ' ' + DataSet.FieldByName('hora_occ').AsString;
end;

procedure TQOrden.QRDBText4Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCliente( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrden.QRDBText5Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desSuministro( DataSet.FieldByName('empresa_occ').AsString,
                    DataSet.FieldByName('cliente_sal_occ').AsString, Value );
end;

procedure TQOrden.QRDBText6Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCliente( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrden.QRDBText7Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desMoneda( Value );
end;

procedure TQOrden.QRDBText9Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCentro( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrden.QRDBText10Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desTransporte( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrden.QRDBText11Print(sender: TObject; var Value: String);
begin
  Value:= Value;
end;

procedure TQOrden.QRDBText15Print(sender: TObject; var Value: String);
begin
  Value:= Value + ' - ' + DDescripciones.desProducto( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrden.QRDBText16Print(sender: TObject; var Value: String);
begin
  Value:= Value + ' - ' + DDescripciones.desEnvase( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrden.QRDBText20Print(sender: TObject; var Value: String);
begin
  iCajas:= iCajas + bndLineas.DataSet.FieldByName('cajas_ocl').AsInteger;
end;

procedure TQOrden.QRDBText21Print(sender: TObject; var Value: String);
begin
  rKilos:= rKilos + bndLineas.DataSet.FieldByName('kilos_ocl').AsFloat;
end;

procedure TQOrden.QRLabel18Print(sender: TObject; var Value: String);
begin
  Value:= FormatFloat( '#,##0', iCajas );
end;

procedure TQOrden.QRLabel17Print(sender: TObject; var Value: String);
begin
  Value:= FormatFloat( '#,##0.00', rKilos );
end;

end.
