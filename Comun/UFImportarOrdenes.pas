unit UFImportarOrdenes;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  Buttons,
  DBTables,

  dmImportarOrdenes,
  UTipos, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue, dxSkinFoggy,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, cxContainer,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, FMTBcd, SqlExpr, ConexionAWSAurora,
  cxCheckBox, dxSkinBlack, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFImportarOrdenes = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    MuestraCargaDs: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtEmpresaCod: TEdit;
    edtEmpresaDes: TEdit;
    edtCentroCod: TEdit;
    edtCentroDes: TEdit;
    Label3: TLabel;
    FiltroFechaEdit: TcxDateEdit;
    Panel2: TPanel;
    lblProgreso: TLabel;
    Memo: TMemo;
    pb: TProgressBar;
    sbImportar: TSpeedButton;
    sbSalir: TSpeedButton;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    BuscarBtn: TButton;
    MarcarTodosBtn: TButton;
    DesmarcarTodosBtn: TButton;
    cxGrid1DBTableView1Column11: TcxGridDBColumn;
    cxGrid1DBTableView1Column12: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure sbImportarClick(Sender: TObject);
    procedure sbSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BuscarBtnClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure MarcarTodosBtnClick(Sender: TObject);
    procedure DesmarcarTodosBtnClick(Sender: TObject);
  private

    FBDOrigen: TDataBase;
    FDMImportarOrdenes: TFDMImportarOrdenes;

    FCentroDTO: TCentroDTO;
    AuroraConn : TConexionAWSAurora;

    qMuestraCargas : TSQLQuery;


    InternoCentroDTO: TCentroDTO;

    procedure OnLog(Sender: TObject; const AMensaje: String);
    procedure OnProgressUpdate(Sender: TObject; Index: Integer; Total: Integer);
    procedure MarcarDesmarcarGrid(selec : integer);
    procedure ActualizarTransporteGrid;
    function GetTransportistaOrdenCarga(orden_occ : integer) : string;
    function EstoyEnPruebas : boolean;



  public
    constructor Create(AOwner: TComponent; BDOrigen: TDatabase; CentroDTO: TCentroDTO); reintroduce;

  end;

var
  FImportarOrdenes: TFImportarOrdenes;

implementation

{$R *.dfm}

uses UDOrdenCarga;

constructor TFImportarOrdenes.Create(AOwner: TComponent; BDOrigen: TDatabase; CentroDTO: TCentroDTO);
begin
  inherited Create(AOwner);
  FBDOrigen := BDOrigen;

  FCentroDTO.EmpresaCodigo := CentroDTO.EmpresaCodigo;
  FCentroDTO.EmpresaDescripcion := CentroDTO.EmpresaDescripcion;
  FCentroDTO.CentroCodigo := CentroDTO.CentroCodigo;
  FCentroDTO.CentroDescripcion := CentroDTO.CentroDescripcion;

  self.InternoCentroDTO := CentroDTO;

  
  AuroraConn := TConexionAWSAurora.Create;


  qMuestraCargas := TSQLQuery.Create(self);
  qMuestraCargas.SQLConnection := AuroraConn;
  self.MuestraCargaDs.Dataset := QMuestraCargas;
  self.cxGrid1DBTableView1.DataController.DataSource := self.MuestraCargaDs;

  self.FiltroFechaEdit.Date := Now;
  self.sbimportar.enabled := false;
end;

function TFImportarOrdenes.EstoyEnPruebas : boolean;
var
  qMysql : TSQLQuery;
  qIfx : TQuery;
  db_mysql, instancia_ifx : string;
begin
  result := false;
  
  try
    try
    qMysql := TSQLQuery.Create(nil);
    qMysql.SQLConnection := self.AuroraConn;
    qMysql.sql.add('SELECT DATABASE();');
    qMysql.Open;

    db_mysql := qMysql.Fields[0].asstring;

    db_mysql := lowercase(db_mysql);

    qMysql.close;

    qifx := TQuery.create(nil);
    qifx.DatabaseName:= 'Database';
    qifx.SQL.add('SELECT FIRST 1 DBINFO(''DBhostname'') from informix.systables ');
    qifx.open;

    instancia_ifx := qifx.fields[0].asstring;
    instancia_ifx := lowercase(instancia_ifx);

    qifx.close;

    if (CompareStr(db_mysql,'comerprueba') = 0) and (CompareStr(instancia_ifx,'vserverd') = 0)
    then
        result := true;
    
    except
      On E : Exception do
      begin
          Showmessage('Error en TFImportarOrdenes.EstoyEnPruebas: '+e.message);
      end;
    end;
  finally
    FreeAndNil(qmysql);
    FreeAndNil(qifx);
  end;
end;



procedure TFImportarOrdenes.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  RecIdx : integer;
begin
  try
    RecIdx := self.cxGrid1DBTableView1.DataController.FocusedRecordIndex;

     if (self.cxGrid1DBTableView1.DataController.Values[RecIdx,0] = 0) then
      self.cxGrid1DBTableView1.DataController.SetValue(RecIdx,0,1)
     else self.cxGrid1DBTableView1.DataController.SetValue(RecIdx,0,0);
  except
    On E : exception do
    begin
        Showmessage('Error evento TFImportarOrdenes.cxGrid1DBTableView1CellDblClick: '+e.message);
    end;

  end;
end;

procedure TFImportarOrdenes.DesmarcarTodosBtnClick(Sender: TObject);
begin
   self.MarcarDesmarcarGrid(0);
end;

procedure TFImportarOrdenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.qMuestraCargas.close;
  FreeAndNil(self.qMuestraCargas);
  FreeAndNil(AuroraConn);
end;

procedure TFImportarOrdenes.FormShow(Sender: TObject);
begin
  lblProgreso.Caption := '';
  Memo.Clear;
  pb.Position := 0;

  edtEmpresaCod.Text := FCentroDTO.EmpresaCodigo;
  edtEmpresaDes.Text := FCentroDTO.EmpresaDescripcion;
  edtCentroCod.Text := FCentroDTO.CentroCodigo;
  edtCentroDes.Text := FCentroDTO.CentroDescripcion;
end;

procedure TFImportarOrdenes.MarcarDesmarcarGrid(selec : integer);
var
  i : integer;
  selcolidx : integer;
begin
  if self.cxGrid1DBTableView1.DataController.RecordCount >0 then
  begin
   selcolidx := self.cxGrid1DBTableView1.DataController.GetItemByFieldName('sel').Index;

    for i := 0 to self.cxGrid1DBTableView1.DataController.RecordCount -1 do
    begin
       self.cxGrid1DBTableView1.DataController.SetValue(i, selcolidx, selec);
    end;
  end;
end;


procedure TFImportarOrdenes.MarcarTodosBtnClick(Sender: TObject);
begin
  self.MarcarDesmarcarGrid(1);
end;

procedure TFImportarOrdenes.OnLog(Sender: TObject; const AMensaje: String);
begin
  Memo.Lines.Add(AMensaje);
  Application.ProcessMessages;
end;

procedure TFImportarOrdenes.OnProgressUpdate(Sender: TObject; Index, Total: Integer);
begin
  lblProgreso.Caption := Format('Descargados %d de %d', [ Index, Total ]);
  pb.Max := Total;
  pb.Position := Index;
  Application.ProcessMessages;
end;

procedure TFImportarOrdenes.sbImportarClick(Sender: TObject);
var
  RegistrosADescargar: Integer;
  orden_occ : integer;
  i : integer;
  selcolidx, ordercolidx : integer;
begin

  try
    FDMImportarOrdenes := TFDMImportarOrdenes.Create(Self, FBDOrigen, self.InternoCentroDTO);
  //  FDMImportarOrdenes.Importar(orden_occ);
    FDMImportarOrdenes.OnLog := OnLog;
    FDMImportarOrdenes.OnProgressUpdate := OnProgressUpdate;


    RegistrosADescargar := 0;

    selcolidx := self.cxGrid1DBTableView1.DataController.GetItemByFieldName('sel').Index;
    ordercolidx := self.cxGrid1DBTableView1.DataController.GetItemByFieldName('id_orden').Index;
    //lee cuantos registros hay para descargar
    for i := 0 to self.cxGrid1DBTableView1.DataController.RecordCount -1 do
    begin
      if (self.cxGrid1DBTableView1.DataController.Values[i, selcolidx] = 1) then
        inc(RegistrosADescargar);

    end;

    //si no hay ninguno, acaba
    if RegistrosADescargar <=0 then
    begin
      ShowMessage('No hay ordenes seleccionadas');
      exit;
    end;


    if MessageBox(
      Self.Handle,
      PChar(Format('Se van a descargar %d orden(es) de compra desde el servidor web.' + #13 + #10 + '¿Desea continuar?', [ RegistrosADescargar ])),
      PChar(Self.Caption),
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = ID_YES then
    begin
      sbSalir.Enabled := False;
      sbImportar.Enabled := False;
      try
        lblProgreso.Caption := '';
        Memo.Clear;
        pb.Position := 0;


       FDMImportarOrdenes.Inicializar(RegistrosADescargar);

       //descarga cada una de las órdenes
       for I := 0 to  self.cxGrid1DBTableView1.DataController.RecordCount -1 do
       begin
          //si hay una orden para descargar
         if (self.cxGrid1DBTableView1.DataController.Values[i, selcolidx] = 1) then
         begin
          //recupera el id de la orden
          if self.cxGrid1DBTableView1.DataController.Values[i, ordercolidx] = null then
              orden_occ := 0
          else
              orden_occ := self.cxGrid1DBTableView1.DataController.Values[i, ordercolidx];

          self.cxGrid1DBTableView1.DataController.SetValue(i, selcolidx, 0);
           //si la orden se ha descargado del AWS (web de pedidos), a la bbdd del almacén
           if (FDMImportarOrdenes.Descargar(orden_occ) = true) then
              self.cxGrid1DBTableView1.DataController.SetValue(i,0,0);
         end;
      end;

      FDMImportarOrdenes.Finalizar;


      finally
        sbImportar.Enabled := True;
        sbSalir.Enabled := True;
      end;
    end;
  except
    ON E : Exception do
    begin
        ShowMessage('Error evento TFImportarOrdenes.sbImportarClick: '+e.Message);
    end;
  end;
end;

procedure TFImportarOrdenes.sbSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;



procedure TFImportarOrdenes.BuscarBtnClick(Sender: TObject);
var
 anyo, mes, dia : Word;
 fecha : TDateTime;
begin
  try
    fecha := self.FiltroFechaEdit.editvalue;

    DecodeDate(fecha, anyo, mes, dia);

    qMuestraCargas.close;
    qMuestraCargas.Params.Clear;
    qMuestraCargas.sql.clear;
    qMuestraCargas.sql.add('select 0 as sel, o.id as id_orden, empresa_occ AS Empresa,  orden_occ AS Orden, fecha_occ as Fecha, cliente_sal_occ as Cliente, c.nombre_c,');
    qMuestraCargas.sql.add('dir_sum_occ as  Direccion, d.nombre_ds, n_pedido_bonnysa_occ as Pedido,');
    qMuestraCargas.sql.add('n_pedido_occ as PedidoCliente, ''desconocido'' as Transporte');
    qMuestraCargas.sql.add('from frf_orden_carga_c o');
    qMuestraCargas.sql.add('left join frf_clientes c on c.cliente_c = cliente_sal_occ');
    qMuestraCargas.sql.add('left join frf_dir_sums d on d.cliente_ds = cliente_sal_occ and d.dir_sum_ds = o.dir_sum_occ');
    qMuestraCargas.sql.add('where empresa_occ = :p1');
    qMuestraCargas.sql.add('and centro_salida_occ = :p2');
    qMuestraCargas.SQL.add('and year(fecha_occ) = :p3');
    qMuestraCargas.SQL.add('and month(fecha_occ) = :p4');
    qMuestraCargas.SQL.add('and day(fecha_occ) =:p5');
    qMuestraCargas.SQL.add('and status_occ = 4');
    qMuestraCargas.SQL.add('and o.deleted_at is null');  // Cambiado

    qMuestraCargas.Params[0].asstring := self.edtEmpresaCod.text;
    qMuestraCargas.Params[1].asstring := self.edtCentroCod.text;
    qMuestraCargas.Params[2].asinteger := anyo;
    qMuestraCargas.Params[3].asinteger := mes;
    qMuestraCargas.Params[4].asinteger := dia;

//    ShowMessage(self.qmuestraCargas.SQL.Text);


    qMuestraCargas.Open;

    self.ActualizarTransporteGrid;

    if (self.cxGrid1DBTableView1.DataController.RecordCount >0) then
    begin
      self.sbIMportar.enabled := true;
      self.MarcarTodosBtn.enabled := true;
      self.DesmarcarTodosBtn.enabled := true;
    end
    else
    begin
      self.sbImportar.Enabled := false;
      self.MarcarTodosBtn.enabled := false;
      self.DesmarcarTodosBtn.enabled := false;

      Showmessage('Sin datos');
    end;
  except
    On E : Exception do
    begin
        Showmessage('Error Boton : '+e.Message);
    end;

  end;
end;

procedure TFImportarOrdenes.ActualizarTransporteGrid;
var
  i : integer;
  ordercolidx : integer;
  transidx : integer;
  orden_occ : integer;
  desc_trans : string;
begin
  self.cxGrid1DBTableView1.BeginUpdate();

  ordercolidx := self.cxGrid1DBTableView1.DataController.GetItemByFieldName('id_orden').Index;
  transidx := self.cxGrid1DBTableView1.DataController.GetItemByFieldName('Transporte').Index;

   for I := 0 to  self.cxGrid1DBTableView1.DataController.RecordCount -1 do
       begin
           if self.cxGrid1DBTableView1.DataController.Values[i, ordercolidx] = null then
              orden_occ := 0
           else
              orden_occ := self.cxGrid1DBTableView1.DataController.Values[i, ordercolidx];

           desc_trans := self.GetTransportistaOrdenCarga(orden_occ);
           self.cxGrid1DBTableView1.DataController.SetValue(i, transidx, desc_trans);
      end;

  self.cxGrid1DBTableView1.EndUpdate;
end;

function TFImportarOrdenes.GetTransportistaOrdenCarga(orden_occ: Integer) : string;
var
  q1 : TSQLQuery;
  desc : string;
  bd1, bd2 : string;
begin
  desc := 'Desconocido';


  try

    if EstoyEnPruebas() = true then
    begin
        bd1 := 'logisticaprueba';
        bd2 := 'comerprueba';
    end
    else
    begin
        bd1 := 'logistica';
        bd2 := 'comer';
    end;


    try
       q1 := TSQLQuery.Create(nil);
      // q1.UpdateStatus := usInserted;
      q1.SQLConnection := self.AuroraConn;
      q1.sql.add('select provider from '+bd1+'.shipment s');
      q1.sql.add('left join '+bd1+'.shipment_order so on so.shipmentId = s.id');
      q1.sql.add('left join '+bd2+'.frf_orden_carga_c focc on focc.shipment_order_id = so.id where focc.orden_occ = :valor');
      q1.params[0].asinteger := orden_occ;

//      ShowMessage(q1.sql.text);

      q1.Open;


      while not q1.eof do
      begin
          desc := q1.Fields[0].asstring;
          q1.next;
      end;

      q1.close;
    except
      On E : Exception do
      begin
        Showmessage('Error en function TFImportarOrdenes.GetTransportistaCarga: '+e.message);
      end;
    end;
  finally
    FreeAndNil(q1);
    result := desc;
  end;
end;

end.
