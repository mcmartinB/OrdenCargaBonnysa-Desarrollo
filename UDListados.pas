unit UDListados;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDListados = class(TDataModule)
    QCab: TQuery;
    QCaborden_occ: TIntegerField;
    QCabempresa_occ: TStringField;
    QCabcentro_salida_occ: TStringField;
    QCabn_albaran_occ: TIntegerField;
    QCabfecha_occ: TDateField;
    QCabhora_occ: TStringField;
    QCabcentro_destino_occ: TStringField;
    QCabcliente_sal_occ: TStringField;
    QCabdir_sum_occ: TStringField;
    QCabcliente_fac_occ: TStringField;
    QCabn_pedido_occ: TStringField;
    QCabmoneda_occ: TStringField;
    QCabtransporte_occ: TSmallintField;
    QCabvehiculo_occ: TStringField;
    QCabnota_occ: TMemoField;
    QCabstatus_occ: TIntegerField;
    QCabtraspasada_occ: TIntegerField;
    QLineas: TQuery;
    QLineasorden_ocl: TIntegerField;
    QLineaslinea_ocl: TIntegerField;
    QLineasempresa_ocl: TStringField;
    QLineascentro_salida_ocl: TStringField;
    QLineasn_albaran_ocl: TIntegerField;
    QLineasfecha_ocl: TDateField;
    QLineascentro_origen_ocl: TStringField;
    QLineasproducto_ocl: TStringField;
    QLineasenvase_ocl: TStringField;
    QLineasmarca_ocl: TStringField;
    QLineascategoria_ocl: TStringField;
    QLineascalibre_ocl: TStringField;
    QLineascolor_ocl: TStringField;
    QLineasref_transitos_ocl: TIntegerField;
    QLineasfecha_transito_ocl: TDateField;
    QLineascajas_ocl: TIntegerField;
    QLineaskilos_ocl: TFloatField;
    QLineasprecio_ocl: TFloatField;
    QLineasunidad_precio_ocl: TStringField;
    QLineasimporte_neto_ocl: TFloatField;
    QLineasporc_iva_ocl: TFloatField;
    QLineasiva_ocl: TFloatField;
    QLineasimporte_total_ocl: TFloatField;
    QLineasn_palets_ocl: TSmallintField;
    QLineastipo_palets_ocl: TStringField;
    QLineastipo_iva_ocl: TStringField;
    QLineasfederacion_ocl: TStringField;
    QLineascliente_ocl: TStringField;
    QLineasemp_procede_ocl: TStringField;
    QPackingLin: TQuery;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    StringField1: TStringField;
    StringField2: TStringField;
    SmallintField1: TSmallintField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField2: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField1: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    DateField2: TDateField;
    StringField13: TStringField;
    QPalets: TQuery;
    QLogifruit: TQuery;
    QEnvases: TQuery;
    QEnvasesenvase_pl: TStringField;
    QEnvasescalibre_pl: TStringField;
    QEnvasescolor_pl: TStringField;
    QEnvasesunidades_caja_pl: TIntegerField;
    QEnvasescajas_pl: TFloatField;
    QEnvasespeso_pl: TFloatField;
    QEnvasestipo_palet_pl: TStringField;
    QEnvasespalets_pl: TFloatField;
    QLogifruitcodigo_caja_e: TStringField;
    QLogifruittexto_caja_e: TStringField;
    QLogifruitcajas_pl: TFloatField;
    QPaletstipo_palet_pl: TStringField;
    QPaletspalets_pl: TFloatField;
    QEnvasesmarca_pl: TStringField;
    QCabporte_bonny_occ: TIntegerField;
    QCabn_palets_occ: TIntegerField;
    QCabhigiene_occ: TIntegerField;
    QCabnota_interna_occ: TStringField;
    strngfldQLineasnotas_ocl: TStringField;
    QCabfecha_descarga_occ: TDateField;
    QEnvasesbestbefore_pl: TDateField;
    QEnvasesempresa_pl: TStringField;
    QEnvasesproducto_pl: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create( AOwner: TComponent ); Override;
    destructor Destroy; Override;

    function DatosOrden( const AOrden: Integer;
      var ALineas, APacking, ALogifruit, AEnvases, APalets: boolean ): boolean;
  end;



implementation

{$R *.dfm}

uses UDOrdenCarga;


constructor TDListados.Create( AOwner: TComponent );
begin
  inherited;
  with QCab do
  begin
    SQL.Clear;
    SQL.Add('select * ');
    SQL.Add('from frf_orden_carga_c ');
    SQL.Add('where orden_occ = :orden ');
  end;
  with QLineas do
  begin
    SQL.Clear;
    SQL.Add('select * ');
    SQL.Add('from frf_orden_carga_l ');
    SQL.Add('where orden_ocl = :orden ');
  end;
  with QPackingLin do
  begin
    SQL.Clear;
    SQL.Add('select * ');
    SQL.Add('from frf_packing_list ');
    SQL.Add('where orden_pl = :orden ');
    SQL.Add('order by orden_pl, ean128_pl, ean13_pl ');
  end;
  with QPalets do
  begin
    SQL.Clear;
    SQL.Add(' select tipo_palet_pl, count(distinct ean128_pl) palets_pl ');
    SQL.Add(' from frf_packing_list ');
    SQL.Add(' where orden_pl = :orden ');
    SQL.Add(' group by tipo_palet_pl ');
    SQL.Add(' order by tipo_palet_pl ');
  end;
  with QLogifruit do
  begin
    SQL.Clear;
    SQL.Add(' select cod_producto_ecp codigo_caja_e, des_producto_ecp texto_caja_e, sum(cajas_pl) cajas_pl ');
    SQL.Add(' from frf_packing_list, frf_envases, frf_env_comer_productos ');
    SQL.Add(' where orden_pl = :orden ');
    SQL.Add(' and producto_e = producto_pl ');
    SQL.Add(' and envase_e = envase_pl ');
    SQL.Add(' and env_comer_operador_e = cod_operador_ecp ');
    SQL.Add(' and env_comer_producto_e = cod_producto_ecp ');
    SQL.Add(' group by cod_producto_ecp, des_producto_ecp ');
    SQL.Add(' order by cod_producto_ecp ');
  end;
  with QEnvases do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_pl, envase_pl, producto_pl, marca_pl, calibre_pl, color_pl, unidades_caja_pl, bestbefore_pl, ');
    SQL.Add('        sum(cajas_pl) cajas_pl, round(sum(peso_pl),2) peso_pl, ');
    SQL.Add('        count( distinct  ean128_pl ) palets_pl, tipo_palet_pl ');
    SQL.Add(' from frf_packing_list ');
    SQL.Add(' where orden_pl = :orden ');
    SQL.Add(' group by empresa_pl, envase_pl, producto_pl, marca_pl, calibre_pl, color_pl, unidades_caja_pl, tipo_palet_pl, bestbefore_pl ');
    SQL.Add(' order by empresa_pl, envase_pl, producto_pl, marca_pl, calibre_pl, color_pl, unidades_caja_pl, bestbefore_pl  ');
  end;
enD;

destructor TDListados.Destroy;
begin
  QPackingLin.Close;
  QPalets.Close;
  QLogifruit.Close;
  QEnvases.Close;
  QLineas.Close;
  QCab.Close;

  inherited;
end;

function TDListados.DatosOrden( const AOrden: Integer;
  var ALineas, APacking, ALogifruit, AEnvases, APalets: boolean ): boolean;
begin
  QPackingLin.Close;
  QPalets.Close;
  QLogifruit.Close;
  QEnvases.Close;
  QLineas.Close;
  QCab.Close;

  QCab.ParamByName('orden').AsInteger:= AOrden;
  QCab.Open;
  result:= not QCab.IsEmpty;
  if QCab.IsEmpty then
  begin
    QCab.Close;
  end
  else
  begin
    QLineas.ParamByName('orden').AsInteger:= AOrden;
    if ALineas then
      QLineas.Open;
    ALineas:= not QLineas.IsEmpty;

    QPalets.ParamByName('orden').AsInteger:= AOrden;
    if APalets then
      QPalets.Open;
    APalets:= not QPalets.IsEmpty;

    QLogifruit.ParamByName('orden').AsInteger:= AOrden;
    if ALogifruit then
      QLogifruit.Open;
    ALogifruit:= not QLogifruit.IsEmpty;

    QEnvases.ParamByName('orden').AsInteger:= AOrden;
    if AEnvases then
      QEnvases.Open;
    AEnvases:= not QEnvases.IsEmpty;

    QPackingLin.ParamByName('orden').AsInteger:= AOrden;
    if APacking then
      QPackingLin.Open;
    APacking:= not QPackingLin.IsEmpty;
  end;
end;

end.
