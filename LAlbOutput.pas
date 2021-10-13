unit LAlbOutput;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  jpeg;

type
  TQRLAlbOutput = class(TQuickRep)
    BonnyBand: TQRBand;
    bandaFinal: TQRBand;
    LogoBonnysa: TQRImage;
    bandaGris: TQRShape;
    registroBonny1: TQRLabel;
    central: TQRMemo;
    delegacion1: TQRMemo;
    delegacion2: TQRMemo;
    lineaDelegacion: TQRShape;
    tituloDelegacion: TQRLabel;
    lineaCentral: TQRShape;
    TituloCentral: TQRLabel;
    RegistroBonny2: TQRLabel;
    OrganizacionBonny: TQRLabel;
    BandaDatos: TQRBand;
    CabeceraTabla: TQRBand;
    QRSubDetail1: TQRSubDetail;
    LogoCalidad: TQRImage;
    beef: TQRLabel;
    descripcion2_p: TQRDBText;
    marca: TQRDBText;
    color: TQRDBText;
    PsQRDBText28: TQRDBText;
    cajas: TQRLabel;
    psKilos: TQRDBText;
    PrecioUnidad: TQRDBText;
    LPor: TQRLabel;
    UnidadCobro: TQRDBText;
    precioNeto: TQRDBText;
    producto: TQRDBText;
    lin1: TQRShape;
    lin2: TQRShape;
    lin3: TQRShape;
    lin4: TQRShape;
    lin5: TQRShape;
    lin6: TQRShape;
    lin7: TQRShape;
    lin8: TQRShape;
    transito_num: TQRLabel;
    cajas_num: TQRLabel;
    kilos_num: TQRLabel;
    PsQRShape1: TQRShape;
    PsQRShape2: TQRShape;
    PsQRShape3: TQRShape;
    PsQRShape4: TQRShape;
    PsQRShape5: TQRShape;
    PsQRShape6: TQRShape;
    PsQRShape7: TQRShape;
    PsQRShape8: TQRShape;
    QEmpresas: TQuery;
    psEtiqueta: TQRLabel;
    memoGarantia: TQRMemo;
    PsQRLabel19: TQRLabel;
    PsQRSysData1: TQRSysData;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    Rtotal: TQRShape;
    Riva: TQRShape;
    Rneto: TQRShape;
    LPalets: TQRLabel;
    LCajas: TQRLabel;
    Lneto: TQRLabel;
    LIva: TQRLabel;
    Ltotal: TQRLabel;
    MemoCajas: TQRMemo;
    MemoPalets: TQRMemo;
    moneda1: TQRLabel;
    moneda2: TQRLabel;
    moneda3: TQRLabel;
    ChildBand2: TQRChildBand;
    LObservaciones: TQRLabel;
    PsQRLabel1: TQRLabel;
    PsQRShape9: TQRShape;
    PsQRLabel2: TQRLabel;
    PsQRShape10: TQRShape;
    cantNeta: TQRExpr;
    cantIva: TQRExpr;
    cantTotal: TQRExpr;
    mmoObservaciones: TQRMemo;
    ChildBand1: TQRChildBand;
    mmoResumen: TQRMemo;
    QRBand2: TQRBand;
    Lcodpostal: TQRLabel;
    LTipoVia: TQRLabel;
    LCliente: TQRLabel;
    LSuministro: TQRLabel;
    LDomicilio: TQRLabel;
    Lpoblacion: TQRLabel;
    LProvincia: TQRLabel;
    LPais: TQRLabel;
    PsQRShape16: TQRShape;
    PsQRShape17: TQRShape;
    PsQRLabel6: TQRLabel;
    PsQRLabel7: TQRLabel;
    PsQRLabel8: TQRLabel;
    PsQRLabel9: TQRLabel;
    PsQRLabel10: TQRLabel;
    PsQRDBText14: TQRDBText;
    PsQRDBText13: TQRDBText;
    PsQRDBText12: TQRDBText;
    LCentro: TQRLabel;
    PsQRDBText10: TQRDBText;
    PsQRLabel11: TQRLabel;
    PsQRLabel12: TQRLabel;
    PsQRDBText16: TQRDBText;
    LTransporte: TQRLabel;
    PsQRShape20: TQRShape;
    PsQRShape23: TQRShape;
    PsQRShape24: TQRShape;
    PsQRShape25: TQRShape;
    PsQRShape26: TQRShape;
    PsQRShape22: TQRShape;
    PsQRShape21: TQRShape;
    PsQRShape27: TQRShape;
    PsQRShape19: TQRShape;
    PsQRShape18: TQRShape;
    PsQRLabel22: TQRLabel;
    PsQRLabel23: TQRLabel;
    PsQRLabel24: TQRLabel;
    PsQRLabel25: TQRLabel;
    PsQRLabel26: TQRLabel;
    PsQRLabel27: TQRLabel;
    PsQRLabel28: TQRLabel;
    PsQRLabel29: TQRLabel;
    PsQRLabel30: TQRLabel;
    PsQRShape29: TQRShape;
    PsQRShape30: TQRShape;
    PsQRShape31: TQRShape;
    PsQRShape32: TQRShape;
    PsQRShape33: TQRShape;
    PsQRShape34: TQRShape;
    PsQRShape35: TQRShape;
    PsQRShape36: TQRShape;
    MasetBand: TQRChildBand;
    PsQRShape11: TQRShape;
    el1: TQRShape;
    el2: TQRShape;
    el3: TQRShape;
    el4: TQRShape;
    el5: TQRShape;
    el16: TQRShape;
    el17: TQRShape;
    el18: TQRShape;
    el19: TQRShape;
    el20: TQRShape;
    MasetSeva: TQRLabel;
    elipse: TQRShape;
    el6: TQRShape;
    el7: TQRShape;
    el8: TQRShape;
    el9: TQRShape;
    el10: TQRShape;
    el11: TQRShape;
    el12: TQRShape;
    el13: TQRShape;
    el14: TQRShape;
    el15: TQRShape;
    PsQRLabel40: TQRLabel;
    PsQRLabel16: TQRLabel;
    PsQRLabel17: TQRLabel;
    PsQRLabel39: TQRLabel;
    BardizaBand: TQRChildBand;
    PsQRShape15: TQRShape;
    PsQRShape43: TQRShape;
    PsQRShape44: TQRShape;
    PsQRShape45: TQRShape;
    PsQRShape46: TQRShape;
    PsQRShape47: TQRShape;
    PsQRShape48: TQRShape;
    PsQRShape49: TQRShape;
    PsQRShape50: TQRShape;
    PsQRShape51: TQRShape;
    PsQRShape52: TQRShape;
    PsQRLabel3: TQRLabel;
    PsQRShape53: TQRShape;
    PsQRLabel14: TQRLabel;
    PsQRShape54: TQRShape;
    PsQRShape55: TQRShape;
    PsQRShape56: TQRShape;
    PsQRShape57: TQRShape;
    PsQRShape58: TQRShape;
    PsQRShape59: TQRShape;
    PsQRShape60: TQRShape;
    PsQRShape61: TQRShape;
    PsQRShape62: TQRShape;
    PsQRShape63: TQRShape;
    PsQRLabel15: TQRLabel;
    PsQRLabel13: TQRLabel;
    SalemanBand: TQRChildBand;
    PsEmpresa: TQRLabel;
    PsNif: TQRLabel;
    PsQRShape64: TQRShape;
    PsDireccion: TQRLabel;
    PsQRLabel4: TQRLabel;
    VicenteBand: TQRChildBand;
    PsQRLabel5: TQRLabel;
    PsQRLabel20: TQRLabel;
    PsQRLabel21: TQRLabel;
    PsQRLabel31: TQRLabel;
    PsQRLabel32: TQRLabel;
    PsQRLabel33: TQRLabel;
    PsQRLabel34: TQRLabel;
    PsQRLabel35: TQRLabel;
    PsQRShape12: TQRShape;
    PiensosBand: TQRChildBand;
    PsQRImage2: TQRImage;
    PsQRLabel36: TQRLabel;
    PsQRLabel37: TQRLabel;
    PsQRMemo1: TQRMemo;
    PsQRShape13: TQRShape;
    PsQRLabel38: TQRLabel;
    LTransporteDir1: TQRLabel;
    PsQRShape14: TQRShape;
    LTransporteDir2: TQRLabel;
    descripcion2_e: TQRDBText;
    PsQRLabel18: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    FrutiBonBand: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    logoFrutiBon: TQRImage;
    QRLabel8: TQRLabel;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BandaDatosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bandaFinalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PsQRLabel19Print(sender: TObject; var Value: string);
    procedure CabeceraTablaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LPaletsPrint(sender: TObject; var Value: string);
    procedure LCajasPrint(sender: TObject; var Value: string);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure descripcion2_ePrint(sender: TObject; var Value: string);
    procedure PsQRLabel8Print(sender: TObject; var Value: String);
    procedure psKilosPrint(sender: TObject; var Value: String);
    procedure cajasPrint(sender: TObject; var Value: String);
    procedure PsQRLabel18Print(sender: TObject; var Value: String);
    procedure PsQRLabel27Print(sender: TObject; var Value: String);
    procedure PsQRLabel28Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure UnidadCobroPrint(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
  private
    bTransito, bEnEspanyol: Boolean;
    resumenList: TStringList;

    procedure DisableBonnyBand;
  public
    empresa, cliente: string;
    bValorar: Boolean;
    bAquiHayTomate: Boolean;
    codProveedor: string;
    bPrimeraVez: boolean;

    procedure GetCodigoProveedor(const AEmpresa, ACliente: string);
    procedure GetResumen(const AEmpresa, ACentro, AAlbaran, Afecha: string);
    procedure Configurar(Empresa: string);

    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;
  end;

var
  QRLAlbOutput: TQRLAlbOutput;

implementation

uses MSalidas, {$IFNDEF Oficina}MSalidasAlmacen, {$ENDIF} UDMAuxDB, CVariables, StrUtils, UDMBaseDatos,
  bTextUtils, bSQLUtils, Dialogs;

{$R *.DFM}

constructor TQRLAlbOutput.Create(AOwner: TComponent);
begin
  inherited;

  resumenList := TStringList.Create;
  bPrimeraVez:= True;
end;

destructor TQRLAlbOutput.Destroy;
begin
  QRLAlbOutput.QEmpresas.Cancel;
  QRLAlbOutput.QEmpresas.Close;

  resumenList.Free;

  inherited;
end;

procedure TQRLAlbOutput.DisableBonnyBand;
begin
  LogoBonnysa.Enabled := False;
  LogoCalidad.Enabled := False;
  TituloCentral.Enabled := False;
  tituloDelegacion.Enabled := False;
  lineaCentral.Enabled := False;
  lineaDelegacion.Enabled := False;
  central.Enabled := False;
  delegacion1.Enabled := False;
  delegacion2.Enabled := False;
  OrganizacionBonny.Enabled := False;
  bandaGris.Enabled := False;
  registroBonny1.Enabled := False;
  registroBonny2.Enabled := False;
  BonnyBand.Height := 0;
end;

procedure TQRLAlbOutput.GetCodigoProveedor(const AEmpresa, ACliente: string);
begin
  if ACliente = 'MER' then
  begin
    DMBaseDatos.QTemp.SQL.Clear;
    DMBaseDatos.QTemp.SQL.Add(' SELECT codigo_ean_e  ' +
      ' FROM    frf_empresas ' +
      ' WHERE empresa_e = :empresa ');
    DMBaseDatos.QTemp.ParamByName('empresa').AsString := AEmpresa;
    DMBaseDatos.QTemp.open;
    codProveedor := DMBaseDatos.QTemp.FieldByName('codigo_ean_e').AsString;
    DMBaseDatos.QTemp.Close;
  end
  else
  begin
    codProveedor := '';
  end;
end;

procedure TQRLAlbOutput.GetResumen(const AEmpresa, ACentro, AAlbaran, Afecha: string);
var
  cajas, unidades, kilos, bruto: Real;
begin
  with DMBaseDatos.QTemp do
  begin
    with SQL do
    begin
      Clear;
(*
      Add(' SELECT centro_origen_sl  as centro, producto_p, ');
      Add('        case ');
      Add('          when (producto_sl IN (' + SQLString('T') +','
                                             + SQLString('E') +') '+
                          ' AND calibre_sl IN (' + SQLString('G') + ','
                                                 + SQLString('GG') + ','
                                                 + SQLString('g') + ','
                                                 + SQLString('gg') +')) ');
      Add('            then TRIM(descripcion_p) || ' + SQLString(' [BEEF] '));
      Add('          else descripcion_p ');
      Add('        end as nomProducto, ');
      Add('        sum(cajas_sl) as cajasResumen, ');
      Add('        sum(cajas_sl*unidades_e) as unidadesResumen, ');
      Add('        sum(kilos_sl) as kilosResumen ');


      Add(' FROM frf_salidas_l , frf_productos , frf_envases ');
      Add(' WHERE (empresa_sl = :empresa) ');
      Add(' AND   (centro_salida_sl = :centro) ');
      Add(' AND   (n_albaran_sl = :albaran) ');
      Add(' AND   (fecha_sl = :fecha) ');

      Add(' AND   (empresa_p = :empresa) ');   // producto
      Add(' AND   (producto_p = producto_sl) ');

      Add(' AND   (envase_sl = envase_e and empresa_e = :empresa) ');  // envase

      Add(' GROUP BY  centro_origen_sl, producto_p ORDER BY centro_origen_sl, producto_p ');
*)
      Add(' SELECT centro_origen_sl  as centro, producto_p, ');

      Add('        TRIM( descripcion_p ) || ' + SQLString(' [BEEF] ') + ' as nomProducto,');
      Add('        sum(cajas_sl) as cajasResumen, ');
      Add('        sum(cajas_sl*unidades_e) as unidadesResumen, ');
      Add('        sum(kilos_sl) as kilosResumen, ');

      Add('        sum(  ( cajas_sl * peso_envase_e ) + kilos_sl ) as brutoResumen ');
      Add(' FROM frf_salidas_l , frf_productos , frf_envases ');

      Add(' WHERE (empresa_sl = :empresa) ');
      Add(' AND   (centro_salida_sl = :centro) ');
      Add(' AND   (n_albaran_sl = :albaran) ');
      Add(' AND   (fecha_sl = :fecha) ');

      Add(' AND   (empresa_p = :empresa) '); // producto
      Add(' AND   (producto_p = producto_sl) ');

      Add(' AND   (envase_sl = envase_e and empresa_e = :empresa ) '); // envase
      Add(' AND   (envase_sl <> ' + QuotedStr('001') + ') '); // envase
      Add(' AND   (producto_sl IN (' + SQLString('T') + ','
        + SQLString('E') + ') ' +
        ' AND calibre_sl IN (' + SQLString('G') + ','
        + SQLString('GG') + ','
        + SQLString('g') + ','
        + SQLString('gg') + ')) ');
//      Add('  AND   (empresa_uc = :empresa and codigo_uc = tipo_unidad_e )');

      Add(' GROUP BY  centro_origen_sl, producto_p, descripcion_p ');
      Add(' UNION ');
      Add(' SELECT centro_origen_sl  as centro, producto_p, ');

      Add('        descripcion_p as nomProducto,');
      Add('        sum(cajas_sl) as cajasResumen, ');
      Add('        sum(cajas_sl*unidades_e) as unidadesResumen, ');
      Add('        sum(kilos_sl) as kilosResumen, ');

      Add('        sum(  ( cajas_sl * peso_envase_e ) + kilos_sl ) as brutoResumen ');
      Add(' FROM frf_salidas_l , frf_productos , frf_envases ');

      Add(' WHERE (empresa_sl = :empresa) ');
      Add(' AND   (centro_salida_sl = :centro) ');
      Add(' AND   (n_albaran_sl = :albaran) ');
      Add(' AND   (fecha_sl = :fecha) ');

      Add(' AND   (empresa_p = :empresa) '); // producto
      Add(' AND   (producto_p = producto_sl) ');

      Add(' AND   (envase_sl = envase_e and empresa_e = :empresa) '); // envase
      Add(' AND   NOT (producto_sl IN (' + SQLString('T') + ','
        + SQLString('E') + ') ' +
        ' AND calibre_sl IN (' + SQLString('G') + ','
        + SQLString('GG') + ','
        + SQLString('g') + ','
        + SQLString('gg') + ') ');
      Add('            AND (envase_sl <> ' + QuotedStr('001') + '))');
//      Add('  AND   (empresa_uc = :empresa and codigo_uc = tipo_unidad_e )');

      Add(' GROUP BY  centro_origen_sl, producto_p, descripcion_p ');
      Add(' ORDER BY  1, 2 ');

    end;

    ParamByName('empresa').AsString := AEmpresa;
    ParamByName('centro').AsString := ACentro;
    ParamByName('albaran').AsString := AAlbaran;
    ParamByName('fecha').AsDateTime := StrToDate(AFecha);
    try
      SQL.SaveToFile('c:\1.sql');
      Open;
      resumenList.Clear;
      resumenList.Add('   Cajas   Unid.      Kilos      Bruto(Sin Palets)');
      cajas := 0;
      unidades := 0;
      kilos := 0;
      bruto := 0;
      First;
      while not Eof do
      begin
        //'1 5XXXX 6XXXXX 10XXXXXXXX 10XXXXXXXX RESTO'
        resumenList.Add(Fields[0].AsString + ' ' +
          Rellena(Fields[3].AsString, 6) + ' ' +
          Rellena(Fields[4].AsString, 7) + ' ' +
          Rellena(Fields[5].AsString, 10) + ' ' +
          Rellena(Fields[6].AsString, 10) + ' ' +
          Fields[1].AsString + ' ' +
          Fields[2].AsString);
        cajas := cajas + Fields[3].AsFloat;
        unidades := unidades + Fields[4].AsFloat;
        kilos := kilos + Fields[5].AsFloat;
        bruto := bruto + Fields[6].AsFloat;
        Next;
      end;
      resumenList.Add('  ------ ------- ---------- ----------');
      resumenList.Add(Rellena(FloatToStr(cajas), 8) + ' ' +
        Rellena(FloatToStr(unidades), 7) + ' ' +
        Rellena(FloatToStr(kilos), 10) + ' ' +
        Rellena(FloatToStr(bruto), 10));
    finally
      Close;
    end;
  end;
end;

procedure TQRLAlbOutput.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  bEnEspanyol:= true;
  //Si el albaran es no valorado no imprimir precios
  if not bValorar then
  begin
    PrecioUnidad.Enabled := false;
    UnidadCobro.Enabled := false;
    PrecioNeto.Enabled := false;
    Lpor.Enabled := false;
  end;

  moneda2.Caption := moneda1.Caption;
  moneda3.Caption := moneda1.Caption;
  if Trim(Moneda1.Caption) = 'ESP' then
  begin
    precioUnidad.Mask := '#,##0.0';
    precioNeto.Mask := '#,##0';
  end
  else
  begin
    precioUnidad.Mask := '#,##0.000';
    precioNeto.Mask := '#,##0.00';
  end;

  QEmpresas.First;
  bTransito := false;
  ReportTitle := 'Albaran ' + FMSalidas.n_albaran_sc.Text;
  Hint := FMSalidas.cliente_sal_sc.Text + ' ' +
      StringReplace(FMSalidas.fecha_sc.Text, '/', '-', [rfReplaceAll, rfIgnoreCase])
      + ' ' + FMSalidas.n_albaran_sc.Text;
end;

procedure TQRLAlbOutput.BandaDatosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  temporal: string;
begin
  //PRODUCTO-ENVASE
  bEnEspanyol:= Trim(Lpais.Caption) = 'ESPAÑA';
  if not bEnEspanyol then
  begin

       //PRODUCTO
    temporal := Trim(DMBaseDatos.QListado.FieldByName('producto_p').AsString);
    if ((temporal = 'E') or (temporal = 'T')) and
      ((Trim(DMBaseDatos.QListado.FieldByName('calibre_sl').AsString) = 'G') or
      (Trim(DMBaseDatos.QListado.FieldByName('calibre_sl').AsString) = 'GG')) and
      (DMBaseDatos.QListado.FieldByName('envase_sl').AsString <> '001') then
    begin
         //Descripcion en ingles -producto(beef)
      producto.Enabled := false;
      descripcion2_p.Enabled := false;
      beef.Enabled := true;
    end
    else
      if Trim(DMBaseDatos.QListado.FieldByName('descripcion2_p').asstring) <> '' then
      begin
           //Descripcion en ingles -producto
        producto.Enabled := false;
        descripcion2_p.Enabled := true;
        beef.Enabled := false;
      end
      else
      begin
           //Descripcion en castellano -producto
        producto.Enabled := true;
        descripcion2_p.Enabled := false;
        beef.Enabled := false;
      end;
  end
  else
  begin
       //Descripcion en castellano
       //Producto
    producto.Enabled := true;
    descripcion2_p.Enabled := false;
    beef.Enabled := false;
  end;
end;

procedure TQRLAlbOutput.Configurar(Empresa: string);
var
  aux: string;
begin
  if (Trim(Empresa) = '050') then //Bonnysa
  begin
    LogoBonnysa.Picture.LoadFromFile(gsDirActual + '\recursos\logoBonnysa.emf');
    LogoCalidad.Picture.LoadFromFile(gsDirActual + '\recursos\logoCalidad.emf');
    BonnyBand.Height := 148;
    MasetBand.Enabled := False;
    BardizaBand.Enabled := False;
    SalemanBand.Enabled := False;
    VicenteBand.Enabled := False;
    PiensosBand.Enabled := False;
    FrutiBonBand.Enabled := False;
  end
  else
  if (Trim(Empresa) = '037') then //Maset de Seva
  begin
    DisableBonnyBand; //BonnyBand.Height:=0;
    MasetBand.Height := 148;
    SalemanBand.Enabled := False;
    BardizaBand.Enabled := False;
    VicenteBand.Enabled := False;
    PiensosBand.Enabled := False;
    FrutiBonBand.Enabled := False;
  end
  else
  if (Trim(Empresa) = '073') then //Frutibon
  begin
    logoFrutiBon.Picture.LoadFromFile(gsDirActual + '\recursos\logoFrutiBon.bmp');
    DisableBonnyBand; //BonnyBand.Height:=0;
    BardizaBand.Enabled := False;
    MasetBand.Enabled := False;
    SalemanBand.Enabled := False;
    VicenteBand.Enabled := False;
    PiensosBand.Enabled := False;
    FrutiBonBand.Enabled := True;
    FrutiBonBand.Height := 156;
  end
  else
  if (Trim(Empresa) = '062') then //BardizaVerde
  begin
    DisableBonnyBand; //BonnyBand.Height:=0;
    BardizaBand.Height := 148;
    MasetBand.Enabled := False;
    SalemanBand.Enabled := False;
    VicenteBand.Enabled := False;
    PiensosBand.Enabled := False;
    FrutiBonBand.Enabled := False;
  end
  else
  if (Trim(Empresa) = '502') then //Martinez Vicente
  begin
    DisableBonnyBand; //BonnyBand.Height:=0;
    BardizaBand.Enabled := False;
    MasetBand.Enabled := False;
    SalemanBand.Enabled := False;
    PiensosBand.Enabled := False;
    VicenteBand.Enabled := True;
    VicenteBand.Height := 122;
    FrutiBonBand.Enabled := False;
  end
  else
  if (Trim(Empresa) = '501') then //Exportadores pienso
  begin
    DisableBonnyBand; //BonnyBand.Height:=0;
    BardizaBand.Enabled := False;
    MasetBand.Enabled := False;
    SalemanBand.Enabled := False;
    VicenteBand.Enabled := False;
    PiensosBand.Enabled := True;
    PiensosBand.Height := 148;
    FrutiBonBand.Enabled := False;
  end
  else
  //GENERICO
  begin
    DisableBonnyBand; //BonnyBand.Height:=0;
    BardizaBand.Enabled := False;
    MasetBand.Enabled := False;
    SalemanBand.Height := 148;
    VicenteBand.Enabled := False;
    PiensosBand.Enabled := False;
    FrutiBonBand.Enabled := False;

    ConsultaOpen(DMAuxDB.QAux,
      ' select nombre_e,nif_e,tipo_via_e,domicilio_e,cod_postal_e, ' +
      '        poblacion_e,nombre_p ' +
      ' from frf_empresas,frf_provincias ' +
      ' where empresa_e=' + QuotedStr(Trim(Empresa)) +
      '   and cod_postal_e[1,2]=codigo_p');

    with DMAuxDB.QAux do
    begin
      PsEmpresa.Caption := FieldByName('nombre_e').AsString;
      PsNif.Caption := 'NIF: ' + FieldByName('nif_e').AsString;

      aux := '';
      if Trim(FieldByName('tipo_via_e').AsString) <> '' then
        aux := aux + Trim(FieldByName('tipo_via_e').AsString) + '. ';
      if Trim(FieldByName('domicilio_e').AsString) <> '' then
        aux := aux + Trim(FieldByName('domicilio_e').AsString) + '      ';
      if Trim(FieldByName('cod_postal_e').AsString) <> '' then
        aux := aux + Trim(FieldByName('cod_postal_e').AsString) + '  ';
      if Trim(FieldByName('poblacion_e').AsString) <> '' then
        aux := aux + Trim(FieldByName('poblacion_e').AsString) + '      ';
      if Trim(FieldByName('cod_postal_e').AsString) <> '' then
        aux := aux + '(' + Trim(FieldByName('nombre_p').AsString) + ')  ';

      PsDireccion.Caption := aux;

      Close;
    end;
  end;
end;

procedure TQRLAlbOutput.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if ((Self.Tag = 1) or (Self.Tag = 3)) and
    QEmpresas.Active and
    (QEmpresas.FieldByName('producto_p').AsString =
    DMBaseDatos.QListado.FieldByName('producto_p').AsString) and
    (QEmpresas.FieldByName('envase_e').AsString =
    DMBaseDatos.QListado.FieldByName('envase_e').AsString) and
    (QEmpresas.FieldByName('descripcion_m').AsString =
    DMBaseDatos.QListado.FieldByName('descripcion_m').AsString) and
    (QEmpresas.FieldByName('color_sl').AsString =
    DMBaseDatos.QListado.FieldByName('color_sl').AsString) and
    (QEmpresas.FieldByName('calibre_sl').AsString =
    DMBaseDatos.QListado.FieldByName('calibre_sl').AsString) and
    (QEmpresas.FieldByName('unidad_precio_sl').AsString =
    DMBaseDatos.QListado.FieldByName('unidad_precio_sl').AsString) and
    (QEmpresas.FieldByName('precio_sl').AsString =
    DMBaseDatos.QListado.FieldByName('precio_sl').AsString) and
    not QEmpresas.EOF then
  begin
    MoreData := true;
    bTransito := true;
  end
  else
  begin
    MoreData := false;
    bTransito := false;
  end;
end;

procedure TQRLAlbOutput.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Trim(QEmpresas.FieldByName('ref_transitos_sl').AsString) = '' then
    PrintBand := false
  else
  begin
    transito_num.Caption := QEmpresas.FieldByName('ref_transitos_sl').AsString;
    kilos_num.Caption := FormatFloat('#,##0.00', QEmpresas.FieldByName('kilos_sl').ASFloat);
    //CAJAS O UNIDADES
    if (DMBaseDatos.QListado.FieldByName('unidad_precio_sl').AsString = 'UND') then
    begin
      cajas_num.Caption := FormatFloat('#,##0', QEmpresas.FieldByName('unidades').AsInteger);
    end
    else
    begin
      cajas_num.Caption := FormatFloat('#,##0', QEmpresas.FieldByName('cajas_sl').AsInteger);
    end;
  end;

  QEmpresas.Next;
end;

procedure TQRLAlbOutput.PsQRLabel19Print(sender: TObject;
  var Value: string);
begin
  if codProveedor <> '' then
  begin
    Value := 'COD. PROVEEDOR: ' + codProveedor;
  end
  else
  begin
    Value := '';
  end;
end;

procedure TQRLAlbOutput.bandaFinalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  case Tag of
    0: psEtiqueta.Caption := '';
    1: psEtiqueta.Caption := 'ORIGINAL EMPRESA';
    2: psEtiqueta.Caption := 'ORIGINAL CLIENTE';
    3: psEtiqueta.Caption := 'COPIA 1/1ST COPY';
    4: psEtiqueta.Caption := 'COPIA 2/2ND COPY';
    5: psEtiqueta.Caption := 'COPIA 3/1RD COPY';
  else psEtiqueta.Caption := 'COPIA ' + IntToStr(Tag - 2) + '/' + IntToStr(Tag - 2) + 'TH COPY';
  end;

  memoGarantia.Lines.Clear;
  if bAquiHayTomate then
  begin
    if not bEnEspanyol then
    begin
      memoGarantia.Lines.Add( 'All the tomatoes packed by S.A.T. Nº9359 BONNYSA are certified according to UNE 155000:2005,');
      memoGarantia.Lines.Add( 'UNE 155102 and EUREPGAP ver 2.1. product standards.' );
    end
    else
    begin
      memoGarantia.Lines.Add( 'Toda la producción de tomate comercializada por S.A.T. Nº9359 BONNYSA está certificada conforme ');
      memoGarantia.Lines.Add( 'a las normas UNE 155000:2005, UNE 155102 y EUREPGAP ver 2.1. ');
    end;

  end;
end;

procedure TQRLAlbOutput.CabeceraTablaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := bValorar or (MemoPalets.Lines.Count <> 0) or (MemoCajas.Lines.Count <> 0);
  if bValorar then
  begin
    LIva.Caption := DMBaseDatos.QListado.FieldByName('tipo_i').AsString;
    LIva.Caption := LIva.Caption + '  ';
    LIva.Caption := 'Total ' + LIva.Caption + DMBaseDatos.QListado.FieldByName('porc_iva_sl').AsString; ;
    LIva.Caption := LIva.Caption + '%';
  end
  else
  begin
    CantNeta.Enabled := false;
    CantIva.Enabled := false;
    CantTotal.Enabled := false;
    RIva.Enabled := false;
    LIva.Enabled := false;
    RNeto.Enabled := false;
    LNeto.Enabled := false;
    RTotal.Enabled := false;
    LTotal.Enabled := false;
    Moneda1.Enabled := false;
    Moneda2.Enabled := false;
    Moneda3.Enabled := false;
  end;
end;

procedure TQRLAlbOutput.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := mmoObservaciones.Lines.Count <> 0;
end;

procedure TQRLAlbOutput.LPaletsPrint(sender: TObject; var Value: string);
begin
  if MemoPalets.Lines.Count = 0 then Value := '';
end;

procedure TQRLAlbOutput.LCajasPrint(sender: TObject; var Value: string);
begin
  if MemoCajas.Lines.Count = 0 then Value := '';
end;

procedure TQRLAlbOutput.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  mmoResumen.Lines.Clear;
  if ( tag < 2 ) or ( ( cliente = 'MER' ) and ( tag < 3 ) )then
    mmoResumen.Lines.AddStrings(resumenList)
  else
    PrintBand := false;
end;

procedure TQRLAlbOutput.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if LTipoVia.Caption = '' then
    LDomicilio.Left := 39
  else
    LDomicilio.Left := 66;

  if bPrimeraVez then
  begin
    if (not LProvincia.Enabled) or
      (LProvincia.Caption = '') then
    begin
      LPais.Top := LProvincia.Top;
      if Lcodpostal.enabled then
      begin
        //LPais.Left := LProvincia.Left;
        Lcodpostal.Caption:= Lcodpostal.Caption + ' - ' + LPais.Caption;
        LPais.Enabled:= False;
      end;
    end
    else
    begin
      if Lcodpostal.enabled then
      begin
        Lcodpostal.Caption:= Lcodpostal.Caption + ' - ' + LProvincia.Caption;
        LProvincia.Enabled:= false;
      end;
    end;
    bPrimeraVez:= False;
  end;
end;

procedure TQRLAlbOutput.descripcion2_ePrint(sender: TObject;
  var Value: string);

begin
  Value := desEnvaseCliente(
    empresa,
    productobase(empresa, DMBaseDatos.QListado.FieldByName('producto_p').AsString),
    Value,
    cliente,
    -1);
end;

procedure TQRLAlbOutput.PsQRLabel8Print(sender: TObject;
  var Value: String);
begin
  if cliente = 'MER' then
    Value:= 'Fecha Carga'
  else
    Value:= 'Fecha';
end;

procedure TQRLAlbOutput.psKilosPrint(sender: TObject;
  var Value: String);
begin
  if cliente = 'MER' then
  begin
    if (DMBaseDatos.QListado.FieldByName('unidad_precio_sl').AsString = 'UND') then
      value := FormatFloat('#,##0', DMBaseDatos.QListado.FieldByName('unidades').AsInteger)
    else
      value := FormatFloat('#,##0', DMBaseDatos.QListado.FieldByName('kilos_sl').AsInteger);
  end;
end;

procedure TQRLAlbOutput.cajasPrint(sender: TObject; var Value: String);
begin
  //CAJAS O UNIDADES
  if cliente = 'MER' then
  begin
    value := FormatFloat('#,##0', DMBaseDatos.QListado.FieldByName('cajas_sl').AsInteger);
  end
  else
  begin
    if (DMBaseDatos.QListado.FieldByName('unidad_precio_sl').AsString = 'UND') then
    begin
      value := FormatFloat('#,##0', DMBaseDatos.QListado.FieldByName('unidades').AsInteger);
    end
    else
    begin
      value := FormatFloat('#,##0', DMBaseDatos.QListado.FieldByName('cajas_sl').AsInteger);
    end
  end;
end;

procedure TQRLAlbOutput.PsQRLabel18Print(sender: TObject;
  var Value: String);
begin
  if cliente = 'MER' then
  begin
    value := '';
  end
  else
  begin
    value:= 'Unidad';
  end;
end;

procedure TQRLAlbOutput.PsQRLabel27Print(sender: TObject;
  var Value: String);
begin
  if cliente = 'MER' then
  begin
    value := 'Cajas';
  end
  else
  begin
    value := 'Cajas/';
  end;
end;

procedure TQRLAlbOutput.PsQRLabel28Print(sender: TObject;
  var Value: String);
begin
  if cliente = 'MER' then
  begin
    value := 'Kgs/Uds';
  end
  else
  begin
    value := 'Kgs';
  end;
end;

procedure TQRLAlbOutput.QRDBText1Print(sender: TObject; var Value: String);
begin
  if cliente = 'MER' then
    Value:= Copy( Value, 1, 1 )
  else
    Value:= '';
end;

procedure TQRLAlbOutput.UnidadCobroPrint(sender: TObject;
  var Value: String);
begin
  Value:= Copy( Value, 1, 1 )
end;

procedure TQRLAlbOutput.QRDBText2Print(sender: TObject; var Value: String);
begin
  //CAJAS O UNIDADES
  if cliente = 'MER' then
  begin
    value := '';
  end
  else
  begin
    if (DMBaseDatos.QListado.FieldByName('unidad_precio_sl').AsString = 'UND') then
    begin
      value := 'U';
    end
    else
    begin
      value := 'C';
    end
  end;
end;

end.
