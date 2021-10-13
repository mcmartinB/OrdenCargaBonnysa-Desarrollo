unit UFDistribuirPeso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BEdit, DB, DBTables;

type
  TRDistribuirPesos = record
    cod_envase: String;
    num_cajas: integer;
    peso_tara: real;
    peso_teorico_neto: real;
    peso_teorico_bruto: real;
    porcen_teorico_bruto: real;
    peso_real_bruto: real;
    peso_real_neto: real;
    peso_caja_neto: real;
  end;

  TFDistribuirPesos = class(TForm)
    lblNombre1: TLabel;
    LEmpresa_p: TLabel;
    eCamionLleno: TBEdit;
    eCamionVacio: TBEdit;
    btnAceptar: TButton;
    btnCancelar: TButton;
    lblNombre2: TLabel;
    lblNombre3: TLabel;
    lblNombre4: TLabel;
    lblNombre5: TLabel;
    lblNombre6: TLabel;
    ePesoBruto: TBEdit;
    QAux: TQuery;
    lblNombre8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure ePesoCamionChange(Sender: TObject);
  private
    aRDistribuirPesos: array of TRDistribuirPesos;

    { Private declarations }
    iOrden: integer;
    rCamionLleno, rCamionVacio: real;
    rProductoCamion, rBrutoTeoricoTotal: real;

    function  PesoBrutoOk: boolean;
    function  RellenaArryPesos: boolean;
    procedure DistribuirPesos;
    procedure PutPesoEnvase( const AEnvase: String; const APesoCaja: Real );
    procedure EliminiarArrayPesos;
    function  ReiniciarPesosTeoricos: boolean;
    procedure ModificarImportes;
  public
    { Public declarations }
  end;

  procedure Execute( const AOwner: TComponent; const AOrden: integer; const ABaseDatos: string );

implementation

{$R *.dfm}

uses
  Math;

var
  FDistribuirPesos: TFDistribuirPesos;

procedure Execute( const AOwner: TComponent; const AOrden: integer; const ABaseDatos: string );
begin
  FDistribuirPesos:= TFDistribuirPesos.Create( AOwner );
  FDistribuirPesos.iOrden:= AOrden;
  FDistribuirPesos.QAux.DatabaseName:= ABaseDatos;
  try
    FDistribuirPesos.ShowModal;
  finally
    FreeAndNil( FDistribuirPesos );
  end;
end;

procedure TFDistribuirPesos.FormCreate(Sender: TObject);
begin
  eCamionLleno.Text:= '0';
  eCamionVacio.Text:= '0';
end;

procedure TFDistribuirPesos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caHide;
end;

procedure TFDistribuirPesos.btnCancelarClick(Sender: TObject);
begin
  ShowMessage('Opcion cancelada por el usuario.');
  Close;
end;

procedure TFDistribuirPesos.btnAceptarClick(Sender: TObject);
begin
  if PesoBrutoOk then
  begin
    if rProductoCamion > 0 then
    begin
      if RellenaArryPesos then
      begin
        if MessageDlg('Seguro que quiere distribuir el peso del camion entre las lineas de la orden de carga.?' +
                      #13 + #10 + 'Peso Teórico = ' + FormatFloat('#,##0.00', rBrutoTeoricoTotal ) +
                      #13 + #10 + 'Peso Camión = ' + FormatFloat('#,##0.00', rProductoCamion ) +
                      ' (' + FormatFloat('#,##0.00', ( Abs( rProductoCamion - rBrutoTeoricoTotal ) / rProductoCamion ) * 100 ) + '%Dif)',
                      mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
        begin
          DistribuirPesos;
          EliminiarArrayPesos;
          ModificarImportes;
          ShowMessage('Proceso de finalizado.');
        end
        else
        begin
          ShowMessage('Cancelado.');
        end;
    end
      else
      begin
        ShowMessage('Faltan las lineas de la orden de carga');
      end;
    end
    else
    begin
      if MessageDlg('Seguro que quiere reiniciar los pesos con los kilos teoricos.?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
      begin
        if ReiniciarPesosTeoricos then
        begin
          DistribuirPesos;
          EliminiarArrayPesos;
          ModificarImportes;
          ShowMessage('Proceso de finalizado.');
        end
        else
        begin
          ShowMessage('Faltan las lineas de la orden de carga');
        end;
      end
      else
      begin
        ShowMessage('Cancelado.');
      end;
    end;
    Close;
  end
  else
  begin
    ShowMessage('El valor de los pesos del camion es incorrecto.');
  end;
end;

function TFDistribuirPesos.PesoBrutoOk: boolean;
begin
  result:= rProductoCamion >= 0;
end;

procedure TFDistribuirPesos.ePesoCamionChange(Sender: TObject);
begin
  rCamionLleno:= StrToFloatDef( eCamionLleno.Text, 0 );
  rCamionVacio:= StrToFloatDef( eCamionVacio.Text, 0 );
  rProductoCamion:= rCamionLleno - rCamionVacio;
  if rProductoCamion >= 0 then
  begin
    ePesoBruto.Text:= FormatFloat( '#,##0.00', rProductoCamion);
  end
  else
  begin
    ePesoBruto.Text:= 'ERROR';
  end;
end;

function TFDistribuirPesos.RellenaArryPesos: boolean;
var
  iAux, iLen: integer;
begin
  with QAux do
  begin
    SQL.Add(' select envase_ocl, ');
    SQL.Add('        sum( nvl(cajas_ocl, 0) ) cajas_ocl, ');
    SQL.Add('        sum( nvl(cajas_ocl, 0) * nvl( ( select peso_neto_e from frf_envases ');
    SQL.Add('          where envase_e = envase_ocl ');
    SQL.Add('            and producto_e = producto_ocl ), 0) ) peso_teorico_ocl, ');
    SQL.Add('        sum( nvl(cajas_ocl, 0) * nvl( ( select peso_envase_e from frf_envases ');
    SQL.Add('          where envase_e = envase_ocl ');
    SQL.Add('            and producto_e = producto_ocl ), 0) ) + ');
    SQL.Add('        sum( NVL(n_palets_ocl, 0) *  nvl( ( select kilos_tp from frf_tipo_palets ');
    SQL.Add('          where codigo_tp = tipo_palets_ocl ), 0) ) peso_tara_ocl ');

    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden ');
    SQL.Add(' group by 1 ');

    ParamByName('orden').AsInteger:= iOrden;
    Open;
    result:= not IsEmpty;

    if result then
    begin
      iLen:= 0;
      while Not Eof do
      begin
        inc( iLen );
        Next;
      end;

      SetLength( aRDistribuirPesos, iLen );
      rBrutoTeoricoTotal:= 0;
      First;
      for iAux:= 0 to iLen - 1 do
      begin
        aRDistribuirPesos[iAux].cod_envase:= FieldByName('envase_ocl').AsString;
        aRDistribuirPesos[iAux].num_cajas:= FieldByName('cajas_ocl').AsInteger;
        aRDistribuirPesos[iAux].peso_tara:= FieldByName('peso_tara_ocl').AsFloat;
        aRDistribuirPesos[iAux].peso_teorico_neto:= FieldByName('peso_teorico_ocl').AsFloat;
        aRDistribuirPesos[iAux].peso_teorico_bruto:= aRDistribuirPesos[iAux].peso_tara +
                                                  aRDistribuirPesos[iAux].peso_teorico_neto;
        rBrutoTeoricoTotal:= rBrutoTeoricoTotal + aRDistribuirPesos[iAux].peso_teorico_bruto;
        Next;
      end;

      for iAux:= 0 to iLen - 1 do
      begin
        aRDistribuirPesos[iAux].porcen_teorico_bruto:= SimpleRoundTo( aRDistribuirPesos[iAux].peso_teorico_bruto / rBrutoTeoricoTotal, -5 ) ;
        if rProductoCamion = 0 then
        begin
          aRDistribuirPesos[iAux].peso_real_bruto:= 0;
          aRDistribuirPesos[iAux].peso_real_neto:= 0;
          aRDistribuirPesos[iAux].peso_caja_neto:= 0;
        end
        else
        begin
          aRDistribuirPesos[iAux].peso_real_bruto:= SimpleRoundTo( rProductoCamion * aRDistribuirPesos[iAux].porcen_teorico_bruto, -2 );
          aRDistribuirPesos[iAux].peso_real_neto:= aRDistribuirPesos[iAux].peso_real_bruto - aRDistribuirPesos[iAux].peso_tara;
          aRDistribuirPesos[iAux].peso_caja_neto:= SimpleRoundTo( aRDistribuirPesos[iAux].peso_real_neto / aRDistribuirPesos[iAux].num_cajas, -2 );
        end;
      end;
    end;
    Close;
  end;
end;

procedure TFDistribuirPesos.DistribuirPesos;
var
  iAux, iLen: integer;
begin
  iLen:= Length( aRDistribuirPesos );
  for iAux:= 0 to iLen - 1 do
  begin
    PutPesoEnvase( aRDistribuirPesos[iAux].cod_envase, aRDistribuirPesos[iAux].peso_caja_neto );
  end;
end;

procedure TFDistribuirPesos.PutPesoEnvase( const AEnvase: String; const APesoCaja: Real );
begin
  //Lineas orden de carga
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' update frf_orden_carga_l ');
    SQL.Add(' set kilos_ocl = cajas_ocl * :kilos ');
    SQL.Add(' where orden_ocl = :orden ');
    SQL.Add(' and envase_ocl = :envase ');
    ParamByName('orden').AsInteger:= iOrden;
    ParamByName('envase').Asstring:= AEnvase;
    ParamByName('kilos').AsFloat:= APesoCaja;
    ExecSQL;
  end;
  //Packing list
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' update frf_packing_list ');
    SQL.Add(' set peso_pl = cajas_pl * :kilos ');
    SQL.Add(' where orden_pl = :orden ');
    SQL.Add(' and envase_pl = :envase ');
    ParamByName('orden').AsInteger:= iOrden;
    ParamByName('envase').Asstring:= AEnvase;
    ParamByName('kilos').AsFloat:= APesoCaja;
    ExecSQL;
  end;
  //Radio frecuencia
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' update rf_palet_pc_det ');
    SQL.Add(' set peso_det = unidades_det * :kilos ');
    SQL.Add(' where ean128_det in ');
    SQL.Add('  ( ');
    SQL.Add('   select ean128_cab ');
    SQL.Add('   from rf_palet_pc_cab ');
    SQL.Add('   where orden_carga_cab = :orden ');
    SQL.Add('  ) ');
    SQL.Add(' and envase_det = :envase ');
    ParamByName('orden').AsInteger:= iOrden;
    ParamByName('envase').Asstring:= AEnvase;
    ParamByName('kilos').AsFloat:= APesoCaja;
    try
      ExecSQL;
    except
      //Por si no tiene radio frecuencia
    end;
  end;
end;

procedure TFDistribuirPesos.EliminiarArrayPesos;
begin
  Finalize( aRDistribuirPesos );
end;

function TFDistribuirPesos.ReiniciarPesosTeoricos: boolean;
var
  iAux, iLen: integer;
begin
  with QAux do
  begin
    SQL.Add(' select envase_ocl, ');
    SQL.Add('        ( select nvl(peso_neto_e,0) from frf_envases ');
    SQL.Add('          where envase_e = envase_ocl ');
    SQL.Add('            and producto_e = producto_ocl ) peso_teorico_caja ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden ');
    SQL.Add(' group by 1, 2 ');

    ParamByName('orden').AsInteger:= iOrden;
    Open;
    result:= not IsEmpty;

    if result then
    begin
      iLen:= 0;
      while Not Eof do
      begin
        inc( iLen );
        Next;
      end;

      SetLength( aRDistribuirPesos, iLen );
      First;
      for iAux:= 0 to iLen - 1 do
      begin
        aRDistribuirPesos[iAux].cod_envase:= FieldByName('envase_ocl').AsString;
        aRDistribuirPesos[iAux].peso_caja_neto:= FieldByName('peso_teorico_caja').AsFloat;
        Next;
      end;
    end;
    Close;
  end;
end;

procedure TFDistribuirPesos.ModificarImportes;
begin
  with QAux do
  begin
    RequestLive:= True;
    SQL.Clear;
    SQL.Add(' select kilos_ocl, precio_ocl, importe_neto_ocl, porc_iva_ocl, iva_ocl, importe_total_ocl ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden ');
    SQL.Add(' and unidad_precio_ocl = ''KGS'' ');
    ParamByName('orden').AsInteger:= iOrden;
    Open;
    while not Eof do
    begin
      Edit;
      FieldByName('importe_neto_ocl').AsFloat:= SimpleRoundTo( FieldByName('kilos_ocl').AsFloat *
                                                FieldByName('precio_ocl').AsFloat, -2 );
      FieldByName('iva_ocl').AsFloat:= SimpleRoundTo( ( FieldByName('importe_neto_ocl').AsFloat *
                                                FieldByName('porc_iva_ocl').AsFloat ) / 100, -2 );
      FieldByName('importe_total_ocl').AsFloat:= SimpleRoundTo( FieldByName('importe_neto_ocl').AsFloat +
                                                FieldByName('iva_ocl').AsFloat, -2 );
      Post;
      Next;
    end;
    Close;
    RequestLive:= False;
  end;
end;

end.
