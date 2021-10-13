object DListados: TDListados
  OldCreateOrder = False
  Height = 396
  Width = 433
  object QCab: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select *'
      'from frf_orden_carga_c')
    Left = 40
    Top = 32
    object QCaborden_occ: TIntegerField
      FieldName = 'orden_occ'
      Origin = 'DATABASE.frf_orden_carga_c.orden_occ'
    end
    object QCabempresa_occ: TStringField
      FieldName = 'empresa_occ'
      Origin = 'DATABASE.frf_orden_carga_c.empresa_occ'
      FixedChar = True
      Size = 3
    end
    object QCabcentro_salida_occ: TStringField
      FieldName = 'centro_salida_occ'
      Origin = 'DATABASE.frf_orden_carga_c.centro_salida_occ'
      FixedChar = True
      Size = 1
    end
    object QCabn_albaran_occ: TIntegerField
      FieldName = 'n_albaran_occ'
      Origin = 'DATABASE.frf_orden_carga_c.n_albaran_occ'
    end
    object QCabfecha_occ: TDateField
      FieldName = 'fecha_occ'
      Origin = 'DATABASE.frf_orden_carga_c.fecha_occ'
    end
    object QCabhora_occ: TStringField
      FieldName = 'hora_occ'
      Origin = 'DATABASE.frf_orden_carga_c.hora_occ'
      FixedChar = True
      Size = 5
    end
    object QCabcentro_destino_occ: TStringField
      FieldName = 'centro_destino_occ'
      Origin = 'DATABASE.frf_orden_carga_c.centro_destino_occ'
      FixedChar = True
      Size = 1
    end
    object QCabcliente_sal_occ: TStringField
      FieldName = 'cliente_sal_occ'
      Origin = 'DATABASE.frf_orden_carga_c.cliente_sal_occ'
      FixedChar = True
      Size = 3
    end
    object QCabdir_sum_occ: TStringField
      FieldName = 'dir_sum_occ'
      Origin = 'DATABASE.frf_orden_carga_c.dir_sum_occ'
      FixedChar = True
      Size = 3
    end
    object QCabcliente_fac_occ: TStringField
      FieldName = 'cliente_fac_occ'
      Origin = 'DATABASE.frf_orden_carga_c.cliente_fac_occ'
      FixedChar = True
      Size = 3
    end
    object QCabn_pedido_occ: TStringField
      FieldName = 'n_pedido_occ'
      Origin = 'DATABASE.frf_orden_carga_c.n_pedido_occ'
      FixedChar = True
      Size = 15
    end
    object QCabmoneda_occ: TStringField
      FieldName = 'moneda_occ'
      Origin = 'DATABASE.frf_orden_carga_c.moneda_occ'
      FixedChar = True
      Size = 3
    end
    object QCabtransporte_occ: TSmallintField
      FieldName = 'transporte_occ'
      Origin = 'DATABASE.frf_orden_carga_c.transporte_occ'
    end
    object QCabvehiculo_occ: TStringField
      FieldName = 'vehiculo_occ'
      Origin = 'DATABASE.frf_orden_carga_c.vehiculo_occ'
      FixedChar = True
    end
    object QCabnota_occ: TMemoField
      FieldName = 'nota_occ'
      Origin = 'DATABASE.frf_orden_carga_c.nota_occ'
      BlobType = ftMemo
      Size = 511
    end
    object QCabstatus_occ: TIntegerField
      FieldName = 'status_occ'
      Origin = 'DATABASE.frf_orden_carga_c.status_occ'
    end
    object QCabtraspasada_occ: TIntegerField
      FieldName = 'traspasada_occ'
      Origin = 'DATABASE.frf_orden_carga_c.traspasada_occ'
    end
    object QCabporte_bonny_occ: TIntegerField
      FieldName = 'porte_bonny_occ'
      Origin = '"COMER.BDL.LOCAL".frf_orden_carga_c.porte_bonny_occ'
    end
    object QCabn_palets_occ: TIntegerField
      FieldName = 'n_palets_occ'
      Origin = '"COMER.BDL.LOCAL".frf_orden_carga_c.n_palets_occ'
    end
    object QCabhigiene_occ: TIntegerField
      FieldName = 'higiene_occ'
      Origin = '"COMER.BDL.LOCAL".frf_orden_carga_c.higiene_occ'
    end
    object QCabnota_interna_occ: TStringField
      FieldName = 'nota_interna_occ'
      Origin = '"COMER.BDL.LOCAL".frf_orden_carga_c.nota_interna_occ'
      FixedChar = True
      Size = 255
    end
    object QCabfecha_descarga_occ: TDateField
      FieldName = 'fecha_descarga_occ'
    end
  end
  object QLineas: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select *'
      'from frf_orden_carga_l')
    Left = 88
    Top = 32
    object QLineasorden_ocl: TIntegerField
      FieldName = 'orden_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.orden_ocl'
    end
    object QLineaslinea_ocl: TIntegerField
      FieldName = 'linea_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.linea_ocl'
    end
    object QLineasempresa_ocl: TStringField
      FieldName = 'empresa_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.empresa_ocl'
      FixedChar = True
      Size = 3
    end
    object QLineascentro_salida_ocl: TStringField
      FieldName = 'centro_salida_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.centro_salida_ocl'
      FixedChar = True
      Size = 1
    end
    object QLineasn_albaran_ocl: TIntegerField
      FieldName = 'n_albaran_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.n_albaran_ocl'
    end
    object QLineasfecha_ocl: TDateField
      FieldName = 'fecha_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.fecha_ocl'
    end
    object QLineascentro_origen_ocl: TStringField
      FieldName = 'centro_origen_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.centro_origen_ocl'
      FixedChar = True
      Size = 1
    end
    object QLineasproducto_ocl: TStringField
      DisplayWidth = 3
      FieldName = 'producto_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.producto_ocl'
      FixedChar = True
      Size = 3
    end
    object QLineasenvase_ocl: TStringField
      FieldName = 'envase_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.envase_ocl'
      FixedChar = True
      Size = 3
    end
    object QLineasmarca_ocl: TStringField
      FieldName = 'marca_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.marca_ocl'
      FixedChar = True
      Size = 2
    end
    object QLineascategoria_ocl: TStringField
      FieldName = 'categoria_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.categoria_ocl'
      FixedChar = True
      Size = 2
    end
    object QLineascalibre_ocl: TStringField
      DisplayWidth = 10
      FieldName = 'calibre_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.calibre_ocl'
      FixedChar = True
      Size = 10
    end
    object QLineascolor_ocl: TStringField
      FieldName = 'color_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.color_ocl'
      FixedChar = True
      Size = 1
    end
    object QLineasref_transitos_ocl: TIntegerField
      FieldName = 'ref_transitos_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.ref_transitos_ocl'
    end
    object QLineasfecha_transito_ocl: TDateField
      FieldName = 'fecha_transito_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.fecha_transito_ocl'
    end
    object QLineascajas_ocl: TIntegerField
      FieldName = 'cajas_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.cajas_ocl'
    end
    object QLineaskilos_ocl: TFloatField
      FieldName = 'kilos_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.kilos_ocl'
    end
    object QLineasprecio_ocl: TFloatField
      FieldName = 'precio_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.precio_ocl'
    end
    object QLineasunidad_precio_ocl: TStringField
      FieldName = 'unidad_precio_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.unidad_precio_ocl'
      FixedChar = True
      Size = 3
    end
    object QLineasimporte_neto_ocl: TFloatField
      FieldName = 'importe_neto_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.importe_neto_ocl'
    end
    object QLineasporc_iva_ocl: TFloatField
      FieldName = 'porc_iva_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.porc_iva_ocl'
    end
    object QLineasiva_ocl: TFloatField
      FieldName = 'iva_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.iva_ocl'
    end
    object QLineasimporte_total_ocl: TFloatField
      FieldName = 'importe_total_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.importe_total_ocl'
    end
    object QLineasn_palets_ocl: TSmallintField
      FieldName = 'n_palets_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.n_palets_ocl'
    end
    object QLineastipo_palets_ocl: TStringField
      FieldName = 'tipo_palets_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.tipo_palets_ocl'
      FixedChar = True
      Size = 2
    end
    object QLineastipo_iva_ocl: TStringField
      FieldName = 'tipo_iva_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.tipo_iva_ocl'
      FixedChar = True
      Size = 2
    end
    object QLineasfederacion_ocl: TStringField
      FieldName = 'federacion_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.federacion_ocl'
      FixedChar = True
      Size = 1
    end
    object QLineascliente_ocl: TStringField
      FieldName = 'cliente_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.cliente_ocl'
      FixedChar = True
      Size = 3
    end
    object QLineasemp_procede_ocl: TStringField
      FieldName = 'emp_procede_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.emp_procede_ocl'
      FixedChar = True
      Size = 3
    end
    object strngfldQLineasnotas_ocl: TStringField
      FieldName = 'notas_ocl'
      Size = 90
    end
  end
  object QPackingLin: TQuery
    DatabaseName = 'database'
    SQL.Strings = (
      'select *'
      'from frf_packing_list'
      '')
    Left = 88
    Top = 256
    object IntegerField1: TIntegerField
      FieldName = 'orden_pl'
      Origin = 'DATABASE.frf_packing_list.orden_pl'
    end
    object DateField1: TDateField
      FieldName = 'fecha_alta_pl'
      Origin = 'DATABASE.frf_packing_list.fecha_alta_pl'
    end
    object StringField1: TStringField
      FieldName = 'hora_alta_pl'
      Origin = 'DATABASE.frf_packing_list.hora_alta_pl'
      FixedChar = True
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'empresa_pl'
      Origin = 'DATABASE.frf_packing_list.empresa_pl'
      FixedChar = True
      Size = 3
    end
    object SmallintField1: TSmallintField
      FieldName = 'producto_base_pl'
      Origin = 'DATABASE.frf_packing_list.producto_base_pl'
    end
    object StringField3: TStringField
      FieldName = 'producto_pl'
      Origin = 'DATABASE.frf_packing_list.producto_pl'
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'ean128_pl'
      Origin = 'DATABASE.frf_packing_list.ean128_pl'
      FixedChar = True
    end
    object StringField5: TStringField
      FieldName = 'ean13_pl'
      Origin = 'DATABASE.frf_packing_list.ean13_pl'
      FixedChar = True
      Size = 13
    end
    object StringField6: TStringField
      FieldName = 'envase_pl'
      Origin = 'DATABASE.frf_packing_list.envase_pl'
      FixedChar = True
      Size = 3
    end
    object IntegerField2: TIntegerField
      FieldName = 'cajas_pl'
      Origin = 'DATABASE.frf_packing_list.cajas_pl'
    end
    object StringField7: TStringField
      FieldName = 'calibre_pl'
      Origin = 'DATABASE.frf_packing_list.calibre_pl'
      FixedChar = True
      Size = 6
    end
    object StringField8: TStringField
      FieldName = 'color_pl'
      Origin = 'DATABASE.frf_packing_list.color_pl'
      FixedChar = True
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'le_pl'
      Origin = 'DATABASE.frf_packing_list.le_pl'
      FixedChar = True
      Size = 2
    end
    object FloatField1: TFloatField
      FieldName = 'peso_pl'
      Origin = 'DATABASE.frf_packing_list.peso_pl'
    end
    object StringField10: TStringField
      FieldName = 'tipo_palet_pl'
      Origin = 'DATABASE.frf_packing_list.tipo_palet_pl'
      FixedChar = True
      Size = 2
    end
    object StringField11: TStringField
      FieldName = 'cliente_pl'
      Origin = 'DATABASE.frf_packing_list.cliente_pl'
      FixedChar = True
      Size = 3
    end
    object StringField12: TStringField
      FieldName = 'dir_sum_pl'
      Origin = 'DATABASE.frf_packing_list.dir_sum_pl'
      FixedChar = True
      Size = 3
    end
    object DateField2: TDateField
      FieldName = 'fecha_carga_pl'
      Origin = 'DATABASE.frf_packing_list.fecha_carga_pl'
    end
    object StringField13: TStringField
      FieldName = 'hora_carga_pl'
      Origin = 'DATABASE.frf_packing_list.hora_carga_pl'
      FixedChar = True
      Size = 10
    end
  end
  object QPalets: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select tipo_palet_pl, count(distinct ean128_pl) palets_pl'
      'from frf_packing_list '
      'where orden_pl = 8'
      'group by tipo_palet_pl '
      'order by tipo_palet_pl')
    Left = 88
    Top = 88
    object QPaletstipo_palet_pl: TStringField
      FieldName = 'tipo_palet_pl'
      Origin = 'DATABASE.frf_packing_list.tipo_palet_pl'
      FixedChar = True
      Size = 2
    end
    object QPaletspalets_pl: TFloatField
      FieldName = 'palets_pl'
      Origin = 'DATABASE.frf_packing_list.ean128_pl'
    end
  end
  object QLogifruit: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select codigo_caja_e, texto_caja_e, sum(cajas_pl) cajas_pl'
      'from frf_packing_list, frf_envases'
      'where orden_pl = 8'
      'and empresa_e = empresa_pl'
      'and producto_e = producto_pl'
      'and envase_e = envase_pl'
      'and codigo_caja_e is not null'
      'group by codigo_caja_e, texto_caja_e'
      'order by codigo_caja_e')
    Left = 88
    Top = 144
    object QLogifruitcodigo_caja_e: TStringField
      FieldName = 'codigo_caja_e'
      Origin = 'DATABASE.frf_envases.codigo_caja_e'
      FixedChar = True
      Size = 5
    end
    object QLogifruittexto_caja_e: TStringField
      FieldName = 'texto_caja_e'
      Origin = 'DATABASE.frf_envases.texto_caja_e'
      FixedChar = True
      Size = 35
    end
    object QLogifruitcajas_pl: TFloatField
      FieldName = 'cajas_pl'
      Origin = 'DATABASE.frf_packing_list.cajas_pl'
    end
  end
  object QEnvases: TQuery
    DatabaseName = 'database'
    SQL.Strings = (
      
        'select envase_pl, marca_pl, calibre_pl, color_pl, bestbefore_pl,' +
        ' sum(cajas_pl) cajas_pl, sum(peso_pl) peso_pl'
      'from frf_packing_list'
      ''
      
        'group by envase_pl, marca_pl,  calibre_pl, color_pl, bestbefore_' +
        'pl'
      
        'order by envase_pl,  marca_pl, calibre_pl, color_pl, bestbefore_' +
        'pl')
    Left = 88
    Top = 200
    object QEnvasesempresa_pl: TStringField
      FieldName = 'empresa_pl'
      Origin = 'DATABASE.frf_packing_list.empresa_pl'
      Size = 3
    end
    object QEnvasesenvase_pl: TStringField
      DisplayWidth = 9
      FieldName = 'envase_pl'
      Origin = 'DATABASE.frf_packing_list.envase_pl'
      FixedChar = True
      Size = 9
    end
    object QEnvasesproducto_pl: TStringField
      FieldName = 'producto_pl'
      Origin = 'DATABASE.frf_packing_list.producto_pl'
      Size = 3
    end
    object QEnvasesmarca_pl: TStringField
      FieldName = 'marca_pl'
      Origin = 'DATABASE.frf_packing_list.marca_pl'
      FixedChar = True
      Size = 2
    end
    object QEnvasescalibre_pl: TStringField
      DisplayWidth = 10
      FieldName = 'calibre_pl'
      Origin = 'DATABASE.frf_packing_list.calibre_pl'
      FixedChar = True
      Size = 10
    end
    object QEnvasescolor_pl: TStringField
      FieldName = 'color_pl'
      Origin = 'DATABASE.frf_packing_list.color_pl'
      FixedChar = True
      Size = 1
    end
    object QEnvasesunidades_caja_pl: TIntegerField
      FieldName = 'unidades_caja_pl'
      Origin = 'DATABASE.frf_packing_list.unidades_caja_pl'
    end
    object QEnvasescajas_pl: TFloatField
      FieldName = 'cajas_pl'
      Origin = 'DATABASE.frf_packing_list.cajas_pl'
    end
    object QEnvasespeso_pl: TFloatField
      FieldName = 'peso_pl'
      Origin = 'DATABASE.frf_packing_list.peso_pl'
    end
    object QEnvasestipo_palet_pl: TStringField
      FieldName = 'tipo_palet_pl'
      Origin = 'DATABASE.frf_packing_list.tipo_palet_pl'
      FixedChar = True
      Size = 2
    end
    object QEnvasespalets_pl: TFloatField
      FieldName = 'palets_pl'
      Origin = 'DATABASE.frf_packing_list.palets_pl_pl'
    end
    object QEnvasesbestbefore_pl: TDateField
      FieldName = 'bestbefore_pl'
      Origin = 'COMERSAT.frf_packing_list.bestbefore_pl'
    end
  end
end
