unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type

  TPartidaEstado = (Partida, Derrota);
  TMovimiento = (Arriba, Abajo, Izquierda, Derecha);

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
    Estado: TPartidaEstado;

    procedure Empezar;
    procedure InicializaTablero;
    procedure InicializaCelda;

    procedure DibujarTablero;
    procedure DibujarCelda(X, Y: integer);
    function GetColor(Numero: Variant): TColor;
    procedure SetPuntuacion;
    function ExistenMovimientos: boolean;
    procedure EjecutaMovimiento(Movimiento: TMovimiento);
    function GetNuevoNumero: Variant;
    function TieneValor(X, Y: Integer): boolean;
    procedure AgruparFila(NumFila: integer; Movimiento: TMovimiento);
    procedure AgruparColumna(NumColumna: integer; Movimiento: TMovimiento);
    function ExisteMovimientoDireccion(Movimiento: TMovimiento): boolean;
    function GetPatron(Ind: Integer; Movimiento: TMovimiento): string;
    function ExistenCeldasIgualesContiguas(Ind: Integer; Movimiento: TMovimiento): boolean;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  Math,
  StrUtils,
  System.Generics.Collections;

{$R *.dfm}

{ TFMain }

procedure TFMain.AgruparColumna(NumColumna: integer; Movimiento: TMovimiento);
begin
  //
end;

procedure TFMain.AgruparFila(NumFila: integer; Movimiento: TMovimiento);
var
  X: integer;
  ValorCelda: Variant;
  ValorCeldaAnterior: Variant;
  PosCeldaValor: integer;
  I: integer;
begin

  if Movimiento = Derecha then
    X := 4
  else
    X := 1;

  ValorCeldaAnterior := Null;

  while ((X >= 1) and (Movimiento = Derecha)) or ((X <= 4) and (Movimiento = Izquierda)) do
  begin

    ValorCelda := Tablero[NumFila, X];

    if (ValorCelda = ValorCeldaAnterior) and (not VarIsNull(ValorCelda)) then
    begin

      Tablero[Numfila, PosCeldaValor] := ValorCelda*2;
      Tablero[NumFila, X]             := Null;
      ValorCeldaAnterior := Null;

    end
    else if ((not VarIsNull(ValorCelda)) and VarIsNull(ValorCeldaAnterior)) or ((ValorCelda <> ValorCeldaAnterior) and (not VarIsNull(ValorCelda)) and (not VarIsNull(ValorCeldaAnterior))) then
    begin
      ValorCeldaAnterior := ValorCelda;
      PosCeldaValor := X;
    end;

    if Movimiento = Derecha then
      X := X - 1
    else
      X := X + 1;

    // lo dejé aquí intentando aplicar este bucle para izquierda y derecha
    for I := 1 to 3 do
    begin

      for X := 4 downto 2 do
      begin

        if VarIsNull(Tablero[NumFila, X]) and (not VarIsNull(Tablero[NumFila, X-1])) then
        begin
          Tablero[NumFila, X]   := Tablero[NumFila, X-1];
          Tablero[NumFila, X-1] := Null;
        end;

      end;

    end;

  end;

  if Movimiento = Derecha then
  begin
    {
    ValorCeldaAnterior := Null;

    for X := 4 downto 1 do
    begin

      ValorCelda := Tablero[NumFila, X];

      if VarIsNull(ValorCelda) then
        Continue;

      if ((not VarIsNull(ValorCelda)) and VarIsNull(ValorCeldaAnterior)) or (ValorCelda <> ValorCeldaAnterior) then
      begin
        ValorCeldaAnterior := ValorCelda;
        PosCeldaValor := X;
        Continue;
      end;

      if (ValorCelda = ValorCeldaAnterior) then
      begin

        Tablero[Numfila, PosCeldaValor] := ValorCelda*2;
        Tablero[NumFila, X]             := Null;
        ValorCeldaAnterior := Null;

      end;

    end;
    }
    //
    // Desplazar los números a la derecha
    //
    for I := 1 to 3 do
    begin

      for X := 4 downto 2 do
      begin

        if VarIsNull(Tablero[NumFila, X]) and (not VarIsNull(Tablero[NumFila, X-1])) then
        begin
          Tablero[NumFila, X]   := Tablero[NumFila, X-1];
          Tablero[NumFila, X-1] := Null;
        end;

      end;

    end;

  end;

end;

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

procedure TFMain.EjecutaMovimiento(Movimiento: TMovimiento);
var
  Ind: Integer;
begin

  if (Movimiento = Arriba) or (Movimiento = Abajo) then
    for Ind := 1 to 4 do
      AgruparColumna(Ind, Movimiento);

  if (Movimiento = Izquierda) or (Movimiento = Derecha) then
    for Ind := 1 to 4 do
      AgruparFila(Ind, Movimiento);

  InicializaCelda;

  if not ExistenMovimientos then
  begin
    Estado := Derrota;
    ShowMessage('No puedes realizar más movimientos');
  end;

end;

procedure TFMain.Empezar;
begin
  InicializaTablero;
  DibujarTablero;

  Puntuacion := 0;
  SetPuntuacion;

  Estado := Partida;
end;

function TFMain.GetPatron(Ind: Integer; Movimiento: TMovimiento): string;
var
  Col: Integer;
begin

  result := '';

  if Movimiento = Derecha then
  begin

    for Col := 1 to 4 do
    begin

      if VarIsNull(Tablero[Ind, Col]) then
        result := concat(result, '-')
      else
        result := concat(result, 'X');

    end;

  end;

end;

function TFMain.ExisteMovimientoDireccion(Movimiento: TMovimiento): boolean;
var
  Row: Integer;
  Patron: string;
begin

  result := false;

  if Movimiento = Derecha then
  begin

    for Row := 1 to 4 do
    begin

      Patron := GetPatron(Row, Movimiento);

      if not MatchStr(Patron, ['----', '---X', '--XX', '-XXX', 'XXXX']) or (ExistenCeldasIgualesContiguas(Row, Movimiento)) then
      begin
        result := true;
        exit;
      end;

    end;

  end;

end;

function TFMain.ExistenCeldasIgualesContiguas(Ind: Integer;
  Movimiento: TMovimiento): boolean;
var
  Col: integer;
begin

  result := false;

  if Movimiento = Derecha then
    for Col := 4 downto 2 do
      if (Tablero[Ind, Col] = Tablero[Ind, Col-1]) and (not VarIsNull(Tablero[Ind, Col])) then
        result := true;
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
  // Si hay 2 celdas contiguas iguales, sí existen movimientos (TODO: hacerlo por algoritmo)
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
var
  Movimiento: TMovimiento;
begin

  if Estado = Partida then
  begin

    if Key = VK_UP then
      Movimiento := Arriba;

    if Key = VK_DOWN then
      Movimiento := Abajo;

    if Key = VK_LEFT then
      Movimiento := Izquierda;

    if Key = VK_RIGHT then
      Movimiento := Derecha;

    if ExisteMovimientoDireccion(Movimiento) then
    begin
      EjecutaMovimiento(Movimiento);
      DibujarTablero;
    end;

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
  else if Numero = 4 then
    result := clInfoBk
  else
     result := clLime;

end;

function TFMain.GetNuevoNumero: Variant;
begin

  if Random(10) = 0 then
    result := 4
  else
    result := 2;

end;

procedure TFMain.InicializaCelda;
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

  Tablero[X, Y] := GetNuevoNumero;

end;

procedure TFMain.InicializaTablero;
var
  X: Integer;
  Y: Integer;
begin

  for X := 1 to 4 do
    for Y := 1 to 4 do
      Tablero[X, Y] := Null;

  InicializaCelda;
  InicializaCelda;
  {
  Tablero[1, 1] := Null;
  Tablero[1, 2] := Null;
  Tablero[1, 3] := 2;
  Tablero[1, 4] := 8;
  //
  Tablero[2, 1] := Null;
  Tablero[2, 2] := Null;
  Tablero[2, 3] := Null;
  Tablero[2, 4] := 4;
  //
  Tablero[3, 1] := Null;
  Tablero[3, 2] := Null;
  Tablero[3, 3] := 2;
  Tablero[3, 4] := 4;
  //
  Tablero[4, 1] := Null;
  Tablero[4, 2] := Null;
  Tablero[4, 3] := Null;
  Tablero[4, 4] := Null;
  }
end;

procedure TFMain.SetPuntuacion;
begin
  Pn_Puntuacion.Caption := Puntuacion.ToString;
end;

function TFMain.TieneValor(X, Y: Integer): boolean;
begin
  result := not VarIsNull(Tablero[X, Y]);
end;

end.
