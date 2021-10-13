unit UDTraspasar;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDTraspasar = class(TDataModule)
    QCabCarga: TQuery;
    QCabCargaorden_occ: TIntegerField;
    QCabCargaempresa_occ: TStringField;
    QCabCargacentro_salida_occ: TStringField;
    QCabCargan_albaran_occ: TIntegerField;
    QCabCargafecha_occ: TDateField;
    QCabCargahora_occ: TStringField;
    QCabCargacliente_sal_occ: TStringField;
    QCabCargadir_sum_occ: TStringField;
    QCabCargacliente_fac_occ: TStringField;
    QCabCargan_pedido_occ: TStringField;
    QCabCargatransporte_occ: TSmallintField;
    QCabCargavehiculo_occ: TStringField;
    QCabCarganota_occ: TMemoField;
    QCabCargastatus_occ: TIntegerField;
    QLinCargaSalida: TQuery;
    QCabAlbaran: TQuery;
    QLinAlbaran: TQuery;
    QGetNumeroAlbaran: TQuery;
    QUpdateNumeroAlbaran: TQuery;
    QCabAlbaranempresa_sc: TStringField;
    QCabAlbarancentro_salida_sc: TStringField;
    QCabAlbarann_albaran_sc: TIntegerField;
    QCabAlbaranfecha_sc: TDateField;
    QCabAlbaranhora_sc: TStringField;
    QCabAlbarancliente_sal_sc: TStringField;
    QCabAlbarandir_sum_sc: TStringField;
    QCabAlbarancliente_fac_sc: TStringField;
    QCabAlbarann_pedido_sc: TStringField;
    QCabAlbaranmoneda_sc: TStringField;
    QCabAlbarantransporte_sc: TSmallintField;
    QCabAlbaranvehiculo_sc: TStringField;
    QCabAlbarann_factura_sc: TIntegerField;
    QCabAlbaranfecha_factura_sc: TDateField;
    QCabAlbarandua_sc: TStringField;
    QCabAlbaranfecha_dua_sc: TDateField;
    QGetNumeroAlbarancont_albaranes_c: TIntegerField;
    QCabTransito: TQuery;
    QLinTransito: TQuery;
    QGetNumeroTransito: TQuery;
    QUpdateNumeroTransito: TQuery;
    QCabTransitoempresa_tc: TStringField;
    QCabTransitocentro_tc: TStringField;
    QCabTransitoreferencia_tc: TIntegerField;
    QCabTransitofecha_tc: TDateField;
    QCabTransitocentro_destino_tc: TStringField;
    QCabTransitotransporte_tc: TSmallintField;
    QCabTransitovehiculo_tc: TStringField;
    QCabTransitostatus_gastos_tc: TStringField;
    QCabTransitobuque_tc: TStringField;
    QCabTransitodestino_tc: TStringField;
    QCabTransitodua_salida_tc: TStringField;
    QCabTransitofecha_duasal_tc: TDateField;
    QCabTransitodua_entrada_tc: TStringField;
    QCabTransitofecha_duaent_tc: TDateField;
    QCabTransitofactura_control_tc: TIntegerField;
    QCabTransitofecha_facontrol_tc: TDateField;
    QLinTransitoempresa_tl: TStringField;
    QLinTransitocentro_tl: TStringField;
    QLinTransitoreferencia_tl: TIntegerField;
    QLinTransitofecha_tl: TDateField;
    QLinTransitocentro_destino_tl: TStringField;
    QLinTransitocentro_origen_tl: TStringField;
    QLinTransitoref_origen_tl: TIntegerField;
    QLinTransitofecha_origen_tl: TDateField;
    QLinTransitoproducto_tl: TStringField;
    QLinTransitoenvase_tl: TStringField;
    QLinTransitomarca_tl: TStringField;
    QLinTransitocategoria_tl: TStringField;
    QLinTransitocolor_tl: TStringField;
    QLinTransitocalibre_tl: TStringField;
    QLinTransitocajas_tl: TIntegerField;
    QLinTransitounidades_caja_tl: TIntegerField;
    QLinTransitokilos_tl: TFloatField;
    QLinTransitofederacion_tl: TStringField;
    QLinTransitocosechero_tl: TSmallintField;
    QLinTransitoplantacion_tl: TSmallintField;
    QLinTransitoanyo_semana_tl: TStringField;
    QGetNumeroTransitocont_transitos_c: TIntegerField;
    QUpdateCabCarga: TQuery;
    QUpdateLinCarga: TQuery;
    QUpdateStatusCarga: TQuery;
    QCabCargacentro_destino_occ: TStringField;
    QCabCargatraspasada_occ: TIntegerField;
    QCabCargan_palets_occ: TIntegerField;
    QCabCargaporte_bonny_occ: TIntegerField;
    QCabAlbaranporte_bonny_sc: TIntegerField;
    QCabTransitoporte_bonny_tc: TIntegerField;
    QLinCargaTransito: TQuery;
    QCabAlbarann_cmr_sc: TStringField;
    QCabAlbarann_orden_sc: TStringField;
    QCabAlbaranhigiene_sc: TIntegerField;
    QCabAlbarannota_sc: TMemoField;
    QCabAlbarannota_factura_sc: TMemoField;
    QCabCargahigiene_occ: TIntegerField;
    QLinTransitotipo_palet_tl: TStringField;
    QLinTransitopalets_tl: TIntegerField;
    QCabTransitofecha_entrada_tc: TDateField;
    QCabTransiton_cmr_tc: TStringField;
    QCabTransitonota_tc: TMemoField;
    QCabTransiton_orden_tc: TStringField;
    QCabAlbaranoperador_transporte_sc: TSmallintField;
    QCabCargaoperador_transporte_occ: TSmallintField;
    QLineasPalets: TQuery;
    QLineasCarga: TQuery;
    QPesoTeorico: TQuery;
    QValidarNumeroAlbaran: TQuery;
    QValidarNumeroTransito: TQuery;
    qryPesoVariable: TQuery;
    QMonedaCliente: TQuery;
    QCabCargafecha_descarga_occ: TDateField;
    QCabAlbaranfecha_descarga_sc: TDateField;
    strngfldQCabTransitohora_tc: TStringField;
    QCabAlbaranincoterm_sc: TStringField;
    QCabAlbaranplaza_incoterm_sc: TStringField;
    qryAux: TQuery;
    QCabAlbaranfecha_pedido_sc: TDateField;
    QCabCargafecha_pedido_occ: TDateField;
    qryAux2: TQuery;
    QLinTransitoprecio_tl: TFloatField;
    QLinTransitoimporte_linea_tl: TCurrencyField;
    QUpdateLinCarga2: TQuery;
  private
    { Private declarations }
    QLinCargaAux: TQuery;

    procedure ActualizaEstadoOrden( const AEstado: integer );

    procedure PreparaTraspasoAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer );
    function  ObtenerNumeroAlbaran: integer;
    procedure PasaCabeceraAlbaran;
    procedure PasaDetalleAlbaran( const AIgnorarPacking: Boolean; const ALinea: integer  );
    procedure CerrarTablasAlbaran;

    procedure PreparaTraspasoTransito( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer );
    function  ObtenerNumeroTransito: integer;
    procedure PasaCabeceraTransito;
    procedure PasaDetalleTransito;
    procedure CerrarTablasTransito;
    procedure PesosPaletToLineasOrden( const AOrden: integer; const APacking: Boolean );
    function  PesoTeorico( const AEmpresa, AEnvase, AProducto: string; const ACajas: Integer ): Real;
    function  EsPesoVariable( const AEmpresa, AEnvase: string ): Boolean;
    function  PonNotaFactura( const AEmpresa, ACliente: string ): string;
    function EsProductoDesglose: Boolean;
    procedure ArticuloDesgloseInsertar;

    //Obtenemos la moneda del cliente
    function GetMonedaCliente( const AEmpresa, ACliente: string ): string;

    procedure PonerIncotermPorDefecto;
  public
    { Public declarations }

    Constructor Create( AOwner: TComponent ); Override;

    function  PasarAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime;  const AOrden: Integer; const APacking: Boolean ): integer;
    function  PasarTransito( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer; const APacking: Boolean ): integer;
  end;

implementation

{$R *.dfm}

uses Dialogs, Variants, Math, bMath;

Constructor TDTraspasar.Create( AOwner: TComponent );
begin
  inherited;
  //***********************************************************************
  //***********************************************************************
  // CARGA
  //***********************************************************************
  //***********************************************************************
  with QCabCarga.SQL do
  begin
    Clear;
    Add('select * from frf_orden_carga_c');
    Add('where orden_occ = :orden');
  end;
  with QLinCargaSalida.SQL do
  begin
    Clear;
    //Add('select * from frf_orden_carga_l');
    //Add('where orden_ocl = :orden');
    //Add('order by producto_ocl, envase_ocl, cajas_ocl desc ');
    Add('select empresa_ocl,centro_salida_ocl, n_albaran_ocl, fecha_ocl, centro_origen_ocl, ');
    Add('       producto_ocl, envase_ocl, marca_ocl, categoria_ocl, calibre_ocl, color_ocl, ref_transitos_ocl,    ');
    Add('       fecha_transito_ocl, unidades_caja_ocl, sum(cajas_ocl) cajas_ocl, sum(kilos_ocl) kilos_ocl, precio_ocl, unidad_precio_ocl, ');
    Add('       sum(importe_neto_ocl) importe_neto_ocl, porc_iva_ocl, sum(iva_ocl) iva_ocl, sum(importe_total_ocl) importe_total_ocl, ');
    Add('       sum(n_palets_ocl) n_palets_ocl, tipo_palets_ocl, tipo_iva_ocl, federacion_ocl, cliente_ocl, comercial_ocl, emp_procede_ocl, notas_ocl, ');
    Add('       sum(cajas_packing_ocl) cajas_packing_ocl, sum(kilos_packing_ocl) kilos_packing_ocl, sum(palets_packing_ocl) palets_packing_ocl ');
    Add('from frf_orden_carga_l ');
    Add('where orden_ocl = :orden');
    Add('group by empresa_ocl,centro_salida_ocl, n_albaran_ocl, fecha_ocl, centro_origen_ocl, ');
    Add('       producto_ocl, envase_ocl, marca_ocl, categoria_ocl, calibre_ocl, color_ocl, ref_transitos_ocl, ');
    Add('       fecha_transito_ocl, unidades_caja_ocl, precio_ocl, unidad_precio_ocl, porc_iva_ocl,  ');
    Add('       tipo_palets_ocl, tipo_iva_ocl, federacion_ocl, cliente_ocl, comercial_ocl, emp_procede_ocl, notas_ocl');
    Add('order by producto_ocl, envase_ocl, cajas_ocl desc ');
  end;
  with QLinCargaTransito.SQL do
  begin
    Clear;
    Add('select empresa_ocl,centro_salida_ocl, n_albaran_ocl, fecha_ocl, centro_origen_ocl, ');
    Add('       producto_ocl, envase_ocl, marca_ocl, categoria_ocl, calibre_ocl, color_ocl, ref_transitos_ocl,    ');
    Add('       fecha_transito_ocl, unidades_caja_ocl, sum(cajas_ocl) cajas_ocl, sum(kilos_ocl) kilos_ocl, precio_ocl, unidad_precio_ocl, ');
    Add('       importe_neto_ocl, porc_iva_ocl, iva_ocl, importe_total_ocl, sum(n_palets_ocl) n_palets_ocl, ');
    Add('       tipo_palets_ocl, tipo_iva_ocl, federacion_ocl, cliente_ocl, comercial_ocl, emp_procede_ocl, notas_ocl, ');
    Add('       sum(cajas_packing_ocl) cajas_packing_ocl, sum(kilos_packing_ocl) kilos_packing_ocl, sum(palets_packing_ocl) palets_packing_ocl ');
    Add('from frf_orden_carga_l ');
    Add('where orden_ocl = :orden');
    Add('group by empresa_ocl,centro_salida_ocl, n_albaran_ocl, fecha_ocl, centro_origen_ocl, ');
    Add('       producto_ocl, envase_ocl, marca_ocl, categoria_ocl, calibre_ocl, color_ocl, ref_transitos_ocl, ');
    Add('       fecha_transito_ocl, unidades_caja_ocl, precio_ocl, unidad_precio_ocl, importe_neto_ocl, porc_iva_ocl, iva_ocl, importe_total_ocl, ');
    Add('       tipo_palets_ocl, tipo_iva_ocl, federacion_ocl, cliente_ocl, comercial_ocl,  emp_procede_ocl, notas_ocl');
    Add('order by producto_ocl, envase_ocl, cajas_ocl desc ');
  end;
  with QUpdateStatusCarga.SQL do
  begin
    Clear;
    Add('update frf_orden_carga_c ');
    Add('set traspasada_occ = :estado  ');
    Add('where orden_occ = :orden ');
  end;
  with QUpdateCabCarga.SQL do
  begin
    Clear;
    Add('update frf_orden_carga_c ');
    Add('set n_albaran_occ = :contador  ');
    Add('where orden_occ = :orden ');
  end;
  with QUpdateLinCarga.SQL do
  begin
    Clear;
    Add('update frf_orden_carga_l ');
    Add('set n_albaran_ocl = :contador  ');
    Add('where orden_ocl = :orden ');
  end;
  with QUpdateLinCarga2.SQL do
  begin
    Clear;
    Add('update frf_orden_carga_l ');
    Add('set (kilos_packing_ocl, cajas_packing_ocl, palets_packing_ocl) = (:kilos, :cajas, :palets)  ');
    Add('where orden_ocl = :orden ');
    Add(' and linea_ocl = :linea  ');
  end;
  with QLineasCarga.SQL do
  begin
    Clear;
    Add('select * ');
    Add('from   frf_orden_carga_l ');
    Add('where orden_ocl = :orden ');
    Add('order by producto_ocl, tipo_palets_ocl, envase_ocl, marca_ocl, calibre_ocl, color_ocl, cajas_ocl desc');
  end;
  with QLineasPalets.SQL do
  begin
    Clear;
    Add('select * ');
    Add('from   frf_packing_list ');
    Add('where orden_pl = :orden ');
    Add('order by producto_pl, tipo_palet_pl, envase_pl, marca_pl, calibre_pl, color_pl, cajas_pl desc');
  end;

  //***********************************************************************
  //***********************************************************************
  // ALBARANES
  //***********************************************************************
  //***********************************************************************
  with QCabAlbaran.SQL do
  begin
    Clear;
    Add('select * from frf_salidas_c');
  end;
  with QLinAlbaran.SQL do
  begin
    Clear;
    Add('select * from frf_salidas_l');
  end;
  with QGetNumeroAlbaran.SQL do
  begin
    Clear;
    Clear;
    Add('select cont_albaranes_c ');
    Add('from frf_centros  ');
    Add('where empresa_c = :empresa ');
    Add('  and centro_c = :centro ');
  end;
  with QUpdateNumeroAlbaran.SQL do
  begin
    Clear;
    Add('update frf_centros ');
    Add('set cont_albaranes_c = :contador  ');
    Add('where empresa_c = :empresa ');
    Add('  and centro_c = :centro ');
  end;
  with QValidarNumeroAlbaran.SQL do
  begin
    Clear;
    Add(' select * ');
    Add(' from frf_salidas_c ');
    Add(' where empresa_sc = :empresa ');
    Add(' and centro_salida_sc = :centro ');
    Add(' and year(fecha_sc) = :anyo ');
    Add(' and n_albaran_sc = :albaran ');
  end;


  //***********************************************************************
  //***********************************************************************
  // TRANSITOS
  //***********************************************************************
  //***********************************************************************
  with QCabTransito.SQL do
  begin
    Clear;
    Add('select * from frf_transitos_c');
  end;
  with QLinTransito.SQL do
  begin
    Clear;
    Add('select * from frf_transitos_l');
  end;
  with QGetNumeroTransito.SQL do
  begin
    Clear;
    Clear;
    Add('select cont_transitos_c ');
    Add('from frf_centros  ');
    Add('where empresa_c = :empresa ');
    Add('  and centro_c = :centro ');
  end;
  with QUpdateNumeroTransito.SQL do
  begin
    Clear;
    Add('update frf_centros ');
    Add('set cont_transitos_c = :contador  ');
    Add('where empresa_c = :empresa ');
    Add('  and centro_c = :centro ');
  end;
  with QValidarNumeroTransito.SQL do
  begin
    Clear;
    Add(' select * ');
    Add(' from frf_transitos_c ');
    Add(' where empresa_tc = :empresa ');
    Add(' and centro_tc = :centro ');
    Add(' and year(fecha_tc) = :anyo ');
    Add(' and referencia_tc = :referencia ');
  end;

  //***********************************************************************
  //***********************************************************************
  // TRANSITOS
  //***********************************************************************
  //***********************************************************************
  with QPesoTeorico.SQL do
  begin
    Clear;
    Add('select peso_neto_e peso');
    Add('from frf_envases ');
    Add('where producto_e = :producto ');
    Add('and envase_e = :envase ');
  end;
  with qryPesoVariable do
  begin
    SQL.Clear;
    SQL.Add(' select peso_variable_e from frf_envases  ');
    SQL.Add(' where envase_e = :envase ');
    Prepare;
  end;

  with QMonedaCliente do
  begin
    SQL.Clear;
    SQL.add(' select moneda_c ');
    SQL.add(' from frf_clientes ');
    SQL.add(' where cliente_c  = :cliente ');
  end;
end;

function TDTraspasar.GetMonedaCliente( const AEmpresa, ACliente: string ): string;
begin
  QMonedaCliente.ParamByName('cliente').AsString:= ACliente;
  QMonedaCliente.Open;
  if not QMonedaCliente.IsEmpty then
  begin
    result:= QMonedaCliente.Fields[0].asstring;
  end
  else
  begin
    result:= 'EUR';
  end;
  QMonedaCliente.Close;
end;

procedure TDTraspasar.PreparaTraspasoAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer );
var
  iDay, iMonth, iYear: Word;
  iAlbaran: integer;
begin
  QGetNumeroAlbaran.ParamByName('empresa').AsString:= AEmpresa;
  QGetNumeroAlbaran.ParamByName('centro').AsString:= ACentro;
  QGetNumeroAlbaran.Open;
  iAlbaran:= QGetNumeroAlbarancont_albaranes_c.AsInteger;

  DecodeDate( AFecha, iYear, iMonth, iDay );
  QValidarNumeroAlbaran.ParamByName('empresa').AsString:= AEmpresa;
  QValidarNumeroAlbaran.ParamByName('centro').AsString:= ACentro;
  QValidarNumeroAlbaran.ParamByName('anyo').AsInteger:= iYear;
  QValidarNumeroAlbaran.ParamByName('albaran').AsInteger:= iAlbaran;
  QValidarNumeroAlbaran.Open;
  if not QValidarNumeroAlbaran.IsEmpty then
  begin
    QGetNumeroAlbaran.Close;
    QValidarNumeroAlbaran.Close;
    raise Exception.Create('Numero de albarán ' + IntToStr(iAlbaran) +
                           ' ya usado en el año ' + IntToStr(iYear) + #13 + #10 +
                           'Por favor revise el contador de albaranes.');
  end;
  QValidarNumeroAlbaran.Close;

  QCabCarga.ParamByName('orden').AsInteger:= AOrden;
  QLinCargaSalida.ParamByName('orden').AsInteger:= AOrden;
  QLinCargaAux:= QLinCargaSalida;
  QUpdateStatusCarga.ParamByName('orden').AsInteger:= AOrden;
  QUpdateCabCarga.ParamByName('orden').AsInteger:= AOrden;
  QUpdateLinCarga.ParamByName('orden').AsInteger:= AOrden;

  QCabAlbaran.Open;
  QLinAlbaran.Open;
  QUpdateNumeroAlbaran.ParamByName('empresa').AsString:= AEmpresa;
  QUpdateNumeroAlbaran.ParamByName('centro').AsString:= ACentro;
end;

procedure TDTraspasar.PreparaTraspasoTransito( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer );
var
  iDay, iMonth, iYear: Word;
  iAlbaran: integer;
begin
  QGetNumeroTransito.ParamByName('empresa').AsString:= AEmpresa;
  QGetNumeroTransito.ParamByName('centro').AsString:= ACentro;
  QGetNumeroTransito.Open;
  iAlbaran:= QGetNumeroTransitocont_transitos_c.AsInteger;

  DecodeDate( AFecha, iYear, iMonth, iDay );
  QValidarNumeroTransito.ParamByName('empresa').AsString:= AEmpresa;
  QValidarNumeroTransito.ParamByName('centro').AsString:= ACentro;
  QValidarNumeroTransito.ParamByName('anyo').AsInteger:= iYear;
  QValidarNumeroTransito.ParamByName('referencia').AsInteger:= iAlbaran;
  QValidarNumeroTransito.Open;
  if not QValidarNumeroTransito.IsEmpty then
  begin
    QGetNumeroTransito.Close;
    QValidarNumeroTransito.Close;
    raise Exception.Create('Numero de tránsito ' + IntToStr(iAlbaran) +
                           ' ya usado en el año ' + IntToStr(iYear) + #13 + #10 +
                           'Por favor revise el contador de tránsitos.');
  end;
  QValidarNumeroTransito.Close;

  QCabCarga.ParamByName('orden').AsInteger:= AOrden;
  QLinCargaTransito.ParamByName('orden').AsInteger:= AOrden;
  QLinCargaAux:= QLinCargaTransito;
  QUpdateStatusCarga.ParamByName('orden').AsInteger:= AOrden;
  QUpdateCabCarga.ParamByName('orden').AsInteger:= AOrden;
  QUpdateLinCarga.ParamByName('orden').AsInteger:= AOrden;
  QCabTransito.Open;
  QLinTransito.Open;
  QUpdateNumeroTransito.ParamByName('empresa').AsString:= AEmpresa;
  QUpdateNumeroTransito.ParamByName('centro').AsString:= ACentro;
end;

function TDTraspasar.PasarAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer; const APacking: Boolean ): integer;
var id_linea:integer;
begin
  PesosPaletToLineasOrden( AOrden, APacking );
  PreparaTraspasoAlbaran( AEmpresa, ACentro, AFecha, AOrden);
  result:= ObtenerNumeroAlbaran;

  PasaCabeceraAlbaran;
  id_linea := 0;
  QLinCargaAux.First;
  While not QLinCargaAux.Eof do
  begin
       id_linea := id_linea + 1;
       PasaDetalleAlbaran( True, id_linea );
       QLinCargaAux.Next;
  end;

  //Comprobar que todos los palets han sido pasados correctamente

  ActualizaEstadoOrden( 1 );
  CerrarTablasAlbaran;
end;

function TDTraspasar.ObtenerNumeroAlbaran: integer;
var
  iAlbaran: integer;
begin
  iAlbaran:= QGetNumeroAlbarancont_albaranes_c.AsInteger;
  //Comprobar que no este usado

  QUpdateNumeroAlbaran.ParamByName('contador').AsInteger:= iAlbaran + 1;
  QUpdateNumeroAlbaran.ExecSQL;

  QUpdateCabCarga.ParamByName('contador').AsInteger:= iAlbaran;
  QUpdateCabCarga.ExecSQL;
  QUpdateLinCarga.ParamByName('contador').AsInteger:= iAlbaran;
  QUpdateLinCarga.ExecSQL;
  QCabCarga.Open;
  QLinCargaAux.Open;
  result:= iAlbaran;
end;

procedure TDTraspasar.PasaCabeceraAlbaran;
begin
  QCabAlbaran.Insert;
  QCabAlbaranempresa_sc.Value:= QCabCargaempresa_occ.Value;
  QCabAlbarancentro_salida_sc.Value:= QCabCargacentro_salida_occ.Value;
  QCabAlbarann_albaran_sc.Value:= QCabCargan_albaran_occ.Value;
  QCabAlbaranfecha_sc.Value:= QCabCargafecha_occ.Value;
  if QCabCargahora_occ.AsString <> '' then
    QCabAlbaranhora_sc.AsString:= QCabCargahora_occ.AsString;

  QCabAlbarancliente_sal_sc.Value:= QCabCargacliente_sal_occ.Value;
  QCabAlbarandir_sum_sc.Value:= QCabCargadir_sum_occ.Value;
  QCabAlbarancliente_fac_sc.Value:= QCabCargacliente_fac_occ.Value;

  QCabAlbarann_pedido_sc.Value:= QCabCargan_pedido_occ.Value;
  if ( QCabCargafecha_pedido_occ.Value <> 0 ) and ( QCabCargafecha_pedido_occ.Value <> null ) then
    QCabAlbaranfecha_pedido_sc.Value:= QCabCargafecha_pedido_occ.Value;
  if ( QCabCargafecha_descarga_occ.Value <> 0 ) and ( QCabCargafecha_descarga_occ.Value <> null ) then
    QCabAlbaranfecha_descarga_sc.Value:= QCabCargafecha_descarga_occ.Value;
  QCabAlbaranmoneda_sc.Value:= GetMonedaCliente( QCabCargaempresa_occ.Value, QCabCargacliente_sal_occ.Value);

  QCabAlbarantransporte_sc.Value:= QCabCargatransporte_occ.Value;
  QCabAlbaranoperador_transporte_sc.Value:= QCabCargaoperador_transporte_occ.Value;
  QCabAlbaranporte_bonny_sc.Value:= QCabCargaporte_bonny_occ.Value;
  QCabAlbaranvehiculo_sc.Value:= QCabCargavehiculo_occ.Value;

  QCabAlbaranhigiene_sc.AsInteger:= QCabCargahigiene_occ.AsInteger;
  QCabAlbarann_orden_sc.AsString:= QCabCargaorden_occ.AsString;
  QCabAlbarannota_sc.AsString:= QCabCarganota_occ.AsString;
  QCabAlbarannota_factura_sc.AsString:= PonNotaFactura( QCabCargaempresa_occ.AsString, QCabCargacliente_fac_occ.AsString );

  PonerIncotermPorDefecto;

  QCabAlbaran.Post;
end;

function TDTraspasar.PonNotaFactura( const AEmpresa, ACliente: string ): string;
begin
    if ( ( AEmpresa = '050' ) or  ( AEmpresa = '080' ) ) and
       ( ( ACliente = 'BEL' ) or  ( ACliente = 'DAN' ) or  ( ACliente = 'EIN' ) or  ( ACliente = 'FL4' )
         or  ( ACliente = 'FOI' ) or  ( ACliente = 'FOR' ) or  ( ACliente = 'LEG' ) or  ( ACliente = 'LOM' )
         or  ( ACliente = 'MAG' ) or  ( ACliente = 'MGG' ) or  ( ACliente = 'SAP' ) or  ( ACliente = 'URS' )) then
    begin
       Result:= 'PAYABLE PAR CRENO IMPEX';
    end
    else
    begin
      Result:= '';
    end;
end;

function  TDTraspasar.PesoTeorico( const AEmpresa, AEnvase, AProducto: string; const ACajas: Integer ): Real;
begin
  with QPesoTeorico do
  begin
    ParamByName('envase').AsString:= AEnvase;
    ParamByName('producto').AsString:= AProducto;
    Open;
    Result:= SimpleRoundTo(FieldByName('peso').AsFloat * ACajas, -2);
    Close;
  end;
end;

function TDTraspasar.EsPesoVariable( const AEmpresa, AEnvase: string ): Boolean;
begin
    with qryPesoVariable do
    begin
      ParamByName('envase').AsString:= AEnvase;
      Open;
      try
        result:= FieldByname('peso_variable_e').AsInteger = 1;
      finally
        Close;
      end;
    end;
end;


function TDTraspasar.EsProductoDesglose: Boolean;
begin
  with qryAux do
  begin
    SQL.Clear;
    SQL.Add('select producto_desglose_p ');
    SQL.Add('  from frf_productos ');
    SQL.Add(' where producto_p = :producto ');
    ParamByName('producto').AsString := QLinAlbaran.FieldByName('producto_sl').AsString;
    Open;
    try
      result := (FieldByName('producto_desglose_p').AsString = 'S');
    finally
      Close;
    end;
  end;
end;

procedure TDTraspasar.PesosPaletToLineasOrden( const AOrden: Integer; const APacking: Boolean );
var
  sPalets: string;
  iCount: Integer;
  aiCajas, aiPalets: array of Integer;
  arKilos, arTeoricos: array of Real;
begin
  if APacking then
  begin
    sPalets:= '';
    QLineasCarga.ParamByName('orden').AsInteger:= AOrden;
    QLineasPalets.ParamByName('orden').AsInteger:= AOrden;
    QLineasCarga.Open;
    QLineasPalets.Open;

    //Inicalizar
    iCount:= 0;
    while not QLineasCarga.Eof do
    begin
      QLineasCarga.Next;
      Inc( iCount );
    end;
    SetLength( aiCajas, iCount );
    SetLength( aiPalets, iCount );
    SetLength( arKilos, iCount );
    SetLength( arTeoricos, iCount );
    for iCount:= 0 to Length( aiCajas ) - 1 do
    begin
      aiCajas[ iCount ]:= 0;
      aiPalets[ iCount ]:= 0;
      arKilos[ iCount ]:= 0;
      arTeoricos[ iCount ]:= 0;
    end;

    //mENOS UNO pasada -> AÑADO COLOR
    QLineasCarga.First;
    iCount:= 0;
    while not QLineasCarga.Eof do
    begin
      QLineasPalets.First;
      while not QLineasPalets.Eof do
      begin
        if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
           ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
           ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
           ( QLineasCarga.FieldByName('marca_ocl').AsString = QLineasPalets.FieldByName('marca_pl').AsString ) and
           ( QLineasCarga.FieldByName('calibre_ocl').AsString = QLineasPalets.FieldByName('calibre_pl').AsString ) and
           ( QLineasCarga.FieldByName('color_ocl').AsString = QLineasPalets.FieldByName('color_pl').AsString ) and
           ( QLineasCarga.FieldByName('unidades_caja_ocl').AsString = QLineasPalets.FieldByName('unidades_caja_pl').AsString ) and
           ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat ) then
        begin
          aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
          arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;

          if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
             ( not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
            arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                             QLineaspalets.FieldByName('envase_pl').AsString,
                                                             QLineaspalets.FieldByName('producto_pl').AsString,
                                                             QLineaspalets.FieldByName('cajas_pl').AsInteger )
          else
            arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
          if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
          begin
            aiPalets[iCount]:= aiPalets[iCount] + 1;
            sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
          end;
          QLineaspalets.Delete;
        end
        else
        begin
          QLineaspalets.Next;
        end;
      end;
      QLineasCarga.Next;
      inc( iCount );
    end;


    //Zero pasada
    QLineasCarga.First;
    iCount:= 0;
    while not QLineasCarga.Eof do
    begin
      QLineasPalets.First;
      while not QLineasPalets.Eof do
      begin
        if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
           ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
           ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
           ( QLineasCarga.FieldByName('marca_ocl').AsString = QLineasPalets.FieldByName('marca_pl').AsString ) and
           ( QLineasCarga.FieldByName('calibre_ocl').AsString = QLineasPalets.FieldByName('calibre_pl').AsString ) and
           ( QLineasCarga.FieldByName('unidades_caja_ocl').AsString = QLineasPalets.FieldByName('unidades_caja_pl').AsString ) and
           ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat ) then
        begin
          aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
          arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;

          if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
             ( not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
            arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                             QLineaspalets.FieldByName('envase_pl').AsString,
                                                             QLineaspalets.FieldByName('producto_pl').AsString,
                                                             QLineaspalets.FieldByName('cajas_pl').AsInteger )
          else
            arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
          if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
          begin
            aiPalets[iCount]:= aiPalets[iCount] + 1;
            sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
          end;
          QLineaspalets.Delete;
        end
        else
        begin
          QLineaspalets.Next;
        end;
      end;
      QLineasCarga.Next;
      inc( iCount );
    end;

    if not QLineasPalets.IsEmpty then
    begin
      //Primera pasada
      QLineasCarga.First;
      iCount:= 0;
      while not QLineasCarga.Eof do
      begin
        QLineasPalets.First;
        while not QLineasPalets.Eof do
        begin
          if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
             ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
             ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
             ( QLineasCarga.FieldByName('marca_ocl').AsString = QLineasPalets.FieldByName('marca_pl').AsString ) and
             ( QLineasCarga.FieldByName('unidades_caja_ocl').AsString = QLineasPalets.FieldByName('unidades_caja_pl').AsString ) and
             ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat ) then
          begin
            aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
            arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
            if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
               ( not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
              arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                             QLineaspalets.FieldByName('envase_pl').AsString,
                                                             QLineaspalets.FieldByName('producto_pl').AsString,
                                                             QLineaspalets.FieldByName('cajas_pl').AsInteger )
            else
              arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
            if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
            begin
              aiPalets[iCount]:= aiPalets[iCount] + 1;
              sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
            end;
            QLineaspalets.Delete;
          end
          else
          begin
            QLineaspalets.Next;
          end;
        end;
        QLineasCarga.Next;
        inc( iCount );
      end;
    end;

    //Segunda pasada, eliminamos calibre
    if not QLineasPalets.IsEmpty then
    begin
      QLineasCarga.First;
      iCount:= 0;
      while not QLineasCarga.Eof do
      begin
        QLineasPalets.First;
        while not QLineasPalets.Eof do
        begin
          if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
             ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
             ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
             ( QLineasCarga.FieldByName('unidades_caja_ocl').AsString = QLineasPalets.FieldByName('unidades_caja_pl').AsString ) and
             ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat ) then
          begin
            aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
            arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
            if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
               ( not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
              arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                               QLineaspalets.FieldByName('envase_pl').AsString,
                                                               QLineaspalets.FieldByName('producto_pl').AsString,
                                                               QLineaspalets.FieldByName('cajas_pl').AsInteger )
            else
              arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
            if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
            begin
              aiPalets[iCount]:= aiPalets[iCount] + 1;
              sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
            end;
            QLineaspalets.Delete;
          end
          else
          begin
            QLineaspalets.Next;
          end;
        end;
        QLineasCarga.Next;
        inc( iCount );
      end;

      //tercera pasada, eliminamos marca
      if not QLineasPalets.IsEmpty then
      begin
        QLineasCarga.First;
        iCount:= 0;
        while not QLineasCarga.Eof do
        begin
          QLineasPalets.First;
          while not QLineasPalets.Eof do
          begin
            if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
               ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
               ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
               ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat )  then
            begin
              aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
              arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
              if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
                 ( not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
               arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                                QLineaspalets.FieldByName('envase_pl').AsString,
                                                                QLineaspalets.FieldByName('producto_pl').AsString,
                                                                QLineaspalets.FieldByName('cajas_pl').AsInteger )
              else
                arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
              if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
              begin
                aiPalets[iCount]:= aiPalets[iCount] + 1;
                sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
              end;
              QLineaspalets.Delete;
            end
            else
            begin
              QLineaspalets.Next;
            end;
          end;
          QLineasCarga.Next;
          inc( iCount );
        end;
      end;
    end;


    if not QLineasPalets.IsEmpty  then
    begin
      QLineasCarga.Close;
      QLineasPalets.Close;
      raise Exception.Create('Error al extraer los detalles del packing.');
    end
    else
    begin
      QLineasCarga.First;
      iCount:= 0;
      while not QLineasCarga.Eof do
      begin
        QUpdateLinCarga2.ParamByName('orden').AsInteger:= QLineasCarga.FieldByName('orden_ocl').AsInteger;
        QUpdateLinCarga2.ParamByName('linea').AsInteger:= QLineasCarga.FieldByName('linea_ocl').AsInteger;
        QUpdateLinCarga2.ParamByName('cajas').AsFloat:= aiCajas[ iCount ];
        QUpdateLinCarga2.ParamByName('palets').AsFloat:= aiPalets[ iCount ];
        if arKilos[ iCount ] <> 0 then
        begin
          QUpdateLinCarga2.ParamByName('kilos').AsFloat:= arTeoricos[ iCount ]
        end
        else
        begin
          QUpdateLinCarga2.ParamByName('kilos').AsFloat:= QLineasCarga.FieldByName('kilos_ocl').AsFloat;
        end;
        QUpdateLinCarga2.ExecSQL;

      //Cambio la forma de hacer el update, por problemas al actualizar datos en sinonimo de frf_orden_l 15/09/2020
{
        QLineasCarga.Edit;
        if aiCajas[ iCount ] <> 0 then
        begin
          QLineasCarga.FieldByName('cajas_packing_ocl').AsFloat:= aiCajas[ iCount ];
          QLineasCarga.FieldByName('palets_packing_ocl').AsInteger:= aiPalets[ iCount ];
          if arKilos[ iCount ] <> 0 then
          begin
            QLineasCarga.FieldByName('kilos_packing_ocl').AsFloat:= arTeoricos[ iCount ]
          end
          else
          begin
            QLineasCarga.FieldByName('kilos_packing_ocl').AsFloat:= QLineasCarga.FieldByName('kilos_ocl').AsFloat;
          end;

        end
        else
        begin
          QLineasCarga.FieldByName('cajas_packing_ocl').AsFloat:= 0;
          QLineasCarga.FieldByName('palets_packing_ocl').AsInteger:= 0;
          QLineasCarga.FieldByName('kilos_packing_ocl').AsFloat:= 0;
        end;

        QLineasCarga.Post;
}

        QLineasCarga.Next;
        Inc( iCount );
      end;
      QLineasPalets.Close;
      QLineasCarga.Close;
    end;
  end
  else
  begin
    QLineasCarga.ParamByName('orden').AsInteger:= AOrden;
    QLineasCarga.Open;
    while not QLineasCarga.Eof do
    begin

      QUpdateLinCarga2.ParamByName('orden').AsInteger:= QLineasCarga.FieldByName('orden_ocl').AsInteger;
      QUpdateLinCarga2.ParamByName('linea').AsInteger:= QLineasCarga.FieldByName('linea_ocl').AsInteger;
      QUpdateLinCarga2.ParamByName('kilos').AsFloat:= QLineasCarga.FieldByName('kilos_ocl').AsFloat;
      QUpdateLinCarga2.ParamByName('cajas').AsFloat:= QLineasCarga.FieldByName('cajas_ocl').AsFloat;
      QUpdateLinCarga2.ParamByName('palets').AsFloat:= QLineasCarga.FieldByName('n_palets_ocl').AsFloat;
      QUpdateLinCarga2.ExecSQL;

      //Cambio la forma de hacer el update, por problemas al actualizar datos en sinonimo de frf_orden_l 15/09/2020
{
      QLineasCarga.Edit;
      QLineasCarga.FieldByName('kilos_packing_ocl').AsFloat:= QLineasCarga.FieldByName('kilos_ocl').AsFloat;
      QLineasCarga.FieldByName('cajas_packing_ocl').AsFloat:= QLineasCarga.FieldByName('cajas_ocl').AsFloat;
      QLineasCarga.FieldByName('palets_packing_ocl').AsFloat:= QLineasCarga.FieldByName('n_palets_ocl').AsFloat;
      QLineasCarga.Post;
}
      QLineasCarga.Next;
    end;
    QLineasCarga.Close;
  end;
end;

procedure TDTraspasar.PasaDetalleAlbaran( const AIgnorarPacking: Boolean; const ALinea:integer );
begin
  QLinAlbaran.Insert;

  QLinAlbaran.FieldByName('empresa_sl').Value:= QLinCargaAux.FieldByName('empresa_ocl').Value;
  QLinAlbaran.FieldByName('centro_salida_sl').Value:= QLinCargaAux.FieldByName('centro_salida_ocl').Value;
  QLinAlbaran.FieldByName('n_albaran_sl').Value:= QLinCargaAux.FieldByName('n_albaran_ocl').Value;
  QLinAlbaran.FieldByName('fecha_sl').Value:= QCabCargafecha_occ.Value;
  QLinAlbaran.FieldByName('producto_sl').Value:= QLinCargaAux.FieldByName('producto_ocl').Value;
  QLinAlbaran.FieldByName('envase_sl').Value:= QLinCargaAux.FieldByName('envase_ocl').Value;
  QLinAlbaran.FieldByName('marca_sl').Value:= QLinCargaAux.FieldByName('marca_ocl').Value;
  QLinAlbaran.FieldByName('categoria_sl').Value:= QLinCargaAux.FieldByName('categoria_ocl').Value;
  QLinAlbaran.FieldByName('calibre_sl').Value:= QLinCargaAux.FieldByName('calibre_ocl').Value;
  QLinAlbaran.FieldByName('color_sl').Value:= QLinCargaAux.FieldByName('color_ocl').Value;
  (*TODO*)//mirar a ver por que pasa un 0 envez de un nulo como ref transito
  QLinAlbaran.FieldByName('centro_origen_sl').Value:= QLinCargaAux.FieldByName('centro_origen_ocl').Value;
  if QLinCargaAux.FieldByName('ref_transitos_ocl').AsString <> '' then
  begin
    QLinAlbaran.FieldByName('centro_transito_sl').Value:=  QLinCargaAux.FieldByName('centro_origen_ocl').Value;
    QLinAlbaran.FieldByName('ref_transitos_sl').Value:=  QLinCargaAux.FieldByName('ref_transitos_ocl').Value;
    QLinAlbaran.FieldByName('fecha_transito_sl').Value:=  QLinCargaAux.FieldByName('fecha_transito_ocl').Value;
  end;


  QLinAlbaran.FieldByName('kilos_sl').Value:= QLinCargaAux.FieldByName('kilos_packing_ocl').Value;
  if QLinAlbaran.FieldByName('kilos_sl').Value = 0 then
  begin
    QLinAlbaran.Cancel;
    raise Exception.Create('ERROR: No se pueden generar albaranes con lineas con 0 kilos. Por favor revise la orden de carga y packing para comprobar que los pesos sean correctos. ');
  end;

  QLinAlbaran.FieldByName('cajas_sl').Value:= QLinCargaAux.FieldByName('cajas_packing_ocl').Value;
  QLinAlbaran.FieldByName('unidades_caja_sl').Value:= QLinCargaAux.FieldByName('unidades_caja_ocl').Value;
  QLinAlbaran.FieldByName('n_palets_sl').Value:= QLinCargaAux.FieldByName('palets_packing_ocl').Value;
  QLinAlbaran.FieldByName('tipo_palets_sl').Value:= QLinCargaAux.FieldByName('tipo_palets_ocl').Value;

  QLinAlbaran.FieldByName('precio_sl').AsFloat:= QLinCargaAux.FieldByName('precio_ocl').AsFloat;
  QLinAlbaran.FieldByName('porc_iva_sl').Value:= QLinCargaAux.FieldByName('porc_iva_ocl').Value;
  QLinAlbaran.FieldByName('unidad_precio_sl').AsString:= QLinCargaAux.FieldByName('unidad_precio_ocl').AsString;

  if QLinAlbaran.FieldByName('unidad_precio_sl').AsString = 'KGS' then
  begin
    QLinAlbaran.FieldByName('importe_neto_sl').AsFloat:= SimpleRoundTo( QLinAlbaran.FieldByName('kilos_sl').Value * QLinAlbaran.FieldByName('precio_sl').AsFloat, -2);
    QLinAlbaran.FieldByName('iva_sl').Value:= SimpleRoundTo( ( QLinAlbaran.FieldByName('importe_neto_sl').AsFloat * QLinAlbaran.FieldByName('porc_iva_sl').AsFloat ) / 100, -2);
    QLinAlbaran.FieldByName('importe_total_sl').AsFloat:= QLinAlbaran.FieldByName('importe_neto_sl').AsFloat + QLinAlbaran.FieldByName('iva_sl').Value;
  end
  else
  begin
    QLinAlbaran.FieldByName('importe_neto_sl').AsFloat:= QLinCargaAux.FieldByName('importe_neto_ocl').AsFloat;
    QLinAlbaran.FieldByName('iva_sl').Value:= QLinCargaAux.FieldByName('iva_ocl').Value;
    QLinAlbaran.FieldByName('importe_total_sl').AsFloat:= QLinCargaAux.FieldByName('importe_total_ocl').AsFloat;
  end;

  QLinAlbaran.FieldByName('tipo_iva_sl').AsString:= QLinCargaAux.FieldByName('tipo_iva_ocl').AsString;
  QLinAlbaran.FieldByName('federacion_sl').AsString:= QLinCargaAux.FieldByName('federacion_ocl').AsString;
  QLinAlbaran.FieldByName('cliente_sl').AsString:= QLinCargaAux.FieldByName('cliente_ocl').AsString;
  QLinAlbaran.FieldByName('comercial_sl').AsString:= QLinCargaAux.FieldByName('comercial_ocl').AsString;
  QLinAlbaran.FieldByName('emp_procedencia_sl').AsString:= QLinCargaAux.FieldByName('emp_procede_ocl').AsString;
  QLinAlbaran.FieldByName('notas_sl').AsString:= QLinCargaAux.FieldByName('notas_ocl').AsString;
  QLinAlbaran.FieldByName('id_linea_albaran_sl').AsInteger:= ALinea;


  QLinAlbaran.Post;
  //Producto Desglose
  if EsProductoDesglose then
    ArticuloDesgloseInsertar;
end;

procedure TDTraspasar.ActualizaEstadoOrden( const AEstado: integer );
begin
  //0 -> SIN PASAR
  //1 -> PASADA COMO ALBARAN SALIDA
  //2 -> PASADA COMO ALBARAN TRANSITO
  QUpdateStatusCarga.ParamByName('estado').asinteger:= AEstado;
  QUpdateStatusCarga.ExecSQL;
end;

procedure TDTraspasar.ArticuloDesgloseInsertar;
begin
  // Insertamos en frf_salidas_l2 desglose de producto
  with qryAux do
  begin
    if Active then
    begin
      Cancel;
      Close;
    end;

    SQL.Clear;
    SQL.Add(' select * from frf_articulos_desglose ');
    SQL.Add('  where articulo_ad = :articulo ');

    ParamByName('articulo').AsString := QLinAlbaran.FieldByName('envase_sl').AsString;

    Open;
    if IsEmpty then
        raise Exception.Create('ERROR: No se puede generar el albarán. Falta indicar el % de desglose por producto en el Mant. de Articulos');

    while not Eof do
    begin
      with qryAux2 do
      begin
        SQL.Clear;
        SQL.Add(' insert into frf_salidas_l2 (empresa_sl2, centro_salida_sl2, n_albaran_sl2, fecha_sl2, id_linea_albaran_sl2,' );
        SQL.Add('                             articulo_sl2, producto_sl2, producto_desglose_sl2, porcentaje_sl2, kilos_desglose_sl2) ');
        SQL.Add('                     values (:empresa, :centro, :albaran, :fecha, :id_linea, ');
        SQL.Add('                             :articulo, :producto, :producto_desglose, :porcentaje_desglose, :kilos_desglose) ');
        ParamByName('empresa').AsString := QLinAlbaran.FieldByName('empresa_sl').AsString;
        ParamByName('centro').AsString := QLinAlbaran.FieldByName('centro_salida_sl').AsString;
        ParamByName('albaran').AsString := QLinAlbaran.FieldByName('n_albaran_sl').AsString;
        ParamByName('fecha').AsString := QLinAlbaran.FieldByName('fecha_sl').AsString;
        ParamByName('id_linea').AsInteger := QLinAlbaran.FieldByName('id_linea_albaran_sl').AsInteger;
        ParamByName('articulo').AsString := QLinAlbaran.FieldByName('envase_sl').AsString;
        ParamByName('producto').AsString := QLinAlbaran.FieldByName('producto_sl').AsString;
        ParamByName('producto_desglose').AsString := qryAux.FieldByName('producto_desglose_ad').AsString;
        ParamByName('porcentaje_desglose').AsFloat := qryAux.FieldByName('porcentaje_ad').AsFloat;
        ParamByName('kilos_desglose').AsFloat := bRoundTo(QLinAlbaran.FieldByName('kilos_sl').AsFloat * qryAux.FieldByName('porcentaje_ad').AsFloat / 100, 2);
        try
          ExecSQL;
        finally
          Close;
        end;
      end;

      Next;
    end;
  end;
end;

procedure TDTraspasar.CerrarTablasAlbaran;
begin
  QCabCarga.Close;
  QLinCargaAux.Close;
  QCabAlbaran.Close;
  QLinAlbaran.Close;
  QGetNumeroAlbaran.Close;
end;

function  TDTraspasar.PasarTransito( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer; const APacking: Boolean ): integer;
begin
  PesosPaletToLineasOrden( AOrden, APacking );
  PreparaTraspasoTransito( AEmpresa, ACentro, AFecha, AOrden);
  result:= ObtenerNumeroTransito;
  PasaCabeceraTransito;

  QLinCargaAux.First;
  While not QLinCargaAux.Eof do
  begin
       PasaDetalleTransito;
       QLinCargaAux.Next;
  end;

  ActualizaEstadoOrden( 2 );
  CerrarTablasTransito;
end;

function TDTraspasar.ObtenerNumeroTransito: integer;
var
  iTransito: integer;
begin
  iTransito:= QGetNumeroTransitocont_transitos_c.AsInteger;
  QUpdateNumeroTransito.ParamByName('contador').AsInteger:= iTransito + 1;
  QUpdateNumeroTransito.ExecSQL;
  QUpdateCabCarga.ParamByName('contador').AsInteger:= iTransito;
  QUpdateCabCarga.ExecSQL;
  QUpdateLinCarga.ParamByName('contador').AsInteger:= iTransito;
  QUpdateLinCarga.ExecSQL;
  QCabCarga.Open;
  QLinCargaAux.Open;
  result:= iTransito;
end;

procedure TDTraspasar.PasaCabeceraTransito;
begin
  QCabTransito.Insert;
  QCabTransitoempresa_tc.Value:= QCabCargaempresa_occ.Value;
  QCabTransitocentro_tc.Value:= QCabCargacentro_salida_occ.Value;
  QCabTransitoreferencia_tc.Value:= QCabCargan_albaran_occ.Value;
  QCabTransitofecha_tc.Value:= QCabCargafecha_occ.Value;
  if QCabCargahora_occ.AsString <> '' then
    strngfldQCabTransitohora_tc.Value:= QCabCargahora_occ.Value;
  QCabTransitocentro_destino_tc.Value:= QCabCargacentro_destino_occ.Value;

  QCabTransitotransporte_tc.Value:= QCabCargatransporte_occ.Value;
  QCabTransitoporte_bonny_tc.Value:= QCabCargaporte_bonny_occ.Value;
  QCabTransitovehiculo_tc.Value:= QCabCargavehiculo_occ.Value;

  if ( QCabTransitoempresa_tc.AsString = '050' )and
     ( QCabTransitocentro_tc.AsString = '6' ) and
     ( QCabTransitocentro_destino_tc.AsString = '1' ) then
  begin
    QCabTransitodestino_tc.AsString:= 'ALC/DDA Nº AUT. ESIC03001001';
  end;

  QCabTransiton_orden_tc.AsString:= QCabCargaorden_occ.AsString;
  QCabTransitonota_tc.AsString:= 'ORDEN DE CARGA Nº ' + QCabCargaorden_occ.AsString + #13 + #10 + QCabCarganota_occ.AsString;

  QCabTransitostatus_gastos_tc.AsString:= 'N';
  QCabTransito.Post;
  QCabTransito.Cancel;
end;


procedure TDTraspasar.PasaDetalleTransito;
begin
  QLinTransito.Insert;

  QLinTransitoempresa_tl.Value:= QLinCargaAux.FieldByName('empresa_ocl').Value;
  QLinTransitocentro_tl.Value:= QLinCargaAux.FieldByName('centro_salida_ocl').Value;
  QLinTransitoreferencia_tl.Value:= QLinCargaAux.FieldByName('n_albaran_ocl').Value;
  QLinTransitofecha_tl.Value:= QCabCargafecha_occ.Value;
  QLinTransitocentro_destino_tl.Value:= QCabCarga.FieldByName('centro_destino_occ').Value;

  QLinTransitocentro_origen_tl.Value:= QLinCargaAux.FieldByName('centro_origen_ocl').Value;
  QLinTransitoref_origen_tl.AsString:=  QLinCargaAux.FieldByName('ref_transitos_ocl').AsString;
  QLinTransitofecha_origen_tl.AsString:= QLinCargaAux.FieldByName('fecha_transito_ocl').AsString;

  QLinTransitoproducto_tl.Value:= QLinCargaAux.FieldByName('producto_ocl').Value;
  QLinTransitoenvase_tl.Value:= QLinCargaAux.FieldByName('envase_ocl').Value;
  QLinTransitomarca_tl.Value:= QLinCargaAux.FieldByName('marca_ocl').Value;
  QLinTransitocategoria_tl.Value:= QLinCargaAux.FieldByName('categoria_ocl').Value;
  QLinTransitocalibre_tl.Value:= QLinCargaAux.FieldByName('calibre_ocl').Value;
  QLinTransitocolor_tl.Value:= QLinCargaAux.FieldByName('color_ocl').Value;

  QLinTransitokilos_tl.Value:= QLinCargaAux.FieldByName('kilos_packing_ocl').Value;
  if QLinTransitokilos_tl.Value = 0 then
  begin
    QLinTransito.Cancel;
    raise Exception.Create('ERROR: No se pueden generar albaranes con lineas con 0 kilos. Por favor revise la orden de carga y packing para comprobar que los pesos sean correctos. ');
  end;

  QLinTransitocajas_tl.Value:= QLinCargaAux.FieldByName('cajas_packing_ocl').Value;
  QLinTransitounidades_caja_tl.Value:= QLinCargaAux.FieldByName('unidades_caja_ocl').Value;

  QLinTransitopalets_tl.Value:= QLinCargaAux.FieldByName('palets_packing_ocl').Value;
  QLinTransitotipo_palet_tl.Value:= QLinCargaAux.FieldByName('tipo_palets_ocl').Value;

  QLinTransitofederacion_tl.AsString:= QLinCargaAux.FieldByName('federacion_ocl').AsString;

  QLinTransitoprecio_tl.AsFloat:= QLinCargaAux.FieldByName('precio_ocl').AsFloat;
  QLinTransitoimporte_linea_tl.AsFloat:= QLinCargaAux.FieldByName('importe_neto_ocl').AsFloat;


  QLinTransito.Post;
  QLinTransito.Cancel;
end;

procedure TDTraspasar.CerrarTablasTransito;
begin
  QCabCarga.Close;
  QLinCargaAux.Close;
  QCabTransito.Close;
  QLinTransito.Close;
  QGetNumeroTransito.Close;
end;

procedure TDTraspasar.PonerIncotermPorDefecto;
begin

//  if ( QCabCargaempresa_occ.Asstring = '080' ) and
//     ( QCabCargacliente_sal_occ.Asstring = 'F23' ) then
//  begin
    with qryAux do
    begin
      SQL.Clear;
      SQL.Add(' select incoterm_c, plaza_incoterm_c ');
      SQL.Add(' from frf_clientes ');
      SQL.Add(' where cliente_c = :cliente ');
      ParamByName('cliente').AsString:= QCabCargacliente_sal_occ.Asstring;
      Open;
      if FieldByname('incoterm_c').AsString <> '' then
      begin
        QCabAlbaranincoterm_sc.Asstring:= FieldByname('incoterm_c').AsString;
        QCabAlbaranplaza_incoterm_sc.Asstring:= FieldByname('plaza_incoterm_c').AsString;
      end;
     Close;
    end;
//  end
end;

end.
