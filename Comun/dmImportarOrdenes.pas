unit dmImportarOrdenes;

interface

uses
  SysUtils,
  Classes,
  DBTables,
  SqlExpr,
  SimpleDS,
  DB,
  Dialogs,

  ConexionAWSAurora,
  UTipos,
  UDOrdenCarga,
  windows;

type
  TProgressUpdate = procedure(Sender: TObject; Index: Integer; Total: Integer) of object;
  TOnLog = procedure(Sender: TObject; const Mensaje: String) of object;




type
  TFDMImportarOrdenes = class(TDataModule)
  private
    FConexionAurora: TConexionAWSAurora;
    FConexionDestino: TDataBase;

    FQSelOrdenCab: TSimpleDataset;

    FQSelOrdenCabCount,
    FQSelOrdenLin,
    FQSelPacking: TSQLQuery;

    FQExisteOrdenCab,
    FQInsOrdenCab,
    FQInsOrdenLin,
    FQInsPacking: TQuery;
    FOnProgressUpdate: TProgressUpdate;
    FOnLog: TOnLog;

    FCentroDTO: TCentroDTO;

  protected
    procedure CargarCabecera;
    procedure CargarLineas(orden_occ: Integer);
    procedure CargarPackingList(orden_occ: Integer);

    procedure Log(const Mensaje: String);
    procedure ProgressUpdate(Index: integer; Total: Integer);
    function ExisteOrden(orden_occ: Integer): boolean;
    procedure AsingnarCamposAParametros(Source: TDataset; Destination: TQuery);
    function GetComputerNameFromWindows: string;
    function GetUsernameFromWindows : string;
  public
    RegistrosTotales : integer;
    RegistrosProcesados: Integer;
    RegistrosErrores: Integer;

    function AbrirOrdenCargaIfx(empresa, centro : string; fecha : TDateTime; orden_occ : integer) : TQuery;
    function AbrirOrdenCargaDetIfx(empresa, centro : string; fecha : TDateTime; orden_occ : integer) : TQuery;
    function AbrirOrdenCargaAurora(empresa, centro : string; fecha : TDateTime; orden_occ : integer) : TSQLQuery;
    function AbrirOrdenCargaDetAurora(empresa, centro : string; fecha : TDateTime; orden_occ : integer) : TSQLQuery;



    function CambiarContadorAurora(registro : TDataset; nuevo_contador : integer) : integer;
    function CambiarEstadoAurora(registro : TDataset;  status_occ : integer) : integer;
    function BorrarOccAurora(registro : TDataset) : integer;

    function CambiarContadorInformix(registro : TDataset;   nuevo_contador : integer) : integer;
    function CambiarEstadoInformix(registro : TDataset;  status_occ : integer) : integer;
    function ActulizarImpuestosOccInformix(registro : TDataset) : integer;
    function GenerarContadorInformix(empresa_occ : string) : integer;


    constructor Create(AOwner: TComponent; ADatabase: TDatabase; CentroDTO: TCentroDTO); reintroduce;
    destructor Destroy; override;

    procedure Inicializar(TotalRegistros : integer);
    procedure Finalizar;
    function Descargar(orden_occ : integer) : boolean;
    function RegistrosaProcesar : integer;

    property OnProgressUpdate: TProgressUpdate read FOnProgressUpdate write FOnProgressUpdate;
    property OnLog: TOnLog read FOnLog write FOnLog;

    procedure RegistrarError(empresa, centro : string; fecha : TDatetime; orden_occ : integer);
  end;

var
  FDMImportarOrdenes: TFDMImportarOrdenes;



implementation

{$R *.dfm}

const
  _ORDEN_TRASPASADA_SI_ = 1;
  _ORDEN_TRASPASADA_NO_ = 0;


{ TFDMImportarOrdenes }


procedure TFDMImportarOrdenes.CargarCabecera;
begin
  with FQInsOrdenCab do
  begin
    AsingnarCamposAParametros(FQSelOrdenCab, FQInsOrdenCab);
    ExecSQL;
  end;

end;

procedure TFDMImportarOrdenes.CargarLineas(orden_occ: Integer);
begin
  with FQInsOrdenLin do
  begin
    if FQSelOrdenLin.Active then
      FQSelOrdenLin.Close;
    FQSelOrdenLin.ParamByName('orden_occ').asInteger := orden_occ;
    FQSelOrdenLin.Open;
    while not FQSelOrdenLin.eof do
    begin
      AsingnarCamposAParametros(FQSelOrdenLin, FQInsOrdenLin);
      ExecSQL;

      FQSelOrdenLin.Next;
    end;
  end;
end;

procedure TFDMImportarOrdenes.CargarPackingList(orden_occ: Integer);
begin
  with FQInsPacking do
  begin
    if FQSelPacking.Active then
      FQSelPacking.Close;
    FQSelPacking.ParamByName('orden_occ').asInteger := orden_occ;
    FQSelPacking.Open;
    while not FQSelPacking.eof do
    begin
      AsingnarCamposAParametros(FQSelPacking, FQInsPacking);
      ExecSQL;

      FQSelPacking.Next;
    end;
  end;
end;

constructor TFDMImportarOrdenes.Create(AOwner: TComponent; ADatabase: TDatabase; CentroDTO: TCentroDTO);
begin
  inherited Create(AOwner);

  FCentroDTO.EmpresaCodigo := CentroDTO.EmpresaCodigo;
  FCentroDTO.EmpresaDescripcion := CentroDTO.EmpresaDescripcion;
  FCentroDTO.CentroCodigo := CentroDTO.CentroCodigo;
  FCentroDTO.CentroDescripcion := CentroDTO.CentroDescripcion;

  FConexionAurora := TConexionAWSAurora.Create(Self);
  FConexionDestino := ADatabase;

  FQSelOrdenCab := FConexionAurora.NewSimpleDataset(Self);
  FQSelOrdenCab.Dataset.CommandText := 'select * from frf_orden_carga_c where empresa_occ = :empresa_occ and centro_salida_occ = :centro_salida_occ and orden_occ = :orden_occ and status_occ = :status_occ';

  FQSelOrdenCabCount := FConexionAurora.NewSQLQuery(Self);
  FQSelOrdenCabCount.CommandText := 'select count(*) as total from frf_orden_carga_c where empresa_occ = :empresa_occ and centro_salida_occ = :centro_salida_occ and  traspasada_occ = :traspasada_occ';

  FQSelOrdenLin  := FConexionAurora.NewSQLQuery(Self);
  FQSelOrdenLin.CommandText := 'select * from frf_orden_carga_l where orden_ocl = :orden_occ';

  FQSelPacking := FConexionAurora.NewSQLQuery(Self);
  FQSelPacking.CommandText := 'select * from frf_packing_list where orden_pl = :orden_occ';


  FQExisteOrdenCab := TQuery.Create(Self);
  with FQExisteOrdenCab do
  begin
    DatabaseName := 'Database';
    SQL.Add('select * from frf_orden_carga_c where orden_occ = :orden_occ');
  end;

  FQInsOrdenCab := TQuery.Create(Self);
  with FQInsOrdenCab do
  begin
    DatabaseName := 'Database';
    SQL.Add('insert into frf_orden_carga_c ( ');
    SQL.Add('orden_occ, ');
    SQL.Add('empresa_occ, ');
    SQL.Add('centro_salida_occ, ');
    SQL.Add('n_albaran_occ, ');
    SQL.Add('fecha_occ, ');
    SQL.Add('hora_occ, ');
    SQL.Add('planta_origen_occ, ');
    SQL.Add('planta_destino_occ, ');
    SQL.Add('centro_destino_occ, ');
    SQL.Add('cliente_sal_occ, ');
    SQL.Add('dir_sum_occ, ');
    SQL.Add('cliente_fac_occ, ');
    SQL.Add('depto_occ, ');
    SQL.Add('n_pedido_bonnysa_occ, ');
    SQL.Add('n_pedido_occ, ');
    SQL.Add('fecha_pedido_occ, ');
    SQL.Add('fecha_descarga_occ, ');
    SQL.Add('moneda_occ, ');
    SQL.Add('operador_occ, ');
    SQL.Add('operador_transporte_occ, ');
    SQL.Add('transporte_occ, ');
    SQL.Add('porte_bonny_occ, ');
    SQL.Add('vehiculo_occ, ');
    SQL.Add('n_palets_occ, ');
    SQL.Add('muelle_occ, ');
    SQL.Add('higiene_occ, ');
    SQL.Add('nota_occ, ');
    SQL.Add('nota_interna_occ, ');
    SQL.Add('status_occ, ');
    SQL.Add('traspasada_occ, ');
    SQL.Add('desadv_occ ');
    SQL.Add(') values ( ');
    SQL.Add(':orden_occ, ');
    SQL.Add(':empresa_occ, ');
    SQL.Add(':centro_salida_occ, ');
    SQL.Add(':n_albaran_occ, ');
    SQL.Add(':fecha_occ, ');
    SQL.Add(':hora_occ, ');
    SQL.Add(':planta_origen_occ, ');
    SQL.Add(':planta_destino_occ, ');
    SQL.Add(':centro_destino_occ, ');
    SQL.Add(':cliente_sal_occ, ');
    SQL.Add(':dir_sum_occ, ');
    SQL.Add(':cliente_fac_occ, ');
    SQL.Add(':depto_occ, ');
    SQL.Add(':n_pedido_bonnysa_occ, ');
    SQL.Add(':n_pedido_occ, ');
    SQL.Add(':fecha_pedido_occ, ');
    SQL.Add(':fecha_descarga_occ, ');
    SQL.Add(':moneda_occ, ');
    SQL.Add(':operador_occ, ');
    SQL.Add(':operador_transporte_occ, ');
    SQL.Add(':transporte_occ, ');
    SQL.Add(':porte_bonny_occ, ');
    SQL.Add(':vehiculo_occ, ');
    SQL.Add(':n_palets_occ, ');
    SQL.Add(':muelle_occ, ');
    SQL.Add(':higiene_occ, ');
    SQL.Add(':nota_occ, ');
    SQL.Add(':nota_interna_occ, ');
    SQL.Add(':status_occ, ');
    SQL.Add(':traspasada_occ, ');
    SQL.Add(':desadv_occ ');
    SQL.Add(')');

    ParamByName('orden_occ').DataType := ftInteger;
    ParamByName('empresa_occ').DataType := ftString;
    ParamByName('centro_salida_occ').DataType := ftString;
    ParamByName('n_albaran_occ').DataType := ftInteger;
    ParamByName('fecha_occ').DataType := ftDate;
    ParamByName('hora_occ').DataType := ftString;
    ParamByName('planta_origen_occ').DataType := ftString;
    ParamByName('planta_destino_occ').DataType := ftString;
    ParamByName('centro_destino_occ').DataType := ftString;
    ParamByName('cliente_sal_occ').DataType := ftString;
    ParamByName('dir_sum_occ').DataType := ftString;
    ParamByName('cliente_fac_occ').DataType := ftString;
    ParamByName('depto_occ').DataType := ftString;
    ParamByName('n_pedido_bonnysa_occ').DataType := ftString;
    ParamByName('n_pedido_occ').DataType := ftString;
    ParamByName('fecha_pedido_occ').DataType := ftDate;
    ParamByName('fecha_descarga_occ').DataType := ftDate;
    ParamByName('moneda_occ').DataType := ftString;
    ParamByName('operador_occ').DataType := ftInteger;
    ParamByName('operador_transporte_occ').DataType := ftInteger;
    ParamByName('transporte_occ').DataType := ftInteger;
    ParamByName('porte_bonny_occ').DataType := ftInteger;
    ParamByName('vehiculo_occ').DataType := ftString;
    ParamByName('n_palets_occ').DataType := ftInteger;
    ParamByName('muelle_occ').DataType := ftString;
    ParamByName('higiene_occ').DataType := ftInteger;
    ParamByName('nota_occ').DataType := ftString;
    ParamByName('nota_interna_occ').DataType := ftString;
    ParamByName('status_occ').DataType := ftInteger;
    ParamByName('traspasada_occ').DataType := ftInteger;
    ParamByName('desadv_occ').DataType := ftInteger;
  end;

  FQInsOrdenLin := TQuery.Create(Self);
  with FQInsOrdenLin do
  begin
    DatabaseName := 'Database';
    SQL.Add('insert into frf_orden_carga_l ( ');
    SQL.Add('orden_ocl, ');
    SQL.Add('linea_ocl, ');
    SQL.Add('empresa_ocl, ');
    SQL.Add('centro_salida_ocl, ');
    SQL.Add('n_albaran_ocl, ');
    SQL.Add('fecha_ocl, ');
    SQL.Add('centro_origen_ocl, ');
    SQL.Add('producto_ocl, ');
    SQL.Add('producto_base_ocl, ');
    SQL.Add('formato_cliente_ocl, ');
    SQL.Add('envase_ocl, ');
    SQL.Add('envaseold_ocl, ');
    SQL.Add('marca_ocl, ');
    SQL.Add('categoria_ocl, ');
    SQL.Add('calibre_ocl, ');
    SQL.Add('color_ocl, ');
    SQL.Add('ref_transitos_ocl, ');
    SQL.Add('fecha_transito_ocl, ');
    SQL.Add('unidades_caja_ocl, ');
    SQL.Add('cajas_ocl, ');
    SQL.Add('unidades_ocl, ');
    SQL.Add('kilos_ocl, ');
    SQL.Add('precio_ocl, ');
    SQL.Add('unidad_precio_ocl, ');
    SQL.Add('importe_neto_ocl, ');
    SQL.Add('porc_iva_ocl, ');
    SQL.Add('iva_ocl, ');
    SQL.Add('importe_total_ocl, ');
    SQL.Add('n_palets_ocl, ');
    SQL.Add('tipo_palets_ocl, ');
    SQL.Add('tipo_iva_ocl, ');
    SQL.Add('federacion_ocl, ');
    SQL.Add('cliente_ocl, ');
    SQL.Add('emp_procede_ocl, ');
    SQL.Add('kilos_packing_ocl, ');
    SQL.Add('cajas_packing_ocl, ');
    SQL.Add('palets_packing_ocl, ');
    SQL.Add('comercial_ocl, ');
    SQL.Add('notas_ocl ');
    SQL.Add(') values ( ');
    SQL.Add(':orden_ocl, ');
    SQL.Add(':linea_ocl, ');
    SQL.Add(':empresa_ocl, ');
    SQL.Add(':centro_salida_ocl, ');
    SQL.Add(':n_albaran_ocl, ');
    SQL.Add(':fecha_ocl, ');
    SQL.Add(':centro_origen_ocl, ');
    SQL.Add(':producto_ocl, ');
    SQL.Add(':producto_base_ocl, ');
    SQL.Add(':formato_cliente_ocl, ');
    SQL.Add(':envase_ocl, ');
    SQL.Add(':envaseold_ocl, ');
    SQL.Add(':marca_ocl, ');
    SQL.Add(':categoria_ocl, ');
    SQL.Add(':calibre_ocl, ');
    SQL.Add(':color_ocl, ');
    SQL.Add(':ref_transitos_ocl, ');
    SQL.Add(':fecha_transito_ocl, ');
    SQL.Add(':unidades_caja_ocl, ');
    SQL.Add(':cajas_ocl, ');
    SQL.Add(':unidades_ocl, ');
    SQL.Add(':kilos_ocl, ');
    SQL.Add(':precio_ocl, ');
    SQL.Add(':unidad_precio_ocl, ');
    SQL.Add(':importe_neto_ocl, ');
    SQL.Add(':porc_iva_ocl, ');
    SQL.Add(':iva_ocl, ');
    SQL.Add(':importe_total_ocl, ');
    SQL.Add(':n_palets_ocl, ');
    SQL.Add(':tipo_palets_ocl, ');
    SQL.Add(':tipo_iva_ocl, ');
    SQL.Add(':federacion_ocl, ');
    SQL.Add(':cliente_ocl, ');
    SQL.Add(':emp_procede_ocl, ');
    SQL.Add(':kilos_packing_ocl, ');
    SQL.Add(':cajas_packing_ocl, ');
    SQL.Add(':palets_packing_ocl, ');
    SQL.Add(':comercial_ocl, ');
    SQL.Add(':notas_ocl ');
    SQL.Add(')');

    ParamByName('orden_ocl').DataType := ftInteger;
    ParamByName('linea_ocl').DataType := ftInteger;
    ParamByName('empresa_ocl').DataType := ftString;
    ParamByName('centro_salida_ocl').DataType := ftString;
    ParamByName('n_albaran_ocl').DataType := ftInteger;
    ParamByName('fecha_ocl').DataType := ftDate;
    ParamByName('centro_origen_ocl').DataType := ftString;
    ParamByName('producto_ocl').DataType := ftString;
    ParamByName('producto_base_ocl').DataType := ftInteger;
    ParamByName('formato_cliente_ocl').DataType := ftString;
    ParamByName('envase_ocl').DataType := ftString;
    ParamByName('envaseold_ocl').DataType := ftString;
    ParamByName('marca_ocl').DataType := ftString;
    ParamByName('categoria_ocl').DataType := ftString;
    ParamByName('calibre_ocl').DataType := ftString;
    ParamByName('color_ocl').DataType := ftString;
    ParamByName('ref_transitos_ocl').DataType := ftInteger;
    ParamByName('fecha_transito_ocl').DataType := ftDate;
    ParamByName('unidades_caja_ocl').DataType := ftInteger;
    ParamByName('cajas_ocl').DataType := ftInteger;
    ParamByName('unidades_ocl').DataType := ftInteger;
    ParamByName('kilos_ocl').DataType := ftFloat;
    ParamByName('precio_ocl').DataType := ftFloat;
    ParamByName('unidad_precio_ocl').DataType := ftString;
    ParamByName('importe_neto_ocl').DataType := ftFloat;
    ParamByName('porc_iva_ocl').DataType := ftFloat;
    ParamByName('iva_ocl').DataType := ftFloat;
    ParamByName('importe_total_ocl').DataType := ftFloat;
    ParamByName('n_palets_ocl').DataType := ftInteger;
    ParamByName('tipo_palets_ocl').DataType := ftString;
    ParamByName('tipo_iva_ocl').DataType := ftString;
    ParamByName('federacion_ocl').DataType := ftString;
    ParamByName('cliente_ocl').DataType := ftString;
    ParamByName('emp_procede_ocl').DataType := ftString;
    ParamByName('kilos_packing_ocl').DataType := ftFloat;
    ParamByName('cajas_packing_ocl').DataType := ftInteger;
    ParamByName('palets_packing_ocl').DataType := ftInteger;
    ParamByName('comercial_ocl').DataType := ftString;
    ParamByName('notas_ocl').DataType := ftString;
  end;

  FQInsPacking := TQuery.Create(Self);
  with FQInsPacking do
  begin
    DatabaseName := 'Database';
    SQL.Add('insert into frf_packing_list ( ');
    SQL.Add('orden_pl, ');
    SQL.Add('fecha_alta_pl, ');
    SQL.Add('hora_alta_pl, ');
    SQL.Add('empresa_pl, ');
    SQL.Add('producto_base_pl, ');
    SQL.Add('producto_pl, ');
    SQL.Add('ean128_pl, ');
    SQL.Add('ean13_pl, ');
    SQL.Add('formato_pl, ');
    SQL.Add('formato_cliente_pl, ');
    SQL.Add('envase_pl, ');
    SQL.Add('envaseold_pl, ');
    SQL.Add('unidades_caja_pl, ');
    SQL.Add('cajas_pl, ');
    SQL.Add('marca_pl, ');
    SQL.Add('categoria_pl, ');
    SQL.Add('calibre_pl, ');
    SQL.Add('color_pl, ');
    SQL.Add('le_pl, ');
    SQL.Add('peso_pl, ');
    SQL.Add('tipo_palet_pl, ');
    SQL.Add('cliente_pl, ');
    SQL.Add('dir_sum_pl, ');
    SQL.Add('fecha_carga_pl, ');
    SQL.Add('hora_carga_pl, ');
    SQL.Add('cod_devolucion, ');
    SQL.Add('albaran_entrada_tfe, ');
    SQL.Add('plantacion, ');
    SQL.Add('variedad, ');
    SQL.Add('caducidad_pl, ');
    SQL.Add('bestbefore_pl, ');
    SQL.Add('recoleccion_pl, ');
    SQL.Add('fechapedido_pl, ');
    SQL.Add('pedido_pl, ');
    SQL.Add('plantacion_pl, ');
    SQL.Add('lote_pl, ');
    SQL.Add('variedad_pl, ');
    SQL.Add('lotecliente_pl, ');
    SQL.Add('envase_orden_pl, ');
    SQL.Add('linea_orden_pl ');
    SQL.Add(' ) values ( ');
    SQL.Add(':orden_pl, ');
    SQL.Add(':fecha_alta_pl, ');
    SQL.Add(':hora_alta_pl, ');
    SQL.Add(':empresa_pl, ');
    SQL.Add(':producto_base_pl, ');
    SQL.Add(':producto_pl, ');
    SQL.Add(':ean128_pl, ');
    SQL.Add(':ean13_pl, ');
    SQL.Add(':formato_pl, ');
    SQL.Add(':formato_cliente_pl, ');
    SQL.Add(':envase_pl, ');
    SQL.Add(':envaseold_pl, ');
    SQL.Add(':unidades_caja_pl, ');
    SQL.Add(':cajas_pl, ');
    SQL.Add(':marca_pl, ');
    SQL.Add(':categoria_pl, ');
    SQL.Add(':calibre_pl, ');
    SQL.Add(':color_pl, ');
    SQL.Add(':le_pl, ');
    SQL.Add(':peso_pl, ');
    SQL.Add(':tipo_palet_pl, ');
    SQL.Add(':cliente_pl, ');
    SQL.Add(':dir_sum_pl, ');
    SQL.Add(':fecha_carga_pl, ');
    SQL.Add(':hora_carga_pl, ');
    SQL.Add(':cod_devolucion, ');
    SQL.Add(':albaran_entrada_tfe, ');
    SQL.Add(':plantacion, ');
    SQL.Add(':variedad, ');
    SQL.Add(':caducidad_pl, ');
    SQL.Add(':bestbefore_pl, ');
    SQL.Add(':recoleccion_pl, ');
    SQL.Add(':fechapedido_pl, ');
    SQL.Add(':pedido_pl, ');
    SQL.Add(':plantacion_pl, ');
    SQL.Add(':lote_pl, ');
    SQL.Add(':variedad_pl, ');
    SQL.Add(':lotecliente_pl, ');
    SQL.Add(':envase_orden_pl, ');
    SQL.Add(':linea_orden_pl ');
    SQL.Add(')');
    ParamByName('orden_pl').DataType := ftInteger;
    ParamByName('fecha_alta_pl').DataType := ftDate;
    ParamByName('hora_alta_pl').DataType := ftString;
    ParamByName('empresa_pl').DataType := ftString;
    ParamByName('producto_base_pl').DataType := ftInteger;
    ParamByName('producto_pl').DataType := ftString;
    ParamByName('ean128_pl').DataType := ftString;
    ParamByName('ean13_pl').DataType := ftString;
    ParamByName('formato_pl').DataType := ftString;
    ParamByName('formato_cliente_pl').DataType := ftString;
    ParamByName('envase_pl').DataType := ftString;
    ParamByName('envaseold_pl').DataType := ftString;
    ParamByName('unidades_caja_pl').DataType := ftInteger;
    ParamByName('cajas_pl').DataType := ftInteger;
    ParamByName('marca_pl').DataType := ftString;
    ParamByName('categoria_pl').DataType := ftString;
    ParamByName('calibre_pl').DataType := ftString;
    ParamByName('color_pl').DataType := ftString;
    ParamByName('le_pl').DataType := ftString;
    ParamByName('peso_pl').DataType := ftFloat;
    ParamByName('tipo_palet_pl').DataType := ftString;
    ParamByName('cliente_pl').DataType := ftString;
    ParamByName('dir_sum_pl').DataType := ftString;
    ParamByName('fecha_carga_pl').DataType := ftDate;
    ParamByName('hora_carga_pl').DataType := ftString;
    ParamByName('cod_devolucion').DataType := ftInteger;
    ParamByName('albaran_entrada_tfe').DataType := ftInteger;
    ParamByName('plantacion').DataType := ftString;
    ParamByName('variedad').DataType := ftString;
    ParamByName('caducidad_pl').DataType := ftDate;
    ParamByName('bestbefore_pl').DataType := ftDate;
    ParamByName('recoleccion_pl').DataType := ftDate;
    ParamByName('fechapedido_pl').DataType := ftDate;
    ParamByName('pedido_pl').DataType := ftString;
    ParamByName('plantacion_pl').DataType := ftString;
    ParamByName('lote_pl').DataType := ftString;
    ParamByName('variedad_pl').DataType := ftString;
    ParamByName('lotecliente_pl').DataType := ftString;
    ParamByName('envase_orden_pl').DataType := ftString;
    ParamByName('linea_orden_pl').DataType := ftInteger;
  end;
end;

function TFDMImportarOrdenes.CambiarContadorInformix(registro : TDataset;   nuevo_contador : integer) : integer;
var
  lin : TDataset;
begin
  try
    lin := nil;
    try
      registro.edit;
      registro.fieldbyname('orden_occ').asinteger := nuevo_contador;
      registro.post;



      lin := self.AbrirOrdenCargaDetIfx(registro.fieldbyname('empresa_occ').asstring,
        registro.fieldbyname('centro_salida_occ').asstring,
        registro.fieldbyname('fecha_occ').asdatetime,
        registro.fieldbyname('orden_occ').asinteger);

      lin.first;

      while not lin.eof do
      begin
          lin.edit;
          lin.FieldByName('orden_occ').asinteger := nuevo_contador;
          lin.post;
          lin.next;
      end;

      except
        ON E : exception do
        begin
          Log('Error al actulizar la tabla orden_carga en Informix: '+e.message);
        end;
      end;

      lin.close;
  finally
      FreeAndNil(lin);
  end;
end;

function TFDMImportarOrdenes.CambiarEstadoInformix(registro : TDataset;  status_occ : integer) : integer;
begin
    try
      registro.edit;
      registro.FieldByName('status_occ').asinteger := status_occ;
      registro.post;

    except
      ON E : exception do
      begin
        Log('Error al actulizar la tabla orden_carga en Informix: '+e.message);
      end;
    end;
end;



function TFDMImportarOrdenes.ActulizarImpuestosOccInformix(registro : TDataset) : integer;
var
  lin : TDataset;
  rImpuestoLinea : integer;
  rImpuestoCliente : TImpuesto;
  Impuesto : real;
  ordenCarga : TDOrdenCarga;
begin
  try
      try
        ordenCarga := TDOrdenCarga.Create(nil);

        registro.first;


        while not registro.eof do
        begin
            rImpuestoCliente := ordenCarga.ImpuestosCliente(registro.fieldbyname('empresa_occ').asstring, registro.fieldbyname('centro_saida_occ').asstring,
                registro.fieldbyname('cliente_sal_occ').asstring, registro.fieldbyname('dir_sum_occ').asstring, registro.fieldbyname('fecha_occ').asdatetime);
            registro.next;
        end;

        lin := self.AbrirOrdenCargaDetIfx(registro.fieldbyname('empresa_occ').asstring,
                registro.fieldbyname('centro_salida_occ').asstring,
                registro.fieldbyname('fecha_occ').asdatetime,
                registro.fieldbyname('orden_occ').asinteger);

        lin.first;


        while not lin.eof do
        begin

            rImpuestoLinea := ordenCarga.TipoIvaEnvaseProducto(lin.fieldbyname('empresa_ocl').asstring,
                              lin.fieldbyname('envase_ocl').asstring,
                              lin.fieldbyname('producto_ocl').asstring);

            case rImpuestoLinea  of
              0 : Impuesto := rImpuestoCliente.rSuper;
              1 : Impuesto := rImpuestoCliente.rReducido;
            else Impuesto := rImpuestoCliente.rGeneral;

            end;
            lin.edit;
            lin.fieldbyname('por_iva_ocl').asfloat := impuesto;
            lin.fieldbyname('iva_ocl').asfloat := 0; //no se porque lo pone a 0
            lin.post;

            lin.Next;
        end;
      except
        ON E : exception do
        begin
          Log('Error al actulizar la tabla orden_carga en Informix: '+e.message);
        end;
      end;
  finally
      lin.close;
      FreeAndNil(lin);
      FreeAndNil(ordenCarga);
  end;
end;


function TFDMImportarOrdenes.CambiarContadorAurora(registro : TDataset; nuevo_contador : integer) : integer;
var
  lin : TDataset;
begin
  try
    lin := nil;
    try
      registro.edit;
      registro.fieldbyname('orden_occ').asinteger := nuevo_contador;
      registro.fieldbyname('updated_at').asdatetime := now;
      registro.post;

      lin := self.AbrirOrdenCargaDetIfx(registro.fieldbyname('empresa_occ').asstring,
        registro.fieldbyname('centro_salida_occ').asstring,
        registro.fieldbyname('fecha_occ').asdatetime,
        registro.fieldbyname('orden_occ').asinteger);

      lin.first;

      while not lin.eof do
      begin
          lin.edit;
          lin.FieldByName('orden_occ').asinteger := nuevo_contador;
          lin.fieldbyname('updated_at').asdatetime := now;
          lin.post;
          lin.next;
      end;

      lin.close;

      except
        ON E : exception do
        begin
          Log('Error al actulizar la tabla orden_carga en Informix: '+e.message);
        end;
      end;
  finally
      FreeAndNil(lin);
  end;
end;



function TFDMImportarOrdenes.Descargar(orden_occ : integer) : boolean;
var
  correcto : boolean;
  nuevo_contador : integer;
  ifxdst, auroradst : TDataset;
begin
  correcto := false;

  FConexionAurora.Connected := True;
  try
    try
      Log('Conectando a servidor web...');
      FQSelOrdenCab.Close;
      FQSelOrdenCab.Dataset.Params.ParamByName('empresa_occ').asString := FCentroDTO.EmpresaCodigo;
      FQSelOrdenCab.Dataset.Params.ParamByName('centro_salida_occ').asString := FCentroDTO.CentroCodigo;
      FQSelOrdenCab.Dataset.Params.ParamByName('orden_occ').asinteger := orden_occ;
      FQSelOrdenCab.Dataset.Params.ParamByName('status_occ').asInteger := 4;
      FQSelOrdenCab.Open;
      Log('Conectado a servidor web.');



      //RegistrosTotales := RegistrosAProcesar;
      Log(Format('Procesando %d orden de carga', [ orden_occ ]));
      while not FQSelOrdenCab.eof do
      begin
        orden_occ := FQSelOrdenCab.FieldByName('orden_occ').AsInteger;
        if not ExisteOrden(orden_occ) then
        begin
          FConexionDestino.StartTransaction;
          try
            CargarCabecera;
            CargarLineas(orden_occ);
            CargarPackingList(orden_occ);

  //          if FQSelOrdenCab.FieldByName('orden_occ').asInteger in [20, 30] then
  //            raise Exception.Create('Error provocado a posta');

            nuevo_contador := self.GenerarContadorInformix(FCentroDTO.EmpresaCodigo);

            ifxdst := self.AbrirOrdenCargaIfx(FQSelOrdenCab.FieldByName('empresa_occ').asstring,
                   FQSelOrdenCab.FieldByName('centro_salida_occ').asstring,
                    FQSelOrdenCab.FieldByName('fecha_occ').asdatetime,
                    orden_occ);


             self.CambiarContadorInformix(ifxdst, nuevo_contador);

             ifxdst.close;
             FreeAndNil(ifxdst);


            FConexionDestino.Commit;
            Inc(RegistrosProcesados);

            try
              auroradst := self.AbrirOrdenCargaAurora(FQSelOrdenCab.FieldByName('empresa_occ').asstring,
                   FQSelOrdenCab.FieldByName('centro_salida_occ').asstring,
                    FQSelOrdenCab.FieldByName('fecha_occ').asdatetime,
                    orden_occ);

              self.CambiarContadorAurora(auroradst, nuevo_Contador);

              auroradst.close;
              FreeAndNil(auroradst);

              correcto := true;
            Except
              on E: Exception do
              begin
                correcto := false;
                if FQSelOrdenCab.State in dsEditModes then
                  FQSelOrdenCab.Cancel;
                Log(Format('Error al pasar a estado ''Descargada'' la orden %d', [ orden_occ ]));
              end;
            end;

          except
            on E: Exception do
            begin
              correcto := false;
              Inc(RegistrosErrores);
              FConexionDestino.Rollback;
              Log(Format('Error al importar orden %d (%s)', [ orden_occ, E.Message ]));
            end;
          end;
        end
        else
        begin
          Log(Format('Warning: la orden %d ya existe', [ orden_occ ]));
          Inc(RegistrosErrores);
        end;

        FQSelOrdenCab.Next;
        ProgressUpdate(RegistrosProcesados, RegistrosTotales);
      end;
    except
      on E: Exception do
      begin
        correcto := false;
        Log(E.Message);
      end;
    end;
  finally
    FQSelOrdenCab.Close;
    FConexionAurora.Connected := False;
  end;

  result := correcto;
end;

destructor TFDMImportarOrdenes.Destroy;
begin
  FConexionAurora.Free;
  inherited;
end;

function TFDMImportarOrdenes.ExisteOrden(orden_occ: Integer): boolean;
begin
  with FQExisteOrdenCab do
  begin
    if Active then Close;
    ParamByName('orden_occ').asInteger := orden_occ;
    Open;
    Result := not isEmpty;
    Close;
  end;
end;

procedure TFDMImportarOrdenes.Log(const Mensaje: String);
var
  timestamp: String;
begin
  if Assigned(FOnLog) then
  begin
    timestamp := FormatDateTime('dd-mm-yyyy hh:mm:ss', now);
    FOnLog(Self, Format('%s - %s', [ timestamp, Mensaje]));
  end;
end;

procedure TFDMImportarOrdenes.ProgressUpdate(Index, Total: Integer);
begin
  if Assigned(FOnProgressUpdate) then
    FOnProgressUpdate(Self, Index, Total);
end;

function TFDMImportarOrdenes.RegistrosAProcesar: Integer;
begin
  with FQSelOrdenCabCount do
  begin
    ParamByName('empresa_occ').asString := FCentroDTO.EmpresaCodigo;
    ParamByName('centro_salida_occ').asString := FCentroDTO.CentroCodigo;
    ParamByName('traspasada_occ').asInteger := _ORDEN_TRASPASADA_NO_;
    Open;
    Result := FieldByName('total').asInteger;
    Close;
  end;
end;


procedure TFDMImportarOrdenes.AsingnarCamposAParametros(Source: TDataset; Destination: TQuery);
var
  Ind:longint;
  SField: TField;
  DField: TParam;
begin
  for Ind:=0 to Destination.ParamCount - 1 do
   begin
     SField := Source.Fields[ Ind ];
     DField := Destination.Params.FindParam( SField.FieldName );

     if (DField <> nil) {and (DField.FieldKind = fkData) and
        not DField.ReadOnly} then
        if SField.IsNull then
        begin
          Destination.ParamByName(SField.FieldName).Clear
        end
        else if (SField.DataType = ftString) {or
           (SField.DataType <> DField.DataType)} then
        begin
           Destination.ParamByName(SField.FieldName).asString := Trim(SField.AsString);
        end
        else
        begin
           Destination.ParamByName(SField.FieldName).Value := Trim(SField.Value);
        end;
   end;
end;

procedure TFDMImportarOrdenes.Inicializar(TotalRegistros : integer);
begin
  self.RegistrosTotales := TotalRegistros;
  self.RegistrosProcesados := 0;
  self.RegistrosErrores := 0;
  Log('Inicializando importación');
  end;

procedure TFDMIMportarOrdenes.Finalizar;
begin
  Log('Fin importación.');
  Log(Format('Ordenes totales: %d. Ordenes importadas: %d. Ordenes no importadas: %d', [ RegistrosTotales, RegistrosProcesados, RegistrosErrores ]));
  self.RegistrosTotales := 0;
  self.RegistrosProcesados := 0;
  self.RegistrosErrores := 0;
end;

function TFDMIMportarOrdenes.BorrarOccAurora(registro : TDataset) : integer;
var
  estado : integer;
begin

  estado := -1;


      try
        registro.edit;
        registro.fieldbyname('updated_at').asdatetime := now;
        registro.fieldbyname('delete_at').asdatetime := registro.fieldbyname('updated_at').asdatetime;
        registro.post;

        estado := 0;
      except
        On E : Exception do
        begin
          estado := -2;
        end;
      end;

  result := estado;
end;

function TFDMIMportarOrdenes.GenerarContadorInformix(empresa_occ : string) : integer;
var
  q1: TQuery;
  contador : integer;
begin
  contador := -1;

  try
      try
        q1 := TQuery.Create(nil);
        q1.DatabaseName := 'Database';
        q1.SQL.add('select * from  frf_orden_carga');
        q1.sql.add('where empresa_oc = :p1');
        q1.prepare;

        q1.Open;

        while not q1.eof do
        begin
          q1.Edit;
          contador := q1.fieldbyname('contador_oc').asinteger;
          q1.fieldbyname('contador_oc').asinteger := contador + 1;
          q1.post;
        end;

        q1.close;
      except
        On E : exception do
        begin
            q1.Database.Rollback;
        end;

      end;
  finally
    FreeAndNil(q1);
  end;
end;

function TFDMIMportarOrdenes.CambiarEstadoAurora(registro : TDataset; status_occ : integer) : integer;
begin
  try
      try
        registro.edit;
        registro.fieldbyname('status_occ').AsInteger := status_occ;
        registro.fieldbyname('updated_at').asdatetime := now;
        registro.post;

      except
        ON E : exception do
        begin
          Log('Error al actulizar la tabla orden_carga en Informix: '+e.message);
        end;
      end;
  finally
  end;
end;


function TFDMIMportarOrdenes.AbrirOrdenCargaIfx(empresa, centro : string; fecha : TDateTime; orden_occ : integer) : TQuery;
var
  q : TQuery;
begin
  q := nil;
  try
    q := TQuery.Create(nil);
    q.Databasename := 'database';
    q.sql.add('select * from frf_orden_carga_c');
    q.sql.add('where empresa_occ = :p0');
    q.sql.add('and centro_salida_occ = :p1');
    q.sql.add('and fecha_occ = :p2');
    q.sql.add('and orden_occ = :p3');

    q.params[0].asstring := empresa;
    q.params[1].asstring := centro;
    q.params[2].asdatetime := fecha;
    q.params[3].asinteger := orden_occ;

    q.prepare;

    q.open;

  Except
    On E : Exception do
    begin
        Showmessage(e.message);
    end;
  end;

  result := q;
end;

function TFDMIMportarOrdenes.AbrirOrdenCargaDetIfx(empresa, centro : string; fecha : TDateTime; orden_occ : integer) : TQuery;
var
  q : TQuery;
begin
  q := nil;
  try
    q := TQuery.Create(nil);
    q.Databasename := 'database';
    q.sql.add('select * from frf_orden_carga_l');
    q.sql.add('where empresa_ocl = :p0');
    q.sql.add('and centro_salida_ocl = :p1');
    q.sql.add('and fecha_ocl = :p2');
    q.sql.add('and orden_ocl = :p3');

    q.params[0].asstring := empresa;
    q.params[1].asstring := centro;
    q.params[2].asdatetime := fecha;
    q.params[3].asinteger := orden_occ;

    q.prepare;

    q.open;

  Except
    On E : Exception do
    begin
        Showmessage(e.message);
    end;
  end;

  result := q;
end;

function TFDMIMportarOrdenes.AbrirOrdenCargaAurora(empresa, centro : string; fecha : TDateTime; orden_occ : integer) : TSQLQuery;
var
  q : TSQLQuery;
begin
  q := nil;
  try
    q := TSQLQuery.Create(nil);
    q.SQLConnection := self.FConexionAurora;

    q.sql.add('select * from frf_orden_carga_c');
    q.sql.add('where empresa_occ = :p0');
    q.sql.add('and centro_salida_occ = :p1');
    q.sql.add('and fecha_occ = :p2');
    q.sql.add('and orden_occ = :p3');

    q.params[0].asstring := empresa;
    q.params[1].asstring := centro;
    q.params[2].asdatetime := fecha;
    q.params[3].asinteger := orden_occ;


    q.open;

  Except
    On E : Exception do
    begin
        Showmessage(e.message);
    end;
  end;

  result := q;
end;

function TFDMIMportarOrdenes.AbrirOrdenCargaDetAurora(empresa, centro : string; fecha : TDateTime; orden_occ : integer) : TSQLQuery;
var
  q : TSQLQuery;
begin
  q := nil;
  try
    q := TSQLQuery.Create(nil);
    q.SQLConnection := self.FConexionAurora;

    q.sql.add('select * from frf_orden_carga_l');
    q.sql.add('where empresa_ocl = :p0');
    q.sql.add('and centro_salida_ocl = :p1');
    q.sql.add('and fecha_ocl = :p2');
    q.sql.add('and orden_ocl = :p3');

    q.params[0].asstring := empresa;
    q.params[1].asstring := centro;
    q.params[2].asdatetime := fecha;
    q.params[3].asinteger := orden_occ;


    q.open;

  Except
    On E : Exception do
    begin
        Showmessage(e.message);
    end;
  end;

  result := q;
end;

function TFDMIMportarOrdenes.GetComputerNameFromWindows: string;
var
  iLen: Cardinal;
begin
  iLen := MAX_COMPUTERNAME_LENGTH + 1;
  Result := StringOfChar(#0, iLen);
  GetComputerName(PChar(Result), iLen);
  SetLength(Result, iLen);
end;

function TFDMImportarOrdenes.GetUsernameFromWindows : string;
var
  iLen: Cardinal;
begin
  iLen := 256;
  Result := StringOfChar(#0, iLen);
  GetUserName(PChar(Result), iLen);
  SetLength(Result, iLen);
end;

procedure TFDMIMportarOrdenes.RegistrarError(empresa, centro : string; fecha : TDatetime; orden_occ : integer);
var
  qifx : TTable;
begin
  try
    qifx := nil;

    try
      qifx := TTable.Create(nil);
      qifx.databasename := 'Databasename';
      qifx.TableName := 'frf_sincroweb';
      
      qifx.Append;
      qifx.FieldByName('equipo').asstring := GetComputerNameFromWindows;
      qifx.FieldByName('usuario').asstring := GetUsernameFromWindows;
      qifx.fieldbyname('tabla').asstring :=qifx.TableName;
      qifx.fieldbyname('campos_clave').asstring := 'empresa_occ,centro_salida_occ,fecha_occ,orden_occ';
      qifx.fieldbyname('valor_clave').asstring := empresa+';'+centro+';'+DateToStr(Fecha)+';'+InttoStr(orden_occ);
      qifx.fieldbyname('s3aws').asinteger := 0;
      qifx.post;
      qifx.close;
    except
      On E : Exception do
      begin
          Showmessage('Error al registrar el error: '+e.message);
      end;
    end;
  finally
    freeandnil(qifx);
  end;
end;





end.
