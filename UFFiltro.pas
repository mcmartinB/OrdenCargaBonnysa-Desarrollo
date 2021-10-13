unit UFFiltro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, BSpeedButton, BGridButton, BEdit, BDEdit,
  BCalendarButton;

type
  TFFiltro = class(TForm)
    Label3: TLabel;
    orden_occ: TBEdit;
    LEmpresa_p: TLabel;
    empresa_occ: TBEdit;
    BGBEmpresa_occ: TBGridButton;
    Label1: TLabel;
    centro_salida_occ: TBEdit;
    BGBCentro_occ: TBGridButton;
    STEmpresa_occ: TStaticText;
    STCentro_salida_occ: TStaticText;
    Label11: TLabel;
    fecha_desde_occ: TBEdit;
    Label14: TLabel;
    cliente_sal_occ: TBEdit;
    BGBCliente_sal_occ: TBGridButton;
    STCliente_sal_occ: TStaticText;
    Label9: TLabel;
    centro_destino_occ: TBEdit;
    BGBCentro_destino_occ: TBGridButton;
    STcentro_destino_occ: TStaticText;
    LPedido: TLabel;
    n_pedido_occ: TBEdit;
    LAno_semana_p: TLabel;
    transporte_occ: TBEdit;
    BGBtransporte_occ: TBGridButton;
    STTransporte_occ: TStaticText;
    Label5: TLabel;
    vehiculo_occ: TBEdit;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Label2: TLabel;
    dir_sum_occ: TBEdit;
    BGBdir_sum_occ: TBGridButton;
    STDir_sum_occ: TStaticText;
    Label4: TLabel;
    fecha_hasta_occ: TBEdit;
    BCBFecha_occ: TBCalendarButton;
    BCalendarButton1: TBCalendarButton;
    Label6: TLabel;
    cbxTraspasada: TComboBox;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure empresa_occChange(Sender: TObject);
    procedure centro_salida_occChange(Sender: TObject);
    procedure centro_destino_occChange(Sender: TObject);
    procedure cliente_sal_occChange(Sender: TObject);
    procedure dir_sum_occChange(Sender: TObject);
    procedure transporte_occChange(Sender: TObject);
    procedure BGBCliente_sal_occClick(Sender: TObject);
    procedure BGBEmpresa_occClick(Sender: TObject);
    procedure BGBCentro_occClick(Sender: TObject);
    procedure BGBCentro_destino_occClick(Sender: TObject);
    procedure BGBdir_sum_occClick(Sender: TObject);
    procedure BGBtransporte_occClick(Sender: TObject);
    procedure BCBFecha_occClick(Sender: TObject);
    procedure BCalendarButton1Click(Sender: TObject);
  private
    { Private declarations }
    sAux: string;

    procedure DesplegarRejilla( const AControl: TControl );
  public
    { Public declarations }
    function GetFiltro: String;
  end;

implementation

{$R *.dfm}

uses UFRejilla, UDDescripciones, UFCalendario, UFTransportistas, UFClientes;

function TFFiltro.GetFiltro: String;
var
  bFlag: Boolean;
begin
  bFlag:= false;
  result:= '';

  if Trim( orden_occ.Text ) <> '' then
  begin
     result:= ' orden_occ = ' + orden_occ.Text;
     bFlag:= True;
  end
  else
  begin
    if Trim( empresa_occ.Text ) <> '' then
    begin
       result:= ' empresa_occ = ' + QuotedStr( empresa_occ.Text );
       bFlag:= True;
    end;
    if Trim( centro_salida_occ.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' centro_salida_occ = ' + QuotedStr( centro_salida_occ.Text );
       bFlag:= True;
    end;
    if Trim( centro_destino_occ.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' centro_destino_occ = ' + QuotedStr( centro_destino_occ.Text );
       bFlag:= True;
    end;
    if Trim( cliente_sal_occ.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' cliente_sal_occ = ' + QuotedStr( cliente_sal_occ.Text );
       bFlag:= True;
    end;
    if Trim( dir_sum_occ.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' dir_sum_occ = ' + QuotedStr( dir_sum_occ.Text );
       bFlag:= True;
    end;
    if Trim( n_pedido_occ.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' n_pedido_occ = ' + QuotedStr( n_pedido_occ.Text );
       bFlag:= True;
    end;
    if Trim( transporte_occ.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' transporte_occ = ' + transporte_occ.Text;
       bFlag:= True;
    end;
    if Trim( vehiculo_occ.Text ) <> '' then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' vehiculo_occ = ' + QuotedStr( vehiculo_occ.Text );
       bFlag:= True;
    end;
    if ( Trim( fecha_desde_occ.Text ) <> '' ) and ( Trim( fecha_hasta_occ.Text ) <> '' ) then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' fecha_occ between ' + QuotedStr( fecha_desde_occ.Text ) + ' and ' + QuotedStr( fecha_hasta_occ.Text );
       bFlag:= True;
    end
    else
    if ( Trim( fecha_desde_occ.Text ) <> '' ) then
    begin
       if bFlag then
         result:= result + ' and ';
       result:= result + ' fecha_occ = ' + QuotedStr( fecha_desde_occ.Text );
       bFlag:= True;
    end;
    case cbxTraspasada.ItemIndex of
      1:
      begin
        if bFlag then
          result:= result + ' and ';
        result:= result + ' traspasada_occ <> 0 ';
        bFlag:= True;
      end;
      2:
      begin
        if bFlag then
          result:= result + ' and ';
        result:= result + ' traspasada_occ = 0 ';
        bFlag:= True;
      end;
    end;
  end;
  if bFlag then
    result:= 'where ' + result;
end;

procedure TFFiltro.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f1:
          btnAceptar.Click;
    vk_escape:
          btnCancelar.Click;
  end;
end;

procedure TFFiltro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return, vk_down:
          PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
    vk_up:
          PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
    vk_f2:
          DesplegarRejilla( self.ActiveControl );
    end;
end;

procedure TFFiltro.DesplegarRejilla( const AControl: TControl );
var
  sAux: string;
begin
  sAux:= TEdit( AControl ).Text;

  if ( AControl.Name = fecha_desde_occ.Name ) or ( AControl.Name = fecha_hasta_occ.Name ) then
  begin
    PonFecha( self, AControl, SAux, sAux );
  end
  else
  if AControl.Name = empresa_occ.Name then
  begin
    SeleccionaEmpresa( self, AControl, SAux );
  end
  else
  if ( AControl.Name = centro_salida_occ.Name )  or ( AControl.Name = centro_destino_occ.Name )then
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
    SeleccionaSuministro( self, AControl, empresa_occ.Text, cliente_sal_occ.Text, SAux );
  end
  else
  if ( AControl.Name = transporte_occ.Name ) then
  begin
    UFTransportistas.SeleccionaTransportista( self, AControl, empresa_occ.Text, SAux );
  end;

  TEdit( AControl ).Text:= sAux;
end;

procedure TFFiltro.empresa_occChange(Sender: TObject);
begin
  STempresa_occ.Caption:= DDescripciones.desEmpresa( empresa_occ.Text );
  STcentro_salida_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_salida_occ.Text );
  STcentro_destino_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_destino_occ.Text );
  STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
  STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
  STtransporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, transporte_occ.Text );
end;

procedure TFFiltro.centro_salida_occChange(Sender: TObject);
begin
  STcentro_salida_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_salida_occ.Text );
end;

procedure TFFiltro.centro_destino_occChange(Sender: TObject);
begin
  STcentro_destino_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_destino_occ.Text );
end;

procedure TFFiltro.cliente_sal_occChange(Sender: TObject);
begin
  STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
end;

procedure TFFiltro.dir_sum_occChange(Sender: TObject);
begin
  STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
end;

procedure TFFiltro.transporte_occChange(Sender: TObject);
begin
  STtransporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, transporte_occ.Text );
end;

procedure TFFiltro.BGBEmpresa_occClick(Sender: TObject);
begin
  sAux:= empresa_occ.Text;
  if SeleccionaEmpresa( self, empresa_occ, sAux ) then
    empresa_occ.Text:= sAux;
end;

procedure TFFiltro.BGBCentro_occClick(Sender: TObject);
begin
  sAux:= centro_salida_occ.Text;
  if SeleccionaCentro( self, centro_salida_occ, empresa_occ.text, sAux ) then
    centro_salida_occ.Text:= sAux;
end;

procedure TFFiltro.BGBCentro_destino_occClick(Sender: TObject);
begin
  sAux:= centro_destino_occ.Text;
  if SeleccionaCentro( self, centro_destino_occ, empresa_occ.text, sAux ) then
    centro_destino_occ.Text:= sAux;
end;

procedure TFFiltro.BGBCliente_sal_occClick(Sender: TObject);
begin
  sAux:= cliente_sal_occ.Text;
  if UFClientes.SeleccionaClientes( self, cliente_sal_occ, empresa_occ.text, sAux ) then
    cliente_sal_occ.Text:= sAux;
end;

procedure TFFiltro.BGBdir_sum_occClick(Sender: TObject);
begin
  sAux:= dir_sum_occ.Text;
  if SeleccionaSuministro( self, dir_sum_occ, empresa_occ.text, cliente_sal_occ.Text, sAux ) then
    dir_sum_occ.Text:= sAux;
end;

procedure TFFiltro.BGBtransporte_occClick(Sender: TObject);
begin
  sAux:= transporte_occ.Text;
  if SeleccionaTransportista( self, transporte_occ, empresa_occ.text, sAux ) then
    transporte_occ.Text:= sAux;
end;

procedure TFFiltro.BCBFecha_occClick(Sender: TObject);
begin
  sAux:= fecha_desde_occ.Text;
  if PonFecha( self, fecha_desde_occ, fecha_desde_occ.Text, sAux ) then
    fecha_desde_occ.Text:= sAux;
end;

procedure TFFiltro.BCalendarButton1Click(Sender: TObject);
begin
  sAux:= fecha_hasta_occ.Text;
  if PonFecha( self,fecha_hasta_occ, fecha_hasta_occ.Text, sAux ) then
    fecha_hasta_occ.Text:= sAux;
end;

end.
