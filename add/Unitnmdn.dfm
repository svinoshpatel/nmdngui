object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 233
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object LabelA: TLabel
    Left = 224
    Top = 64
    Width = 20
    Height = 15
    Caption = 'a = '
  end
  object labelinput: TLabel
    Left = 272
    Top = 20
    Width = 73
    Height = 20
    Caption = 'Input data'
    Color = clMenuHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LabelResult: TLabel
    Left = 488
    Top = 20
    Width = 44
    Height = 20
    Caption = 'Result'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelB: TLabel
    Left = 224
    Top = 105
    Width = 18
    Height = 15
    Caption = 'b ='
  end
  object LabelEps: TLabel
    Left = 213
    Top = 148
    Width = 29
    Height = 15
    Caption = 'Eps ='
  end
  object LabelKmax: TLabel
    Left = 203
    Top = 185
    Width = 41
    Height = 15
    Caption = 'Kmax ='
    Visible = False
  end
  object LabelX: TLabel
    Left = 416
    Top = 64
    Width = 20
    Height = 15
    Caption = 'x = '
  end
  object LabelIterations: TLabel
    Left = 389
    Top = 127
    Width = 55
    Height = 15
    Caption = 'Iterations: '
  end
  object EditA: TEdit
    Left = 250
    Top = 61
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object EditB: TEdit
    Left = 250
    Top = 102
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object EditEps: TEdit
    Left = 248
    Top = 145
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object EditKmax: TEdit
    Left = 250
    Top = 182
    Width = 121
    Height = 23
    TabOrder = 3
    Visible = False
  end
  object EditX: TEdit
    Left = 450
    Top = 61
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object EditIterations: TEdit
    Left = 450
    Top = 124
    Width = 121
    Height = 23
    TabOrder = 5
  end
  object Button1: TButton
    Left = 413
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Solve'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 520
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 7
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 464
    Top = 199
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 8
  end
  object CheckBox1: TCheckBox
    Left = 40
    Top = 203
    Width = 97
    Height = 17
    Caption = 'Format root'
    TabOrder = 9
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 185
    Height = 71
    Caption = 'Method'
    Items.Strings = (
      'Bisection'
      'Newton')
    TabOrder = 10
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 8
    Top = 85
    Width = 185
    Height = 78
    Caption = 'Equation'
    Items.Strings = (
      'x*x - 4 = 0'
      '3*x - 4*ln(x) - 5'
      ' x*x*x - 6*x*x + 11*x - 6')
    TabOrder = 11
  end
end
