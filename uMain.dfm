object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '2048 for Windows'
  ClientHeight = 566
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Marco_Tablero: TShape
    Left = 8
    Top = 152
    Width = 400
    Height = 400
    Brush.Color = clActiveBorder
  end
  object Shape1: TShape
    Left = 8
    Top = 80
    Width = 177
    Height = 56
    Brush.Color = clActiveBorder
    Shape = stRoundRect
  end
  object Label1: TLabel
    Left = 60
    Top = 81
    Width = 78
    Height = 21
    Caption = 'Puntuaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Shape2: TShape
    Left = 231
    Top = 80
    Width = 177
    Height = 56
    Brush.Color = clActiveBorder
    Shape = stRoundRect
  end
  object Label2: TLabel
    Left = 295
    Top = 81
    Width = 49
    Height = 21
    Caption = 'Record'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Cell_11: TPanel
    Left = 16
    Top = 161
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Cell_12: TPanel
    Left = 114
    Top = 161
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object Cell_13: TPanel
    Left = 212
    Top = 161
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
  end
  object Cell_14: TPanel
    Left = 310
    Top = 161
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object Cell_21: TPanel
    Left = 16
    Top = 259
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object Cell_22: TPanel
    Left = 114
    Top = 259
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object Cell_23: TPanel
    Left = 212
    Top = 259
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object Cell_24: TPanel
    Left = 310
    Top = 259
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
  end
  object Cell_31: TPanel
    Left = 16
    Top = 356
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
  end
  object Cell_32: TPanel
    Left = 114
    Top = 356
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 10
  end
  object Cell_33: TPanel
    Left = 212
    Top = 356
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
  object Cell_34: TPanel
    Left = 310
    Top = 356
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 12
  end
  object Cell_41: TPanel
    Left = 16
    Top = 453
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 13
  end
  object Cell_42: TPanel
    Left = 114
    Top = 453
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 14
  end
  object Cell_43: TPanel
    Left = 212
    Top = 453
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 15
  end
  object Cell_44: TPanel
    Left = 310
    Top = 453
    Width = 90
    Height = 90
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 16
  end
  object Bt_Empezar: TButton
    Left = 8
    Top = 16
    Width = 399
    Height = 49
    Caption = 'Iniciar Partida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnClick = Bt_EmpezarClick
  end
  object Pn_Puntuacion: TPanel
    Left = 27
    Top = 99
    Width = 142
    Height = 31
    BevelOuter = bvNone
    Caption = '23880'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
  end
  object Pn_Record: TPanel
    Left = 250
    Top = 99
    Width = 142
    Height = 31
    BevelOuter = bvNone
    Caption = '23880'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
  end
end
