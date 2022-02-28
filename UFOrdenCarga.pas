
unit UFOrdenCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, ActnList, Grids, DBGrids, BGrid, BDEdit,
  BSpeedButton, Menus, ComCtrls, BCalendario, BEdit, BCalendarButton, BGridButton,
  QRPrntr, DBTables, DBCtrls, bDialogs, bSQLUtils, bTimeUtils, StrUtils,
  ToolWin, ImgList, UDOrdenCarga, AFQuickMail, QRPDFFilt, QRExport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons, SimpleSearch, cxTextEdit, cxDBEdit, UTipos ,

  UFImportarOrdenes, FMTBcd, SqlExpr,ConexionAWSAurora;

//ESTADOS
const
   kVisualizar = 0;
   kNuevaCabecera = 1;
   kEditarCabecera = 2;
   kNuevoDetalle = 3;
   kEditarDetalle = 4;

type
  TFOrdenCarga = class( TForm )
    PMaestro: TPanel;
    DSMaestro: TDataSource;
    LEmpresa_p: TLabel;
    empresa_occ: TBDEdit;
    Label13: TLabel;
    Label1: TLabel;
    BGBCentro_occ: TBGridButton;
    centro_salida_occ: TBDEdit;
    STCentro_salida_occ: TStaticText;
    Label5: TLabel;
    vehiculo_occ: TBDEdit;
    transporte_occ: TBDEdit;
    DSDetalle: TDataSource;
    Bevel1: TBevel;
    LAno_semana_p: TLabel;
    STTransporte_occ: TStaticText;
    BGBtransporte_occ: TBGridButton;
    BGBEmpresa_occ: TBGridButton;
    STEmpresa_occ: TStaticText;
    Label11: TLabel;
    fecha_occ: TBDEdit;
    hora_occ: TBDEdit;
    Label14: TLabel;
    cliente_sal_occ: TBDEdit;
    BGBCliente_sal_occ: TBGridButton;
    STCliente_sal_occ: TStaticText;
    Label19: TLabel;
    dir_sum_occ: TBDEdit;
    BGBDir_sum_occ: TBGridButton;
    STDir_sum_occ: TStaticText;
    LPedido: TLabel;
    n_pedido_occ: TBDEdit;
    BCBFecha_occ: TBCalendarButton;
    QOrdenCargaC: TQuery;
    nota_occ: TDBMemo;
    QOrdenCargaL: TQuery;
    ToolBar1: TToolBar;
    btnAlta: TToolButton;
    sep4: TToolButton;
    btnEditarC: TToolButton;
    btnBorrar: TToolButton;
    btnLocalizar: TToolButton;
    sep2: TToolButton;
    btnAltaD: TToolButton;
    btnEditarD: TToolButton;
    btnBorrarD: TToolButton;
    sep3: TToolButton;
    btnPrimero: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    sep1: TToolButton;
    btnAceptar: TToolButton;
    btnCancelar: TToolButton;
    QOrdenCargaCorden_occ: TIntegerField;
    QOrdenCargaCempresa_occ: TStringField;
    QOrdenCargaCcentro_salida_occ: TStringField;
    QOrdenCargaCn_albaran_occ: TIntegerField;
    QOrdenCargaCfecha_occ: TDateField;
    QOrdenCargaChora_occ: TStringField;
    QOrdenCargaCcliente_sal_occ: TStringField;
    QOrdenCargaCdir_sum_occ: TStringField;
    QOrdenCargaCcliente_fac_occ: TStringField;
    QOrdenCargaCn_pedido_occ: TStringField;
    QOrdenCargaCtransporte_occ: TSmallintField;
    QOrdenCargaCvehiculo_occ: TStringField;
    QOrdenCargaCnota_occ: TMemoField;
    QOrdenCargaCstatus_occ: TIntegerField;
    QOrdenCargaLorden_ocl: TIntegerField;
    QOrdenCargaLlinea_ocl: TIntegerField;
    QOrdenCargaLempresa_ocl: TStringField;
    QOrdenCargaLcentro_salida_ocl: TStringField;
    QOrdenCargaLn_albaran_ocl: TIntegerField;
    QOrdenCargaLfecha_ocl: TDateField;
    QOrdenCargaLcentro_origen_ocl: TStringField;
    QOrdenCargaLproducto_ocl: TStringField;
    QOrdenCargaLenvase_ocl: TStringField;
    QOrdenCargaLmarca_ocl: TStringField;
    QOrdenCargaLcategoria_ocl: TStringField;
    QOrdenCargaLcalibre_ocl: TStringField;
    QOrdenCargaLcolor_ocl: TStringField;
    QOrdenCargaLref_transitos_ocl: TIntegerField;
    QOrdenCargaLcajas_ocl: TIntegerField;
    QOrdenCargaLunidades_caja_ocl: TIntegerField;
    QOrdenCargaLkilos_ocl: TFloatField;
    QOrdenCargaLprecio_ocl: TFloatField;
    QOrdenCargaLunidad_precio_ocl: TStringField;
    QOrdenCargaLimporte_neto_ocl: TFloatField;
    QOrdenCargaLporc_iva_ocl: TFloatField;
    QOrdenCargaLiva_ocl: TFloatField;
    QOrdenCargaLimporte_total_ocl: TFloatField;
    QOrdenCargaLn_palets_ocl: TSmallintField;
    QOrdenCargaLtipo_palets_ocl: TStringField;
    QOrdenCargaLtipo_iva_ocl: TStringField;
    QOrdenCargaLfederacion_ocl: TStringField;
    QOrdenCargaLcliente_ocl: TStringField;
    QOrdenCargaLemp_procede_ocl: TStringField;
    ImageList: TImageList;
    btnImprimir: TToolButton;
    Label3: TLabel;
    orden_occ: TBDEdit;
    des_status_occ: TDBText;
    QOrdenCargaCdes_status_occ: TStringField;
    Label4: TLabel;
    Bevel2: TBevel;
    btnCrearAlbaran: TToolButton;
    sep5: TToolButton;
    PopupMenuImprimir: TPopupMenu;
    mnuImprimirOrdenCarga: TMenuItem;
    mnuImprimirPackingList: TMenuItem;
    btnActivar: TToolButton;
    PopupMenuFiltro: TPopupMenu;
    mnuCreadas: TMenuItem;
    mnuActivas: TMenuItem;
    mnuInicializadas: TMenuItem;
    mnuFinalizadas: TMenuItem;
    btnFinalizar: TToolButton;
    QOrdenCargaCtraspasada_occ: TIntegerField;
    PageControl1: TPageControl;
    tsLineas: TTabSheet;
    RVisualizacion: TDBGrid;
    PDetalle: TPanel;
    Label2: TLabel;
    BGBProducto_ocl: TBGridButton;
    Label7: TLabel;
    BGBCentro_origen_ocl: TBGridButton;
    Label6: TLabel;
    Label15: TLabel;
    BGBMarca_ocl: TBGridButton;
    Label16: TLabel;
    BGBCategoria_ocl: TBGridButton;
    Label17: TLabel;
    BGBColor_ocl: TBGridButton;
    Label18: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    BGBCalibre_ocl: TBGridButton;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Lporc_iva_ocl: TLabel;
    Liva_ocl: TLabel;
    LImporteTotal: TLabel;
    lblRefTransito: TLabel;
    STProducto_ocl: TStaticText;
    producto_ocl: TBDEdit;
    centro_origen_ocl: TBDEdit;
    STCentro_origen_ocl: TStaticText;
    STEnvase_ocl: TStaticText;
    marca_ocl: TBDEdit;
    STMarca_ocl: TStaticText;
    categoria_ocl: TBDEdit;
    STCategoria_ocl: TStaticText;
    color_ocl: TBDEdit;
    STcolor_ocl: TStaticText;
    cajas_ocl: TBDEdit;
    precio_ocl: TBDEdit;
    calibre_ocl: TBDEdit;
    kilos_ocl: TBDEdit;
    unidad_precio_ocl: TBDEdit;
    importe_neto_ocl: TBDEdit;
    STUnidades: TStaticText;
    porc_iva_ocl: TBDEdit;
    iva_ocl: TBDEdit;
    importe_total_ocl: TBDEdit;
    tipo_iva_ocl: TBDEdit;
    ref_transitos_ocl: TBDEdit;
    QOrdenCargaCdes_traspasada_occ: TStringField;
    DBText1: TDBText;
    Shape1: TShape;
    ToolButton1: TToolButton;
    Label8: TLabel;
    fecha_transito_ocl: TBDEdit;
    QOrdenCargaLfecha_transito_ocl: TDateField;
    BCBFecha_transito_ocl: TBCalendarButton;
    lblDestino: TLabel;
    centro_destino_occ: TBDEdit;
    BGBCentro_destino_occ: TBGridButton;
    STcentro_destino_occ: TStaticText;
    QOrdenCargaCcentro_destino_occ: TStringField;
    EnvaseCalibreyColor1: TMenuItem;
    EnvasesLogifruit1: TMenuItem;
    ipoPalets1: TMenuItem;
    ShapeTransito: TShape;
    ShapeSalida: TShape;
    lblTransito: TLabel;
    lblSalida: TLabel;
    Label22: TLabel;
    n_palets_occ: TBDEdit;
    QOrdenCargaCn_palets_occ: TIntegerField;
    btnResumen: TToolButton;
    QOrdenCargaCdes2_status_occ: TStringField;
    QOrdenCargaCdes2_traspasada_occ: TStringField;
    QPalets: TQuery;
    QOrdenCargaCpalets_cargados_occ: TIntegerField;
    DBText2: TDBText;
    Label24: TLabel;
    Label25: TLabel;
    lblPortes: TLabel;
    porte_bonny_occ: TDBCheckBox;
    QOrdenCargaCdes_suministro_occ: TStringField;
    QOrdenCargaCporte_bonny_occ: TIntegerField;
    N1: TMenuItem;
    mnuEnviarCorreo: TMenuItem;
    AFQuickMail: TAFQuickMail;
    Label37: TLabel;
    higiene_occ: TDBCheckBox;
    QOrdenCargaChigiene_occ: TIntegerField;
    Label9: TLabel;
    lblPalets: TLabel;
    n_palets_ocl: TBDEdit;
    Label10: TLabel;
    tipo_palets_ocl: TBDEdit;
    BGridButton1: TBGridButton;
    stTipoPalet: TStaticText;
    Label12: TLabel;
    nota_interna_occ: TDBMemo;
    QOrdenCargaCnota_interna_occ: TStringField;
    Bevel3: TBevel;
    Bevel4: TBevel;
    lblNombre1: TLabel;
    operador_transporte_occ: TBDEdit;
    BGBoperador_transporte_occ: TBGridButton;
    SToperador_transporte_occ: TStaticText;
    QOrdenCargaCoperador_transporte_occ: TSmallintField;
    status_occ: TBDEdit;
    btnBalanza: TToolButton;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    N2: TMenuItem;
    mnuImprimirPackingSimple: TMenuItem;
    pmCrearAlbaran: TPopupMenu;
    mnuIgnorarPacking: TMenuItem;
    mnuSepUnirAlbaran: TMenuItem;
    mnuUnirAlbaran: TMenuItem;
    lbl1: TLabel;
    OrdenCargaCompleta1: TMenuItem;
    lbl2: TLabel;
    unidades_caja_ocl: TBDEdit;
    lblUnidades: TLabel;
    lblComercial: TLabel;
    comercial_ocl: TBDEdit;
    btnComercial: TBGridButton;
    txtComercial: TStaticText;
    strngfldQOrdenCargaLcomercial_ocl: TStringField;
    lbl3: TLabel;
    edtentrega_sl: TBDEdit;
    QOrdenCargaLnotas_ocl: TStringField;
    lblFechaDescarga: TLabel;
    fecha_descarga_occ: TBDEdit;
    btnFechaDescarga: TBCalendarButton;
    QOrdenCargaCfecha_descarga_occ: TDateField;
    envase_ocl: TcxDBTextEdit;
    ssEnvase: TSimpleSearch;
    ActionList1: TActionList;
    BCancelar: TAction;
    Label20: TLabel;
    fecha_pedido_occ: TBDEdit;
    btnFechaPedido: TBCalendarButton;
    QOrdenCargaCfecha_pedido_occ: TDateField;
    pmFinalizarOrden: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    qryLineaOrden: TQuery;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    StringField18: TStringField;
    StringField19: TStringField;
    IntegerField9: TIntegerField;
    DateField3: TDateField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    IntegerField10: TIntegerField;
    DateField4: TDateField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField27: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    SmallintField2: TSmallintField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    QPackingList: TQuery;
    n_pedido_bonnysa_occ: TBDEdit;
    QOrdenCargaCn_pedido_bonnysa_occ: TStringField;
    tbImportar: TToolButton;
    lbl4: TLabel;
    EstadoDS: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAltaClick(Sender: TObject);
    procedure btnEditarCClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnAltaDClick(Sender: TObject);
    procedure btnEditarDClick(Sender: TObject);
    procedure btnBorrarDClick(Sender: TObject);
    procedure btnPrimeroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QOrdenCargaCNewRecord(DataSet: TDataSet);
    procedure QOrdenCargaCCalcFields(DataSet: TDataSet);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BCBFecha_occClick(Sender: TObject);
    procedure empresa_occChange(Sender: TObject);
    procedure centro_salida_occChange(Sender: TObject);
    procedure cliente_sal_occChange(Sender: TObject);
    procedure dir_sum_occChange(Sender: TObject);
    procedure transporte_occChange(Sender: TObject);
    procedure producto_oclChange(Sender: TObject);
    procedure envase_oclChange(Sender: TObject);
    procedure marca_oclChange(Sender: TObject);
    procedure categoria_oclChange(Sender: TObject);
    procedure color_oclChange(Sender: TObject);
    procedure centro_origen_oclChange(Sender: TObject);
    procedure BGBEmpresa_occClick(Sender: TObject);
    procedure BGBCentro_occClick(Sender: TObject);
    procedure BGBCliente_sal_occClick(Sender: TObject);
    procedure BGBDir_sum_occClick(Sender: TObject);
    procedure BGBtransporte_occClick(Sender: TObject);
    procedure QOrdenCargaCAfterEdit(DataSet: TDataSet);
    procedure QOrdenCargaCBeforePost(DataSet: TDataSet);
    procedure QOrdenCargaLBeforePost(DataSet: TDataSet);
    procedure QOrdenCargaLAfterEdit(DataSet: TDataSet);
    procedure BGBCentro_origen_oclClick(Sender: TObject);
    procedure BGBProducto_oclClick(Sender: TObject);
    procedure BGBEnvase_oclClick(Sender: TObject);
    procedure BGBMarca_oclClick(Sender: TObject);
    procedure BGBCalibre_oclClick(Sender: TObject);
    procedure BGBCategoria_oclClick(Sender: TObject);
    procedure BGBColor_oclClick(Sender: TObject);
    procedure cajas_oclChange(Sender: TObject);
    procedure kilos_oclChange(Sender: TObject);
    procedure precio_oclChange(Sender: TObject);
    procedure QOrdenCargaLAfterInsert(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QOrdenCargaCAfterPost(DataSet: TDataSet);
    procedure mnuImprimirOrdenClick(Sender: TObject);
    procedure mnuImprimirPackingListClick(Sender: TObject);
    procedure mnuFiltroClick(Sender: TObject);
    procedure btnActivarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure BCBFecha_transito_oclClick(Sender: TObject);
    procedure BGBCentro_destino_occClick(Sender: TObject);
    procedure centro_destino_occChange(Sender: TObject);
    procedure btnCrearAlbaranClick(Sender: TObject);
    //procedure TimerTimer(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure EnvaseCalibreyColor1Click(Sender: TObject);
    procedure EnvasesLogifruit1Click(Sender: TObject);
    procedure ipoPalets1Click(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure ref_transitos_oclChange(Sender: TObject);
    procedure btnResumenClick(Sender: TObject);
    procedure porte_bonny_occEnter(Sender: TObject);
    procedure porte_bonny_occExit(Sender: TObject);
    procedure mnuEnviarCorreoClick(Sender: TObject);
    procedure QOrdenCargaLAfterPost(DataSet: TDataSet);
    procedure BGBTipo_Palet_oclClick(Sender: TObject);
    procedure tipo_palets_oclChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure operador_transporte_occChange(Sender: TObject);
    procedure BGBoperador_transporte_occClick(Sender: TObject);
    procedure importe_neto_oclChange(Sender: TObject);
    procedure status_occChange(Sender: TObject);
    procedure btnBalanzaClick(Sender: TObject);
    procedure mnuImprimirPackingSimpleClick(Sender: TObject);
    procedure mnuIgnorarPackingClick(Sender: TObject);
    procedure mnuUnirAlbaranClick(Sender: TObject);
    procedure dir_sum_occExit(Sender: TObject);
    procedure OrdenCargaCompleta1Click(Sender: TObject);
    procedure unidades_caja_oclChange(Sender: TObject);
    procedure dir_sum_occEnter(Sender: TObject);
    procedure btnComercialClick(Sender: TObject);
    procedure comercial_oclChange(Sender: TObject);
    procedure btnFechaDescargaClick(Sender: TObject);
    procedure envase_oclExit(Sender: TObject);
    procedure ssEnvaseAntesEjecutar(Sender: TObject);
    procedure BCancelarExecute(Sender: TObject);
    procedure btnFechaPedidoClick(Sender: TObject);
    procedure mnuReconstruirOrden(Sender: TObject);
    procedure ReconstruirOrden( APreguntar: boolean);
    procedure InsertarLineasOrden (AComercial: string);
    procedure ActualizarEnvasePacking;
    function ObtenerUnidadPrecio(AEmpresa, ACliente, AProducto, AEnvase: string): String;
    procedure tbImportarClick(Sender: TObject);
    procedure PDetalleEnter(Sender: TObject);
    procedure DSMaestroStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure producto_oclExit(Sender: TObject);
    

  private
    { Private declarations }
    sFiltro: string;

    EstadoAnterior: integer;
    EstadoActual: integer;

    bEscape: boolean;

    sEmpresaActual, sCentroActual, sFechaActual, sClienteActual: string;
    rImpuestosActual: TImpuesto;


    bPesoVariableLinea, bUnidadesVariableLinea, bFlagCambios: Boolean;
    iUnidadesCaja: Integer;
    rPesoCaja, rImpuestoLinea: real;
    sUnidadPrecioLinea: string;

    rKilosAnterior: Real;

    CentroDto: TCentroDTO;

     AuroraConn : TConexionAWSAurora;


    procedure ActualizarEstado( const AEstado: integer );
    procedure HabilitarBarra;
    procedure DesHabilitarBarra;
    procedure Visualizar;
    procedure EditarC;
    procedure EditarD;
    procedure VisualizarOrden( const AOrden: string );
    procedure RefrescarOrden( const AOrden: string );
    procedure RefrescarDetalle;

    procedure PonInicializada;
    procedure PonFinalizada;
    procedure CrearAlbaran( const APacking: Boolean );
    procedure CrearTransito( const APacking: Boolean );

    procedure BorrarOrdenActual( const APreguntar: Boolean );
    procedure BorrarOrdenAurora( orden_occ : integer);
    procedure BorrarDetalleActual( const APreguntar: Boolean );
    procedure FiltrarOrdenes;

    procedure ConstruirFiltro;

    procedure DesplegarRejilla( const AControl: TControl );

    procedure Aceptar;

    procedure UnirTransito;
    procedure UnirAlbaran;

    function NumVersion: string;

  public

    procedure RecalcularUnidades( const ASender: TObject; const AImporte: boolean = false );
  end;

var
  FOrdenCarga: TFOrdenCarga;

implementation

{$R *.DFM}

uses UFFiltro, UFCalendario, UFRejilla, UFTransportistas,  UFClientes,
     UDDescripciones, UDTraspasar, UQOrdenCompleta, Math, UFResumen,
     bCalculadora, UFSuministros, UFDistribuirPeso, UQOrdenPackingSimple,
     UFAsignarAlbaran, UFAsignarTransito, bMath, bTextUtils, CGlobal;

function TFOrdenCarga.NumVersion: string;
var
  sFileIni: string;
  slAux: TStringList;
begin
  sFileIni:= StringReplace( ParamStr(0), '.exe', '.ver', [] );
  if FileExists(sFileIni) then
  begin
    slAux:= TStringList.Create;
    try
      slAux.LoadFromFile( sFileINi );
      Result:= 'V' + Trim( slAux.Text );
    finally
      FreeAndNil( slAux );
    end;
  end;
end;

procedure TFOrdenCarga.FormCreate(Sender: TObject);
begin


  Caption:= Caption + ' - ' + NumVersion;
  bEscape:= false;

  UDDescripciones.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFRejilla.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFTransportistas.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFClientes.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFSuministros.InicializaModulo( DOrdenCarga.Database.DatabaseName );

  with QOrdenCargaC do
  begin
    SQL.Clear;
    SQL.Add(' select * from frf_orden_carga_c ');
    SQL.Add(' where fecha_occ = :fecha ');
    SQL.Add(' order by fecha_occ desc, status_occ, orden_occ desc ');
    ParamByName('fecha').asDateTime:= Date;
    sFiltro:= ' where fecha_occ = ' + DateToStr( Date );
    Open;
  end;
  with QOrdenCargaL do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden_occ ');
    Prepare;
    Open;
  end;
  ActualizarEstado( kVisualizar );

  QPalets.Prepare;


  Top:= ( Screen.Height - Height ) div 2;
  Left:= ( Screen.Width - Width ) div 2;

  UFResumen.InicializarResumenOrdenes( self, QOrdenCargaC );

{
  if gsEmpresa = '078' then
  begin
    //Cabecera
    centro_destino_occ.Enabled:= False;
    BGBCentro_destino_occ.Enabled:= False;
    (*
    lblDestino.Visible:= False;
    centro_destino_occ.Visible:= False;
    BGBCentro_destino_occ.Visible:= False;
    STcentro_destino_occ.Visible:= False;
    lblTransito.Visible:= False;
    lblSalida.Visible:= False;
    ShapeTransito.Visible:= False;
    ShapeSalida.Visible:= False;
    *)
    //Detalle
    ref_transitos_ocl.Enabled:= False;
    fecha_transito_ocl.Enabled:= False;
    BCBFecha_transito_ocl.Enabled:= False;
    centro_origen_ocl.Enabled:= False;
    BGBCentro_origen_ocl.Enabled:= False;

    lblPortes.Caption:= ' Portes Pagados';
  end;
}

  bFlagCambios:= True;
  bPesoVariableLinea:= True;
  bUnidadesVariableLinea:= True;
  iUnidadesCaja:= 0;
  rPesoCaja:= 0;
  rImpuestoLinea:= 0;
  sUnidadPrecioLinea:='';

  self.CentroDTO.EmpresaCodigo := gsEmpresa;
  self.CentroDTO.EmpresaDescripcion := DDescripciones.desEmpresa( gsEmpresa );
  self.CentroDTO.CentroCodigo := gsCentro;
  self.CentroDTO.CentroDescripcion := DDescripciones.desCentro( gsEmpresa, gsCentro);

  AuroraConn := TConexionAWSAurora.Create;

end;

procedure TFOrdenCarga.FormDestroy(Sender: TObject);
begin
  FreeAndNil(self.AuroraConn);
end;

procedure TFOrdenCarga.FormShow(Sender: TObject);
begin
  (*
  //SOLO SI ES UN WINDOWS XP
  AnimateWindow( Handle, 400, AW_ACTIVATE or AW_SLIDE or AW_VER_POSITIVE ); //AW_CENTER );
  RedrawWindow( Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN );
  *)
end;

procedure TFOrdenCarga.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=
    (Application.MessageBox('¿Seguro que desea cerrar la aplicación?', 'CERRAR APLICACIÓN', MB_YESNO ) = IDYES );
end;

procedure TFOrdenCarga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  UFResumen.FinalizarResumenOrdenes;

  QOrdenCargaL.Close;
  QOrdenCargaC.Close;

  UDDescripciones.FinalizaModulo;
  UFRejilla.FinalizaModulo;
  UFTransportistas.FinalizaModulo;
  UFClientes.FinalizaModulo;
  UFSuministros.FinalizaModulo;

  QOrdenCargaL.UnPrepare;
  QPalets.UnPrepare;
end;

procedure TFOrdenCarga.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EstadoActual = kVisualizar then
  begin
    case Key of
      VK_ADD:
            if ssShift in Shift then
            begin
              if btnAltaD.Enabled then
                btnAltaD.Click;
            end
            else
            begin
              if btnAlta.Enabled then
                btnAlta.Click;
            end;
      VK_SUBTRACT:
            if ssShift in Shift then
            begin
              if btnBorrarD.Enabled then
                btnBorrarD.Click;
            end
            else
            begin
              if btnBorrar.Enabled then
                btnBorrar.Click;
            end;
      Ord('M'):
            if ssShift in Shift then
            begin
              if btnEditarD.Enabled then
                btnEditarD.Click;
            end
            else
            begin
              if btnEditarC.Enabled then
                btnEditarC.Click;
            end;
      Ord('L'):
            if btnLocalizar.Enabled then
              btnLocalizar.Click;
      vk_f1:
            if btnAceptar.Enabled then
              btnAceptar.Click;
//      vk_escape:
//            if btnCancelar.Enabled then
//             btnCancelar.Click;
      vk_left:
            if btnAnterior.Enabled then
              btnAnterior.Click;
      vk_up:
            if btnPrimero.Enabled then
              btnPrimero.Click;
      vk_right:
            if btnProximo.Enabled then
              btnProximo.Click;
      vk_down:
            if btnUltimo.Enabled then
              btnUltimo.Click;
      Ord('I'):
            if btnImprimir.Enabled then
              btnImprimir.Click;
      Ord('A'):
            if ssShift in Shift then
            begin
              if btnActivar.Enabled then
                btnActivar.Click;
            end;
      Ord('F'):
            if ssShift in Shift then
            begin
              if btnFinalizar.Enabled then
                btnFinalizar.Click;
            end;
      Ord('C'):
            if ssShift in Shift then
            begin
              if btnCrearAlbaran.Enabled then
                btnCrearAlbaran.Click;
            end;
      Ord('D'):
            if ssShift in Shift then
            begin
              if btnBalanza.Enabled then
                btnBalanza.Click;
            end;
    end;
  end
  else
  begin
    case Key of
      vk_f1:
            btnAceptar.Click;
//      vk_escape:
//            btnCancelar.Click;
    end;
  end;
end;

procedure TFOrdenCarga.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EstadoActual <> kVisualizar then
  begin
    case Key of
      vk_return, vk_down:
        if not nota_occ.Focused then
            PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      vk_up:
        if not nota_occ.Focused then
            PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
      vk_f2:
        DesplegarRejilla( self.ActiveControl );
      vk_f5:
        if cajas_ocl.Focused then
        begin
          bCalculadora.CalculadoraExecute( cajas_ocl );
        end
        else
        if kilos_ocl.Focused then
        begin
          bCalculadora.CalculadoraExecute( kilos_ocl );
        end;
    end;
  end;
end;

procedure TFOrdenCarga.DesplegarRejilla( const AControl: TControl );
var
  sAux: string;
begin
  sAux:= TEdit( AControl ).Text;

  if AControl.Name = fecha_occ.Name then
  begin
    PonFecha( self, AControl, SAux, sAux );
  end
  else
  if AControl.Name = fecha_descarga_occ.Name then
  begin
    PonFecha( self, AControl, SAux, sAux );
  end
  else
  if AControl.Name = fecha_transito_ocl.Name then
  begin
    PonFecha( self, AControl, SAux, sAux );
  end
  else
  if AControl.Name = empresa_occ.Name then
  begin
    SeleccionaEmpresa( self, AControl, SAux );
  end
  else
  if ( AControl.Name = centro_salida_occ.Name ) or ( AControl.Name = centro_origen_ocl.Name ) or
     ( AControl.Name = centro_destino_occ.Name )then
  begin
    SeleccionaCentro( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = cliente_sal_occ.Name ) then
  begin
    UFClientes.SeleccionaClientes( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = dir_sum_occ.Name ) then
  begin
    UFSuministros.SeleccionaSuministros( self, AControl, empresa_occ.Text, cliente_sal_occ.Text, SAux );
    //SeleccionaSuministro( self, AControl, empresa_occ.Text, cliente_sal_occ.Text, SAux );
  end
  else
  if ( AControl.Name = transporte_occ.Name ) then
  begin
    UFTransportistas.SeleccionaTransportista( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = producto_ocl.Name ) then
  begin
    SeleccionaProducto( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = envase_ocl.Name ) then
  begin
    SeleccionaEnvaseCliente( self, AControl, empresa_occ.Text, producto_ocl.Text, cliente_sal_occ.Text, SAux );
  end
  else
  if ( AControl.Name = marca_ocl.Name ) then
  begin
    SeleccionaMarca( self, AControl, SAux );
  end
  else
  if ( AControl.Name = calibre_ocl.Name ) then
  begin
    SeleccionaCalibre( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end
  else
  if ( AControl.Name = color_ocl.Name ) then
  begin
    SeleccionaColor( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end
  else
  if ( AControl.Name = comercial_ocl.Name ) then
  begin
    SeleccionaComercial( self, comercial_ocl,  sAux );
  end
  else
  if ( AControl.Name = categoria_ocl.Name ) then
  begin
    SeleccionaCategoria( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end;

  TEdit( AControl ).Text:= sAux;
end;

procedure TFOrdenCarga.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFOrdenCarga.btnRefrescarClick(Sender: TObject);
begin
  if QOrdenCargaC.Active then
  begin
    if not QOrdenCargaC.IsEmpty then
    begin
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    end;
  end;
end;

procedure TFOrdenCarga.Aceptar;
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaC.Post;
    ActualizarEstado( kVisualizar );
    if EstadoAnterior = kNuevaCabecera then
    begin
      btnAltaD.Click;
    end;
  end
  else
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    (*TODO*)
    (*
    if sFacturar = '' then
    begin
      ShowMessage('Envase selccionado no valido para el cliente actual.' + #10 + #10 +
                  'Si es correcto, por favor darlo de alta en el mantenimento de clientes.');
      Exit;
    end;
    *)
    QOrdenCargaL.Post;
    ActualizarEstado( kVisualizar );
    if EstadoAnterior = kNuevoDetalle then
    begin
      btnAltaD.Click;
    end;
  end;
end;

procedure TFOrdenCarga.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
  (*
  if not DOrdenCarga.Database.InTransaction then
  begin
    DOrdenCarga.Database.StartTransaction;
    try
      Aceptar;
      DOrdenCarga.Database.Commit;
    except
      DOrdenCarga.Database.Rollback;
      btnCancelar.Click;
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
      Raise;
    end;
  end;
  *)
end;

procedure TFOrdenCarga.btnCancelarClick(Sender: TObject);
begin
  bEscape:= True;
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaC.Cancel;
  end
  else
  begin
    if QOrdenCargaL.State in [dsInsert, dsEdit] then
    begin
      QOrdenCargaL.Cancel;
    end;
  end;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAltaClick(Sender: TObject);
begin
  QOrdenCargaC.Insert;
  ActualizarEstado( kNuevaCabecera );
end;

procedure TFOrdenCarga.btnEditarCClick(Sender: TObject);
begin
  QOrdenCargaC.Edit;
  ActualizarEstado( kEditarCabecera );
end;

procedure TFOrdenCarga.btnBorrarClick(Sender: TObject);
begin
  if DOrdenCarga.ComprobarIntegridadOrden( QOrdenCargaCorden_occ.AsInteger ) then
  begin
    BorrarOrdenActual( true );
    ActualizarEstado( kVisualizar );
  end
  else
  begin
    if Application.MessageBox( PCHAR( 'La orden "' + IntToStr( QOrdenCargaCorden_occ.AsInteger ) + '" tiene datos de Packing List asociados.' +
      #13 + #10 + '¿Esta seguro que desea borrar la orden seleccionada?   ' + #13 + #10 +
      'NOTA: El Packing List no se borrara.' ), 'AVISO PACKING LIST', mb_yesno ) = idyes then
    begin
      BorrarOrdenActual( false );
      ActualizarEstado( kVisualizar );
    end;
  end;
end;

procedure TFOrdenCarga.btnLocalizarClick(Sender: TObject);
begin
  FiltrarOrdenes; // Devuel QOrdenCargaC.open;
//  QOrdenCargaC.Edit;
  QordenCargaL.Close;
  QOrdenCargaL.Open;
   ActualizarEstado( kVisualizar );
//  ActualizarEstado( kEditarCabecera );
end;

procedure TFOrdenCarga.btnPrimeroClick(Sender: TObject);
begin
  QOrdenCargaC.DisableControls;
  QOrdenCargaL.Close;
  QOrdenCargaC.First;
  QOrdenCargaL.Open;
  QOrdenCargaC.EnableControls;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAnteriorClick(Sender: TObject);
begin
  QOrdenCargaC.DisableControls;
  QOrdenCargaL.Close;
  QOrdenCargaC.Prior;
  QOrdenCargaL.Open;
  QOrdenCargaC.EnableControls;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnProximoClick(Sender: TObject);
begin
  QOrdenCargaC.DisableControls;
  QOrdenCargaL.Close;
  QOrdenCargaC.Next;
  QOrdenCargaL.Open;
  QOrdenCargaC.EnableControls;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnUltimoClick(Sender: TObject);
begin
  QOrdenCargaC.DisableControls;
  QOrdenCargaL.Close;
  QOrdenCargaC.Last;
  QOrdenCargaL.Open;
  QOrdenCargaC.EnableControls;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAltaDClick(Sender: TObject);
begin
  QOrdenCargaL.Insert;
  ActualizarEstado( kNuevoDetalle );
end;

procedure TFOrdenCarga.btnEditarDClick(Sender: TObject);
begin
  QOrdenCargaL.Edit;
  ActualizarEstado( kEditarDetalle );
end;

procedure TFOrdenCarga.btnBorrarDClick(Sender: TObject);
begin
  //Integridad con el packing list
  if DOrdenCarga.ComprobarIntegridadLinea( QOrdenCargaLorden_ocl.AsInteger, QOrdenCargaLlinea_ocl.AsInteger,
    QOrdenCargaLempresa_ocl.AsString, QOrdenCargaLproducto_ocl.AsString, QOrdenCargaLenvase_ocl.AsString, 0, 0 ) then
  begin
    BorrarDetalleActual( True );
    ActualizarEstado( kVisualizar );
  end
  else
  begin
    if Application.MessageBox('Integridad con el Packing List rota, hay mas cajas y/o palets en el camión que en la orden de carga.' + #13 + #10 +
                              '¿Esta seguro de querer continuar con el borrado?      ', 'AVISO PACKING LIST', mb_yesno) = idyes then
    begin
      BorrarDetalleActual( False );
    end;
  end;
end;

procedure TFOrdenCarga.btnImprimirClick(Sender: TObject);
begin
  //UQOrdenPackingSimple.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) );
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, False, True, False );
end;

procedure TFOrdenCarga.OrdenCargaCompleta1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , True, True, True, True, True );
end;

procedure TFOrdenCarga.mnuImprimirOrdenClick(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , True, False, False, False, False );
end;

procedure TFOrdenCarga.mnuImprimirPackingListClick(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, True, False, False, False );
end;

procedure TFOrdenCarga.mnuImprimirPackingSimpleClick(Sender: TObject);
begin
  UQOrdenPackingSimple.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) );
end;

procedure TFOrdenCarga.EnvaseCalibreyColor1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, False, True, False );
end;

procedure TFOrdenCarga.EnvasesLogifruit1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, True, False, False );
end;

procedure TFOrdenCarga.ipoPalets1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, False, False, True );
end;

procedure TFOrdenCarga.CrearAlbaran( const APacking: Boolean );
var
  DTraspasar: TDTraspasar;
  bTraspasar: boolean;
  iReferencia: integer;
begin
  if QOrdenCargaCtraspasada_occ.AsInteger = 0 then
  begin
    bTraspasar:= Application.MessageBox('¿Seguro que quiere generar el ALBARÁN DE SALIDA?   ',
         'GENERAR ALBARÁN.', mb_yesno ) = idyes;
  end
  else
  begin
    bTraspasar:= Application.MessageBox('La orden ya ha sido traspasada.' + #13 + #10 +
      '¿Seguro que quiere volver a generar el ALBARÁN DE SALIDA?   ', 'GENERAR ALBARÁN.', mb_yesno ) = idyes;
  end;

  if bTraspasar then
  begin
    DTraspasar:= TDTraspasar.Create( self );
    try
      if not DOrdenCarga.Database.InTransaction then
      begin
        DOrdenCarga.Database.StartTransaction;
        try
          iReferencia:= DTraspasar.PasarAlbaran( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCcentro_salida_occ.AsString,
            QOrdenCargaCfecha_occ.AsDateTime, QOrdenCargaCorden_occ.AsInteger, APacking );
          DOrdenCarga.Database.Commit;
          ShowMessage('Salida ' + IntToStr( iReferencia  )  + ' generada con exito.');
        except
          DOrdenCarga.Database.Rollback;
          Raise;
        end;
      end;
    finally
      FreeAndNil( DTraspasar );
    end;
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  end;
end;

procedure TFOrdenCarga.CrearTransito( const APacking: Boolean );
var
  DTraspasar: TDTraspasar;
  bTraspasar: boolean;
  iReferencia: integer;
begin
  if QOrdenCargaCtraspasada_occ.AsInteger = 0 then
  begin
    bTraspasar:= Application.MessageBox('¿Seguro que quiere generar el TRÁNSITO?   ',
         'GENERAR TRÁNSITO.', mb_yesno ) = idyes;
  end
  else
  begin
    bTraspasar:= Application.MessageBox('La orden ya ha sido traspasada.' + #13 + #10 +
      '¿Seguro que quiere volver a generar el TRÁNSITO?   ', 'GENERAR TRÁNSITO.', mb_yesno ) = idyes;
  end;

  if bTraspasar then
  begin
    DTraspasar:= TDTraspasar.Create( self );
    try
      if not DOrdenCarga.Database.InTransaction then
      begin
        DOrdenCarga.Database.StartTransaction;
        try
          iReferencia:= DTraspasar.PasarTransito( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCcentro_salida_occ.AsString,
            QOrdenCargaCfecha_occ.AsDateTime, QOrdenCargaCorden_occ.AsInteger, APacking );
          DOrdenCarga.Database.Commit;
          ShowMessage('Tránsito ' + IntToStr( iReferencia  )  + ' generado con exito.');
        except
          DOrdenCarga.Database.Rollback;
          Raise;
        end;
      end;
    finally
      FreeAndNil( DTraspasar );
    end;
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  end;
end;

procedure TFOrdenCarga.btnActivarClick(Sender: TObject);
begin
  if Application.MessageBox('¿Esta seguro que quiere activar la orden?, a partir de ese momento se inicializara la carga.','ACTIVAR ORDEN', MB_YESNO ) = IDYES then
  begin
    DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 1);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  end;
end;

procedure TFOrdenCarga.btnFinalizarClick(Sender: TObject);
var
  sAux: string;
  bParar: Boolean;
begin
  if ( QOrdenCargaCstatus_occ.AsInteger = 1 ) or ( QOrdenCargaCstatus_occ.AsInteger = 2 ) then
  begin
    if not DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, bParar, sAux ) then
    begin
      if bParar then
      begin
        ShowMessage( sAux );
      end
      else
      begin
        if Application.MessageBox(Pchar( sAux +  '¿Esta seguro que quiere finalizar la orden?   '),
             'FINALIZAR ORDEN.', mb_yesno ) = idyes then
        begin
          PonFinalizada;
        end
      end;
    end
    else
    begin
      PonFinalizada;
    end;
  end
  else
  if ( QOrdenCargaCstatus_occ.AsInteger = 3) then
  begin
    if QOrdenCargaCtraspasada_occ.AsInteger <> 0 then
    begin
      if Application.MessageBox(Pchar( 'El albarán de salida/tránsito ya ha sido creado.' + #13 + #10 +
                                       '¿Esta seguro que quiere desfinalizar la orden?   '),
                                       'DESFINALIZAR ORDEN.', mb_yesno ) = idyes then
      begin
        PonInicializada;
      end;
    end
    else
    begin
      if DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, bParar, sAux ) then
      begin
        if Application.MessageBox(Pchar( 'La orden de carga coincide con el packing creado.' + #13 + #10 +
                                         '¿Esta seguro que quiere desfinalizar la orden?   '),
                                         'DESFINALIZAR ORDEN.', mb_yesno ) = idyes then
        begin
          PonInicializada;
        end
      end
      else
      begin
        PonInicializada;
      end;
    end;
  end;
end;

procedure TFOrdenCarga.btnCrearAlbaranClick(Sender: TObject);
var
  sAux: string;
  bParar: Boolean;
begin
    //No se podrá generar un albaran, si ya existe
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select* from frf_salidas_c    ');
      SQL.Add('   where empresa_sc = :empresa ');
      SQL.Add('     and n_orden_sc = :orden   ');

      ParamByName('orden').AsString := QOrdenCargaCorden_occ.AsString;
      ParamByName('empresa').AsString := QOrdenCargaCempresa_occ.AsString;
      Open;

      if not DOrdenCarga.QAux.IsEmpty  then
      begin
        ShowMessage( 'ATENCION! YA existe un Albaran de Salida con esta Orden Carga ( Albaran: ' + DOrdenCarga.QAux.FieldByName('n_albaran_sc').AsString + ' Fecha: '
                                                                                                 + DOrdenCarga.QAux.FieldByName('fecha_sc').AsString + ' )' );
        Exit;
      end;

    finally
      Close;
    end;


    //No se podrá generar un transito, si ya existe
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select* from frf_transitos_c  ');
      SQL.Add('   where empresa_tc = :empresa ');
      SQL.Add('     and n_orden_tc = :orden   ');

      ParamByName('orden').AsString := QOrdenCargaCorden_occ.AsString;
      ParamByName('empresa').AsString := QOrdenCargaCempresa_occ.AsString;
      Open;

      if not DOrdenCarga.QAux.IsEmpty  then
      begin
        ShowMessage( 'ATENCION! YA existe un Tránsito con esta Orden Carga ( Transito: ' + DOrdenCarga.QAux.FieldByName('referencia_tc').AsString + ' Fecha: '
                                                                                         + DOrdenCarga.QAux.FieldByName('fecha_tc').AsString + ' )' );
        Exit;
      end;

    finally
      Close;
    end;


  if not DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, bParar, sAux ) then
  begin
    ShowMessage( sAux );
  end
  else
  begin
    (*
    if hora_occ.Text = '' then
    begin
      ShowMessage( 'Falta la hora de salida.' );
    end
    else
    *)
    begin
      if centro_destino_occ.Text <> '' then
      begin
        CrearTransito( True );
      end
      else
      begin
        CrearAlbaran( True );
      end;
    end;
  end;
end;

procedure TFOrdenCarga.mnuIgnorarPackingClick(Sender: TObject);
var
  bParar: Boolean;
  sAux: string;
begin
  sAux:= '';
    //No se podrá generar un albaran, si ya existe
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select* from frf_salidas_c ');
      SQL.Add('  where empresa_sc = :empresa ');
      SQL.Add('    and n_orden_sc = :orden ');

      ParamByName('orden').AsString := QOrdenCargaCorden_occ.AsString;
      ParamByName('empresa').AsString := QOrdenCargaCempresa_occ.AsString;

      Open;

      if not DOrdenCarga.QAux.IsEmpty  then
      begin
        ShowMessage( 'ATENCION! YA existe un Albaran de Salida con esta Orden Carga ( Albaran: ' + DOrdenCarga.QAux.FieldByName('n_albaran_sc').AsString + ' Fecha: '
                                                                                                 + DOrdenCarga.QAux.FieldByName('fecha_sc').AsString + ' )' );
        Exit;
      end;

    finally
      Close;
    end;


    //No se podrá generar un transito, si ya existe
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select* from frf_transitos_c ');
      SQL.Add('   where empresa_tc = :empresa ');
      SQL.Add('     and n_orden_tc = :orden ');

      ParamByName('orden').AsString := QOrdenCargaCorden_occ.AsString;
      ParamByName('empresa').AsString := QOrdenCargaCempresa_occ.AsString;
      Open;

      if not DOrdenCarga.QAux.IsEmpty  then
      begin
        ShowMessage( 'ATENCION! YA existe un Tránsito con esta Orden Carga ( Transito: ' + DOrdenCarga.QAux.FieldByName('referencia_tc').AsString + ' Fecha: '
                                                                                         + DOrdenCarga.QAux.FieldByName('fecha_tc').AsString + ' )' );
        Exit;
      end;

    finally
      Close;
    end;

    if not DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, bParar, sAux ) then
    begin
      if bParar then
      begin
        ShowMessage( sAux );
      end
      else
      begin
        if Application.MessageBox(Pchar( sAux +  '¿Esta seguro que quiere crear el albarán de salida/tránsito?   '),
             'FINALIZAR ORDEN.', mb_yesno ) = idyes then
        begin
          if centro_destino_occ.Text <> '' then
          begin
            CrearTransito( False );
          end
          else
          begin
            CrearAlbaran( False );
          end;
        end
      end;
    end
    else
    begin
          if centro_destino_occ.Text <> '' then
          begin
            CrearTransito( False );
          end
          else
          begin
            CrearAlbaran( False );
          end;
    end;
end;

procedure TFOrdenCarga.mnuUnirAlbaranClick(Sender: TObject);
begin
  if Trim( orden_occ.Text ) <> '' then
  begin
    if centro_destino_occ.Text <> '' then
    begin
      UnirTransito;
    end
    else
    begin
      UnirAlbaran;
    end;
  end;
end;

procedure TFOrdenCarga.btnBalanzaClick(Sender: TObject);
begin
  if not DSMaestro.DataSet.IsEmpty then
    UFDistribuirPeso.Execute( self,
                              DSMaestro.DataSet.FieldByName('orden_occ').AsInteger,
                              DOrdenCarga.Database.DatabaseName );
  RefrescarOrden( QOrdenCargaCorden_occ.AsString );
end;

procedure TFOrdenCarga.PonInicializada;
begin
  //if Application.MessageBox('¿Esta seguro que quiere desfinalizar la orden?','DESFINALIZAR ORDEN', MB_YESNO ) = IDYES then
  //begin
    DOrdenCarga.DesfinalizarOrden( QOrdenCargaCorden_occ.AsInteger );
    //DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 2);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  //end;
end;

procedure TFOrdenCarga.PDetalleEnter(Sender: TObject);
var
  AFecha : TDateTime;
begin
  if comercial_ocl.Text = '' then
  begin
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select * from frf_clientes_comercial    ');
      //SQL.Add('   where cod_empresa_cc = :empresa ');
      SQL.Add('     where cod_cliente_cc = :cliente   ');
      SQL.Add(' and :fecha between fecha_ini_cc and nvl(fecha_fin_cc, today) '); //' + QuotedStr(fecha_occ.Text) + ') ');
      //ParamByName('empresa').AsString := QOrdenCargaCempresa_occ.AsString;
      ParamByName('cliente').AsString := cliente_sal_occ.Text;
      ParamByName('fecha').AsString := fecha_occ.Text;
      Open;

      if isEmpty then
        comercial_ocl.Text := '000'
      else
        comercial_ocl.Text := FieldByName('cod_comercial_cc').AsString;

     finally
      close;
    end;
  end;
end;

procedure TFOrdenCarga.PonFinalizada;
begin
  //if Application.MessageBox('¿Esta seguro que quiere finalizar la orden?','FINALIZAR ORDEN', MB_YESNO ) = IDYES then
  //begin
    DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 3);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  //end;
end;

procedure TFOrdenCarga.mnuFiltroClick(Sender: TObject);
begin
  TMenuItem( Sender ).Checked:= not TMenuItem( Sender ).Checked;
  ConstruirFiltro;
end;

procedure TFOrdenCarga.ActualizarEstado( const AEstado: integer );
var
  sOrden: string;
begin
  EstadoAnterior:= EstadoActual;
  EstadoActual:= AEstado;
  sOrden:= orden_occ.Text;

  case AEstado of
    kVisualizar:
    begin
      Visualizar;
      if not bEscape then
      begin
        if ( EstadoAnterior = kNuevaCabecera ) then
        begin
          VisualizarOrden( sOrden );
        end
        else
        if ( EstadoAnterior = kEditarCabecera )  then
        begin
          RefrescarOrden( sOrden );
        end
        else
        if ( EstadoAnterior = kEditarDetalle ) or ( EstadoAnterior = kNuevoDetalle ) then
        begin
          RefrescarDetalle;
        end;
      end
      else
      begin
        bEscape:= false;
      end;
    end;
    kNuevaCabecera: EditarC;
    kEditarCabecera: EditarC;
    kNuevoDetalle: EditarD;
    kEditarDetalle: EditarD;
  end;
end;

procedure TFOrdenCarga.HabilitarBarra;
begin
  btnAlta.Enabled:= QOrdenCargaC.Active;
  btnEditarC.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnBorrar.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2,3] )
    and ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );
  btnLocalizar.Enabled:= True;

  btnAltaD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnBorrarD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty ) and ( not QOrdenCargaL.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnEditarD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty ) and ( not QOrdenCargaL.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );

  btnPrimero.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Bof );
  btnAnterior.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Bof );
  btnProximo.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Eof );
  btnUltimo.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Eof );

  btnResumen.Enabled:= not QOrdenCargaC.IsEmpty;
  btnImprimir.Enabled:= not QOrdenCargaC.IsEmpty;

  btnActivar.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger = 0 );
  btnFinalizar.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger in [1,2,3] );
  //btnCrearAlbaran.Enabled:= True;
  btnCrearAlbaran.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger = 3 ) and
                            ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );
  btnBalanza.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger in [1,2,3] ) and
                            ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );

  case QOrdenCargaCstatus_occ.AsInteger of
    1,2:
    begin
      btnFinalizar.ImageIndex:= 18;
      btnFinalizar.Hint:= 'Finalizar Orden (Mayus F)';
    end;
    3:
    begin
      btnFinalizar.ImageIndex:= 17;
      btnFinalizar.Hint:= 'Desfinalizar Orden (Mayus F)';
    end;
  end;

  MenuItem3.Enabled := (QOrdenCargaCstatus_occ.AsInteger <> 3);

(*
  btnCancelar.Enabled:= False;
  btnAceptar.Enabled:= False;
  btnCerrar.Enabled:= True;
*)
  btnCancelar.OnClick:= btnCerrarClick;
  btnAceptar.OnClick:= btnRefrescarClick;
  btnAceptar.Enabled:= ( not QOrdenCargaC.IsEmpty );
  btnCancelar.hint:= 'Cerrar (Esc)';
  btnAceptar.hint:= 'Refrescar (F1)';
  btnCancelar.ImageIndex:= 14;
  btnAceptar.ImageIndex:= 19;

  tbImportar.Enabled := btnLocalizar.Enabled;
end;

procedure TFOrdenCarga.DesHabilitarBarra;
begin
  btnAlta.Enabled:= False;
  btnEditarC.Enabled:= False;
  btnBorrar.Enabled:= False;
  btnLocalizar.Enabled:= False;

  btnAltaD.Enabled:= False;
  btnBorrarD.Enabled:= False;
  btnEditarD.Enabled:= False;

  btnPrimero.Enabled:= False;
  btnAnterior.Enabled:= False;
  btnProximo.Enabled:= False;
  btnUltimo.Enabled:= False;

  btnResumen.Enabled:= False;
  btnImprimir.Enabled:= False;
  //btnCrearAlbaran.Enabled:= True;
  btnCrearAlbaran.Enabled:= False;
  btnBalanza.Enabled:= False;
  (* ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger in [1,2,3] ) and
                            ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );
  *)
  btnActivar.Enabled:= False;
  btnFinalizar.Enabled:= False;

(*
  btnCancelar.Enabled:= True;
  btnAceptar.Enabled:= True;
  btnCerrar.Enabled:= False;
*)
  btnCancelar.OnClick:= btnCancelarClick;
  btnAceptar.OnClick:= btnAceptarClick;
  btnCancelar.hint:= 'Cancelar (Esc)';
  btnAceptar.Enabled:= True;
  btnAceptar.hint:= 'Aceptar (F1)';
  btnCancelar.ImageIndex:= 13;
  btnAceptar.ImageIndex:= 12;
  tbImportar.Enabled := false;
end;

procedure TFOrdenCarga.Visualizar;
begin
  PMaestro.Enabled:= False;
  PDetalle.Enabled:= False;
  PDetalle.Height:= 0;
  RVisualizacion.Enabled:= True;

  HabilitarBarra;
end;

procedure TFOrdenCarga.EditarC;
begin
  PMaestro.Enabled:= True;
  PDetalle.Enabled:= False;
  PDetalle.Height:= 0;
  RVisualizacion.Enabled:= False;

  DesHabilitarBarra;

  if ( hora_occ.CanFocus ) and ( hora_occ.Text = '' ) then
    hora_occ.SetFocus
  else
    if centro_destino_occ.CanFocus then
        centro_destino_occ.SetFocus;
end;

procedure TFOrdenCarga.EditarD;
begin
  PMaestro.Enabled:= False;
  PDetalle.Enabled:= True;
  PDetalle.Height:= 160;
  RVisualizacion.Enabled:= False;

  DesHabilitarBarra;

  if EstadoActual = kNuevoDetalle then
  begin
    if ref_transitos_ocl.CanFocus then
    begin
      ref_transitos_ocl.SetFocus
    end
    else
    begin
      if producto_ocl.CanFocus then
      begin
        producto_ocl.SetFocus
      end;
    end;
    rKilosAnterior:= 0;
  end
  else
  begin
    if cajas_ocl.CanFocus then
      cajas_ocl.SetFocus;
    rKilosAnterior:= QOrdenCargaLkilos_ocl.AsFloat;
    envase_oclChange( envase_ocl )
  end;
end;

procedure TFOrdenCarga.QOrdenCargaCNewRecord(DataSet: TDataSet);
var sEmpresa: string;
begin
  with DOrdenCarga do
  begin
    //Obtener y actualizar contador de ordenes
    if gProgramVersion = pvBAG then
      sEmpresa := 'BAG'
    else
      sEmpresa := 'SAT';
    QGetNumeroOrden.ParamByName('empresa').AsString := sEmpresa;
    QGetNumeroOrden.Open;
    QOrdenCargaCorden_occ.AsInteger:= QGetNumeroOrden.FieldByName('contador_oc').AsInteger;
    orden_occ.Text:= QOrdenCargaCorden_occ.AsString;
    QGetNumeroOrden.Close;
    QUpdateNumeroOrden.ParamByName('empresa').AsString:= sEmpresa;
    QUpdateNumeroOrden.ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger + 1;
    QUpdateNumeroOrden.ExecSQL;

    //Datos por defecto
    QOrdenCargaCstatus_occ.AsInteger:= 0;
    QOrdenCargaCtraspasada_occ.AsInteger:= 0;
    QOrdenCargaCempresa_occ.AsString:= gsEmpresa;
    QOrdenCargaCcentro_salida_occ.AsString:= gsCentro;
    QOrdenCargaCn_albaran_occ.AsInteger:= QOrdenCargaCorden_occ.AsInteger;
    QOrdenCargaCfecha_occ.AsDateTime:= Date;
    QOrdenCargaChora_occ.AsString:= '';
    //QOrdenCargaChora_occ.AsString:= FormatDateTime('hh:nn', Time );
    //QOrdenCargaCporte_bonny_occ.AsInteger:= 0;
    porte_bonny_occ.Checked:= False;
    QOrdenCargaChigiene_occ.AsInteger:= 1;
    higiene_occ.Checked:= True;
    QOrdenCargaCn_palets_occ.AsInteger:= 0;

    cliente_sal_occ.TabStop:= True;
    dir_sum_occ.TabStop:= True;
    n_pedido_occ.TabStop:= True;
    fecha_pedido_occ.TabStop:=True;
    fecha_descarga_occ.TabStop:= True;

  end;
end;

procedure TFOrdenCarga.QOrdenCargaCCalcFields(DataSet: TDataSet);
begin
  case QOrdenCargaCtraspasada_occ.AsInteger of
    1:
    begin
      QOrdenCargaCdes_traspasada_occ.AsString:= 'ALBARÁN CREADO Nº ' + QOrdenCargaCn_albaran_occ.AsString;
      QOrdenCargaCdes2_traspasada_occ.AsString:= 'ALBA';
    end;
    2:
    begin
      QOrdenCargaCdes_traspasada_occ.AsString:= 'TRÁNSITO CREADO Nº ' + QOrdenCargaCn_albaran_occ.AsString;
      QOrdenCargaCdes2_traspasada_occ.AsString:= 'TRAN';
    end;
    else
    begin
      QOrdenCargaCdes_traspasada_occ.AsString:= '';
      QOrdenCargaCdes2_traspasada_occ.AsString:= '';
    end;
  end;
  case QOrdenCargaCstatus_occ.AsInteger of
    0:
    begin
      QOrdenCargaCdes_status_occ.AsString:= 'CREADA';
      QOrdenCargaCdes2_status_occ.AsString:= 'CREA';
    end;
    1:
    begin
       QOrdenCargaCdes_status_occ.AsString:= 'ACTIVA';
       QOrdenCargaCdes2_status_occ.AsString:= 'ACTI';
    end;
    2:
    begin
      QOrdenCargaCdes_status_occ.AsString:= 'INICIALIZADA';
      QOrdenCargaCdes2_status_occ.AsString:= 'INIC';
    end;
    3:
    begin
      QOrdenCargaCdes_status_occ.AsString:= 'FINALIZADA';
      QOrdenCargaCdes2_status_occ.AsString:= 'FINA';
    end;
    else
    begin
      QOrdenCargaCdes_status_occ.AsString:= '';
      QOrdenCargaCdes2_status_occ.AsString:= '';
    end;
  end;

  QOrdenCargaCdes_suministro_occ.AsString:= QOrdenCargaCdir_sum_occ.AsString;
  QOrdenCargaCpalets_cargados_occ.AsInteger:= 0;

  try
    if QOrdenCargaCstatus_occ.AsInteger > 1 then
    begin
      QPalets.ParamByName('orden').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
      QPalets.Open;
      QOrdenCargaCpalets_cargados_occ.AsInteger:= QPalets.Fields[0].AsInteger;
      QPalets.Close;
    end
    else
    begin
      QOrdenCargaCpalets_cargados_occ.AsInteger:= 0;
    end;
  finally
    QPalets.Close;
  end;

  if not ( QOrdenCargaC.State in [dsEdit, dsInsert] ) then
  begin
    QOrdenCargaCdes_suministro_occ.AsString:= DDescripciones.desSuministro( QOrdenCargaCempresa_occ.AsString,
      QOrdenCargaCcliente_sal_occ.AsString, QOrdenCargaCdir_sum_occ.AsString );
  end;
end;

procedure TFOrdenCarga.BorrarOrdenActual( const APreguntar: Boolean );
var
  orden_occ : integer;
begin
  orden_occ :=  QOrdenCargaCorden_occ.asinteger;
  //Borrar detalle
  if ( not APreguntar ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere borrar la orden nº. ' + QOrdenCargaCorden_occ.AsString ),
                            'BORRAR ORDEN', MB_YESNO ) = IDYES ) then
  begin
    with DOrdenCarga.QBorrarDetalle do
    begin
      ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
      ExecSQL;
    end;
    with DOrdenCarga.QBorrarPacking do
    begin
      ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
      ExecSQL;
    end;
    //Borrar cabecera activa
    QOrdenCargaC.Delete;

    self.BorrarOrdenAurora(orden_occ);
  end;
end;

procedure TFOrdenCarga.BorrarDetalleActual( const APreguntar: Boolean );
begin
  if ( not APreguntar  ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere borrar la linea activa.' ),
                            'BORRAR ORDEN', MB_YESNO ) = IDYES ) then
  begin
    //Borrar detalle activo
    QOrdenCargaL.Delete;
  end;
end;

procedure TFOrdenCarga.FiltrarOrdenes;
var
  FFIltro: TFFiltro;
begin
  FFIltro:= TFFiltro.Create( self );

  try
    if FFiltro.ShowModal = mrOk then
    begin
      sFiltro := FFiltro.GetFiltro;
      with QOrdenCargaC do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' select * ');
        SQL.Add(' from frf_orden_carga_c ');
        SQL.Add(sFiltro);
        SQL.Add(' order by fecha_occ desc, status_occ, orden_occ desc ');
        try
          //Timer.Enabled:= False;
          QOrdenCargaC.DisableControls;
          Open;
        finally
          //Timer.Enabled:= True;
          QOrdenCargaC.EnableControls;
        end;
      end;
    end;
  finally
    FreeAndNil( FFiltro );
  end;
end;

procedure TFOrdenCarga.VisualizarOrden( const AOrden: string );
begin
  with QOrdenCargaC do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_orden_carga_c ');
    if AOrden <> '' then
    begin
      sFiltro:=  ' where orden_occ = ' + AOrden;
      SQL.Add( sFiltro );
    end;

    try
      //Timer.Enabled:= False;
      QOrdenCargaC.DisableControls;
      Open;
    finally
      //Timer.Enabled:= True;
      QOrdenCargaC.EnableControls;
    end;
  end;
end;

procedure TFOrdenCarga.RefrescarOrden( const AOrden: string );
begin
  with QOrdenCargaC do
  begin
    Close;
    try
      //Timer.Enabled:= False;
      QOrdenCargaC.DisableControls;
      Open;
      Locate('orden_occ', AOrden, []);
      HabilitarBarra;
    finally
      //Timer.Enabled:= True;
      QOrdenCargaC.EnableControls;
    end;
  end;
end;

procedure TFOrdenCarga.RefrescarDetalle;
begin
  with QOrdenCargaL do
  begin
    Close;
    Open;
  end;
end;

procedure TFOrdenCarga.empresa_occChange(Sender: TObject);
begin
  STempresa_occ.Caption:= DDescripciones.desEmpresa( empresa_occ.Text );
  STcentro_salida_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_salida_occ.Text );
  STcentro_destino_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_destino_occ.Text );
  //STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
  cliente_sal_occChange( cliente_sal_occ );
  STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
  STtransporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, transporte_occ.Text );
  SToperador_transporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, operador_transporte_occ.Text );
end;

procedure TFOrdenCarga.centro_salida_occChange(Sender: TObject);
begin
  STcentro_salida_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_salida_occ.Text );
end;

procedure TFOrdenCarga.centro_destino_occChange(Sender: TObject);
begin
  STcentro_destino_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_destino_occ.Text );

  if Trim( centro_destino_occ.Text ) <> '' then
  begin
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcliente_sal_occ.Clear;
      QOrdenCargaCdir_sum_occ.Clear;
      QOrdenCargaCcliente_fac_occ.Clear;
      QOrdenCargaCn_pedido_occ.Clear;
      QOrdenCargaCfecha_pedido_occ.Clear;
      //QOrdenCargaCporte_bonny_occ.AsInteger:= 1;
    end;
    cliente_sal_occ.Text:= '';
    dir_sum_occ.Text:= '';
    n_pedido_occ.Text:= '';
    fecha_pedido_occ.Text:= '';
    fecha_descarga_occ.Text:= '';

    cliente_sal_occ.TabStop:= False;
    dir_sum_occ.TabStop:= False;
    n_pedido_occ.TabStop:= False;
    fecha_pedido_occ.TabStop:= False;
    fecha_descarga_occ.TabStop:= False;
  end
  else
  begin
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] )then
    begin
      QOrdenCargaCcentro_destino_occ.Clear;
      //QOrdenCargaCporte_bonny_occ.AsInteger:= 0;
    end;
    centro_destino_occ.Text:= '';

    cliente_sal_occ.TabStop:= True;
    dir_sum_occ.TabStop:= True;
    n_pedido_occ.TabStop:= True;
    fecha_pedido_occ.TabStop:=True;
    fecha_descarga_occ.TabStop:= True;
  end;
end;

procedure TFOrdenCarga.cliente_sal_occChange(Sender: TObject);
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaCcliente_fac_occ.Value:= cliente_sal_occ.Text;

    STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );

    if ( QOrdenCargaC.State = dsInsert ) and ( STcliente_sal_occ.Caption <> '' ) then
    begin
         porte_bonny_occ.Checked:= DDescripciones.PorteCliente( empresa_occ.Text, cliente_sal_occ.Text ) = 0;
         if porte_bonny_occ.Checked then
           QOrdenCargaC.FieldByName('porte_bonny_occ').AsInteger:= 1
         else
           QOrdenCargaC.FieldByName('porte_bonny_occ').AsInteger:= 0;
    end;

    if ( STcliente_sal_occ.Caption <> '' ) and ( dir_sum_occ.Text = '' ) then
    begin
      dir_sum_occ.Text:= cliente_sal_occ.Text;
    end;

    if QOrdenCargaC.State in [dsEdit, dsInsert] then
    begin
      STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
    end;
  end
  else
  begin
    STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
    STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
  end;

  if Trim( cliente_sal_occ.Text ) = '' then
  begin
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcliente_sal_occ.Clear;
      QOrdenCargaCdir_sum_occ.Clear;
      QOrdenCargaCcliente_fac_occ.Clear;
      QOrdenCargaCn_pedido_occ.Clear;
      QOrdenCargaCfecha_pedido_occ.Clear;
    end;
    cliente_sal_occ.Text:= '';
    dir_sum_occ.Text:= '';
    n_pedido_occ.Text:= '';
    fecha_pedido_occ.Text:= '';
    fecha_descarga_occ.Text:= '';
  end
  else
  begin
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcentro_destino_occ.Clear;
    end;
    centro_destino_occ.Text:= '';

  end;
end;

procedure TFOrdenCarga.dir_sum_occEnter(Sender: TObject);
begin
  if STDir_sum_occ.Caption = '' then
  begin
    if ( STcliente_sal_occ.Caption <> '' ) then
    begin
      dir_sum_occ.Text:= cliente_sal_occ.Text;
    end;
  end;
end;

procedure TFOrdenCarga.dir_sum_occChange(Sender: TObject);
begin
  STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    if STDir_sum_occ.Caption <> '' then
    if ( Trim(nota_occ.Text) = '' ) then
    begin
      if ( empresa_occ.Text = '050' ) then
      begin
        nota_occ.Lines.Add('Mantener temperatura entre 8 y 10 grados.');
        nota_occ.Lines.Add('Temperatura de la carga: conforme.');
        if ( cliente_sal_occ.Text = 'MER' ) then
        begin
          //nota_occ.Lines.Add('TEMPERATURA OPTIMA DE +8 A +10 GRADOS.');
          nota_occ.Lines.Add('Equipo de frío en funcionamiento: SI.');
          if ( dir_sum_occ.Text = '2MN' ) then
          begin
            nota_occ.Lines.Add(UpperCase('La mercancía transportada realiza tráfico marítimo entre islas'));
          end;
        end
        else
        if ( cliente_sal_occ.Text = 'VTO' ) then
        begin
          nota_occ.Lines.Add(UpperCase('Mercancia procedente de producción controlada y certificada bajo el estándar de calidad Globalgap.'));
        end;
      end;
      nota_occ.Lines.Add('- El conductor confirma que la mercancía va sujeta por barras.');
      if ( centro_salida_occ.Text = '6' ) then
      begin
        nota_occ.Lines.Add('Equipo de frío activo ');
        nota_occ.Lines.Add('Temperatura de contenedor OK ');
        nota_occ.Lines.Add('Fruta preenfriada ');
      end;
      
    end;
  end;
end;

procedure TFOrdenCarga.transporte_occChange(Sender: TObject);
begin
  STtransporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, transporte_occ.Text );
end;

procedure TFOrdenCarga.operador_transporte_occChange(Sender: TObject);
begin
  SToperador_transporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, operador_transporte_occ.Text );
end;

procedure TFOrdenCarga.centro_origen_oclChange(Sender: TObject);
begin
  STCentro_origen_ocl.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_origen_ocl.Text );
end;

procedure TFOrdenCarga.producto_oclChange(Sender: TObject);
begin
  //SÓLO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  //if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
  //  Exit;

  STProducto_ocl.Caption:= DDescripciones.desProductoVenta( producto_ocl.Text );
  STCategoria_ocl.Caption:= DDescripciones.desCategoria( empresa_occ.Text, producto_ocl.Text, categoria_ocl.Text );
  STColor_ocl.Caption:= DDescripciones.desColor( empresa_occ.Text, producto_ocl.Text, color_ocl.Text );

  if envase_ocl.Text <> '' then
    envase_oclChange( envase_ocl );
end;

procedure TFOrdenCarga.producto_oclExit(Sender: TObject);
var
  AFecha : TDateTime;
begin
  with DOrdenCarga.QCambiarComercial do
  begin
    comercial_ocl.Text := '';
    AFecha := StrToDate(fecha_occ.Text);

    if Active then
    begin
      Cancel;
      Close;
    end;
    SQL.Clear;
    SQL.Add(' select cod_comercial_cc from frf_clientes_comercial ');
    SQL.Add(' where cod_cliente_cc = :cliente ');
    SQL.Add(' and cod_producto_cc = :producto ');
    SQL.Add(' and :fecha between fecha_ini_cc and nvl(fecha_fin_cc, ' + QuotedStr(datetostr(AFecha)) + ')');
    ParamByName('fecha').asDateTime := AFecha;
    ParamByName('cliente').asString := cliente_sal_occ.Text;
    ParamByName('producto').asString := producto_ocl.Text;
    Open;
    if isEmpty then
    begin
      if Active then
      begin
        Cancel;
        Close;
      end;
      SQL.Clear;
      SQL.Add(' select cod_comercial_cc from frf_clientes_comercial ');
      SQL.Add(' where cod_producto_cc = :producto');
      SQL.Add(' and :fecha between fecha_ini_cc and nvl(fecha_fin_cc, ' + QuotedStr(datetostr(AFecha)) + ')');
      ParamByName('fecha').asDateTime := AFecha;
      ParamByName('producto').asString := producto_ocl.Text;
      Open;
    end;
      if isEmpty then
      begin
        if Active then
        begin
          Cancel;
          Close;
        end;
        SQL.Clear;
        SQL.Add(' select cod_comercial_cc from frf_clientes_comercial ');
        SQL.Add(' where cod_cliente_cc = :cliente');
        SQL.Add(' and :fecha between fecha_ini_cc and nvl(fecha_fin_cc, ' + QuotedStr(datetostr(AFecha)) + ')');
        ParamByName('fecha').asDateTime := AFecha;
        ParamByName('cliente').asString := cliente_sal_occ.Text;
        Open;
      end;

      if isEmpty then
         comercial_ocl.Text := '000'
      else
        comercial_ocl.Text := FieldByName('cod_comercial_cc').AsString;

      Close;
  end;
end;

function desUnidad( const ATipoUnidad: String ): String;
begin
  if ATipoUnidad = 'K' then
  begin
    result:= 'KGS';
  end
  else
  if ATipoUnidad = 'C' then
  begin
    result:= 'CAJ';
  end
  else
  if ATipoUnidad = 'U' then
  begin
    result:= 'UND';
  end
  else
  begin
    result:= '';
  end;
end;

procedure TFOrdenCarga.envase_oclChange(Sender: TObject);
var
  sDescripcion: string;
  bAux: boolean;
begin
//SÓLO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;

  STEnvase_ocl.Caption:= DDescripciones.desEnvaseClienteEx( empresa_occ.Text, producto_ocl.Text, envase_ocl .Text, cliente_sal_occ.Text );

  if Length( envase_ocl.Text ) = 9 then
  begin

    DOrdenCarga.DatosEnvaseCliente( empresa_occ.Text, producto_ocl.Text, envase_ocl .Text, cliente_sal_occ.Text,
      bPesoVariableLinea, bUnidadesVariableLinea, rPesoCaja, iUnidadesCaja, sUnidadPrecioLinea, sDescripcion);

    if sUnidadPrecioLinea = '' then
    begin
      sUnidadPrecioLinea:= 'K';
    end;
    unidad_precio_ocl.Text:= desUnidad( sUnidadPrecioLinea );

    kilos_ocl.Enabled:= bPesoVariableLinea;
    unidades_caja_ocl.Enabled:= bUnidadesVariableLinea;

    if not bUnidadesVariableLinea or ( unidades_caja_ocl.Text = '' ) then
    begin
      bAux:= bFlagCambios;
      bFlagCambios:= False;
      unidades_caja_ocl.Text:= IntToStr( iUnidadesCaja );
      bFlagCambios:= bAux;
    end;

    //UNIDAD DE FACTURACION
    tipo_iva_ocl.Text:= rImpuestosActual.sCodigo;
    case DOrdenCarga.TipoIvaEnvaseProducto( empresa_occ.Text, envase_ocl.Text, producto_ocl.Text ) of
      0: rImpuestoLinea:= rImpuestosActual.rSuper;
      1: rImpuestoLinea:= rImpuestosActual.rReducido;
      else rImpuestoLinea:= rImpuestosActual.rGeneral;
    end;


    if bFlagCambios then
      RecalcularUnidades( sender );

  end;
end;

procedure TFOrdenCarga.envase_oclExit(Sender: TObject);
begin
  if EsNumerico(envase_ocl.Text) and (Length(envase_ocl.Text) <= 5) then
    if (envase_ocl.Text <> '' ) and (Length(envase_ocl.Text) < 9) then
      envase_ocl.Text := 'COM-' + Rellena( envase_ocl.Text, 5, '0');
end;

procedure TFOrdenCarga.marca_oclChange(Sender: TObject);
begin
  STMarca_ocl.Caption:= DDescripciones.desMarca( marca_ocl.Text );
end;


procedure TFOrdenCarga.mnuReconstruirOrden(Sender: TObject);
begin
  ReconstruirOrden(True);
end;

procedure TFOrdenCarga.ReconstruirOrden( APreguntar: boolean);
var sComercial: String;
begin
  if ( not APreguntar ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere reconstruir la orden nº. ' + QOrdenCargaCorden_occ.AsString + ' con lo cargado en el packing?' ),
                            'RECONSTRUIR ORDEN', MB_YESNO ) = IDYES ) then
  begin
    with DOrdenCarga.QAux do
    try
      SQL.Clear;
      SQL.Add(' select max(comercial_ocl) comercial_ocl from frf_orden_Carga_l ');
      SQL.Add('   where orden_ocl = :orden ');
      ParamByName('orden').AsInteger := QOrdenCargaCorden_occ.AsInteger;

      Open;
      sComercial := FieldByName('comercial_ocl').AsString;

    finally
      Close;
    end;

    if not DOrdenCarga.Database.InTransaction then
    begin
      DOrdenCarga.Database.StartTransaction;
      try
        with DOrdenCarga.QBorrarDetalle do
        begin
          ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
          ExecSQL;
        end;
        InsertarLineasOrden(sComercial);
        ActualizarEnvasePacking;
        DOrdenCarga.Database.Commit;
        QOrdenCargaL.Close;
        QOrdenCargaL.Open;
      except
        DOrdenCarga.Database.Rollback;
        Raise;
      end;
    end;
  end;
end;

procedure TFOrdenCarga.InsertarLineasOrden (AComercial: String);
var iNumLinea: integer;
    sDescripcion: string;
begin

  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                   cliente_sal_occ.Text, dir_sum_occ.Text, StrToDate( fecha_occ.Text ) );

  iNumLinea:= 1;
  with QPackingList do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_pl, envase_pl, producto_pl, nvl(categoria_pl, ''1'') categoria_pl, marca_pl, calibre_pl, color_pl, unidades_caja_pl, bestbefore_pl, ');
    SQL.Add(' sum(cajas_pl) cajas_pl, round(sum(peso_pl),2) peso_pl,                                                                                         ');
    SQL.Add('        count( distinct  ean128_pl ) palets_pl, tipo_palet_pl                                                                                   ');
    SQL.Add(' from frf_packing_list                                                                                                                          ');
    SQL.Add(' where orden_pl = :orden                                                                                                                        ');
    SQL.Add(' group by empresa_pl, envase_pl, producto_pl, categoria_pl, marca_pl, calibre_pl, color_pl, unidades_caja_pl, tipo_palet_pl, bestbefore_pl      ');
    SQL.Add(' order by empresa_pl, envase_pl, producto_pl, categoria_pl, marca_pl, calibre_pl, color_pl, unidades_caja_pl, bestbefore_pl                     ');

    ParamByName('orden').AsInteger := QOrdenCargaCorden_occ.AsInteger;
    QPackingList.Open;
    while not QPackingList.Eof  do
    begin
        DOrdenCarga.DatosEnvaseCliente( QPackingList.FieldByName('empresa_pl').AsString, QPackingList.FieldByName('producto_pl').AsString,
                                        QPackingList.FieldByName('envase_pl').AsString,  QOrdenCargaC.FieldByName('cliente_sal_occ').AsString,
                                        bPesoVariableLinea, bUnidadesVariableLinea, rPesoCaja, iUnidadesCaja, sUnidadPrecioLinea, sDescripcion);
        with qryLineaOrden do
        begin
          sql.clear;
          sql.Add(' insert into frf_orden_carga_l   ');
          sql.Add(' (orden_ocl, linea_ocl, empresa_ocl, centro_salida_ocl, n_albaran_ocl, fecha_ocl, centro_origen_ocl, producto_ocl, envase_ocl, ');
          sql.Add('  marca_ocl, categoria_ocl, calibre_ocl, color_ocl, unidades_caja_ocl, cajas_ocl, kilos_ocl,   ');
          sql.Add('  precio_ocl, unidad_precio_ocl, importe_neto_ocl, porc_iva_ocl, iva_ocl, importe_total_ocl, n_palets_ocl, tipo_palets_ocl, tipo_iva_ocl, ');
          sql.Add('  cliente_ocl, emp_procede_ocl, kilos_packing_ocl, cajas_packing_ocl, palets_packing_ocl, comercial_ocl  ');
//Opcionales
//          SQl.Add(' formato_cliente_ocl ');
//          SQL.Add(' ref_transitos_ocl, fecha_transito_ocl, ');
//          SQL.Add(' unidades_ocl ');
//          SQL.Add(' federacion_ocl ');
//          SQL.Add(' notas_ocl ');
          SQL.Add(' ) ');
          sql.Add(' values  ');
          sql.Add(' (:orden_ocl, :linea_ocl, :empresa_ocl, :centro_salida_ocl, :n_albaran_ocl, :fecha_ocl, :centro_origen_ocl, :producto_ocl, :envase_ocl,      ');
          sql.Add('  :marca_ocl, :categoria_ocl, :calibre_ocl, :color_ocl, :unidades_caja_ocl, :cajas_ocl, :kilos_ocl,        ');
          sql.Add('  :precio_ocl, :unidad_precio_ocl, :importe_neto_ocl, :porc_iva_ocl, :iva_ocl, :importe_total_ocl, :n_palets_ocl, :tipo_palets_ocl, :tipo_iva_ocl, ');
          sql.Add('  :cliente_ocl, :emp_procede_ocl, :kilos_packing_ocl, :cajas_packing_ocl, :palets_packing_ocl, :comercial_ocl                                      ');
//Opcionales
//          SQl.Add(' :formato_cliente_ocl ');
//          SQL.Add(' :ref_transitos_ocl, :fecha_transito_ocl, ');
//          SQL.Add(' :unidades_ocl ');
//          SQL.Add(' :federacion_ocl ');
//          SQL.Add(' :notas_ocl ');
          SQL.Add(' ) ');

          ParamByName('orden_ocl').AsInteger:= QOrdenCargaC.FieldByName('orden_occ').AsInteger;
          ParamByName('linea_ocl').AsInteger:= iNumLinea;
          ParamByName('empresa_ocl').AsString:= QOrdenCargaC.FieldByName('empresa_occ').AsString;
          ParamByName('centro_salida_ocl').AsString:= QOrdenCargaC.FieldByName('centro_salida_occ').AsString;
          ParamByName('n_albaran_ocl').AsInteger:= QOrdenCargaC.FieldByName('orden_occ').AsInteger;
          ParamByName('fecha_ocl').AsString:= QOrdenCargaC.FieldByName('fecha_occ').AsString;
          ParamByName('centro_origen_ocl').AsString:= QOrdenCargaC.FieldByName('centro_salida_occ').AsString;
          ParamByName('producto_ocl').AsString:= QPackingList.FieldByName('producto_pl').AsString;
//          ParamByName('formato_cliente_ocl').Value := null;
          ParamByName('envase_ocl').AsString:= QPackingList.FieldByName('envase_pl').AsString;
          ParamByName('marca_ocl').AsString:= QPackingList.FieldByName('marca_pl').AsString;
          ParamByName('categoria_ocl').AsString:= QPackingList.FieldByName('categoria_pl').AsString;;
          ParamByName('calibre_ocl').AsString:= QPackingList.FieldByName('calibre_pl').AsString;;
          ParamByName('color_ocl').AsString:= QPackingList.FieldByName('color_pl').AsString;;
//          ParamByName('ref_transitos_ocl').AsInteger:= null
//          ParamByName('fecha_transito_ocl').AsDateTime:= null
          ParamByName('unidades_caja_ocl').AsInteger:= QPackingList.FieldByName('unidades_caja_pl').AsInteger;
          ParamByName('cajas_ocl').AsInteger:= QPackingList.FieldByName('cajas_pl').AsInteger;

          if bPesoVariableLinea then
            ParamByName('kilos_ocl').AsFloat:= QPackingList.FieldByName('peso_pl').AsFloat
          else
            ParamByName('kilos_ocl').AsFloat:= QPackingList.FieldByName('cajas_pl').AsFloat * rPesoCaja;

          ParamByName('precio_ocl').AsFloat:= 0;
          ParamByName('unidad_precio_ocl').AsString:= ObtenerUnidadPrecio(QOrdenCargaC.FieldByName('empresa_occ').AsString,
                                                                          QOrdenCargaC.FieldByName('cliente_sal_occ').AsString,
                                                                          QPackingList.FieldByName('producto_pl').AsString,
                                                                          QPackingList.FieldByName('envase_pl').AsString);
          ParamByName('importe_neto_ocl').AsFloat:= 0;

          case DOrdenCarga.TipoIvaEnvaseProducto( QOrdenCargaC.FieldByName('empresa_occ').AsString,
                                                  QPackingList.FieldByName('envase_pl').AsString,
                                                  QPackingList.FieldByName('producto_pl').AsString ) of
            0: rImpuestoLinea:= rImpuestosActual.rSuper;
            1: rImpuestoLinea:= rImpuestosActual.rReducido;
            else rImpuestoLinea:= rImpuestosActual.rGeneral;
          end;
          ParamByName('porc_iva_ocl').Asfloat:= rImpuestoLinea;
          ParamByName('iva_ocl').AsFloat:= 0;
          ParamByName('importe_total_ocl').Asfloat:= 0;
          ParamByName('n_palets_ocl').AsInteger:= QPackingList.FieldByName('palets_pl').AsInteger;
          ParamByName('tipo_palets_ocl').AsString:= QPackingList.FieldByName('tipo_palet_pl').AsString;
          ParamByName('tipo_iva_ocl').AsString:= DOrdenCarga.ImpuestosEntre(QOrdenCargaC.FieldByName('empresa_occ').AsString,
                                                                            QOrdenCargaC.FieldByName('centro_salida_occ').AsString,
                                                                            QOrdenCargaC.FieldByName('cliente_sal_occ').AsString,
                                                                            QOrdenCargaC.FieldByName('dir_sum_occ').AsString);
//          ParamByName('federacion_ocl').AsString:= null;
          ParamByName('cliente_ocl').AsString:= QOrdenCargaC.FieldByName('cliente_sal_occ').AsString;
          ParamByName('emp_procede_ocl').AsString:= QOrdenCargaC.FieldByName('empresa_occ').AsString;
          ParamByName('kilos_packing_ocl').Asfloat:= QPackingList.FieldByName('peso_pl').AsFloat;
          ParamByName('cajas_packing_ocl').AsInteger:= QPackingList.FieldByName('cajas_pl').AsInteger;
          ParamByName('palets_packing_ocl').AsInteger:= QPackingList.FieldByName('palets_pl').AsInteger;
          ParamByName('comercial_ocl').AsString:= AComercial;
//          ParamByName('notas_ocl').AsString:= null;

          ExecSQL;
        end;

      iNumLinea := iNumLinea + 1;
      QPackingList.Next;
    end;
  end;
end;

procedure TFOrdenCarga.ActualizarEnvasePacking;
begin
  with QPackingList do
  begin
    SQL.Clear;
    SQL.Add(' update frf_packing_list set envase_orden_pl = envase_pl ');
    SQL.Add('  where orden_pl = :orden                                ');

    ParamByName('orden').AsInteger := QOrdenCargaCorden_occ.AsInteger;

    ExecSQL;
  end;
end;

function TFOrdenCarga.ObtenerUnidadPrecio (AEmpresa, ACliente, AProducto, AEnvase: string): string;
var sTipoUnidad: String;
begin
  with DOrdenCarga.QAux do
  try
    SQL.Clear;
    SQL.Add(' select unidad_fac_ce  from frf_clientes_env    ');
    SQL.Add(' where empresa_ce = :emp and producto_ce = :pro ');
    SQL.Add(' and envase_ce = :env and cliente_ce = :cli     ');

    ParamByName('emp').AsString := AEmpresa;
    ParamByName('cli').AsString := ACliente;
    ParamByName('pro').AsString := AProducto;
    ParamByName('env').AsString := AEnvase;

    Open;
    if IsEmpty then
      sTipoUnidad := 'K'
    else
      sTipoUnidad := FieldByName('unidad_fac_ce').AsString;
  finally
    Close;
  end;

  Result := desUnidad ( sTipoUnidad );
end;

procedure TFOrdenCarga.categoria_oclChange(Sender: TObject);
begin
  STCategoria_ocl.Caption:= DDescripciones.desCategoria( empresa_occ.Text, producto_ocl.Text, categoria_ocl.Text );
end;

procedure TFOrdenCarga.color_oclChange(Sender: TObject);
begin
  STColor_ocl.Caption:= DDescripciones.desColor( empresa_occ.Text, producto_ocl.Text, color_ocl.Text );
end;

procedure TFOrdenCarga.tbImportarClick(Sender: TObject);
begin
  try
    FImportarOrdenes := TFImportarOrdenes.Create(Self, DOrdenCarga.Database, CentroDTO);
    FImportarOrdenes.ShowModal;
  finally
    FreeAndNil(FImportarOrdenes);
  end;
end;

procedure TFOrdenCarga.tipo_palets_oclChange(Sender: TObject);
begin
  stTipoPalet.Caption:= DDescripciones.desTipoPalet( tipo_palets_ocl.Text );
end;

procedure TFOrdenCarga.comercial_oclChange(Sender: TObject);
begin
  txtComercial.Caption:= DDescripciones.desComercial( comercial_ocl.Text );
end;

procedure TFOrdenCarga.BGBEmpresa_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= empresa_occ.Text;
  if SeleccionaEmpresa( self, empresa_occ, sAux ) then
    empresa_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCentro_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= centro_salida_occ.Text;
  if SeleccionaCentro( self, centro_salida_occ, empresa_occ.text, sAux ) then
    centro_salida_occ.Text:= sAux;
end;


procedure TFOrdenCarga.BGBCentro_destino_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= centro_destino_occ.Text;
  if SeleccionaCentro( self, centro_destino_occ, empresa_occ.text, sAux ) then
    centro_destino_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BCancelarExecute(Sender: TObject);
begin
  if btnCancelar.Enabled then
      btnCancelar.Click
  else
      btnCerrarClick(Self);
end;

procedure TFOrdenCarga.BCBFecha_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= fecha_occ.Text;
  if PonFecha( self, fecha_occ, fecha_occ.Text, sAux ) then
    fecha_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BCBFecha_transito_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= fecha_transito_ocl.Text;
  if PonFecha( self, fecha_transito_ocl, fecha_transito_ocl.Text, sAux ) then
    fecha_transito_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCliente_sal_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= cliente_sal_occ.Text;
  if UFClientes.SeleccionaClientes( self, cliente_sal_occ, empresa_occ.text, sAux ) then
    cliente_sal_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBDir_sum_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= dir_sum_occ.Text;
  if UFSuministros.SeleccionaSuministros( self, dir_sum_occ, empresa_occ.text, cliente_sal_occ.text, sAux ) then
    dir_sum_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBtransporte_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= transporte_occ.Text;
  if SeleccionaTransportista( self, transporte_occ, empresa_occ.text, sAux ) then
    transporte_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBoperador_transporte_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= operador_transporte_occ.Text;
  if SeleccionaTransportista( self, operador_transporte_occ, empresa_occ.text, sAux ) then
    operador_transporte_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCentro_origen_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Centro_origen_ocl.Text;
  if SeleccionaCentro( self, Centro_origen_ocl, empresa_occ.text, sAux ) then
    Centro_origen_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBProducto_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Producto_ocl.Text;
  if SeleccionaProducto( self, Producto_ocl, empresa_occ.text, sAux ) then
    Producto_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBEnvase_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Envase_ocl.Text;
  if SeleccionaEnvaseCliente( self,envase_ocl, empresa_occ.Text, producto_ocl.Text, cliente_sal_occ.Text, sAux ) then
    Envase_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBMarca_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Marca_ocl.Text;
  if SeleccionaMarca( self, Marca_ocl, sAux ) then
    Marca_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCalibre_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Calibre_ocl.Text;
  if SeleccionaCalibre( self, Calibre_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Calibre_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCategoria_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Categoria_ocl.Text;
  if SeleccionaCategoria( self, Categoria_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Categoria_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBTipo_Palet_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= tipo_palets_ocl.Text;
  if SeleccionaPalet( self, tipo_palets_ocl, sAux ) then
    tipo_palets_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.btnComercialClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= comercial_ocl.Text;
  if SeleccionaComercial( self, comercial_ocl,  sAux ) then
    comercial_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBColor_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Color_ocl.Text;
  if SeleccionaColor( self, Color_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Color_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.QOrdenCargaCAfterEdit(DataSet: TDataSet);
begin
  //Guardar datos cabecera
  sEmpresaActual:= empresa_occ.Text;
  sCentroActual:= centro_salida_occ.Text;
  sFechaActual:= fecha_occ.Text;
  sClienteActual:= cliente_sal_occ.Text;
  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( sEmpresaActual, sCentroActual, sClienteActual, dir_sum_occ.Text, StrToDate( fecha_occ.Text ) );
end;

procedure TFOrdenCarga.QOrdenCargaCBeforePost(DataSet: TDataSet);
var
  dAuxDate, dDescarga, dFecPedido: TDateTime;
begin
  //Comprobar que la fecha se correcta
  if not TryStrTodate( fecha_occ.Text, dAuxDate ) then
  begin
    ShowMessage('Fecha incorrecta.');
    if fecha_occ.CanFocus then
      fecha_occ.SetFocus;
    Abort;
  end;

  if ( hora_occ.Text <> '' ) and ( ( Length( hora_occ.Text ) < 5 ) or  ( Copy( hora_occ.Text, 3, 1 ) <> ':' ) ) then
  begin
    ShowMessage('El formato de la hora de entrada no es correcto (hh:mm).');
    if hora_occ.CanFocus then
      hora_occ.SetFocus;
    Abort;
  end;

  //fecha pedido
  //Fecha de pedido obligatoria para el cliente Sainsbury - Campo obligatorio en ficheros EDI 13/11/2018
  if (cliente_sal_occ.Text = 'JS') and (fecha_pedido_occ.Text = '') then
  begin
    ShowMessage('Para el cliente ' + cliente_sal_occ.Text + ' es obligatorio la fecha de pedido.');
    if fecha_pedido_occ.CanFocus then
        fecha_pedido_occ.SetFocus;
    Abort;
  end;
  if fecha_pedido_occ.Text <> '' then
  begin
    if TryStrTodate( fecha_pedido_occ.Text, dFecPedido ) then
    begin
      if dFecPedido > dAuxDate then
      begin
        ShowMessage('Fecha de pedido debe de ser menor o igual a la fecha del albaran.');
        if fecha_pedido_occ.CanFocus then
          fecha_pedido_occ.SetFocus;
        Abort;
      end;
    end
    else
    begin
      ShowMessage('Fecha pedido incorrecta.');
      if fecha_pedido_occ.CanFocus then
        fecha_pedido_occ.SetFocus;
      Abort;
    end;
  end;


  //fecha descarga
  if fecha_descarga_occ.Text <> '' then
  begin
    if TryStrTodate( fecha_descarga_occ.Text, dDescarga ) then
    begin
      if dDescarga < dAuxDate then
      begin
        ShowMessage('Fecha de descarga debe de ser superior o igual a la de descarga.');
        if fecha_descarga_occ.CanFocus then
          fecha_descarga_occ.SetFocus;
        Abort;
      end;
    end
    else
    begin
      ShowMessage('Fecha descarga incorrecta.');
      if fecha_descarga_occ.CanFocus then
        fecha_descarga_occ.SetFocus;
      Abort;
    end;
  end;

  //Comprobar que la direccion de suministro sea correcta
  if Trim( centro_destino_occ.Text ) = '' then
  begin
    if Trim( cliente_sal_occ.Text ) = '' then
    begin
      ShowMessage('Tanto el código del cliente, la direccion de suministro y a quien facturamos son de obligada inserción.');
      if cliente_sal_occ.CanFocus then
        cliente_sal_occ.SetFocus;
      Abort;
    end;
    if Trim( dir_sum_occ.Text ) = '' then
    begin
      ShowMessage('Tanto el código del cliente, la direccion de suministro y a quien facturamos son de obligada inserción.');
      if dir_sum_occ.CanFocus then
        dir_sum_occ.SetFocus;
      Abort;
    end;
    if not DOrdenCarga.EsDirSuministroValida( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text ) then
    begin
      ShowMessage('Direccion de suministro incorrecta.');
      if dir_sum_occ.CanFocus then
        dir_sum_occ.SetFocus;
      Abort;
    end;
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcentro_destino_occ.Clear;
    end;
    centro_destino_occ.Text:= '';
  end
  else
  begin
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcliente_sal_occ.Clear;
      QOrdenCargaCdir_sum_occ.Clear;
      QOrdenCargaCcliente_fac_occ.Clear;
    end;
    cliente_sal_occ.Text:= '';
    dir_sum_occ.Text:= '';
    //n_pedido_occ.Text:= '';
  end;
  //El transporte es obligatorio
  if Trim( transporte_occ.Text ) = '' then
  begin
    ShowMessage('Falta transporte.');
    if transporte_occ.CanFocus then
      transporte_occ.SetFocus;
    Abort;
  end;
  if Trim( operador_transporte_occ.Text ) = '' then
  begin
    operador_transporte_occ.Text:= transporte_occ.Text;
    QOrdenCargaCoperador_transporte_occ.AsString:= transporte_occ.Text;
  end;
  if porte_bonny_occ.State = cbGrayed then
  begin
    ShowMessage('Falta seleccionar quien paga el porte.');
    Abort;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaCAfterPost(DataSet: TDataSet);
var
  rImpuestosAux: TImpuesto;
begin
  //Ver si hay que hacer cambios en los detalles
  if EstadoActual = kEditarCabecera then
  begin
    if sEmpresaActual <> empresa_occ.Text then
    begin
      DOrdenCarga.CambiarEmpresaDetalle( StrToInt( orden_occ.Text ), empresa_occ.Text );
    end;
    if sCentroActual <> centro_salida_occ.Text then
    begin
      DOrdenCarga.CambiarCentroDetalle( StrToInt( orden_occ.Text ), centro_salida_occ.Text );
    end;
    if sFechaActual <> fecha_occ.Text then
    begin
      DOrdenCarga.CambiarFechaDetalle( StrToInt( orden_occ.Text ), StrToDate( fecha_occ.Text ) );
    end;
    if sClienteActual <> cliente_sal_occ.Text then
    begin
      DOrdenCarga.CambiarClienteDetalle( StrToInt( orden_occ.Text ), cliente_sal_occ.Text );
    end;
    rImpuestosAux:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text, StrToDate( fecha_occ.Text ) );
    if ( rImpuestosActual.sCodigo <> rImpuestosAux.sCodigo ) or
       ( rImpuestosActual.sTipo <> rImpuestosAux.sTipo )  then
    begin
      DOrdenCarga.CambiarImpuestoDetalle( StrToInt( orden_occ.Text ), rImpuestosAux );
    end;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaLBeforePost(DataSet: TDataSet);
var
  sMsg: String;
begin
  if Trim( centro_origen_ocl.Text ) = '' then
  begin
    ShowMessage('El centro de origen es de obligada inserción.');
    if centro_origen_ocl.CanFocus then
      centro_origen_ocl.SetFocus;
    Abort;
  end;

  if Trim( producto_ocl.Text ) = '' then
  begin
    ShowMessage('El producto es de obligada inserción.');
    if producto_ocl.CanFocus then
      producto_ocl.SetFocus;
    Abort;
  end;

  if Trim( STProducto_ocl.Caption ) =  '' then
  begin
    if not DDescripciones.EsProductoAlta( producto_ocl.Text) then
      raise Exception.Create(' ATENCIÓN: Error al grabar la linea, el producto está dado de BAJA. ')
    else if not DDescripciones.EsProductoVenta(producto_ocl.Text) then
      raise Exception.Create(' ATENCIÓN: Error al grabar la linea, el producto NO está marcado como Producto de Venta. ')
    else
      raise Exception.Create('Falta el producto o es incorrecto.');
  end;

  if Trim( envase_ocl.Text ) = '' then
  begin
    ShowMessage('El envase es de obligada inserción.');
    if envase_ocl.CanFocus then
      envase_ocl.SetFocus;
    Abort;
  end;

  with DOrdenCarga.QAux do
  begin
    Close;
    SQL.Clear;
    SQl.Add(' Select * from frf_envases ');
    SQl.Add(' where envase_e = ' + QuotedStr( envase_ocl.Text ) );
    SQl.Add(' and producto_e = ' + QuotedStr( producto_ocl.Text ) );
    SQl.Add('   and fecha_baja_e is not null ');
    Open;
    if not IsEmpty then
    begin
      Close;
      ShowMessage('No se pueden usar los envases que han sido dados de baja.');
      Abort;
    end
    else
    begin
      Close;
    end;
  end;

  //29-12-2011 Garita La font
  if ( ( categoria_ocl.Text = '1' ) and ( ( marca_ocl.Text <> '01' ) and ( marca_ocl.Text <> '23' ) and ( marca_ocl.Text <> '24' ) ) ) or
     ( ( categoria_ocl.Text <> '1' ) and ( marca_ocl.Text = '01' ) ) or
     ( ( categoria_ocl.Text = '2' ) and ( marca_ocl.Text <> '00' ) ) or
     ( ( categoria_ocl.Text <> '2' ) and ( marca_ocl.Text = '00' ) ) then
  begin
      if application.MessageBox(PChar('Esta usted seguro de querer asignar a la categoria ' + categoria_ocl.text + ' la marca '  + STMarca_ocl.Caption + '?'),
              '  ATENCIÓN !', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDNO then
        Abort;
  end;

  if Trim( marca_ocl.Text ) = '' then
  begin
    ShowMessage('La marca es de obligada inserción.');
    if marca_ocl.CanFocus then
      marca_ocl.SetFocus;
    Abort;
  end;

  if Trim( calibre_ocl.Text ) = '' then
  begin
    ShowMessage('El calibre es de obligada inserción.');
    if calibre_ocl.CanFocus then
      calibre_ocl.SetFocus;
    Abort;
  end;

  if Trim( categoria_ocl.Text ) = '' then
  begin
    ShowMessage('La categoria es de obligada inserción.');
    if categoria_ocl.CanFocus then
      categoria_ocl.SetFocus;
    Abort;
  end;

  if Trim( color_ocl.Text ) = '' then
  begin
    ShowMessage('El color es de obligada inserción.');
    if color_ocl.CanFocus then
      color_ocl.SetFocus;
    Abort;
  end;

  if Trim( txtComercial.Caption ) = '' then
  begin
    ShowMessage('Falta el código del comercial o es incorrecto.');
    if comercial_ocl.CanFocus then
      comercial_ocl.SetFocus;
    Abort;
  end;

  if Trim( cajas_ocl.Text ) = '' then
  begin
    ShowMessage('Las cajas son de obligada inserción.');
    if cajas_ocl.CanFocus then
      cajas_ocl.SetFocus;
    Abort;
  end;

  if unidades_caja_ocl.Enabled and ( StrToIntDef( unidades_caja_ocl.Text, 0 ) = 0 ) then
  begin
    //Unidades variables, informar si la cantidad de cajas = 0
    if MessageDlg('El envase seleccionado es de unidades variable y la unidades por cajas son 0, ¿es correcto?.',
                  mtWarning,[mbYes, mbNo],0 ) = mrNO then
    begin
      if unidades_caja_ocl.CanFocus then
        unidades_caja_ocl.SetFocus;
      Abort;
    end;
  end;


  if Trim( kilos_ocl.Text ) = '' then
  begin
    ShowMessage('Los kilos son de obligada inserción.');
    if kilos_ocl.CanFocus then
      kilos_ocl.SetFocus;
    Abort;
  end;

  if ( Trim( n_palets_ocl.Text ) = '' ) then
  begin
    ShowMessage('Los palets son de obligada inserción.');
    if n_palets_ocl.CanFocus then
      n_palets_ocl.SetFocus;
    Abort;
  end;
  (*
  else
  begin
    if ( StrToInt( n_palets_ocl.Text ) < 1 ) then
    begin
      ShowMessage('Tiene que haber por lo menos un palet.');
      if n_palets_ocl.CanFocus then
        n_palets_ocl.SetFocus;
      Abort;
    end;
  end;
  *)

  if ( Trim( tipo_palets_ocl.Text ) = '' ) then
  begin
    ShowMessage('El tipo de palet es de obligada inserción.');
    if tipo_palets_ocl.CanFocus then
      tipo_palets_ocl.SetFocus;
    Abort;
  end;

  QOrdenCargaLemp_procede_ocl.AsString:= QOrdenCargaCempresa_occ.AsString;
  //Transito correcto
  if Trim( ref_transitos_ocl.Text ) <> '' then
  begin
    if centro_origen_ocl.Text = '' then
    begin
      ShowMessage( 'Para identificar el tránsito es necesario el centro, número de referencia y fecha.');
      if centro_origen_ocl.CanFocus then
        centro_origen_ocl.SetFocus;
      Abort;
    end;
    if fecha_transito_ocl.Text = '' then
    begin
      ShowMessage( 'Para identificar el tránsito es necesario el centro, número de referencia y fecha.');
      if fecha_transito_ocl.CanFocus then
        fecha_transito_ocl.SetFocus;
      Abort;
    end;
    if not DOrdenCarga.EsTransitoCorrecto( empresa_occ.Text, centro_origen_ocl.Text, StrToIntDef(ref_transitos_ocl.Text,0),
         StrToDateDef(fecha_transito_ocl.Text, Date), producto_ocl.Text, strToFloatDef( kilos_ocl.Text, 0 ), rKilosAnterior, sMsg ) then
    begin
      ShowMessage( sMsg );
      if ref_transitos_ocl.CanFocus then
        ref_transitos_ocl.SetFocus;
      Abort;
    end;
  end
  else
  begin
    if ( QOrdenCargaL.Active ) and ( QOrdenCargaL.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaLfecha_transito_ocl.Clear;
    end;
    fecha_transito_ocl.Text:= '';

    if centro_origen_ocl.Text = '' then
    begin
      centro_origen_ocl.Text:= centro_salida_occ.Text;
    end
    else
    if centro_origen_ocl.Text <> centro_salida_occ.Text then
    begin
      ShowMessage( 'El centro de origen solo puede ser distinto del de salida si el producto proviene de un transito.');
      if centro_origen_ocl.CanFocus then
        centro_origen_ocl.SetFocus;
      Abort;
    end;
  end;

  //Integridad con el packing list
  if QOrdenCargaL.State = dsEdit then
  if not DOrdenCarga.ComprobarIntegridadLinea( QOrdenCargaLorden_ocl.AsInteger, QOrdenCargaLlinea_ocl.AsInteger,
    QOrdenCargaLempresa_ocl.AsString, QOrdenCargaLproducto_ocl.AsString, QOrdenCargaLenvase_ocl.AsString,
    QOrdenCargaLcajas_ocl.AsInteger, QOrdenCargaLn_palets_ocl.AsInteger ) then
  begin
    if Application.MessageBox('Integridad con el Packing List rota, hay mas cajas y/o palets en el camión que en la orden de carga.' + #13 + #10 +
                              '¿Esta seguro de querer continuar con la grabación?      ', 'AVISO PACKING LIST', mb_yesno) = idno then
      Abort;
  end;

  //Envase correcto
  if not DOrdenCarga.IsEnvaseCorrecto( empresa_occ.Text, producto_ocl.Text, envase_ocl.Text ) then
  begin
    ShowMessage('El envase no es correcto para el producto seleccionado.      ');
      if producto_ocl.CanFocus then
        producto_ocl.SetFocus;
    Abort;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaLAfterPost(DataSet: TDataSet);
begin
  //Actualizar numero de palets
  DOrdenCarga.UpdatePaletsCab( DataSet.FieldByName('orden_ocl').AsInteger );
  RefrescarOrden( DataSet.FieldByName('orden_ocl').AsString );
end;

procedure TFOrdenCarga.QOrdenCargaLAfterInsert(DataSet: TDataSet);
begin
  QOrdenCargaLorden_ocl.AsInteger:= QOrdenCargaCorden_occ.AsInteger;
  QOrdenCargaLlinea_ocl.AsInteger:= DOrdenCarga.GetLineaOrden( QOrdenCargaCorden_occ.AsInteger ) + 1;

  QOrdenCargaLempresa_ocl.AsString:= QOrdenCargaCempresa_occ.AsString;
  QOrdenCargaLcentro_salida_ocl.AsString:= QOrdenCargaCcentro_salida_occ.AsString;
  QOrdenCargaLn_albaran_ocl.AsInteger:= QOrdenCargaCn_albaran_occ.AsInteger;
  QOrdenCargaLfecha_ocl.AsDateTime:= QOrdenCargaCfecha_occ.AsDateTime;

  QOrdenCargaLcliente_ocl.AsString:= QOrdenCargaCcliente_sal_occ.AsString;

  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text, StrToDate( fecha_occ.Text ) );
  Lporc_iva_ocl.Caption:= '% ' + rImpuestosActual.sTipo;

  QOrdenCargaLporc_iva_ocl.AsFloat:= 0;
  QOrdenCargaLtipo_iva_ocl.AsString:= rImpuestosActual.sCodigo;

  bFlagCambios:= False;

  QOrdenCargaLunidades_caja_ocl.AsInteger:= 1;
  QOrdenCargaLcajas_ocl.AsInteger:= 0;
  QOrdenCargaLkilos_ocl.AsInteger:= 0;
  QOrdenCargaLprecio_ocl.AsInteger:= 0;
  QOrdenCargaLporc_iva_ocl.AsInteger:= 0;
  QOrdenCargaLiva_ocl.AsInteger:= 0;
  QOrdenCargaLimporte_neto_ocl.AsInteger:= 0;
  QOrdenCargaLimporte_total_ocl.AsInteger:= 0;
  STUnidades.Caption:= '0';
  QOrdenCargaLn_palets_ocl.AsInteger:= 1;

  QOrdenCargaLcentro_origen_ocl.AsString:= QOrdenCargaCcentro_salida_occ.AsString;
  centro_origen_ocl.Text:= centro_salida_occ.Text;

  bFlagCambios:= True;
  RecalcularUnidades( envase_ocl );
end;

procedure TFOrdenCarga.QOrdenCargaLAfterEdit(DataSet: TDataSet);
var
  iUnidadesLinea, iCajasLinea: Integer;
  sDescripcion: string;
begin
  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text, StrToDate( fecha_occ.Text ) );

  STEnvase_OCl.Caption := DDescripciones.desEnvaseClienteEx( empresa_occ.Text, producto_ocl.Text, envase_ocl .Text, cliente_sal_occ.Text );

  DOrdenCarga.DatosEnvaseCliente( empresa_occ.Text, producto_ocl.Text, envase_ocl .Text, cliente_sal_occ.Text,
      bPesoVariableLinea, bUnidadesVariableLinea, rPesoCaja, iUnidadesCaja, sUnidadPrecioLinea, sDescripcion);

  if sUnidadPrecioLinea = '' then
  begin
    sUnidadPrecioLinea:= 'K';
  end;
  unidad_precio_ocl.Text:= desUnidad( sUnidadPrecioLinea );

  kilos_ocl.Enabled:= bPesoVariableLinea;
  unidades_caja_ocl.Enabled:= bUnidadesVariableLinea;

  if not bUnidadesVariableLinea or ( unidades_caja_ocl.Text = '' ) then
  begin
    unidades_caja_ocl.Text:= IntToStr( iUnidadesCaja );
  end;

  tipo_iva_ocl.Text:= rImpuestosActual.sCodigo;
  case DOrdenCarga.TipoIvaEnvaseProducto( empresa_occ.Text, envase_ocl.Text, producto_ocl.Text ) of
    0: rImpuestoLinea:= rImpuestosActual.rSuper;
    1: rImpuestoLinea:= rImpuestosActual.rReducido;
    else rImpuestoLinea:= rImpuestosActual.rGeneral;
  end;


  iCajasLinea:= StrToIntDef( cajas_ocl.Text, 0);
  iUnidadesLinea:= iCajasLinea * iUnidadesCaja;
  STUnidades.Caption := FormatFloat('#0', iUnidadesLinea );
end;

procedure TFOrdenCarga.cajas_oclChange(Sender: TObject);
begin
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if ( QOrdenCargaL.State in [dsInsert, dsEdit] ) and bFlagCambios then
    RecalcularUnidades( sender );
end;

procedure TFOrdenCarga.unidades_caja_oclChange(Sender: TObject);
begin
  //SÓLO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if ( QOrdenCargaL.State in [dsInsert, dsEdit] ) and bFlagCambios then
    RecalcularUnidades( sender );
end;

procedure TFOrdenCarga.kilos_oclChange(Sender: TObject);
begin
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if ( QOrdenCargaL.State in [dsInsert, dsEdit] ) and bFlagCambios then
    RecalcularUnidades( sender );
end;

procedure TFOrdenCarga.precio_oclChange(Sender: TObject);
begin
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if ( QOrdenCargaL.State in [dsInsert, dsEdit] ) and bFlagCambios then
    RecalcularUnidades( sender );
end;

procedure TFOrdenCarga.importe_neto_oclChange(Sender: TObject);
begin
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;
  if ( QOrdenCargaL.State in [dsInsert, dsEdit] ) and bFlagCambios then
    RecalcularUnidades( sender, True );
end;

procedure TFOrdenCarga.ConstruirFiltro;
var
  sAux: string;
begin
  sAux:= '';
  if mnuCreadas.Checked then
  begin
    sAux:= ' ( status_occ = 0 ) ';
  end;
  if mnuActivas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 1 ) ';
  end;
  if mnuInicializadas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 2 ) ';
  end;
  if mnuFinalizadas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 3 ) ';
  end;
  if sAux <> '' then
  begin
    QOrdenCargaC.Filtered:= True;
    QOrdenCargaC.Filter:= sAux;
  end
  else
  begin
    QOrdenCargaC.Filtered:= False;
  end;
  HabilitarBarra;
end;

procedure TFOrdenCarga.ref_transitos_oclChange(Sender: TObject);
begin
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    if Trim(ref_transitos_ocl.Text) <> '' then
    begin
      fecha_occ.TabStop:= True;
    end
    else
    begin
      fecha_occ.TabStop:= False;
    end;
  end;
  (*TODO*)
  (*EXTRAER LA FECHA Y CENTRO DEL TRANSITO*)
end;

procedure TFOrdenCarga.btnResumenClick(Sender: TObject);
begin
  try
    if QOrdenCargaC.Active then
    begin
      if not QOrdenCargaC.IsEmpty then
      begin
        RefrescarOrden( QOrdenCargaCorden_occ.AsString );
      end;
    end;
    QOrdenCargaL.Close;
    UFResumen.VerResumenOrdenes( Self );
  finally
    QOrdenCargaL.Open;
  end;

  if QOrdenCargaC.Active then
  begin
    if not QOrdenCargaC.IsEmpty then
    begin
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    end;
  end;
end;

procedure TFOrdenCarga.porte_bonny_occEnter(Sender: TObject);
begin
  TDBCheckBox(Sender).Color:= clMoneyGreen;
end;

procedure TFOrdenCarga.porte_bonny_occExit(Sender: TObject);
begin
  TDBCheckBox(Sender).Color:= clBtnFace;
end;

procedure TFOrdenCarga.mnuEnviarCorreoClick(Sender: TObject);
var
  sFileName: string;
begin
  sFileName:= DOrdenCarga.sDirTemp + 'Orden' + orden_occ.Text + '.pdf';

  GuardarOrden( self, StrToInt( orden_occ.Text ), sFileName );
  if FileExists( sFileName ) then
  begin
    AFQuickMail.TextToSend.Clear;
    AFQuickMail.TextToSend.Add('Envío como adjunto la orden nº ' + orden_occ.Text + '.');
    AFQuickMail.Subject:= 'Orden de carga Nº ' + orden_occ.Text;
    AFQuickMail.FileNames.Clear;
    AFQuickMail.FileNames.Add( sFileName );
    try
      AFQuickMail.Execute;
    finally
      if FileExists( sFileName ) then
       DeleteFile( sFileName );
    end;
  end
  else
  begin
    ShowMessage('Problemas al generar el ficheo PDF.');
  end;
end;

procedure TFOrdenCarga.ssEnvaseAntesEjecutar(Sender: TObject);
begin
    ssEnvase.SQLAdi := '';
    if producto_ocl.Text <> '' then
      ssEnvase.SQLAdi := ' producto_e = ' +  QuotedStr(producto_ocl.Text);
end;

procedure TFOrdenCarga.status_occChange(Sender: TObject);
begin
  case QOrdenCargaCstatus_occ.AsInteger of
    0:
    begin
      Shape1.Pen.Color:= clBlack;
      des_status_occ.Font.Color:= clBlack;
    end;
    1:
    begin
       Shape1.Pen.Color:= clGreen;
       des_status_occ.Font.Color:= clGreen;
    end;
    2:
    begin
      Shape1.Pen.Color:= clBlue;
      des_status_occ.Font.Color:= clBlue;
    end;
    3:
    begin
      Shape1.Pen.Color:= clRed;
      des_status_occ.Font.Color:= clRed;
    end;
    else
    begin
      Shape1.Pen.Color:= clWhite;
      des_status_occ.Font.Color:= clWhite;
    end;
  end;
end;

procedure TFOrdenCarga.UnirTransito;
begin
  UFAsignarTransito.Execute( Self, orden_occ.Text, empresa_occ.Text, STEmpresa_occ.Caption,
                            centro_salida_occ.Text, STCentro_salida_occ.Caption,
                            centro_destino_occ.Text, STcentro_destino_occ.Caption, fecha_occ.Text );
end;

procedure TFOrdenCarga.UnirAlbaran;
begin
  UFAsignarAlbaran.Execute( Self, orden_occ.Text, empresa_occ.Text, STEmpresa_occ.Caption,
                            centro_salida_occ.Text, STCentro_salida_occ.Caption,
                            cliente_sal_occ.Text, STCliente_sal_occ.Caption,
                            dir_sum_occ.Text, STDir_sum_occ.Caption, fecha_occ.Text );
end;

procedure TFOrdenCarga.dir_sum_occExit(Sender: TObject);
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    if STDir_sum_occ.Caption <> '' then
    if ( Trim(nota_occ.Text) = '' ) then
    begin
      if ( empresa_occ.Text = '050' ) then
      begin
        nota_occ.Lines.Add('Mantener temperatura entre 8 y 10 grados.');
        if ( cliente_sal_occ.Text = 'MER' ) then
        begin
          //nota_occ.Lines.Add('TEMPERATURA OPTIMA DE +8 A +10 GRADOS.');
          nota_occ.Lines.Add('Equipo de frío en funcionamiento: SI.');
          if ( dir_sum_occ.Text = '2MN' ) then
          begin
            nota_occ.Lines.Add(UpperCase('La mercancía transportada realiza tráfico marítimo entre islas'));
          end;
        end
        else
        if ( cliente_sal_occ.Text = 'VTO' ) then
        begin
          nota_occ.Lines.Add(UpperCase('Mercancia procedente de producción controlada y certificada bajo el estándar de calidad Globalgap.'));
        end;
      end;
      nota_occ.Lines.Add('- El conductor confirma que la mercancía va sujeta por barras.');

    end;
  end;
end;

procedure TFOrdenCarga.DSMaestroStateChange(Sender: TObject);
begin
  case DSMaestro.state of
      dsEdit:
        begin
          estadods.caption := 'Editable';
        end;
      dsInsert:
        begin
          estadods.caption := 'Insert';
        end;
      dsBrowse:
        begin
          estadods.caption := 'Consulta';
        end;
      else estadods.Caption := 'Desconocido';
  end;
end;

procedure TFOrdenCarga.RecalcularUnidades( const ASender: TObject; const AImporte: boolean = false );
var
  iUnidadesLinea, iCajasLinea: Integer;
  rKilosLinea, rPrecioLinea, rNetoLinea, rIvaLinea, rTotalLinea: Real;
begin
  //SÓLO SE REALIZARA EL CODIGO SI LA TABLA ES EDITABLE
  if ((DSDetalle.State <> dsEdit) and (DSDetalle.State <> dsInsert)) then
    Exit;

  bFlagCambios:= False;

  iUnidadesCaja:= StrToIntDef( unidades_caja_ocl.Text, 1);
  iCajasLinea:= StrToIntDef( cajas_ocl.Text, 0);
  iUnidadesLinea:= iCajasLinea * iUnidadesCaja;
  if bPesoVariableLinea then
  begin
    rKilosLinea:= StrToFloatDef( kilos_ocl.Text, 0);
  end
  else
  begin
    rKilosLinea:= bRoundTo( rPesoCaja * iCajasLinea, 2 );
  end;

  if AImporte then
  begin
    rNetoLinea:= StrToFloatDef( importe_neto_ocl.Text, 0);
    if rNetoLinea = 0 then
    begin
      rPrecioLinea:= 0;
    end
    else
    if sUnidadPrecioLinea = 'K' then
    begin
      rPrecioLinea:= bRoundTo( rNetoLinea / rKilosLinea, 3 );
    end
    else
    if sUnidadPrecioLinea = 'U' then
    begin
      rPrecioLinea:= bRoundTo( rNetoLinea / iUnidadesLinea, 3 );
    end
    else
    //if sUnidadPrecioLinea = 'C' then
    begin
      rPrecioLinea:= bRoundTo( rNetoLinea / iCajasLinea, 3 );
    end;
  end
  else
  begin
    rPrecioLinea:= StrToFloatDef( precio_ocl.Text, 0);
    if sUnidadPrecioLinea = 'K' then
    begin
      rNetoLinea:= rPrecioLinea * rKilosLinea;
    end
    else
    if sUnidadPrecioLinea = 'U' then
    begin
      rNetoLinea:= rPrecioLinea * iUnidadesLinea;
    end
    else
    //if sUnidadPrecioLinea = 'C' then
    begin
      rNetoLinea:= rPrecioLinea * iCajasLinea;
    end;
  end;


  rIvaLinea:= bRoundTo( rNetoLinea * ( rImpuestoLinea / 100 ), 2 );
  rTotalLinea:= rNetoLinea + rIvaLinea;


  if TComponent( ASender ).Name <> 'cajas_ocl' then
    cajas_ocl.Text:= FormatFloat('#0',iCajasLinea );
  if TComponent( ASender ).Name <> 'unidades_caja_ocl' then
    unidades_caja_ocl.Text:= FormatFloat('#0',iUnidadesCaja );

  if TComponent( ASender ).Name <> 'STUnidades' then
    STUnidades.Caption := FormatFloat('#0', iUnidadesLinea );
  if TComponent( ASender ).Name <> 'kilos_ocl' then
    kilos_ocl.Text := FormatFloat('#0.00', rKilosLinea );
  if TComponent( ASender ).Name <> 'precio_ocl' then
    precio_ocl.Text := FormatFloat('#0.000', rPrecioLinea );
  if TComponent( ASender ).Name <> 'importe_neto_ocl' then
    importe_neto_ocl.Text := FormatFloat('#0.00', rNetoLinea );
  if TComponent( ASender ).Name <> 'porc_iva_ocl' then
    porc_iva_ocl.Text := FormatFloat('#0.00', rImpuestoLinea );
  if TComponent( ASender ).Name <> 'iva_ocl' then
    iva_ocl.Text := FormatFloat('#0.00', rIvaLinea );
  if TComponent( ASender ).Name <> 'importe_total_ocl' then
    importe_total_ocl.Text := FormatFloat('#0.00', rTotalLinea );

  (*
  QOrdenCargaLunidades_caja_ocl.AsInteger:= iUnidadesCaja;
  QOrdenCargaLcajas_ocl.AsInteger:= iCajasLinea;
  QOrdenCargaLkilos_ocl.AsInteger:= rKilosLinea;
  QOrdenCargaLprecio_ocl.AsInteger:= rPrecioLinea;
  QOrdenCargaLimporte_neto_ocl.AsInteger:= rNetoLinea;
  QOrdenCargaLporc_iva_ocl.AsInteger:= rImpuestoLinea;
  QOrdenCargaLiva_ocl.AsInteger:= rIvaLinea;
  QOrdenCargaLimporte_total_ocl.AsInteger:= rTotalLinea;
  *)

  STUnidades.Caption := FormatFloat('#0', iUnidadesLinea );



  bFlagCambios:= True;
end;

procedure TFOrdenCarga.btnFechaDescargaClick(Sender: TObject);
var
  sAux: string;
begin
  sAux:= fecha_descarga_occ.Text;
  if PonFecha( self, fecha_descarga_occ, fecha_descarga_occ.Text, sAux ) then
    fecha_descarga_occ.Text:= sAux;
end;

procedure TFOrdenCarga.btnFechaPedidoClick(Sender: TObject);
var
  sAux: string;
begin
  sAux:= fecha_pedido_occ.Text;
  if PonFecha( self, fecha_pedido_occ, fecha_pedido_occ.Text, sAux ) then
    fecha_pedido_occ.Text:= sAux;
end;

procedure TFordenCarga.BorrarOrdenAurora(orden_occ : Integer);
var
  q1 : TSQLQuery;
begin
  try
    q1 := TSQLQuery.Create(nil);
    q1.SQLConnection := AuroraConn;
    q1.sql.add('update frf_orden_carga_c set deleted_at = now() where orden_occ = 0'+Inttostr(orden_occ));
    try
      q1.ExecSQL();
    Except
      On E : Exception do
      begin
        ShowMessage('Error en TFOrdenCarga.BorrarOrdenAurora: '+e.message);
      end;
    end;
  finally
    FreeAndNil(q1);
  end;
end;

End.

