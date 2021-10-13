unit UQOrdenCompleta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRPDFFilt;

type
  TQOrdenCompleta = class(TQuickRep)
    bndTitulo: TQRBand;
    bndLineasCab: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    bndCliente: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
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
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRSysData2: TQRSysData;
    bndPieHoja: TQRBand;
    QRSysData3: TQRSysData;
    bndLineasPie: TQRBand;
    bndLineasNota: TQRChildBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    bndPackingCab: TQRBand;
    bndPackingPie: TQRBand;
    QRLabel33: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    bndLineasHijo: TQRChildBand;
    bndPackingHijo: TQRChildBand;
    bndEnvases: TQRSubDetail;
    bndEnvasesCab: TQRBand;
    bndEnvasesPie: TQRBand;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    bndEnvasesHijo: TQRChildBand;
    bndLogifruit: TQRSubDetail;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    bndPalets: TQRSubDetail;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    bndLogifruitCab: TQRBand;
    bndLogifruitPie: TQRBand;
    bndLogifruitHijo: TQRChildBand;
    bndPaletsCab: TQRBand;
    bndPaletsHijo: TQRChildBand;
    bndPaletsPie: TQRBand;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel36: TQRLabel;
    marca_pl: TQRDBText;
    QRDBText56: TQRDBText;
    bndPackingLinea: TQRSubDetail;
    QRDBText30: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    bndCabPackingLinea: TQRGroup;
    QRLabel37: TQRLabel;
    bndPiePackingLinea: TQRBand;
    QRLabel20: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText41: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel41: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel42: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    bndLineasNotaInterna: TQRChildBand;
    QRDBText57: TQRDBText;
    QRLabel43: TQRLabel;
    bndLineasPieHijo: TQRChildBand;
    QRLabel38: TQRLabel;
    QRLabel44: TQRLabel;
    nota_interna_occ: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText58: TQRDBText;
    lblKilosPacking: TQRLabel;
    qrlCajas: TQRLabel;
    qrlTotalCajas: TQRLabel;
    qrlbl1: TQRLabel;
    qrdbtxttipo_palets_pl: TQRDBText;
    qrdbtxt_palets_pl: TQRDBText;
    qrlPalets: TQRLabel;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
    unidades_caja_pl: TQRDBText;
    qrchldbndChildBand1: TQRChildBand;
    qrdbtxtenvase_ocl: TQRDBText;
    qrlbl4: TQRLabel;
    qrdbtxtn_pedido_occ: TQRDBText;
    ChildBand1: TQRChildBand;
    QRDBBefore: TQRDBText;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
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
    procedure QRDBText31Print(sender: TObject; var Value: String);
    procedure QRDBText44Print(sender: TObject; var Value: String);
    procedure QRDBText53Print(sender: TObject; var Value: String);
    procedure QRDBText55Print(sender: TObject; var Value: String);
    procedure QRDBText56Print(sender: TObject; var Value: String);
    procedure bndCabPackingLineaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndPackingCabBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel41Print(sender: TObject; var Value: String);
    procedure QRDBText41Print(sender: TObject; var Value: String);
    procedure QRLabel42Print(sender: TObject; var Value: String);
    procedure bndLineasNotaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bndLineasNotaInternaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText58Print(sender: TObject; var Value: String);
    procedure QRDBText37Print(sender: TObject; var Value: String);
    procedure lblKilosPackingPrint(sender: TObject; var Value: String);
    procedure QRDBText45Print(sender: TObject; var Value: String);
    procedure bndEnvasesCabBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlCajasPrint(sender: TObject; var Value: String);
    procedure qrlPaletsPrint(sender: TObject; var Value: String);
    procedure qrchldbndChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBBeforePrint(sender: TObject; var Value: string);
    procedure QRDBText46Print(sender: TObject; var Value: string);
  private
    iPalets, iCajas: Integer;
    rKilos: Real;
    iPaletsPacking: Integer;
    rKilosPacking: Real;
    iCajasAux, iPaletsAux: integer;
  public

  end;

  procedure VisualizarOrden( const AOwner: TComponent; const AOrden: integer;
    const ALineas, APacking, ALogifruit, AEnvases, APalets: boolean );
  procedure GuardarOrden( const AOwner: TComponent; const AOrden: integer; const AFileName: string );

implementation

{$R *.DFM}

uses UDListados, UDDescripciones, DB;

procedure VisualizarOrden( const AOwner: TComponent; const AOrden: integer;
  const ALineas, APacking, ALogifruit, AEnvases, APalets: boolean );
var
  QOrden: TQOrdenCompleta;
  DListados: TDListados;
  bLineas, bPacking, bLogifruit, bEnvases, bPalets: Boolean;
begin
  bLineas:= ALineas;
  bPacking:= APacking;
  bLogifruit:= ALogifruit;
  bEnvases:= AEnvases;
  bPalets:= APalets;

  DListados:= TDListados.Create( AOwner );
  try
    if DListados.DatosOrden( AOrden, bLineas, bPacking, bLogifruit, bEnvases, bPalets ) then
    begin
      QOrden:= TQOrdenCompleta.Create( AOwner );
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

        //Ver el detalle de la orden
        QOrden.bndLineas.Enabled:= ALineas;
        QOrden.bndLineasCab.Enabled:= ALineas;
        QOrden.bndLineasPie.Enabled:= ALineas;
        QOrden.bndLineasNota.Enabled:= ALineas;
        QOrden.bndLineasHijo.Enabled:= ALineas;

        //Ver el packing list
        QOrden.bndLineasPieHijo.Enabled:= APacking;
        QOrden.bndPackingLinea.Enabled:= APacking;
        QOrden.bndCabPackingLinea.Enabled:= APacking;
        QOrden.bndPiePackingLinea.Enabled:= APacking;
        QOrden.bndPackingCab.Enabled:= APacking;
        QOrden.bndPackingPie.Enabled:= APacking;
        QOrden.bndPackingHijo.Enabled:= APacking;

        //Ver el cajas retornables/logifruit
        QOrden.bndLogifruit.Enabled:= ALogifruit;
        QOrden.bndLogifruitCab.Enabled:= ALogifruit;
        QOrden.bndLogifruitPie.Enabled:= ALogifruit;
        QOrden.bndLogifruitHijo.Enabled:= ALogifruit;

        //Ver el envase, calibre y color
        QOrden.bndEnvases.Enabled:= AEnvases;
        QOrden.bndEnvasesCab.Enabled:= AEnvases;
        QOrden.bndEnvasesPie.Enabled:= AEnvases;
        QOrden.bndEnvasesHijo.Enabled:= AEnvases;

        //Ver el envase, calibre y color
        QOrden.bndPalets.Enabled:= APalets;
        QOrden.bndPaletsCab.Enabled:= APalets;
        QOrden.bndPaletsPie.Enabled:= APalets;
        QOrden.bndPaletsHijo.Enabled:= APalets;

        QOrden.Preview;
      finally
        FreeAndNil( QOrden );
      end;
    end;
  finally
    FreeAndNil( DListados );
  end;
end;

procedure GuardarOrden( const AOwner: TComponent; const AOrden: integer; const AFileName: string );
var
  QOrden: TQOrdenCompleta;
  DListados: TDListados;
  bLineas, bPacking, bLogifruit, bEnvases, bPalets: Boolean;
begin
  bLineas:= True;
  bPacking:= True;
  bLogifruit:= True;
  bEnvases:= True;
  bPalets:= True;

  DListados:= TDListados.Create( AOwner );
  try
    if DListados.DatosOrden( AOrden, bLineas, bPacking, bLogifruit, bEnvases, bPalets ) then
    begin
      QOrden:= TQOrdenCompleta.Create( AOwner );
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

        //Ver el detalle de la orden
        QOrden.bndLineas.Enabled:= True;
        QOrden.bndLineasCab.Enabled:= True;
        QOrden.bndLineasPie.Enabled:= True;
        QOrden.bndLineasPieHijo.Enabled:= True;
        QOrden.bndLineasHijo.Enabled:= True;

        //Ver el packing list
        QOrden.bndPackingLinea.Enabled:= True;
        QOrden.bndCabPackingLinea.Enabled:= True;
        QOrden.bndPiePackingLinea.Enabled:= True;
        QOrden.bndPackingCab.Enabled:= True;
        QOrden.bndPackingPie.Enabled:= True;
        QOrden.bndPackingHijo.Enabled:= True;

        //Ver el cajas retornables/logifruit
        QOrden.bndLogifruit.Enabled:= True;
        QOrden.bndLogifruitCab.Enabled:= True;
        QOrden.bndLogifruitPie.Enabled:= True;
        QOrden.bndLogifruitHijo.Enabled:= True;

        //Ver el envase, calibre y color
        QOrden.bndEnvases.Enabled:= True;
        QOrden.bndEnvasesCab.Enabled:= True;
        QOrden.bndEnvasesPie.Enabled:= True;
        QOrden.bndEnvasesHijo.Enabled:= True;

        //Ver el envase, calibre y color
        QOrden.bndPalets.Enabled:= True;
        QOrden.bndPaletsCab.Enabled:= True;
        QOrden.bndPaletsPie.Enabled:= True;
        QOrden.bndPaletsHijo.Enabled:= True;

        QOrden.ExportToFilter( TQRPDFDocumentFilter.Create( AFileName ) );

      finally
        FreeAndNil( QOrden );
      end;
    end;
  finally
    FreeAndNil( DListados );
  end;
end;

procedure TQOrdenCompleta.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  rKilosPacking:= 0;
  iCajas:= 0;
  rKilos:= 0;
  iPalets:= 0;
  if Exporting then
  begin
    //Elinimar colores didtintos del blanco y negro que salen como negro
    //en la exportacion a PDF
    bndLineasCab.Color:= clWhite;
    bndLineasCab.Frame.DrawTop:= True;
    bndLineasCab.Frame.DrawBottom:= True;
    bndLineasCab.Frame.DrawLeft:= True;
    bndLineasCab.Frame.DrawRight:= True;

    bndPackingCab.Color:= clWhite;
    bndPackingCab.Frame.DrawTop:= True;
    bndPackingCab.Frame.DrawBottom:= True;
    bndPackingCab.Frame.DrawLeft:= True;
    bndPackingCab.Frame.DrawRight:= True;

    bndPiePackingLinea.Color:= clWhite;

    bndEnvasesCab.Color:= clWhite;
    bndEnvasesCab.Frame.DrawTop:= True;
    bndEnvasesCab.Frame.DrawBottom:= True;
    bndEnvasesCab.Frame.DrawLeft:= True;
    bndEnvasesCab.Frame.DrawRight:= True;

    bndLogifruitCab.Color:= clWhite;
    bndLogifruitCab.Frame.DrawTop:= True;
    bndLogifruitCab.Frame.DrawBottom:= True;
    bndLogifruitCab.Frame.DrawLeft:= True;
    bndLogifruitCab.Frame.DrawRight:= True;

    bndPaletsCab.Color:= clWhite;
    bndPaletsCab.Frame.DrawTop:= True;
    bndPaletsCab.Frame.DrawBottom:= True;
    bndPaletsCab.Frame.DrawLeft:= True;
    bndPaletsCab.Frame.DrawRight:= True;
  end
  else
  begin
    bndLineasCab.Color:= clInactiveBorder;
    bndLineasCab.Frame.DrawTop:= False;
    bndLineasCab.Frame.DrawBottom:= False;
    bndLineasCab.Frame.DrawLeft:= False;
    bndLineasCab.Frame.DrawRight:= False;

    bndPackingCab.Color:= clInactiveBorder;
    bndPackingCab.Frame.DrawTop:= False;
    bndPackingCab.Frame.DrawBottom:= False;
    bndPackingCab.Frame.DrawLeft:= False;
    bndPackingCab.Frame.DrawRight:= False;

    bndPiePackingLinea.Color:= clInfoBk;

    bndEnvasesCab.Color:= clInactiveBorder;
    bndEnvasesCab.Frame.DrawTop:= False;
    bndEnvasesCab.Frame.DrawBottom:= False;
    bndEnvasesCab.Frame.DrawLeft:= False;
    bndEnvasesCab.Frame.DrawRight:= False;

    bndLogifruitCab.Color:= clInactiveBorder;
    bndLogifruitCab.Frame.DrawTop:= False;
    bndLogifruitCab.Frame.DrawBottom:= False;
    bndLogifruitCab.Frame.DrawLeft:= False;
    bndLogifruitCab.Frame.DrawRight:= False;

    bndPaletsCab.Color:= clInactiveBorder;
    bndPaletsCab.Frame.DrawTop:= False;
    bndPaletsCab.Frame.DrawBottom:= False;
    bndPaletsCab.Frame.DrawLeft:= False;
    bndPaletsCab.Frame.DrawRight:= False;
  end;
end;

procedure TQOrdenCompleta.QRDBText1Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desEmpresa( Value );
end;

procedure TQOrdenCompleta.QRDBText2Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCentro( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText3Print(sender: TObject; var Value: String);
begin
  Value:= 'FECHA CARGA: ' + Value + ' ' + DataSet.FieldByName('hora_occ').AsString;
end;

procedure TQOrdenCompleta.QRDBText55Print(sender: TObject;
  var Value: String);
begin
  if DataSet.FieldByName('orden_occ').asInteger <> DataSet.FieldByName('n_albaran_occ').asInteger then
  begin
    if DataSet.FieldByName('centro_destino_occ').asString <> '' then
    begin
      Value:= 'TRÁNSITO Nº ' + DataSet.FieldByName('n_albaran_occ').asString;
    end
    else
    begin
      Value:= 'SALIDA Nº ' + DataSet.FieldByName('n_albaran_occ').asString;
    end;
  end
  else
  begin
    if DataSet.FieldByName('centro_destino_occ').asString <> '' then
    begin
      Value:= 'TRÁNSITO SIN ASIGNAR';
    end
    else
    begin
      Value:= 'SALIDA SIN ASIGNAR';
    end;
  end;
end;

procedure TQOrdenCompleta.QRDBText4Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCliente( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText5Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desSuministro( DataSet.FieldByName('empresa_occ').AsString,
                    DataSet.FieldByName('cliente_sal_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText6Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCliente( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText9Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCentro( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBBeforePrint(sender: TObject; var Value: string);
begin
  Value := 'BB ' + Value;
end;

procedure TQOrdenCompleta.QRDBText10Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desTransporte( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText11Print(sender: TObject; var Value: String);
begin
  Value:= Value;
end;

procedure TQOrdenCompleta.QRDBText15Print(sender: TObject; var Value: String);
begin
  Value:= Value + ' - ' + DDescripciones.desProducto( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText16Print(sender: TObject; var Value: String);
begin
  Value:= Value + ' - ' + DDescripciones.desEnvase( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText20Print(sender: TObject; var Value: String);
begin
  iCajas:= iCajas + bndLineas.DataSet.FieldByName('cajas_ocl').AsInteger;
end;

procedure TQOrdenCompleta.QRDBText21Print(sender: TObject; var Value: String);
begin
  rKilos:= rKilos + bndLineas.DataSet.FieldByName('kilos_ocl').AsFloat;
end;

procedure TQOrdenCompleta.QRDBText41Print(sender: TObject;
  var Value: String);
begin
  iPalets:= iPalets + bndLineas.DataSet.FieldByName('n_palets_ocl').AsInteger;
end;

procedure TQOrdenCompleta.QRLabel18Print(sender: TObject; var Value: String);
begin
  Value:= FormatFloat( '#,##0', iCajas );
end;

procedure TQOrdenCompleta.QRLabel17Print(sender: TObject; var Value: String);
begin
  Value:= FormatFloat( '#,##0.00', rKilos );
end;

procedure TQOrdenCompleta.QRLabel41Print(sender: TObject;
  var Value: String);
begin
  Value:= FormatFloat( '#,##0', iPalets );
end;

procedure TQOrdenCompleta.QRDBText31Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desEnvaseComercial( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText44Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desEnvase( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenCompleta.QRDBText53Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desTipoPalet( Value );
end;

procedure TQOrdenCompleta.QRDBText56Print(sender: TObject;
  var Value: String);
begin
  Value:= DDescripciones.desMarca( Value );
  if Value = '' then
    Value:= 'SIN MARCA';
end;

procedure TQOrdenCompleta.bndCabPackingLineaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iPaletsPacking:= iPaletsPacking + 1;
  PrintBand:= false;
end;

procedure TQOrdenCompleta.bndPackingCabBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  iPaletsPacking:= 0;
end;

procedure TQOrdenCompleta.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if QRDBBefore.DataSet.Active then
    PrintBand:= Trim( QRDBBefore.DataSet.FieldByName('bestbefore_pl').AsString ) <> ''
  else
    PrintBand:= False;
end;

procedure TQOrdenCompleta.QRLabel42Print(sender: TObject;
  var Value: String);
begin
  Value:= 'TOTAL ' + IntToStr(iPaletsPacking) + ' PALETS';
end;

procedure TQOrdenCompleta.bndLineasNotaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand:= Trim( DataSet.FieldByName('nota_occ').AsString ) <> '';
end;

procedure TQOrdenCompleta.bndLineasNotaInternaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand:= Trim( DataSet.FieldByName('nota_interna_occ').AsString ) <> '';
end;

procedure TQOrdenCompleta.QRDBText58Print(sender: TObject;
  var Value: String);
begin
  Value:= '*' + UpperCase(Copy(Value,1,1));
end;

procedure TQOrdenCompleta.QRDBText37Print(sender: TObject;
  var Value: String);
begin
  with DDescripciones.QAux do
  begin
    Close;
    SQL.Clear;
    SQl.Add(' select * ');
    SQl.Add(' from frf_envases ');
    SQl.Add(' where envase_e = :envase ');
    SQl.Add(' and producto_e = :producto ');
    ParamByName('envase').AsString:= bndPackingLinea.DataSet.FieldByName('envase_pl').AsString;
    ParamByName('producto').AsString:= bndPackingLinea.DataSet.FieldByName('producto_pl').AsString;
    Open;
    if not IsEmpty then
    begin
      // SI PESO FIJO Y EL PESO DEL PACKING ES 0, calculamos cajas por peso neto del envase
      if (FieldByName('peso_variable_e').AsInteger = 0)  and (bndPackingLinea.DataSet.FieldByName('peso_pl').AsFloat = 0)  then
      begin
          Value := FloatToStr(bndPackingLinea.DataSet.FieldByName('cajas_pl').AsInteger * FieldByName('peso_neto_e').AsFloat);
          rKilosPacking:= rKilosPacking + bndPackingLinea.DataSet.FieldByName('cajas_pl').AsInteger * FieldByName('peso_neto_e').AsFloat
      end
      else
         rKilosPacking:= rKilosPacking + bndPackingLinea.DataSet.FieldByname('peso_pl').AsFloat;
    end;
    Close;
  end;
//  rKilosPacking:= rKilosPacking + bndPackingLinea.DataSet.FieldByname('peso_pl').AsFloat;
end;

procedure TQOrdenCompleta.lblKilosPackingPrint(sender: TObject;
  var Value: String);
begin
  Value:= FormatFloat('#,##0.00', rKilosPacking );
end;

procedure TQOrdenCompleta.bndEnvasesCabBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  iCajasAux:= 0;
  iPaletsAux:= 0;
end;

procedure TQOrdenCompleta.QRDBText45Print(sender: TObject;
  var Value: String);
begin
  iCajasAux:= iCajasAux +  bndEnvases.DataSet.FieldByName('cajas_pl').AsInteger;
  iPaletsAux:= iPaletsAux +  bndEnvases.DataSet.FieldByName('palets_pl').AsInteger;
end;

procedure TQOrdenCompleta.QRDBText46Print(sender: TObject; var Value: string);
begin
  with DDescripciones.QAux do
  begin
    Close;
    SQL.Clear;
    SQl.Add(' select * ');
    SQl.Add(' from frf_envases ');
    SQl.Add(' where envase_e = :envase ');
    SQl.Add(' and producto_e = :producto ');
    ParamByName('envase').AsString:= bndEnvases.DataSet.FieldByName('envase_pl').AsString;
    ParamByName('producto').AsString:= bndEnvases.DataSet.FieldByName('producto_pl').AsString;
    Open;
    if not IsEmpty then
    begin

      // SI PESO FIJO Y EL PESO DEL PACKING ES 0, calculamos cajas por peso neto del envase
      if (FieldByName('peso_variable_e').AsInteger = 0)  and (bndPackingLinea.DataSet.FieldByName('peso_pl').AsFloat = 0)  then
          Value := FloatToStr(bndEnvases.DataSet.FieldByName('cajas_pl').AsInteger * FieldByName('peso_neto_e').AsFloat);
    end;
    Close;
  end;
end;

procedure TQOrdenCompleta.qrlCajasPrint(sender: TObject;
  var Value: String);
begin
  Value:= FormatFloat('#,##0', iCajasAux);
end;

procedure TQOrdenCompleta.qrlPaletsPrint(sender: TObject;
  var Value: String);
begin
  Value:= FormatFloat('#,##0', iPaletsAux);
end;

procedure TQOrdenCompleta.qrchldbndChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrdbtxtenvase_ocl.DataSet.Active then
    PrintBand:= Trim( qrdbtxtenvase_ocl.DataSet.FieldByName('notas_ocl').AsString ) <> ''
  else
    PrintBand:= False;
end;

end.
