unit UFResumen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, ToolWin, ImgList;

type
  TFResumen = class(TForm)
    DBGridResumen: TDBGrid;
    DataSource: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnRefrescar: TToolButton;
    btnCerrar: TToolButton;
    ImageList: TImageList;
    procedure DBGridResumenDblClick(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure InicializarResumenOrdenes( const AOwner: TComponent; const DataSet: TDataSet );
  procedure FinalizarResumenOrdenes;
  procedure VerResumenOrdenes( const AOwner: TComponent );



implementation

{$R *.dfm}

var
  FResumen: TFResumen;

procedure InicializarResumenOrdenes( const AOwner: TComponent; const DataSet: TDataSet );
begin
  FResumen:= TFResumen.Create( AOwner );
  FResumen.DataSource.DataSet:= DataSet;
end;

procedure FinalizarResumenOrdenes;
begin
  FreeAndNil( FResumen );
end;

procedure VerResumenOrdenes( const AOwner: TComponent );
begin
  FResumen.Top:= TForm(AOwner).Top;
  FResumen.Left:= TForm(AOwner).Left;
  FResumen.Height:= TForm(AOwner).Height;
  FResumen.Width:= TForm(AOwner).Width;
  FResumen.ShowModal;
end;

procedure TFResumen.DBGridResumenDblClick(Sender: TObject);
begin
  Close;
end;

procedure TFResumen.btnRefrescarClick(Sender: TObject);
begin
  DataSource.DataSet.DisableControls;
  DataSource.DataSet.Close;
  DataSource.DataSet.Open;
  DataSource.DataSet.EnableControls;
end;

procedure TFResumen.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFResumen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caHide;
end;

end.
