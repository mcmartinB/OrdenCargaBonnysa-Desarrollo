unit UQOrdenPackingSimple;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRPDFFilt;

type
  TQOrdenPackingSimple = class(TQuickRep)
    bndTitulo: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText55: TQRDBText;
    bndPackingLinea: TQRSubDetail;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlbl1: TQRLabel;
    qrdbtxtcategoria_pl: TQRDBText;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText55Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText35Print(sender: TObject; var Value: String);
    procedure QRDBText34Print(sender: TObject; var Value: String);
    procedure qrlbl1Print(sender: TObject; var Value: String);
    procedure QRDBText37Print(sender: TObject; var Value: string);
  private

  public

  end;

  procedure VisualizarOrden( const AOwner: TComponent; const AOrden: integer );
  //procedure GuardarOrden( const AOwner: TComponent; const AOrden: integer; const AFileName: string );

implementation

{$R *.DFM}

uses UDListados, UDDescripciones;

procedure VisualizarOrden( const AOwner: TComponent; const AOrden: integer );
var
  ALineas, APacking, ALogifruit, AEnvases, APalets: boolean;
  QOrden: TQOrdenPackingSimple;
  DListados: TDListados;
begin
  DListados:= TDListados.Create( AOwner );
  try
    ALineas:= False;
    APacking:= True;
    ALogifruit:= False;
    AEnvases:= False;
    APalets:= False;
    if DListados.DatosOrden( AOrden, ALineas, APacking, ALogifruit, AEnvases, APalets ) then
    begin
      QOrden:= TQOrdenPackingSimple.Create( AOwner );
      try
        QOrden.ReportTitle:= 'PACKING ORDEN CARGA ' + IntToStr( AOrden );
        QOrden.Preview;
      finally
        FreeAndNil( QOrden );
      end;
    end;
  finally
    FreeAndNil( DListados );
  end;
end;

procedure TQOrdenPackingSimple.QRDBText1Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desEmpresa( Value );
end;

procedure TQOrdenPackingSimple.QRDBText2Print(sender: TObject; var Value: String);
begin
  Value:= DDescripciones.desCentro( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenPackingSimple.QRDBText3Print(sender: TObject; var Value: String);
begin
  Value:= 'FECHA CARGA: ' + Value + ' ' + DataSet.FieldByName('hora_occ').AsString;
end;

procedure TQOrdenPackingSimple.QRDBText55Print(sender: TObject;
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

procedure TQOrdenPackingSimple.QRDBText11Print(sender: TObject;
  var Value: String);
begin
   Value:= DDescripciones.desEnvase( DataSet.FieldByName('empresa_occ').AsString, Value );
end;

procedure TQOrdenPackingSimple.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if Exporting then
  begin
    Value:= ''''+ Value;
  end;
end;

procedure TQOrdenPackingSimple.QRDBText35Print(sender: TObject;
  var Value: String);
begin
  if Exporting then
  begin
    Value:= ''''+ Value;
  end;
end;

procedure TQOrdenPackingSimple.QRDBText37Print(sender: TObject;
  var Value: string);
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
          Value := FloatToStr(bndPackingLinea.DataSet.FieldByName('cajas_pl').AsInteger * FieldByName('peso_neto_e').AsFloat);
    end;
    Close;
  end;
end;

procedure TQOrdenPackingSimple.QRDBText34Print(sender: TObject;
  var Value: String);
begin
  if Exporting then
  begin
    Value:= ''''+ Value;
  end;
end;

procedure TQOrdenPackingSimple.qrlbl1Print(sender: TObject;
  var Value: String);
begin
  Value:= '';
end;

end.
