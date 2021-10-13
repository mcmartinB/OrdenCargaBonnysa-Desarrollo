unit UFCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, BCalendario;

type
  TFCalendario = class(TForm)
    Calendario: TMonthCalendar;
    procedure FormCreate(Sender: TObject);
    procedure CalendarioDblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    bFlag: Boolean;
    dFecha: TDateTime;
  end;

  function GetFecha( const AForm: TForm; const AControl: TControl;
                     const AFecha: string ): TDateTime; Overload;
  function GetFecha( const AForm: TForm; const AControl: TControl;
                     const AFecha: TDateTime ): TDateTime; Overload;
  function PonFecha( const AForm: TForm; const AControl: TControl;
                      const AFecha: string; var AResultado: String ): Boolean; Overload;
  function PonFecha( const AForm: TForm; const AControl: TControl;
                      const AFecha: TDateTime; var AResultado: String ): Boolean; Overload;

var
  FCalendario: TFCalendario;

implementation

{$R *.dfm}

function GetFecha( const AForm: TForm; const AControl: TControl; const AFecha: string ): TDateTime;
var
  dAux: TDateTime;
begin
  dAux:= StrToDateDef( AFecha, Date );
  result:= Date;
  GetFecha( AForm, AControl, dAux );
end;

function GetFecha( const AForm: TForm; const AControl: TControl; const AFecha: TDateTime ): TDateTime;
begin
  FCalendario:= TFCalendario.Create( AForm );

  FCalendario.Left:= AControl.ClientOrigin.X;
  FCalendario.Top:= AControl.ClientOrigin.Y;
  FCalendario.dFecha:= AFecha;
  FCalendario.Calendario.Date:= AFecha;
  try
    FCalendario.ShowModal;
    result:= FCalendario.dFecha;
  finally
    FreeAndNil( FCalendario );
  end;
end;

function PonFecha( const AForm: TForm; const AControl: TControl; const AFecha: string; var AResultado: String ): Boolean;
var
  dAux: TDateTime;
begin
  dAux:= StrToDateDef( AFecha, Date );
  result:= PonFecha( AForm, AControl, dAux, AResultado );
end;

function PonFecha( const AForm: TForm; const AControl: TControl; const AFecha: TDateTime; var AResultado: String ): Boolean;
begin
  FCalendario:= TFCalendario.Create( AForm );

  FCalendario.Left:= AControl.ClientOrigin.X;
  FCalendario.Top:= AControl.ClientOrigin.Y + AControl.Height;
  FCalendario.dFecha:= AFecha;
  FCalendario.Calendario.Date:= AFecha;
  try
    FCalendario.ShowModal;
    result:= FCalendario.bFlag;
    if result then
      AResultado:= DateToStr( FCalendario.dFecha );
  finally
    FreeAndNil( FCalendario );
  end;
end;

procedure TFCalendario.FormCreate(Sender: TObject);
begin
  bFlag:= False;
end;

procedure TFCalendario.CalendarioDblClick(Sender: TObject);
begin
  bFlag:= True;
  dFecha:= Calendario.Date;
  Close;
end;

procedure TFCalendario.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        bFlag:= True;
        dFecha:= Calendario.Date;
        Close;
      end;
    vk_escape:
      begin
        Close;
      end;
    vk_up:
      begin
        Calendario.Date:= Calendario.Date - 7;
      end;
    vk_down:
      begin
        Calendario.Date:= Calendario.Date + 7;
      end;
    vk_left:
      begin
        Calendario.Date:= Calendario.Date - 1;
      end;
    vk_right:
      begin
        Calendario.Date:= Calendario.Date + 1;
      end;
  end;
end;

end.
