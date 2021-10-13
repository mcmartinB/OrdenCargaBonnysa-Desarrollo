unit UDOrdenCarga;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  //Zona de influencia
  TZonaGeografica = (zgPeninsular, zgCanario, zgComunitario, zgExtra);

  TImpuesto = record
    sCodigo: string;
    sTipo: string;
    sDescripcion: string;
    rGeneral: Real;
    rReducido: Real;
    rSuper: Real;
  end;

  TDOrdenCarga = class(TDataModule)
    QTemp: TQuery;
    QListado: TQuery;
    QAux: TQuery;
    Database: TDatabase;
    QGetNumeroOrden: TQuery;
    QUpdateNumeroOrden: TQuery;
    QBorrarDetalle: TQuery;
    QGetNumeroLinea: TQuery;
    QCliente_es_de: TQuery;
    QSuminis_es_de: TQuery;
    QCentro_es_de: TQuery;
    QDatos_impuestos: TQuery;
    QCambiarEstado: TQuery;
    QCajasPaletsOrden: TQuery;
    QCajasPaletsPacking: TQuery;
    QExistePacking: TQuery;
    QUpdatePaletCab: TQuery;
    QResumenOrden: TQuery;
    QResumenPacking: TQuery;
    QGetProductoBase: TQuery;
    QGetProducto: TQuery;
    QBorrarPacking: TQuery;
    QDesfinalizarOrden: TQuery;
    QRecargo_equivalencia: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    //aPalets: array of TPalets;

    function IntegridadStr( const AEmpresa: string; const ATipo: integer ): string;
    function IntegridadTitle: string;

  public
    { Public declarations }
    sDirTemp: string;

    function GetLineaOrden( const AOrden: integer ): integer;

    //function ProductoBase(  const AEmpresa, AProducto: string ): string;


    function  ClienteEsDe( const AEmpresa, ACliente, ADirSum: string ): TZonaGeografica;
    function  ImpuestosEntre(const AEmpresa, ACentro, ACliente, ASuministro: string ): string;
    function  ImpuestosCliente(const AEmpresa, ACentro, ACliente, ASuministro: string; const AFecha: TDateTime ): TImpuesto;
    function  ClienteConRecargo(const AEmpresa, ACliente: string; const AFecha: TDateTime ): Boolean;
    function  TipoIVAEnvase(const AEmpresa, AEnvase, AProducto: string ): Integer;
    function  TipoIVAEnvaseProducto(const AEmpresa, AEnvase, AProducto: string ): Integer;

    procedure CambiarEmpresaDetalle( const AOrden: integer; AEmpresa: String );
    procedure CambiarCentroDetalle( const AOrden: integer; ACentro: String );
    procedure CambiarFechaDetalle( const AOrden: integer; AFecha: TDateTime );
    procedure CambiarClienteDetalle( const AOrden: integer; ACliente: String );
    procedure CambiarImpuestoDetalle( const AOrden: integer; AImpuesto: TImpuesto );

    function DatosEnvaseCliente( const AEmpresa, AProducto, AEnvase, ACliente: String;
      var APesoVariable, AUnidadesVariables: boolean; var APesoNeto: Real; var AUnidades: integer; var AFacturar, ADescripcion: string ): boolean;

    function TieneSuministros( const AEmpresa, ACliente: string ): Boolean;
    function ExisteSuministro( const AEmpresa, ACliente, ASuministro: string ): Boolean;
    function EsDirSuministroValida( const AEmpresa, ACliente, ASuministro: String ): Boolean;


(*
    function ExisteTransito(
      const AEmpresa, ACentroOrigen: String; const AReferencia: Integer; const AFechaSal: TDateTime; const AProducto: string;
      var ACentro: string; var AFecha: TDateTime; var AKilos: Real ): boolean;
*)
    function ExisteTransito( const AEmpresa, ACentro: String; const AReferencia: Integer;
      const AFecha: TDateTime; const AProducto: string; var AKilos: Real ): boolean;
    function EsTransitoCorrecto( const AEmpresa, ACentro: String; const AReferencia: Integer;
      const AFecha: TDateTime; const AProducto: string; const AKilos, AKilosAnterior: Real; var AMsg: String ): boolean;
    function TransitoKilosTransito( const AEmpresa, ACentro: string; const AFecha: TDateTime;
      const AReferencia: Integer; const AProducto: String ): real;
    function TransitoKilosAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime;
      const AReferencia: Integer; const AProducto: String ): real;
    function TransitoKilosCarga( const AEmpresa, ACentro: string; const AFecha: TDateTime;
      const AReferencia: Integer; const AProducto: String ): real;

    function GetProductoBase( const AEmpresa, AProducto: string ): string;
    function GetProducto( const AEmpresa, AProductoBase: string ): string;

    procedure CambiarEstado( const AOrden: Integer; const AEstado: Integer );
    procedure DesfinalizarOrden( const AOrden: Integer );
    //Modificaciones borrados lineas
    function  ComprobarIntegridadLinea( Const AOrden, ALinea: integer; Const AEmpresa, AProducto, AEnvase: string; const ACajas, APalets: Integer ): boolean;
    //Borrados orden
    function  ComprobarIntegridadOrden( Const AOrden: integer ): boolean;
    //Antes de generar albaran salida/transito
    function  ComprobarIntegridad( const AEmpresa: string; Const AOrden: integer; var AParar: Boolean; var AMensaje: string ): boolean;
    function  ComprobarIntegridadEx( const AEmpresa: string; Const AOrden: integer; var AMensaje: string ): boolean;    
    function  UnidadesCorrectas( const AEmpresa: string; const AOrden: integer; var AMsg: string ): Boolean;
    function  LineasSinKilos( const AEmpresa: string; const AOrden: integer ): boolean;


    //EL ENVASE ES CORRECTO
    function IsEnvaseCorrecto( const AEmpresa, AProducto, AEnvase: string ): boolean;

    //Poner sumatorio de palets en las lineas en la cabecera
    procedure UpdatePaletsCab( const AOrden: integer );
  end;

  function ConsultaOpen( ADataSet: TDataSet; const ASQLString: String ): boolean;

var
  DOrdenCarga: TDOrdenCarga;
  gsEmpresa, gsCentro: string;

implementation

{$R *.dfm}

uses bSQLUtils, Math, IniFiles, dialogs, AdvertenciaFD, Controls;

procedure TDOrdenCarga.DataModuleCreate(Sender: TObject);
var
  IniFile: TIniFile;
  sAux: string;
begin
  sAux:= GetCurrentDir + '\OrdenCarga.ini';
  if FileExists( sAux ) then
  begin
    Database.Params.Clear;
    IniFile:= TIniFile.Create( sAux );
    sAux:= IniFile.ReadString( 'BDDATA', 'ALIAS', 'comer.almacen' );
    Database.AliasName:= sAux;
    sAux:= IniFile.ReadString( 'BDDATA', 'USERNAME', 'cica' );
    Database.Params.Values['USER NAME']:= sAux;
    sAux:= IniFile.ReadString( 'BDDATA', 'PASSWORD', 'cica1' );
    Database.Params.Values['PASSWORD']:= sAux;
    sAux:= IniFile.ReadString( 'DIRECTORIOS', 'TEMP', 'c:\temp' );

    gsEmpresa:= IniFile.ReadString( 'PORDEFECTO', 'EMPRESA', '050' );
    gsCentro:= IniFile.ReadString( 'PORDEFECTO', 'CENTRO', '1' );

    sDirTemp:= sAux;
    if copy( sAux, length( sAux ), 1 ) <> '\' then
      sDirTemp:= sDirTemp + '\';
    IniFile.Free;
  end;
  Database.Connected:= True;

  with QDatos_impuestos do
  begin
    SQL.Clear;
    SQL.add(' select tipo_i, descripcion_i, general_il, reducido_il, super_il, recargo_general_il, recargo_reducido_il, recargo_super_il ');
    SQL.add(' from frf_impuestos, frf_impuestos_l ');
    SQL.add(' where codigo_i = :codigo ');
    SQL.add(' and codigo_il = :codigo ');
    SQL.add(' and :fecha  between fecha_ini_il and case when fecha_fin_il is null then :fecha else fecha_fin_il end ');
  end;
  with QRecargo_equivalencia do
  begin
    SQL.Clear;
    SQL.add(' select * ');
    SQL.add(' from frf_impuestos_recargo_cli ');
    SQL.add(' where empresa_irc = :empresa ');
    SQL.add(' and cliente_irc = :cliente ');
    SQL.add(' and :fecha  between fecha_ini_irc and case when fecha_fin_irc is null then :fecha else fecha_fin_irc end ');
  end;
  with QCentro_es_de do
  begin
    SQL.Clear;
    SQL.add(' SELECT tipo_impuesto_c tipo_iva ');
    SQL.add(' FROM frf_centros Frf_centros ');
    SQL.add(' WHERE   (empresa_c = :empresa) ');
    SQL.add('    AND  (centro_c = :centro) ');
  end;
  with QCliente_es_de do
  begin
    SQL.Clear;
    SQL.add(' SELECT case when pais_fac_c is null then pais_c else pais_fac_c end pais,  ');
    SQL.add('        case when cod_postal_fac_c is null then cod_postal_c[1,2] else cod_postal_fac_c[1,2] end prov,  ');
    SQL.add('        es_comunitario_c comu, substr(nif_c,1,2) pais_nif  ');
    SQL.add(' FROM frf_clientes Frf_clientes ');
    SQL.add(' WHERE   (cliente_c = :cliente) ');
  end;
  with QSuminis_es_de do
  begin
    SQL.Clear;
    SQL.add(' select pais_ds pais, cod_postal_ds[1,2] prov ');
    SQL.add(' from frf_dir_sum ');
    SQL.add(' where cliente_ds=:cliente ');
    SQL.add(' and dir_sum_ds=:dirsum    ');
    SQL.Add(' and fecha_baja_ds is null ');
  end;
end;

procedure TDOrdenCarga.DataModuleDestroy(Sender: TObject);
begin
  Database.CloseDataSets;
  Database.Connected:= False;
end;

function ConsultaOpen( ADataSet: TDataSet; const ASQLString: String ): boolean;
begin
  result:= true;
end;

function TDOrdenCarga.GetLineaOrden( const AOrden: integer ): integer;
begin
  with QGetNumeroLinea do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    if IsEmpty then
    begin
      result:= 1;
    end
    else
    begin
      result:= Fields[0].AsInteger;
    end;
    Close
  end;
end;


//****************//****************//****************//****************
//****************CUESTIONES GEOGRAFICAS Y DE IMPUESTOS
//****************//****************//****************//****************

function ExentoImpuestos(const AEmpresa, ACliente: string): Boolean;
begin
  Result := ( ACliente = 'RET' );
end;

function TDOrdenCarga.ClienteEsDe( const AEmpresa, ACliente, ADirSum: string ): TZonaGeografica;
var
  pais, prov, comu: string;
begin
  //Cliente
  with QCliente_es_de do
  begin
    ParamByName('cliente').AsString := ACliente;
    Open;
    if FieldByName('pais_nif').AsString = 'FR' then
    begin
      pais := FieldByName('pais_nif').AsString;
    end
    else
    begin
      pais := FieldByName('pais').AsString;
    end;
    prov := FieldByName('prov').AsString;
    comu := FieldByName('comu').AsString;
    Cancel;
    Close;
  end;

  //Español
  if pais = 'ES' then
  begin
    //Direccion de suministro
    if (Trim(ADirSum) <> '') and (ADirSum <> ACliente) then
      with QSuminis_es_de do
      begin
        ParamByName('cliente').AsString := ACliente;
        ParamByName('dirsum').AsString := ADirSum;
        Open;
        pais := FieldByName('pais').AsString;
        prov := FieldByName('prov').AsString;
        Cancel;
        Close;
      end;

    //Canario
    if ( pais = 'ES' ) and ( (prov = '38') or (prov = '35') ) then
      ClienteEsDe := zgCanario
    //Peninsular
    else
      ClienteEsDe := zgPeninsular;
  end
  else
  //Extranjero
  begin
    if comu = 'S' then
      ClienteEsDe := zgComunitario
    else
      ClienteEsDe := zgExtra;
  end;
end;

function TDOrdenCarga.ImpuestosEntre(const AEmpresa, ACentro, ACliente, ASuministro: string ): string;
var
  sAux: string;
begin
  with QCentro_es_de do
  begin
    ParamByName('empresa').AsString := AEmpresa;
    ParamByName('centro').AsString := ACentro;
    Open;
    sAux:= FieldByName('tipo_iva').AsString;
    Close;
  end;

  if ( sAux = 'IVA' ) then
  begin
        case ClienteEsDe( AEmpresa, ACliente, ASuministro ) of
          zgPeninsular: //Destino peninsula IGIC normal
            ImpuestosEntre := 'IR';
          zgComunitario: //CEE sin IVA
            ImpuestosEntre := 'IC';
          zgCanario, zgExtra: //Otros sin IVA
            ImpuestosEntre := 'IE';
        end;
  end
  else
  if sAux = 'IGIC' then
  begin
        case ClienteEsDe( AEmpresa, ACliente, ASuministro ) of
          zgCanario: //Destino canario IGIC normal
            ImpuestosEntre := 'GR';
          zgPeninsular, zgComunitario, zgExtra: //Otros sin IGIC
            ImpuestosEntre := 'GE';
        end;
  end
  else
  if sAux = 'EXEN' then
  begin
    //Exento
    Result:= 'E';
  end
  else
  begin
    raise Exception.Create('Falta el tipo de IVA a aplicar al centro.');
  end;
end;

function TDOrdenCarga.ClienteConRecargo(const AEmpresa, ACliente: string; const AFecha: TDateTime ): Boolean;
begin
    with QRecargo_equivalencia do
    begin
      ParamByName('empresa').AsString := AEmpresa;
      ParamByName('cliente').AsString := ACliente;
      ParamByName('fecha').AsDate := AFecha;
      try
        Open;
        Result:= not IsEmpty;
      finally
        Close;
      end;
    end;
end;

function TDOrdenCarga.ImpuestosCliente(const AEmpresa, ACentro, ACliente, ASuministro: string; const AFecha: TDatetime ): TImpuesto;
var
  sAux: string;
  rRecargoGeneral, rRecargoReducido, rRecargoSuper: Real;
begin
  if not ExentoImpuestos(AEmpresa, ACliente) then
  begin
    sAux := ImpuestosEntre( AEmpresa, ACentro, ACliente, ASuministro );
    with QDatos_impuestos do
    begin
      ParamByName('codigo').AsString := sAux;
      ParamByName('fecha').AsDate := AFecha;
      Open;
      result.sCodigo := sAux;
      result.sTipo := FieldByName('tipo_i').AsString;
      result.sDescripcion := FieldByName('descripcion_i').AsString;
      (*IVA*)
      result.rGeneral := FieldByName('general_il').AsFloat;
      result.rReducido := FieldByName('reducido_il').AsFloat;
      result.rSuper := FieldByName('super_il').AsFloat;
      (*RECARGO*)
      rRecargoGeneral := FieldByName('recargo_general_il').AsFloat;
      rRecargoReducido:= FieldByName('recargo_reducido_il').AsFloat;
      rRecargoSuper := FieldByName('recargo_super_il').AsFloat;
      Cancel;
      Close;
    end;
    if ClienteConRecargo( AEmpresa, ACliente, AFecha ) then
    begin
      result.rGeneral := result.rGeneral + rRecargoGeneral;
      result.rReducido := result.rReducido + rRecargoReducido;
      result.rSuper := result.rSuper + rRecargoSuper;
    end;
  end
  else
  begin
    result.sCodigo := 'E';
    result.sTipo := 'EXEN';
    result.sDescripcion := 'EXENTO';
    result.rGeneral := 0;
    result.rReducido := 0;
    result.rSuper := 0;
  end;
end;

//
//Cambiar datos del detalle
//
procedure TDOrdenCarga.CambiarEmpresaDetalle( const AOrden: integer; AEmpresa: String );
begin
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' update frf_orden_carga_l ');
  QAUx.SQL.Add(' set empresa_ocl = :empresa ');
  QAUx.SQL.Add(' where orden_ocl = :orden ');
  QAUx.ParamByName('empresa').AsString:= AEmpresa;
  QAUx.ParamByName('orden').AsInteger:= AOrden;
  QAUx.ExecSQL;
end;

procedure TDOrdenCarga.CambiarCentroDetalle( const AOrden: integer; ACentro: String );
begin
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' update frf_orden_carga_l ');
  QAUx.SQL.Add(' set centro_salida_ocl = :centro ');
  QAUx.SQL.Add(' where orden_ocl = :orden ');
  QAUx.ParamByName('centro').AsString:= ACentro;
  QAUx.ParamByName('orden').AsInteger:= AOrden;
  QAUx.ExecSQL;
end;

procedure TDOrdenCarga.CambiarFechaDetalle( const AOrden: integer; AFecha: TDateTime );
begin
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' update frf_orden_carga_l ');
  QAUx.SQL.Add(' set fecha_ocl = :fecha ');
  QAUx.SQL.Add(' where orden_ocl = :orden ');
  QAUx.ParamByName('fecha').AsDate:= AFecha;
  QAUx.ParamByName('orden').AsInteger:= AOrden;
  QAUx.ExecSQL;
end;

procedure TDOrdenCarga.CambiarClienteDetalle( const AOrden: integer; ACliente: String );
begin
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' update frf_orden_carga_l ');
  QAUx.SQL.Add(' set cliente_ocl = :cliente ');
  QAUx.SQL.Add(' where orden_ocl = :orden ');
  QAUx.ParamByName('cliente').AsString:= ACliente;
  QAUx.ParamByName('orden').AsInteger:= AOrden;
  QAUx.ExecSQL;
end;

(*IVA*)
//Result -> 0:super 1:reducido 2:general
function TDOrdenCarga.TipoIVAEnvase(const AEmpresa, AEnvase, AProducto: string ): Integer;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add('select nvl(tipo_iva_e,0) tipo_iva_e ');
  QAux.SQL.Add('from frf_envases ');
  QAux.SQL.Add('where producto_e = :producto ');
  QAux.SQL.Add('and envase_e = :envase ');
  QAux.ParamByName('producto').AsString:= AProducto;
  QAux.ParamByName('envase').AsString:= AEnvase;
  QAux.Open;
  result:= QAux.FieldByName('tipo_iva_e').AsInteger;
  QAux.Close;
end;

function TDOrdenCarga.TipoIvaEnvaseProducto( const AEmpresa, AEnvase, AProducto: string ): Integer;
var
  sAux: string;
begin
{
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' select producto_base_p');
  QAUx.SQL.Add(' from frf_productos');
  QAUx.SQL.Add(' where producto_p = :producto ');
  QAUx.ParamByName('producto').AsString:= AProducto;
  QAUx.Open;
  sAux:= QAux.FieldByName('producto_base_p').AsString;
  QAUx.Close;
}
  Result:= TipoIvaEnvase( AEmpresa, AEnvase, AProducto );
end;

procedure TDOrdenCarga.CambiarImpuestoDetalle( const AOrden: integer; AImpuesto: TImpuesto );
var
  rImporte, rTipoIva: real;
begin
  QTemp.SQL.Clear;
  QTemp.SQL.Add(' select empresa_ocl, linea_ocl, envase_ocl, producto_ocl, importe_neto_ocl ');
  QTemp.SQL.Add(' from frf_orden_carga_l ');
  QTemp.SQL.Add(' where orden_ocl = :orden ');
  QTemp.ParamByName('orden').AsInteger:= AOrden;
  QTemp.Open;

  while not QTemp.Eof do
  begin
    rImporte:= QTemp.FieldByName('importe_neto_ocl').AsFloat;
    case TipoIvaEnvaseProducto( QTemp.FieldByName('empresa_ocl').AsString,
                        QTemp.FieldByName('envase_ocl').AsString,
                        QTemp.FieldByName('producto_ocl').AsString )of
      0: rTipoIva:=  AImpuesto.rSuper;
      1: rTipoIva:=  AImpuesto.rReducido;
      else rTipoIva:=  AImpuesto.rGeneral;
    end;

    QAUx.SQL.Clear;
    QAUx.SQL.Add(' update frf_orden_carga_l ');
    QAUx.SQL.Add(' set porc_iva_ocl = :porcion, ');
    QAUx.SQL.Add('     tipo_iva_ocl = :tipo, ');
    QAUx.SQL.Add('     iva_ocl = :iva, ');
    QAUx.SQL.Add('     importe_total_ocl = :importe ');
    QAUx.SQL.Add(' where orden_ocl = :orden ');
    QAUx.SQL.Add('   and linea_ocl = :linea ');

    QAUx.ParamByName('porcion').AsFloat:= rTipoIva;
    QAUx.ParamByName('tipo').AsString:= AImpuesto.sCodigo;
    QAUx.ParamByName('iva').AsFloat:= SimpleRoundTo( ( rImporte * rTipoIva ) / 100, -2);
    QAUx.ParamByName('importe').AsFloat:= QAUx.ParamByName('iva').AsFloat + rImporte;
    QAUx.ParamByName('orden').AsInteger:= AOrden;
    QAUx.ParamByName('linea').AsInteger:= QTemp.FieldByName('linea_ocl').AsInteger;
    QAUx.ExecSQL;

    QTemp.Next;
  end;
  QTemp.Close;
end;

//Datos del envase
function TDOrdenCarga.DatosEnvaseCliente( const AEmpresa, AProducto, AEnvase, ACliente: String;
  var APesoVariable, AUnidadesVariables: boolean; var APesoNeto: Real; var AUnidades: integer; var AFacturar, ADescripcion: string ): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    //SQL.Add(' select case when NVL(peso_neto_e,0) = 0 then 1 else 0 end peso_variable, ');
    SQL.Add(' select peso_variable_e peso_variable, unidades_variable_e unidades_variable, ');
    SQL.Add('        peso_neto_e peso, nvl(unidades_e,0) unidades, ');

    SQL.Add(' (select unidad_fac_ce  from frf_clientes_env ');
    SQL.Add(' where empresa_ce = :empresa and producto_ce = producto_e ');
    SQL.Add(' and envase_ce = :envase and cliente_ce = :cliente) facturar, ');
    SQL.Add(' descripcion_e descripcion ');

    SQL.Add(' from frf_envases ');
    SQL.Add(' where (  producto_e =  :producto   ');
    SQL.Add('       or  producto_e is null  ) ');
    SQL.Add(' and envase_e = :envase ');

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('envase').AsString:= AEnvase;
    ParamByName('cliente').AsString:= ACliente;

    Open;
    result:= not IsEmpty;
    if result then
    begin
      APesoVariable:= ( FieldByName('peso').AsFloat = 0 ) or ( FieldByName('peso_variable').AsInteger <> 0 );
      //AUnidadesVariables:= ( FieldByName('unidades').AsFloat = 0 ) or ( FieldByName('unidades_variable').AsInteger <> 0 );
      AUnidadesVariables:= ( FieldByName('unidades_variable').AsInteger <> 0 );
      APesoNeto:= FieldByName('peso').AsFloat;
      //if FieldByName('unidades').AsInteger > 1 then
        AUnidades:= FieldByName('unidades').AsInteger;
      //else
        //AUnidades:= 1;
      AFacturar:= FieldByName('facturar').AsString;
      if AFacturar = '' then
      begin
        if gsEmpresa = '078' then
          AFacturar:= 'U'
        else
          AFacturar:= 'K';
      end;
      ADescripcion:= FieldByName('descripcion').AsString;
    end
    else
    begin
      APesoVariable:= true;
      AUnidadesVariables:= True;
      APesoNeto:= 0;
      AUnidades:= 0;
      AFacturar:= '';
      ADescripcion:= '';
    end;
    Close;
  end;
end;

function TDOrdenCarga.TieneSuministros( const AEmpresa, ACliente: string ): Boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select count(*) ');
    SQL.Add(' from frf_dir_sum ');
    SQL.Add(' where cliente_ds = :cliente  ');
    SQL.Add('   and fecha_baja_ds is null  ');
    ParamByName('cliente').AsString:= ACliente;
    Open;
    result:= Fields[0].AsInteger > 0;
    Close;
  end;
end;

function TDOrdenCarga.ExisteSuministro( const AEmpresa, ACliente, ASuministro: string ): Boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select count(*) ');
    SQL.Add(' from frf_dir_sum ');
    SQL.Add(' where cliente_ds = :cliente  ');
    SQL.Add(' and dir_sum_ds = :dir_sum  ');
    SQL.Add(' and fecha_baja_ds is null  ');

    ParamByName('cliente').AsString:= ACliente;
    ParamByName('dir_sum').AsString:= ASuministro;
    Open;
    result:= Fields[0].AsInteger > 0;
    Close;
  end;
end;

function TDOrdenCarga.EsDirSuministroValida( const AEmpresa, ACliente, ASuministro: String ): Boolean;
begin
  if ASuministro = '' then
  begin
    result:= False;
  end
  else
  begin
    if TieneSuministros( AEmpresa, ACliente ) then
    begin
      result:= ExisteSuministro( AEmpresa, ACliente, ASuministro );
      if not result then
      begin
        result:= (ASuministro = ACliente);
      end;
    end
    else
    begin
      result:= (ASuministro = ACliente);
    end;
  end;
end;

function TDOrdenCarga.ExisteTransito( const AEmpresa, ACentro: String; const AReferencia: Integer;
      const AFecha: TDateTime; const AProducto: string; var AKilos: Real ): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select count(*) lineas, sum(kilos_tl) kilos ');
    SQL.Add(' from frf_transitos_l ');
    SQL.Add(' where empresa_tl = :empresa ');
    SQL.Add(' and centro_tl = :centro ');
    SQL.Add(' and referencia_tl = :referencia ');
    SQL.Add(' and fecha_tl = :fecha ');
    SQL.Add(' and producto_tl = :producto ');

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha').AsDate:= AFecha;
    Open;
    result:= FieldByName('lineas').AsFloat > 0;
    if result then
    begin
      AKilos:= FieldByName('kilos').AsFloat;
    end;
    Close;
  end;
end;

(*
function TDOrdenCarga.ExisteTransito(
  const AEmpresa, ACentroOrigen: String; const AReferencia: Integer; const AFechaSal: TDateTime; const AProducto: string;
  var ACentro: string; var AFecha: TDateTime; var AKilos: Real ): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_tl empresa, centro_tl centro, referencia_tl referencia, fecha_tl fecha, sum(kilos_tl) kilos ');
    SQL.Add(' from frf_transitos_l ');
    SQL.Add(' where empresa_tl = :empresa ');
    SQL.Add(' and referencia_tl = :referencia ');
    SQL.Add(' and centro_origen_tl = :centro_origen ');
    SQL.Add(' and producto_tl = :producto ');
    SQL.Add(' and ( :fecha_sal - fecha_tl ) between 0 and 60 ');
    SQL.Add(' group by empresa_tl, centro_tl, referencia_tl, fecha_tl ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro_origen').AsString:= ACentroOrigen;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha_sal').AsDate:= AFechaSal;
    Open;
    result:= not IsEmpty;
    if result then
    begin
      ACentro:= FieldByName('centro').AsString;
      AFecha:= FieldByName('fecha').AsDateTime;
      AKilos:= FieldByName('kilos').AsFloat;
    end;
    Close;
  end;
end;
*)

function TDOrdenCarga.TransitoKilosAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime;
  const AReferencia: Integer; const AProducto: String ): real;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select sum(kilos_sl) kilos ');
    SQL.Add(' from frf_salidas_l ');
    SQL.Add(' where empresa_sl = :empresa ');
    SQL.Add(' and centro_origen_sl = :centro ');
    SQL.Add(' and ref_transitos_sl = :referencia ');
    SQL.Add(' and ( fecha_sl - :fecha ) between 0 and 60 ');
    SQL.Add(' and producto_sl = :producto ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha').AsDate:= AFecha;
    ParamByName('producto').AsString:= AProducto;
    Open;
    result:= Fields[0].AsFloat;
    Close;
  end;
end;

function TDOrdenCarga.TransitoKilosCarga( const AEmpresa, ACentro: string; const AFecha: TDateTime;
  const AReferencia: Integer; const AProducto: String ): real;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select sum(kilos_ocl) kilos ');
    SQL.Add(' from frf_orden_carga_l, frf_orden_carga_c ');
    SQL.Add(' where empresa_ocl = :empresa ');
    SQL.Add(' and centro_origen_ocl = :centro ');
    SQL.Add(' and ref_transitos_ocl = :referencia ');
    SQL.Add(' and ( fecha_ocl - :fecha ) between 0 and 60 ');
    SQL.Add(' and producto_ocl = :producto ');
    SQL.Add(' and orden_occ = orden_ocl ');
    SQL.Add(' and traspasada_occ = 0 ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha').AsDate:= AFecha;
    ParamByName('producto').AsString:= AProducto;
    Open;
    result:= Fields[0].AsFloat;
    Close;
  end;
end;

function TDOrdenCarga.TransitoKilosTransito( const AEmpresa, ACentro: string; const AFecha: TDateTime;
  const AReferencia: Integer; const AProducto: String ): real;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select sum(kilos_tl) kilos ');
    SQL.Add(' from frf_transitos_l ');
    SQL.Add(' where empresa_tl = :empresa ');
    SQL.Add(' and centro_origen_tl = :centro ');
    SQL.Add(' and ref_origen_tl = :referencia ');
    SQL.Add(' and fecha_origen_tl = :fecha ');
    SQL.Add(' and producto_tl = :producto ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha').AsDate:= AFecha;
    ParamByName('producto').AsString:= AProducto;
    Open;
    result:= Fields[0].AsFloat;
    Close;
  end;
end;

function TDOrdenCarga.EsTransitoCorrecto( const AEmpresa, ACentro: String; const AReferencia: Integer;
  const AFecha: TDateTime; const AProducto: string; const AKilos, AKilosAnterior: Real; var AMsg: String ): boolean;
var
  rKilos, rKilosSalidos, rFaltan: Real;
begin
  if ExisteTransito( AEmpresa, ACentro, AReferencia, AFecha, AProducto, rKilos ) then
  begin
    if AKilos <= rKilos then
    begin
      rKilosSalidos:= TransitoKilosAlbaran( AEmpresa, ACentro, AFecha, AReferencia, AProducto );
      rKilosSalidos:= rKilosSalidos + TransitoKilosCarga( AEmpresa, ACentro, AFecha, AReferencia, AProducto);
      rKilosSalidos:= rKilosSalidos + TransitoKilosTransito( AEmpresa, ACentro, AFecha, AReferencia, AProducto);
      rFaltan:= SimpleRoundTo( ( AKilosAnterior + rKilos ) - rKilosSalidos, -2 );
      rKilosSalidos:= rKilosSalidos + ( AKilos - AKilosAnterior );
      if rKilosSalidos <= rKilos then
      begin
        result:= True;
      end
      else
      begin
        AMsg:= 'Se esta intentanto asignar a la salida mas kilos que quedan en el tránsito (' + FloatToStr(rFaltan) + 'Kgs).';
        result:= False;
      end;
    end
    else
    begin
      AMsg:= 'Se esta intentanto asignar a la salida mas kilos que el tránsito tiene (' + FloatToStr(rKilos) + 'Kgs).';
      result:= False;
    end;
  end
  else
  begin
    AMsg:= 'No existe el transito o producto incorrecto.';
    result:= False;
  end;
end;

procedure TDOrdenCarga.CambiarEstado( const AOrden: Integer; const AEstado: Integer );
begin
  With QCambiarEstado do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ParamByName('estado').AsInteger:= AEstado;
    ExecSQL;
  end;
end;

procedure TDOrdenCarga.DesfinalizarOrden( const AOrden: Integer );
begin
  With QDesfinalizarOrden do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ExecSQL;
  end;
end;

function TDOrdenCarga.ComprobarIntegridadLinea( Const AOrden, ALinea: integer; Const AEmpresa, AProducto, AEnvase: string; const ACajas, APalets: Integer ): boolean;
var
  iCajasOrden, iCajasPacking: integer;
  iPaletsOrden, iPaletsPacking: integer;
begin
  with QCajasPaletsOrden do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ParamByName('linea').AsInteger:= ALinea;
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('envase').AsString:= AEnvase;
    Open;
    iCajasOrden:= Fields[0].AsInteger + ACajas;
    iPaletsOrden:= Fields[1].AsInteger + APalets;
    Close;
  end;
  with QCajasPaletsPacking do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('envase').AsString:= AEnvase;
    Open;
    iCajasPacking:= Fields[0].AsInteger;
    iPaletsPacking:= Fields[1].AsInteger;
    Close;
  end;
  result:= ( iCajasPacking <= iCajasOrden ) and ( iPaletsPacking <= iPaletsOrden );
end;

function TDOrdenCarga.ComprobarIntegridadOrden( Const AOrden: integer ): boolean;
begin
  with QExistePacking do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    result:= IsEmpty;
    Close;
  end;
end;

function TDOrdenCarga.IsEnvaseCorrecto( const AEmpresa, AProducto, AEnvase: string ): boolean;
begin
  if ( Trim(AEmpresa) <> '' ) and ( Trim(AProducto) <> '' ) and ( Trim( AEnvase ) <> '' )then
  with QAux do
  begin

    //Existe el envase para ese producto base
    SQL.Clear;
    SQL.Add('select * from frf_envases ');
    SQL.Add('where producto_e = :producto ');
    SQL.Add('  and envase_e = :envase ');
    ParamByName('producto').AsString:= AProducto;
    ParamByName('envase').AsString:= AEnvase;
    Open;

    if IsEmpty then
    begin
      Close;
      //Existe el envase sin producto base (para todos los productos)
      SQL.Clear;
      SQL.Add('select * from frf_envases ');
      SQL.Add('where producto_e is null ');
      SQL.Add('  and envase_e = :envase ');
      ParamByName('envase').AsString:= AEnvase;
      Open;

      Result:= not IsEmpty;
      Close;
    end
    else
    begin
      result:= True;
    end;
  end
  else
  begin
    result:= False;
  end;
end;

procedure TDOrdenCarga.UpdatePaletsCab( const AOrden: integer );
begin
  with QUpdatePaletCab do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ExecSQL;
  end;
end;

function TDOrdenCarga.GetProductoBase( const AEmpresa, AProducto: string ): string;
begin
  with QGetProductoBase do
  begin
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('producto').AsString:= AProducto;
    Open;
    result:= FieldByName('producto_base_p').AsString;
    Close;
  end;
end;

function TDOrdenCarga.GetProducto( const AEmpresa, AProductoBase: string ): string;
begin
  with QGetProducto do
  begin
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('producto').AsString:= AProductoBase;
    Open;
    result:= FieldByName('producto_p').AsString;
    Close;
  end;
end;

function TDOrdenCarga.IntegridadTitle: string;
begin
  result:= '---------------------------------------------------------'  + #13 + #10 +
           '                         |       Orden       |      Packing   '  + #13 + #10 +
           'Prod.Env.Palet | Cajas - Palets | Cajas - Palets'  + #13 + #10 +
           '---------------------------------------------------------'  + #13 + #10;
end;

function TDOrdenCarga.IntegridadStr( const AEmpresa: string; const ATipo: integer ): string;
begin
  case ATipo of
    1: result:= QResumenOrden.FieldByName('producto_ocl').AsString + '  '  +
                QResumenOrden.FieldByName('envase_ocl').AsString + '  '  +
                QResumenOrden.FieldByName('tipo_palet_ocl').AsString + '       |       ' +
                QResumenOrden.FieldByName('cajas_ocl').AsString + ' - '  +
                QResumenOrden.FieldByName('palets_ocl').AsString + '         |       ' +
                '0 - 0 ' + #13 + #10;

    2: result:= //GetProducto( AEmpresa, QResumenPacking.FieldByName('producto_base_pl').AsString ) + '  '  +
                QResumenPacking.FieldByName('producto_pl').AsString + '  '  +
                QResumenPacking.FieldByName('envase_pl').AsString + '  '  +
                QResumenPacking.FieldByName('tipo_palet_pl').AsString + '       |       ' +
                '0 - 0         |       ' +
                QResumenPacking.FieldByName('cajas_pl').AsString + ' - '  +
                QResumenPacking.FieldByName('palets_pl').AsString + #13 + #10;

    3: result:= QResumenOrden.FieldByName('producto_ocl').AsString + '  '  +
                QResumenOrden.FieldByName('envase_ocl').AsString + '  '  +
                QResumenOrden.FieldByName('tipo_palet_ocl').AsString + '       |       ' +
                QResumenOrden.FieldByName('cajas_ocl').AsString + ' - '  +
                QResumenOrden.FieldByName('palets_ocl').AsString + '         |       ' +
                QResumenPacking.FieldByName('cajas_pl').AsString + ' - '  +
                QResumenPacking.FieldByName('palets_pl').AsString + #13 + #10;
    4: result:='Hay diferencias entre los envases que se quiere cargar y los cargados. Revisar Resumen al final de la Orden de Carga.';
  end;
end;

procedure AddMsg( var AMsg: string; const ACad: string );
begin
  if AMsg = '' then
    AMsg:=  ACad
  else
    AMsg:=  AMsg + #13 + #10 + ACad;
end;

function TDOrdenCarga.LineasSinKilos( const AEmpresa: string; const AOrden: integer ): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add('select *  ');
    SQL.Add('from frf_orden_carga_l   ');
    SQL.Add('where empresa_ocl = :empresa  ');
    SQL.Add('and orden_ocl = :orden ');
    SQL.Add('and kilos_ocl = 0 ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    Result:= not IsEmpty;
    Close;
  end;
end;

function TDOrdenCarga.UnidadesCorrectas( const AEmpresa: string; const AOrden: integer; var AMsg: string ): Boolean;
begin
  Result:= false;
  AMsg:= '';
  with QAux do
  begin
    SQL.Clear;
    SQL.Add('select orden_ocl, producto_ocl, envase_ocl, unidades_caja_ocl, unidades_variable_e, unidades_e,  kilos_ocl, peso_variable_e, round( peso_neto_e * cajas_ocl, 2) peso  ');
    SQL.Add('from frf_orden_carga_l join frf_envases on envase_e = envase_ocl  ');
    SQL.Add('where empresa_ocl = :empresa  ');
    SQL.Add('and orden_ocl = :orden ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        //Kilos
        if FieldByName('peso_variable_e').AsInteger = 0 then
        begin
          if FieldByName('kilos_ocl').AsInteger <> FieldByName('peso').AsInteger then
          begin
            AddMsg( AMsg, 'ERROR: No coincide los kilos para el envase ' + FieldByname('envase_ocl').AsString +
                          ' Albaran: ' +  FieldByname('kilos_ocl').AsString +  ' Esperado: ' +
                          FieldByname('peso').AsString );
          end;
        end;
        //Unidades
        if FieldByName('unidades_variable_e').AsInteger = 0 then
        begin
          if FieldByName('unidades_caja_ocl').AsInteger <> FieldByName('unidades_e').AsInteger then
          begin
            AddMsg( AMsg, 'ERROR: No coincide las unidades por caja para el envase ' + FieldByname('envase_ocl').AsString +
                          ' Albaran: ' +  FieldByname('unidades_caja_ocl').AsString +  ' Esperado: ' +
                          FieldByname('unidades_e').AsString );
          end;
        end;
        Next;
      end;
      Result:= AMsg = '';
    end
    else
    begin
      AMsg:= 'ERROR: Albaran sin lineas.';
    end;
    Close;
  end;
end;


function TDOrdenCarga.ComprobarIntegridad( const AEmpresa: string; const AOrden: integer; var AParar: Boolean; var AMensaje: string ): boolean;
var
  sMsg: string;
begin
  sMsg:= '';
  (*
  if LineasSinKilos(  AEmpresa, AOrden )   then
  begin
    AMensaje:= 'ERROR: Orden de carga con lineas sin kilogramos.';
    Result:= False;
    AParar:= True;
  end
  else
  *)
  begin
    AParar:= False;

    if UnidadesCorrectas( AEmpresa, AOrden, sMsg ) then
    begin
      result:= ComprobarIntegridadEx( AEmpresa, AOrden, AMensaje );
    end
    else
    begin
      if VerAdvertencia( Self, Trim( sMsg ) ) = mrIgnore then
      begin
        Result:= ComprobarIntegridadEx( AEmpresa, AOrden, AMensaje );
      end
      else
      begin
        Result:= False;
        AMensaje:= sMsg;
      end;
    end;
  end;
end;

function TDOrdenCarga.ComprobarIntegridadEx( const AEmpresa: string; const AOrden: integer; var AMensaje: string ): boolean;
var AError: Boolean;
begin
  //kilos y unidades
  result:= False;
  AMensaje:= '';
  AError:=False;

  with QResumenOrden do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    Open;
  end;
  with QResumenPacking do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    Open;
  end;
  if QResumenOrden.IsEmpty then
  begin
    AMensaje:= 'Orden sin lineas.';
  end
  else
  if QResumenPacking.IsEmpty then
  begin
    AMensaje:= 'Orden sin packing.';
  end
  else
  begin

    if QResumenOrden.RecordCount <> QResumenPacking.RecordCount then
    begin
      AMensaje:= AMensaje + IntegridadStr( AEmpresa, 4 );
      AError := true;
    end;

    if not AError then
    begin
      while ( not QResumenOrden.Eof ) and ( not QResumenPacking.Eof ) do
      begin
        if ( QResumenOrden.FieldByName('envase_ocl').AsString = QResumenPacking.FieldByName('envase_pl').AsString ) and
           ( QResumenOrden.FieldByName('tipo_palet_ocl').AsString = QResumenPacking.FieldByName('tipo_palet_pl').AsString ) and
           ( QResumenOrden.FieldByName('producto_ocl').AsString = QResumenPacking.FieldByName('producto_pl').AsString ) then
        begin
          if ( ( QResumenOrden.FieldByName('cajas_ocl').AsInteger - QResumenPacking.FieldByName('cajas_pl').AsInteger ) +
             ( QResumenOrden.FieldByName('palets_ocl').AsInteger - QResumenPacking.FieldByName('palets_pl').AsInteger ) ) <> 0 then
          begin
            AMensaje:= AMensaje + IntegridadStr( AEmpresa, 3 );
          end;
          QResumenOrden.Next;
          QResumenPacking.Next;
        end
        else
        begin
          if ( QResumenOrden.FieldByName('producto_ocl').AsString + QResumenOrden.FieldByName('envase_ocl').AsString + QResumenOrden.FieldByName('tipo_palet_ocl').AsString ) <
             ( QResumenPacking.FieldByName('producto_pl').AsString + QResumenPacking.FieldByName('envase_pl').AsString + QResumenPacking.FieldByName('tipo_palet_pl').AsString ) then
          begin
            AMensaje:= AMensaje + IntegridadStr( AEmpresa, 1 );;
            QResumenOrden.Next;
          end
          else
          begin
            AMensaje:= AMensaje + IntegridadStr( AEmpresa, 2 );
            QResumenPacking.Next;
          end;
        end;
      end;
      if AMensaje <> '' then
      begin
        AMensaje:= 'No coinciden los datos de la orden con los del packing.' + #13 + #10 + IntegridadTitle + AMensaje;
      end;
    end;
  end;

  if AMensaje = '' then
  begin
    result:= True;
    AMensaje:= 'OK';
  end;
  QResumenOrden.Close;
  QResumenPacking.Close;
end;

end.
