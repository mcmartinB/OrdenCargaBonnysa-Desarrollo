object DOrdenCarga: TDOrdenCarga
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 653
  Width = 637
  object QTemp: TQuery
    DatabaseName = 'Database'
    Left = 80
    Top = 32
  end
  object QListado: TQuery
    DatabaseName = 'Database'
    Left = 80
    Top = 88
  end
  object QAux: TQuery
    DatabaseName = 'Database'
    Left = 136
    Top = 32
  end
  object Database: TDatabase
    DatabaseName = 'Database'
    DriverName = 'INFORMIX'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=llanos1'
      'DATABASE NAME=comer2'
      'USER NAME=informix'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER=DB850ES0'
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'LOCK MODE=5'
      'DATE MODE=1'
      'DATE SEPARATOR=/'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'LIST SYNONYMS=NONE'
      'DBNLS='
      'COLLCHAR='
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=unix1q2w')
    SessionName = 'Default'
    Left = 24
    Top = 32
  end
  object QGetNumeroOrden: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select contador_oc'
      'from frf_orden_carga'
      'where empresa_oc = :empresa')
    Left = 280
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
  end
  object QUpdateNumeroOrden: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'update frf_orden_carga'
      'set contador_oc = :contador'
      'where empresa_oc = :empresa')
    Left = 392
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contador'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end>
  end
  object QBorrarDetalle: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'delete from frf_orden_carga_l'
      'where orden_ocl = :contador')
    Left = 280
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contador'
        ParamType = ptUnknown
      end>
  end
  object QGetNumeroLinea: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select max( linea_ocl )'
      'from frf_orden_carga_l'
      'where orden_ocl = :orden')
    Left = 280
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end>
  end
  object QCliente_es_de: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      
        'SELECT case when pais_fac_c is null then pais_c else pais_fac_c ' +
        'end pais, '
      
        '       case when cod_postal_fac_c is null then cod_postal_c[1,2]' +
        ' else cod_postal_fac_c[1,2] end prov, '
      '       es_comunitario_c comu '
      'FROM frf_clientes Frf_clientes'
      'WHERE  (cliente_c = :cliente)  ')
    Left = 80
    Top = 201
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end>
  end
  object QSuminis_es_de: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select pais_ds pais, cod_postal_ds[1,2] prov'
      'from frf_dir_sum'
      'where cliente_ds=:cliente'
      'and dir_sum_ds=:dirsum')
    Left = 80
    Top = 257
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dirsum'
        ParamType = ptUnknown
      end>
  end
  object QCentro_es_de: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'SELECT cod_postal_c[1,2] prov'
      'FROM frf_centros Frf_centros'
      'WHERE   (empresa_c = :empresa)  '
      '   AND  (centro_c = :centro)  ')
    Left = 80
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object QDatos_impuestos: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      
        'SELECT codigo_i, tipo_i, descripcion_i, general_i, reducido_i, s' +
        'uper_i'
      'FROM frf_impuestos Frf_impuestos'
      'WHERE  codigo_i = :impuesto')
    Left = 80
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'impuesto'
        ParamType = ptUnknown
      end>
  end
  object QCambiarEstado: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'update frf_orden_carga_c'
      'set status_occ = :estado'
      'where orden_occ = :orden')
    Left = 280
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'estado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end>
  end
  object QCajasPaletsOrden: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select sum(cajas_ocl) cajas,  sum(n_palets_ocl) palets'
      'from frf_orden_carga_l'
      'where orden_ocl = :orden'
      'and linea_ocl <> :linea'
      'and empresa_ocl = :empresa'
      'and producto_ocl = :producto'
      'and envase_ocl = :envase')
    Left = 280
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'linea'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'envase'
        ParamType = ptUnknown
      end>
  end
  object QCajasPaletsPacking: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select sum(cajas_pl) cajas, count( distinct ean128_pl ) palets'
      'from frf_packing_list'
      'where orden_pl = :orden'
      'and empresa_pl = :empresa'
      'and producto_pl = :producto'
      'and envase_pl = :envase')
    Left = 384
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'producto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'envase'
        ParamType = ptUnknown
      end>
  end
  object QExistePacking: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select empresa_pl, producto_pl, envase_pl, sum(cajas_pl) cajas'
      'from frf_packing_list'
      'where orden_pl = :orden'
      'group by empresa_pl, producto_pl, envase_pl'
      'order by empresa_pl, producto_pl, envase_pl')
    Left = 280
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end>
  end
  object QUpdatePaletCab: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'update frf_orden_carga_c'
      'set n_palets_occ ='
      ' ( select sum(n_palets_ocl) '
      '   from frf_orden_carga_l'
      '   where orden_ocl = :orden )'
      'where orden_occ = :orden')
    Left = 392
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end>
  end
  object QResumenOrden: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select producto_ocl, '
      
        '       envase_ocl, tipo_palets_ocl tipo_palet_ocl, sum(cajas_ocl' +
        ') cajas_ocl, sum(n_palets_ocl) palets_ocl'
      'from frf_orden_carga_l'
      'where orden_ocl = :orden'
      'group by 1,2,3'
      'order by 1,2,3')
    Left = 272
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end>
  end
  object QResumenPacking: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select '
      '   producto_pl,'
      '   envase_pl, tipo_palet_pl, sum(cajas_pl) cajas_pl, '
      '   count( distinct ean128_pl) palets_pl'
      'from frf_packing_list '
      'where orden_pl = :orden'
      'group by 1,2,3'
      'order  by 1,2,3')
    Left = 392
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end>
  end
  object QGetProductoBase: TQuery
    DatabaseName = 'Database'
    RequestLive = True
    SQL.Strings = (
      'select producto_base_p '
      'from frf_productos'
      'where empresa_p = :empresa'
      'and producto_p = :producto')
    Left = 48
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'producto'
        ParamType = ptUnknown
      end>
  end
  object QGetProducto: TQuery
    DatabaseName = 'Database'
    RequestLive = True
    SQL.Strings = (
      'select producto_p '
      'from frf_productos'
      'where empresa_p = :empresa'
      'and producto_base_p = :producto'
      'order by producto_p ')
    Left = 112
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'producto'
        ParamType = ptUnknown
      end>
  end
  object QBorrarPacking: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'delete from frf_packing_list'
      'where orden_pl = :contador')
    Left = 392
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contador'
        ParamType = ptUnknown
      end>
  end
  object QDesfinalizarOrden: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'update frf_orden_carga_c'
      'set n_albaran_occ = :orden, '
      '    status_occ = 2, '
      '    traspasada_occ = 0'
      'where orden_occ = :orden')
    Left = 280
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end>
  end
  object QRecargo_equivalencia: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      
        'SELECT codigo_i, tipo_i, descripcion_i, general_i, reducido_i, s' +
        'uper_i'
      'FROM frf_impuestos Frf_impuestos'
      'WHERE  codigo_i = :impuesto')
    Left = 185
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'impuesto'
        ParamType = ptUnknown
      end>
  end
  object QCambiarComercial: TQuery
    DatabaseName = 'Database'
    Left = 80
    Top = 144
  end
end
