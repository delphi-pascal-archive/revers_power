object MainForm: TMainForm
  Left = 221
  Top = 127
  Width = 703
  Height = 508
  Caption = 'Revers Power'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 695
    Height = 137
    Align = alTop
    Caption = ' '#1042#1099#1095#1080#1089#1083#1077#1085#1080#1103' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 41
      Width = 163
      Height = 16
      Alignment = taRightJustify
      Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083' '#1076#1072#1085#1085#1099#1093':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SelFileSB: TSpeedButton
      Left = 344
      Top = 32
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SelFileSBClick
    end
    object SrcFileEdit: TEdit
      Left = 192
      Top = 32
      Width = 145
      Height = 25
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'src_data.txt'
    end
    object GroupBox2: TGroupBox
      Left = 376
      Top = 10
      Width = 313
      Height = 117
      Caption = ' '#1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '
      TabOrder = 1
      object Label2: TLabel
        Left = 25
        Top = 25
        Width = 217
        Height = 16
        Alignment = taRightJustify
        Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1089#1090#1077#1087#1077#1085#1080' ('#1041#1077#1090#1072'):'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 56
        Width = 227
        Height = 16
        Alignment = taRightJustify
        Caption = #1050#1086#1101#1092'. '#1089#1075#1083#1072#1078#1080#1074#1072#1085#1080#1103' ('#1076#1077#1083#1100#1090#1072'):'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 120
        Top = 88
        Width = 122
        Height = 16
        Alignment = taRightJustify
        Caption = #1056#1072#1079#1084#1077#1088' '#1103#1095#1077#1081#1082#1080':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BetaEdit: TEdit
        Left = 248
        Top = 21
        Width = 49
        Height = 24
        TabOrder = 0
        Text = '2,5'
      end
      object DeltaEdit: TEdit
        Left = 249
        Top = 52
        Width = 48
        Height = 24
        TabOrder = 1
        Text = '1'
      end
      object CellWidthEdit: TEdit
        Left = 249
        Top = 84
        Width = 48
        Height = 24
        TabOrder = 2
        Text = '20'
      end
    end
    object Button1: TButton
      Left = 16
      Top = 88
      Width = 353
      Height = 25
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100'...'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Calculate
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 137
    Width = 695
    Height = 325
    HorzScrollBar.Smooth = True
    HorzScrollBar.Tracking = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 1
    object Image: TImage
      Left = 0
      Top = 0
      Width = 137
      Height = 137
      AutoSize = True
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 462
    Width = 695
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object XPManifest1: TXPManifest
    Left = 328
    Top = 72
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.txt'
    Filter = '*.*'
    InitialDir = '.'
    Title = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072' '#1089' '#1080#1089#1093#1086#1076#1085#1099#1084#1080' '#1076#1072#1085#1085#1099#1084#1080
    Left = 296
    Top = 72
  end
end
