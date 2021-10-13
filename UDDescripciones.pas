unit UDDescripciones;

interface

uses
  Forms, SysUtils, Classes, DB, DBTables;

type
  TDDescripciones = class(TDataModule)
    QDescripciones: TQuery;
    QAux: TQuery;
  private
    { Private declarations }
    function Descripcion(sqlCad: string): string;
    function ProductoBase(  const AEmpresa, AProducto: string ): string;
    function TieneSuministros( const AEmpresa, ACliente: string ): Boolean;

  public
    { Public declarations }
    function desEmpresa(const empresa: string): string;
    function desCentro(const empresa, centro: string): string;
    function desCliente(const empresa, cliente: string): string;
      function PorteCliente(const AEmpresa, ACliente: string): integer;
    function desProducto(const empresa, producto: string): string;
    function desProductoVenta(const producto: string): string;
    function desComercial(const AComercial: string): string;
    function desTransporte(const empresa, transporte: string): string;
    function desPais(const pais: string): string;
    function desProvincia(const codPostal: string): string;
    function desColor(const empresa, producto, color: string): string;
    function desMarca(const marca: string): string;
    function desTipoPalet(const palet: string): string;
    function desEnvase(const empresa, envase: string): string;
    function desEnvaseComercial(const AEmpresa, AEan13: string): string;
    function desCategoria(const empresa, producto, catego: string): string;
    function desSuministro(const empresa, cliente, dirSum: string): string;
    function desImpuesto(const impuesto: string): string;

    function EsProductoAlta( const producto: string) : boolean;
    function EsProductoVenta( const producto: string) : boolean;

    function desEnvaseCliente(const empresa, producto, envase, cliente: string;
      const esEspanyol: integer = -1): string;
    function desEnvaseClienteEx(const empresa, producto, envase, cliente: string;
      const esEspanyol: integer = -1): string;

  end;

  procedure InicializaModulo( const ABaseDatos: string );
  procedure FinalizaModulo;


var
  DDescripciones: TDDescripciones;

implementation

uses bSQLUtils;

{$R *.dfm}

procedure InicializaModulo( const ABaseDatos: string );
begin
  DDescripciones:= TDDescripciones.Create( Application );
  DDescripciones.QDescripciones.DatabaseName:= ABaseDatos;
  DDescripciones.QAux.DatabaseName:= ABaseDatos;
end;

procedure FinalizaModulo;
begin
  FreeAndNil( DDescripciones );
end;

function TDDescripciones.Descripcion(sqlCad: string): string;
begin
  with QDescripciones do
  begin
    SQL.Text := sqlCad;
    try
      try
        Open;
        if IsEmpty then Descripcion := ''
        else Descripcion := Fields[0].AsString;
      except
        Descripcion := '';
      end;
    finally
      Cancel;
      Close;
    end;
  end;
end;

function TDDescripciones.ProductoBase(  const AEmpresa, AProducto: string ): string;
begin
  ProductoBase := '';
  if (Trim(AEmpresa) = '') or (Trim(AProducto) = '') then Exit;
  Result := Descripcion(' select producto_base_p from frf_productos ' +
    ' where producto_p ' + SQLEqualS(AProducto));
end;

function TDDescripciones.TieneSuministros( const AEmpresa, ACliente: string ): Boolean;
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

function TDDescripciones.desEmpresa(const empresa: string): string;
begin
  desEmpresa := '';
  if Trim(empresa) = '' then Exit;
  Result := Descripcion(' select nombre_e from frf_empresas ' +
    ' where empresa_e=' + QuotedStr(empresa));
end;

function TDDescripciones.desCentro(const empresa, centro: string): string;
begin
  desCentro := '';
  if (Trim(empresa) = '') or (Trim(centro) = '') then Exit;
  Result := Descripcion(' select descripcion_c from frf_centros ' +
    ' where empresa_c=' + QuotedStr(empresa) + ' ' +
    ' and centro_c=' + QuotedStr(centro) + ' ');
end;

function TDDescripciones.desCliente(const empresa, cliente: string): string;
begin
  desCliente := '';
  if (Trim(empresa) = '') or (Trim(cliente) = '') then Exit;
  Result := Descripcion(' select nombre_c from frf_clientes ' +
    ' where cliente_c=' + QuotedStr(cliente) + ' ');
end;

function TDDescripciones.PorteCliente(const AEmpresa, ACliente: string): integer;
var
  ssql: string;
begin
  if AEmpresa = 'SAT' then
  begin
    ssql:= ' select grabrar_transporte_c from frf_clientes ' +
      ' where cliente_c=' + QuotedStr(ACliente);
  end
  else
  if AEmpresa = 'BAG' then
  begin
    ssql:= ' select grabrar_transporte_c from frf_clientes ' +
      ' where cliente_c=' + QuotedStr(ACliente);
  end
  else
  begin
    ssql:= ' select grabrar_transporte_c from frf_clientes ' +
      ' where cliente_c=' + QuotedStr(ACliente);
  end;

  with QDescripciones do
  begin
    SQL.Text := ssql;
    try
      try
        Open;
        if IsEmpty then Result := -1
        else Result := Fields[0].AsInteger;
      except
        Result := -1;
      end;
    finally
      Cancel;
      Close;
    end;
  end;

  //si grabrar conste transporte cliente = 1 entonces el porte lo paga bonny ->  porte cliente = 0
  if Result = 0 then
    Result:= 1
  else
    Result:= 0;
end;

function TDDescripciones.desComercial(const AComercial: string): string;
begin
  Result := '';
  if (Trim(AComercial) = '') then
    Exit;
  Result := Descripcion(' select descripcion_c from frf_comerciales ' +
    ' where codigo_c =' + QuotedStr(AComercial) + ' ');
end;

function TDDescripciones.desProducto(const empresa, producto: string): string;
begin
  desProducto := '';
  if (Trim(empresa) = '') or (Trim(producto) = '') then Exit;
  Result := Descripcion(' select descripcion_p from frf_productos ' +
    ' where producto_p=' + QuotedStr(producto) + ' ');
end;

function TDDescripciones.desProductoVenta(const producto: string): string;
begin
  desProductoVenta := '';
  if (Trim(producto) = '') then Exit;
  Result := Descripcion(' select descripcion_p from frf_productos ' +
    ' where producto_p=' + QuotedStr(producto) + ' ' +
    '   and fecha_baja_p is null and tipo_venta_p = ''S'' ');
end;

function TDDescripciones.desTransporte(const empresa, transporte: string): string;
begin
  desTransporte := '';
  if (Trim(transporte) = '') then Exit;
  Result := Descripcion(' select descripcion_t from frf_transportistas ' +
    ' where transporte_t=' + transporte + ' ');
end;

function TDDescripciones.EsProductoAlta(const producto: string): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select * from frf_productos ' );
    SQL.Add(' where producto_p = ' + QuotedStr(producto) );
    SQL.Add('   and fecha_baja_p is null ');
    Open;
    Result:= not IsEmpty;
    Close;
  end;
end;

function TDDescripciones.EsProductoVenta(const producto: string): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select * from frf_productos ' );
    SQL.Add(' where producto_p = ' + QuotedStr(producto) );
    SQL.Add('   and fecha_baja_p is null ');
    SQl.Add('   and tipo_venta_p = ''S'' ');
    Open;
    Result:= not IsEmpty;
    Close;
  end;
end;

function TDDescripciones.desPais(const pais: string): string;
begin
  desPais := '';
  if Trim(pais) = '' then Exit;
  Result := Descripcion(' select descripcion_p from frf_paises ' +
    ' where pais_p=' + QuotedStr(pais));
end;


function TDDescripciones.desProvincia(const codPostal: string): string;
begin
  desProvincia := '';
  if Trim(codPostal) = '' then Exit;
  Result := Descripcion(' select nombre_p from frf_provincias ' +
    ' where codigo_p=' + QuotedStr(Copy(codPostal, 1, 2)));
end;

function TDDescripciones.desColor(const empresa, producto, color: string): string;
begin
  desColor := '';
  if (Trim(producto) = '') or (Trim(color) = '') then Exit;
  Result := Descripcion(' select descripcion_c from frf_colores ' +
    ' where producto_c=' + QuotedStr(producto) +
    ' and color_c=' + QuotedStr(color));
end;

function TDDescripciones.desMarca(const marca: string): string;
begin
  desMarca := '';
  if Trim(marca) = '' then Exit;
  Result := Descripcion(' select descripcion_m from frf_marcas ' +
    ' where codigo_m=' + QuotedStr(marca));
end;

function TDDescripciones.desTipoPalet(const palet: string): string;
begin
  desTipoPalet := '';
  if Trim(palet) = '' then Exit;
  Result := Descripcion(' select descripcion_tp from frf_tipo_palets ' +
    ' where codigo_tp=' + QuotedStr(palet));
end;

function TDDescripciones.desEnvase(const empresa, envase: string): string;
var
  sEmpresa: string;
begin
  desEnvase := '';
  if empresa = '' then
    sEmpresa := '050'
  else
    sEmpresa := empresa;
  if Trim(envase) = '' then Exit;
  Result := Descripcion(' select descripcion_e from frf_envases ' +
    ' where envase_e=' + QuotedStr(envase) );
end;

function TDDescripciones.desEnvaseComercial(const AEmpresa, AEan13: string): string;
begin
  desEnvaseComercial := '';
  if Trim(AEan13) = '' then Exit;
  Result := Descripcion(' select descripcion_e ' +
                        ' from frf_ean13 ' +
                        ' where empresa_e = ' + QuotedStr(AEmpresa) +
                        ' and codigo_e = ' + QuotedStr(AEan13) +
                        ' and fecha_baja_e is null' );
end;

function TDDescripciones.desEnvaseCliente(const empresa, producto, envase, cliente: string;
  const esEspanyol: integer = -1): string;
var
  enEspanyol: boolean;
begin
  desEnvaseCliente := '';
  Result := Descripcion(' select descripcion_ce from frf_clientes_env ' +
    ' where empresa_ce ' + SQLEqualS(empresa) +
    '   and producto_ce ' + SQLEqualS(producto) +
    '   and envase_ce ' + SQLEqualS(envase) +
    '   and cliente_ce ' + SQLEqualS(cliente));
  if Result = '' then
  begin
    if esEspanyol = -1 then
    begin
      with DDescripciones.QDescripciones do
      begin
        SQL.Text := ' select pais_c ' +
          ' from frf_clientes ' +
          ' where cliente_c=' + QuotedStr(cliente);
        try
          try
            Open;
            if IsEmpty then
              enEspanyol := true;
            enEspanyol := Fields[0].AsString = 'ES';
          except
            enEspanyol := true;
          end;
        finally
          Cancel;
          Close;
        end;
      end;
    end
    else
    begin
      enEspanyol := esEspanyol = 1;
    end;

    with DDescripciones.QDescripciones do
    begin
      SQL.Text := ' select descripcion_e, descripcion2_e ' +
        ' from frf_envases ' +
        ' where envase_e=' + QuotedStr(envase) ;
      try
        try
          Open;
          if IsEmpty then
          begin
            result := '';
            Exit;
          end;
        except
          result := '';
          Exit;
        end;

        if enEspanyol then
        begin
          Result := Fields[0].AsString;
        end
        else
        begin
          if Fields[1].AsString <> '' then
          begin
            Result := Fields[1].AsString;
          end
          else
          begin
            Result := Fields[0].AsString;
          end;
        end;

      finally
        Cancel;
        Close;
      end;
    end;
  end;
end;

function TDDescripciones.desEnvaseClienteEx(const empresa, producto, envase, cliente: string;
  const esEspanyol: integer = -1): string;
begin
  result := desEnvaseCliente(empresa, producto,
    envase, cliente, esEspanyol);
end;

function TDDescripciones.desCategoria(const empresa, producto, catego: string): string;
begin
  desCategoria := '';
  if (Trim(producto) = '') or (Trim(catego) = '') then Exit;
  Result := Descripcion(' select descripcion_c from frf_categorias ' +
    ' where producto_c=' + QuotedStr(producto) +
    ' and categoria_c=' + QuotedStr(catego));
end;

function TDDescripciones.desSuministro(const empresa, cliente, dirSum: string): string;
begin
  desSuministro := '';
  if (Trim(empresa) = '') or
     (Trim(cliente) = '') or
     (Trim(dirSum) = '') then
    Exit;

  Result := Descripcion(' select nombre_ds from frf_dir_sum ' +
      ' where cliente_ds=' + QuotedStr(cliente) +
      ' and dir_sum_ds=' + QuotedStr(dirSum) +
      ' and fecha_baja_ds is null ');
  (*
  if TieneSuministros( empresa, cliente) then
  begin
    Result := Descripcion(' select nombre_ds from frf_dir_sum ' +
      ' where empresa_ds=' + QuotedStr(empresa) + ' ' +
      ' and cliente_ds=' + QuotedStr(cliente) +
      ' and dir_sum_ds=' + QuotedStr(dirSum));
    if Result = '' then
    begin
      Result := desCliente( empresa, dirSum );
    end;
  end
  else
  begin
    Result := desCliente( empresa, dirSum );
  end;
  *)
end;

function TDDescripciones.desImpuesto(const impuesto: string): string;
begin
  desImpuesto := '';
  if Trim(impuesto) = '' then Exit;
  Result := Descripcion(' select descripcion_i from frf_impuestos ' +
    ' where codigo_i=' + QuotedStr(impuesto));
end;



end.
