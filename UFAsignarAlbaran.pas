unit UFAsignarAlbaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables;

type
  TFAsignarAlbaran = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    lblEmpresa: TLabel;
    lblCentro: TLabel;
    lblFecha: TLabel;
    lblAlbaran: TLabel;
    lblCliente: TLabel;
    lblSuministro: TLabel;
    edtEmpresa: TEdit;
    edtCentro: TEdit;
    edtFecha: TEdit;
    edtCliente: TEdit;
    edtSuminisro: TEdit;
    edtAlbaran: TEdit;
    lblDesEmpresa: TLabel;
    lbldesCentro: TLabel;
    lblDesCliente: TLabel;
    lblDesSuministro: TLabel;
    QAux: TQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
     iOrden, iAlbaran: Integer;
     dFecha: TDateTime;

     procedure UnirOrdenAlbaran;
     function  ExisteAlbaran: Boolean;

     procedure AsignarAlbaran;
     procedure SQLAsignarAlbaranCab;
     procedure SQLAsignarAlbaranLin;
     procedure SQLAsignarAlbaranOrden;
  public
    { Public declarations }
  end;

  procedure Execute( const AOwnwer: TComponent; const AOrden: string; AEmpresa, ADesEmpresa: string;
                     const ACentro, ADesCentro: string; const ACliente, ADesCliente: string;
                     const ASuministro, ADesSuministro: string; const AFecha: string  );

implementation

{$R *.dfm}

var
  FAsignarAlbaran: TFAsignarAlbaran;

  procedure Execute( const AOwnwer: TComponent; const AOrden: string; AEmpresa, ADesEmpresa: string;
                     const ACentro, ADesCentro: string; const ACliente, ADesCliente: string;
                     const ASuministro, ADesSuministro: string; const AFecha: string  );
begin
  FAsignarAlbaran:= TFAsignarAlbaran.Create( AOwnwer );
  try
    FAsignarAlbaran.iOrden:= StrToInt( AOrden );
    FAsignarAlbaran.edtEmpresa.Text:= AEmpresa;
    FAsignarAlbaran.edtCentro.Text:= ACentro;
    FAsignarAlbaran.edtCliente.Text:= ACliente;
    FAsignarAlbaran.edtSuminisro.Text:= ASuministro;
    FAsignarAlbaran.lblDesEmpresa.Caption:= ADesEmpresa;
    FAsignarAlbaran.lblDesCentro.Caption:= ADesCentro;
    FAsignarAlbaran.lblDesCliente.Caption:= ADesCliente;
    FAsignarAlbaran.lblDesSuministro.Caption:= ADesSuministro;
    FAsignarAlbaran.edtFecha.Text:= AFecha;
    FAsignarAlbaran.dFecha:= StrTodate( AFecha );
    FAsignarAlbaran.ShowModal;
  finally
    FreeAndNil( FAsignarAlbaran );
  end;
end;

procedure TFAsignarAlbaran.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFAsignarAlbaran.btnAceptarClick(Sender: TObject);
begin
  UnirOrdenAlbaran;
end;

procedure TFAsignarAlbaran.UnirOrdenAlbaran;
begin
  if TryStrToInt( edtAlbaran.Text , iAlbaran ) then
  begin
    if ExisteAlbaran then
    begin
      AsignarAlbaran;
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

function TFAsignarAlbaran.ExisteAlbaran: Boolean;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add('select * from frf_salidas_c ' );
  QAux.SQL.Add('where empresa_sc = :empresa' );
  QAux.SQL.Add('  and centro_salida_sc = :centro');
  QAux.SQL.Add('  and fecha_sc = :fecha ');
  QAux.SQL.Add('  and n_albaran_sc = :albaran ');
  QAux.SQL.Add('  and cliente_sal_sc = :cliente ' );
  QAux.SQL.Add('  and dir_sum_sc = :suministro ');
  QAux.ParamByName('empresa').AsString:= edtEmpresa.Text;
  QAux.ParamByName('centro').AsString:= edtCentro.Text;
  QAux.ParamByName('fecha').AsDateTime:= dFecha;
  QAux.ParamByName('albaran').AsInteger:= iAlbaran;
  QAux.ParamByName('cliente').AsString:= edtCliente.Text;
  QAux.ParamByName('suministro').AsString:= edtSuminisro.Text;
  QAux.Open;
  result:= not QAux.isempty;
  QAux.Close;
end;

procedure TFAsignarAlbaran.AsignarAlbaran;
begin
  SQLAsignarAlbaranCab;
  SQLAsignarAlbaranLin;
  SQLAsignarAlbaranOrden;
end;

procedure TFAsignarAlbaran.SQLAsignarAlbaranCab;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add(' update frf_orden_carga_c ');
  QAux.SQL.Add(' set  n_albaran_occ = :albaran,  ');
  QAux.SQL.Add('      traspasada_occ = 1  ');
  QAux.SQL.Add(' where orden_occ = :orden ');
  QAux.ParamByName('orden').AsInteger:= iOrden;
  QAux.ParamByName('albaran').AsInteger:= iAlbaran;
  QAux.ExecSQL;
end;

procedure TFAsignarAlbaran.SQLAsignarAlbaranLin;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add(' update frf_orden_carga_l ');
  QAux.SQL.Add(' set  n_albaran_ocl = :albaran  ');
  QAux.SQL.Add(' where orden_ocl = :orden ');
  QAux.ParamByName('orden').AsInteger:= iOrden;
  QAux.ParamByName('albaran').AsInteger:= iAlbaran;
  QAux.ExecSQL;
end;

procedure TFAsignarAlbaran.SQLAsignarAlbaranOrden;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add(' update frf_salidas_c ');
  QAux.SQL.Add(' set  n_orden_sc = :orden  ');
  QAux.SQL.Add(' where empresa_sc = :empresa ');
  QAux.SQL.Add('  and centro_salida_sc = :centro');
  QAux.SQL.Add('  and fecha_sc = :fecha ');
  QAux.SQL.Add('  and n_albaran_sc = :albaran ');
  QAux.ParamByName('empresa').AsString:= edtEmpresa.Text;
  QAux.ParamByName('centro').AsString:= edtCentro.Text;
  QAux.ParamByName('fecha').AsDateTime:= dFecha;
  QAux.ParamByName('albaran').AsInteger:= iAlbaran;
  QAux.ParamByName('orden').AsInteger:= iOrden;
  QAux.ExecSQL;
end;

end.
