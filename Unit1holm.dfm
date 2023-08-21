object Form1: TForm1
  Left = 220
  Top = 168
  Width = 390
  Height = 434
  Caption = #1089#1086#1079#1076#1072#1085#1080#1077' '#1080#1082#1086#1085#1082#1080' icon. [my.ico]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 24
    Top = 8
    Width = 273
    Height = 297
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object Image2: TImage
    Left = 168
    Top = 320
    Width = 16
    Height = 16
    OnClick = Image2Click
  end
  object Image3: TImage
    Left = 312
    Top = 8
    Width = 50
    Height = 256
    OnMouseDown = Image3MouseDown
  end
  object Label1: TLabel
    Left = 320
    Top = 288
    Width = 6
    Height = 13
    Caption = '7'
  end
  object Button1: TButton
    Left = 80
    Top = 320
    Width = 75
    Height = 25
    Caption = 'DONE'
    TabOrder = 0
    OnClick = Button1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 356
    Width = 374
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 136
    Top = 200
    object dir1: TMenuItem
      Caption = 'dir'
      OnClick = dir1Click
    end
    object base641: TMenuItem
      Caption = 'base64'
      object ico1: TMenuItem
        Caption = 'ico'
        OnClick = ico1Click
      end
      object gif1: TMenuItem
        Caption = 'gif'
        OnClick = gif1Click
      end
    end
    object here1: TMenuItem
      Caption = 'here'
      OnClick = here1Click
    end
  end
  object OpenDialog1: TOpenDialog
    FileName = '*.bmp'
    Filter = '*.bmp'
    InitialDir = '.'
    Left = 56
    Top = 40
  end
  object OpenDialog2: TOpenDialog
    FileName = '*.ico'
    Filter = '*.ico'
    InitialDir = '.'
    Left = 128
    Top = 48
  end
end
