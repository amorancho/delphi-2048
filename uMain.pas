unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type

  PartidaEstado = (Partida, Derrota);

  TFMain = class(TForm)
    Marco_Tablero: TShape;
    Cell_11: TPanel;
    Cell_12: TPanel;
    Cell_13: TPanel;
    Cell_14: TPanel;
    Cell_21: TPanel;
    Cell_22: TPanel;
    Cell_23: TPanel;
    Cell_24: TPanel;
    Cell_31: TPanel;
    Cell_32: TPanel;
    Cell_33: TPanel;
    Cell_34: TPanel;
    Cell_41: TPanel;
    Cell_42: TPanel;
    Cell_43: TPanel;
    Cell_44: TPanel;
    Bt_Empezar: TButton;
    Shape1: TShape;
    Label1: TLabel;
    Pn_Puntuacion: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    Pn_Record: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Bt_EmpezarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

    Tablero: array[1..4, 1..4] of Variant;
    Puntuacion, MejorPuntuacion: Integer;
    Estado: PartidaEstado;

    procedure Empezar;
    procedure InicializaTablero;
    procedure InicializaCelda(Numero: Variant);

    procedure DibujarTablero;
    procedure DibujarCelda(X, Y: integer);
    function GetColor(Numero: Variant): TColor;
    procedure SetPuntuacion;
    function ExistenMovimientos: boolean;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  Math;

{$R *.dfm}

{ TFMain }

procedure TFMain.Bt_EmpezarClick(Sender: TObject);
begin
  Empezar;
end;

procedure TFMain.DibujarCelda(X, Y: integer);
var
  Celda: TPanel;
begin

  //
  // Localizamos la celda-panel
  //
  Celda := TPanel(FindComponent(concat('Cell_', IntToStr(X), IntToStr(Y))));

  Celda.Caption := VarToStr(Tablero[X, Y]);
  Celda.Color   := GetColor(Tablero[X, Y]);

end;

procedure TFMain.DibujarTablero;
var
  X: Integer;
  Y: Integer;
begin

  for X := 1 to 4 do
    for Y := 1 to 4 do
      DibujarCelda(X, Y);

end;

procedure TFMain.Empezar;
begin
  InicializaTablero;
  DibujarTablero;

  Puntuacion := 0;
  SetPuntuacion;

  Estado := Partida;
end;

function TFMain.ExistenMovimientos: boolean;
var
  X: Integer;
  Y: Integer;
begin

  result := false;

  //
  // Si existe una celda vacía, sí existen movimientos
  //
  for X := 1 to 4 do
  begin

    for Y := 1 to 4 do
    begin

      if VarIsNull(Tablero[X, Y]) then
      begin

        result := true;
        exit;

      end;

    end;

  end;

  //
  // Si hay 2 celdas contiguas iguales, sí existen movimientos
  //
  if (Tablero[1, 1] = Tablero[1, 2]) or
     (Tablero[1, 2] = Tablero[1, 3]) or
     (Tablero[1, 3] = Tablero[1, 4]) or
     (Tablero[2, 1] = Tablero[2, 2]) or
     (Tablero[2, 2] = Tablero[2, 3]) or
     (Tablero[2, 3] = Tablero[2, 4]) or
     (Tablero[3, 1] = Tablero[3, 2]) or
     (Tablero[3, 2] = Tablero[3, 3]) or
     (Tablero[3, 3] = Tablero[3, 4]) or
     (Tablero[4, 1] = Tablero[4, 2]) or
     (Tablero[4, 2] = Tablero[4, 3]) or
     (Tablero[4, 3] = Tablero[4, 4]) or
     //
     (Tablero[1, 1] = Tablero[2, 1]) or
     (Tablero[2, 1] = Tablero[3, 1]) or
     (Tablero[3, 1] = Tablero[4, 1]) or
     (Tablero[1, 2] = Tablero[2, 2]) or
     (Tablero[2, 2] = Tablero[3, 2]) or
     (Tablero[3, 2] = Tablero[4, 2]) or
     (Tablero[1, 3] = Tablero[2, 3]) or
     (Tablero[2, 3] = Tablero[3, 3]) or
     (Tablero[3, 3] = Tablero[4, 3]) or
     (Tablero[1, 4] = Tablero[2, 4]) or
     (Tablero[2, 4] = Tablero[3, 4]) or
     (Tablero[3, 4] = Tablero[4, 4])
  then
    result := true;

end;

procedure TFMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Estado = Partida then
  begin

    if Key = VK_UP then
      ShowMessage('Arriba');

    if Key = VK_DOWN then
      ShowMessage('Abajo');

    if Key = VK_LEFT then
      ShowMessage('Izquierda');

    if Key = VK_RIGHT then
      ShowMessage('Derecha');

  end;

end;

procedure TFMain.FormShow(Sender: TObject);
begin
  Empezar;
end;

function TFMain.GetColor(Numero: Variant): TColor;
begin

  if VarIsNull(Numero) then
    result := cl3DLight
  else if Numero = 2 then
    result := clWhite
  else
     result := clLime;

end;

procedure TFMain.InicializaCelda(Numero: Variant);
var
  CeldasVacias: array of string;
  LenArr: integer;
  X: Integer;
  Y: Integer;

  CeldaSel: string;
begin

  LenArr := 0;

  for X := 1 to 4 do
  begin

    for Y := 1 to 4 do
    begin

      if VarIsNull(Tablero[X, Y]) then
      begin

        LenArr := LenArr + 1;
        SetLength(CeldasVacias, LenArr);
        CeldasVacias[LenArr - 1] := concat(X.ToString, Y.ToString);

      end;

    end;

  end;

  CeldaSel := CeldasVacias[RandomRange(0, LenArr - 1)];

  X := StrToInt(copy(CeldaSel, 1, 1));
  Y := StrToInt(copy(CeldaSel, 2, 1));

  Tablero[X, Y] := Numero;

end;

procedure TFMain.InicializaTablero;
var
  X: Integer;
  Y: Integer;
begin

  for X := 1 to 4 do
    for Y := 1 to 4 do
      Tablero[X, Y] := Null;

  InicializaCelda(2);
  InicializaCelda(2);

end;

procedure TFMain.SetPuntuacion;
begin
  Pn_Puntuacion.Caption := Puntuacion.ToString;
end;

end.
