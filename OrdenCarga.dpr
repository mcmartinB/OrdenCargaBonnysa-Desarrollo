program OrdenCarga;

uses
  Forms,
  UFOrdenCarga in 'UFOrdenCarga.pas' {FOrdenCarga},
  UDOrdenCarga in 'UDOrdenCarga.pas' {DOrdenCarga: TDataModule},
  UFCalendario in 'UFCalendario.pas' {FCalendario},
  UFSuministros in 'UFSuministros.pas' {FSuministros},
  UDDescripciones in 'UDDescripciones.pas' {DDescripciones: TDataModule},
  UDTraspasar in 'UDTraspasar.pas' {DTraspasar: TDataModule},
  UFRejilla in 'UFRejilla.pas' {FRejilla},
  UFFiltro in 'UFFiltro.pas' {FFiltro},
  UFTransportistas in 'UFTransportistas.pas' {FTransportistas},
  UDListados in 'UDListados.pas' {DListados: TDataModule},
  UFResumen in 'UFResumen.pas' {FResumen},
  UQOrdenPackingSimple in 'UQOrdenPackingSimple.pas' {QOrdenPackingSimple: TQuickRep},
  UFClientes in 'UFClientes.pas' {FClientes},
  UFDistribuirPeso in 'UFDistribuirPeso.pas' {FDistribuirPesos},
  UQOrdenCompleta in 'UQOrdenCompleta.pas' {QOrdenCompleta: TQuickRep},
  UFAsignarTransito in 'UFAsignarTransito.pas' {FAsignarTransito},
  UFAsignarAlbaran in 'UFAsignarAlbaran.pas' {FAsignarAlbaran},
  AdvertenciaFD in 'AdvertenciaFD.pas' {FDAdvertencia},
  OrdenCarga_TLB in 'OrdenCarga_TLB.pas',
  CGlobal in 'CGlobal.pas',
  UFImportarOrdenes in 'Comun\UFImportarOrdenes.pas' {FImportarOrdenes},
  UTipos in 'Comun\UTipos.pas',
  dmImportarOrdenes in 'Comun\dmImportarOrdenes.pas' {FDMImportarOrdenes: TDataModule},
  ConexionAWSAurora in '..\..\GComer Desarrollo Git\Comun\SincronizacionWeb\ConexionAWSAurora.pas',
  ConexionAWSAuroraConstantes in '..\..\GComer Desarrollo Git\Comun\SincronizacionWeb\ConexionAWSAuroraConstantes.pas';

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;

  CGlobal.gProgramVersion:= pvSAT;
  Application.Title := 'Carga por Envases';
  Application.CreateForm(TDOrdenCarga, DOrdenCarga);
  Application.CreateForm(TFOrdenCarga, FOrdenCarga);
  Application.Run;
end.
