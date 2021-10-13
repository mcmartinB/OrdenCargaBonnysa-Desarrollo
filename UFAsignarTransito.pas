unit UFAsignarTransito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables;

type
  TFAsignarTransito = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    lblEmpresa: TLabel;
    lblCentro: TLabel;
    lblFecha: TLabel;
    lblTransito: TLabel;
    lblCliente: TLabel;
    edtEmpresa: TEdit;
    edtCentro: TEdit;
    edtFecha: TEdit;
    edtDestino: TEdit;
    edtTransito: TEdit;
    lblDesEmpresa: TLabel;
    lbldesCentro: TLabel;
    lblDesDestino: TLabel;
    QAux: TQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
     iOrden, iTransito: Integer;
     dFecha: TDateTime;

     procedure UnirOrdenTransito;
     function  ExisteTransito: Boolean;

     procedure AsignarTransito;
     procedure SQLAsignarTransitoCab;
     procedure SQLAsignarTransitoLin;
     procedure SQLAsignarTransitoOrden;
  public
    { Public declarations }
  end;

  procedure Execute( const AOwnwer: TComponent; const AOrden: string; AEmpresa, ADesEmpresa: string;
                     const ACentro, ADesCentro: string; const ADestino, ADesDestino: string;
                     const AFecha: string  );

implementation

{$R *.dfm}

var
  FAsignarTransito: TFAsignarTransito;

  procedure Execute( const AOwnwer: TComponent; const AOrden: string; AEmpresa, ADesEmpresa: string;
                     const ACentro, ADesCentro: string; const ADestino, ADesDestino: string;
                     const AFecha: string  );
begin
  FAsignarTransito:= TFAsignarTransito.Create( AOwnwer );
  try
    FAsignarTransito.iOrden:= StrToInt( AOrden );
    FAsignarTransito.edtEmpresa.Text:= AEmpresa;
    FAsignarTransito.edtCentro.Text:= ACentro;
    FAsignarTransito.edtDestino.Text:= ADestino;
    FAsignarTransito.lblDesEmpresa.Caption:= ADesEmpresa;
    FAsignarTransito.lblDesCentro.Caption:= ADesCentro;
    FAsignarTransito.lblDesDestino.Caption:= ADesDestino;
    FAsignarTransito.edtFecha.Text:= AFecha;
    FAsignarTransito.dFecha:= StrTodate( AFecha );
    FAsignarTransito.ShowModal;
  finally
    FreeAndNil( FAsignarTransito );
  end;
end;

procedure TFAsignarTransito.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFAsignarTransito.btnAceptarClick(Sender: TObject);
begin
  UnirOrdenTransito;
end;

procedure TFAsignarTransito.UnirOrdenTransito;
begin
  if TryStrToInt( edtTransito.Text , iTransito ) then
  begin
    if ExisteTransito then
    begin
      AsignarTransito;
      ShowMessage('Proceso Finalizado');
      Close;
    end
    else
    begin
      ShowMessage('No existe el albarán seleccioando.');
    end;
  end
  else
  begin
    ShowMessage('El número de albarán es de obligada inserción.');
  end;
end;

function TFAsignarTransito.ExisteTransito: Boolean;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add('select * from frf_transitos_c ' );
  QAux.SQL.Add('where empresa_tc = :empresa' );
  QAux.SQL.Add('  and centro_tc = :centro');
  QAux.SQL.Add('  and fecha_tc = :fecha ');
  QAux.SQL.Add('  and referencia_tc = :Transito ');
  QAux.SQL.Add('  and centro_destino_tc = :destino ' );
  QAux.ParamByName('empresa').AsString:= edtEmpresa.Text;
  QAux.ParamByName('centro').AsString:= edtCentro.Text;
  QAux.ParamByName('fecha').AsDateTime:= dFecha;
  QAux.ParamByName('Transito').AsInteger:= iTransito;
  QAux.ParamByName('destino').AsString:= edtDestino.Text;
  QAux.Open;
  result:= not QAux.isempty;
  QAux.Close;
end;

procedure TFAsignarTransito.AsignarTransito;
begin
  SQLAsignarTransitoCab;
  SQLAsignarTransitoLin;
  SQLAsignarTransitoOrden;
end;

procedure TFAsignarTransito.SQLAsignarTransitoCab;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add(' update frf_orden_carga_c ');
  QAux.SQL.Add(' set  n_albaran_occ = :Transito,  ');
  QAux.SQL.Add('      traspasada_occ = 2  ');
  QAux.SQL.Add(' where orden_occ = :orden ');
  QAux.ParamByName('orden').AsInteger:= iOrden;
  QAux.ParamByName('Transito').AsInteger:= iTransito;
  QAux.ExecSQL;
end;

procedure TFAsignarTransito.SQLAsignarTransitoLin;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add(' update frf_orden_carga_l ');
  QAux.SQL.Add(' set  n_albaran_ocl = :Transito  ');
  QAux.SQL.Add(' where orden_ocl = :orden ');
  QAux.ParamByName('orden').AsInteger:= iOrden;
  QAux.ParamByName('Transito').AsInteger:= iTransito;
  QAux.ExecSQL;
end;

procedure TFAsignarTransito.SQLAsignarTransitoOrden;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add(' update frf_transitos_c ');
  QAux.SQL.Add(' set  n_orden_tc = :orden  ');
  QAux.SQL.Add(' where empresa_tc = :empresa ');
  QAux.SQL.Add('  and centro_tc = :centro');
  QAux.SQL.Add('  and fecha_tc = :fecha ');
  QAux.SQL.Add('  and referencia_tc = :Transito ');
  QAux.ParamByName('empresa').AsString:= edtEmpresa.Text;
  QAux.ParamByName('centro').AsString:= edtCentro.Text;
  QAux.ParamByName('fecha').AsDateTime:= dFecha;
  QAux.ParamByName('Transito').AsInteger:= iTransito;
  QAux.ParamByName('orden').AsInteger:= iOrden;
  QAux.ExecSQL;
end;

end.
