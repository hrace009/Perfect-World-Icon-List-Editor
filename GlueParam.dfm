object GlueParamForm: TGlueParamForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Parameters bonding icons'
  ClientHeight = 124
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object WEd: TsSpinEdit
    Left = 39
    Top = 4
    Width = 60
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    Text = '32'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Width'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    Increment = 16
    MaxValue = 0
    MinValue = 16
    Value = 32
  end
  object HEd: TsSpinEdit
    Left = 149
    Top = 4
    Width = 60
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
    Text = '32'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Height'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    Increment = 16
    MaxValue = 0
    MinValue = 16
    Value = 32
  end
  object CEd: TsSpinEdit
    Left = 270
    Top = 4
    Width = 50
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 2
    Text = '128'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Rows'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    Increment = 32
    MaxValue = 0
    MinValue = 16
    Value = 128
  end
  object IconDir: TsDirectoryEdit
    Left = 96
    Top = 28
    Width = 224
    Height = 21
    AutoSize = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 255
    ParentFont = False
    TabOrder = 3
    CheckOnExit = True
    BoundLabel.Active = True
    BoundLabel.Caption = 'Files folder'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
    GlyphMode.Blend = 0
    GlyphMode.Grayed = False
    Root = 'rfDesktop'
  end
  object OkBut: TsBitBtn
    Left = 7
    Top = 78
    Width = 313
    Height = 40
    Caption = 'Make icons pack'
    Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000002246F000B276300132A68001200510008000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000011D6E000E2B6B002B1E6E0067246F0058256D001F2A6800090000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00011C68000F2D6A00291C75008F369D3EFC329636ED21710069276A001D2A68
      0009000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000021C68
      000F2D6A00291C73008F229831FE4DB360FF4AB25DFF209126EE216F0069276A
      001D2A6800090000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002196200102C6E
      002A1E75008E03921AFE12A335FF0FA130FF11A130FF11A232FF078B12EE2571
      00692668001E2A68000900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000002196200102A69002C1E74
      009000941CFD00A42FFF00A22BFF00A22BFF00A12BFF00A12BFF00A22BFF058D
      16EE25710069276A001D2A680009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000002196200102A69002C1E7400900098
      20FE00A935FF00A732FF00A732FF00A732FF00A632FF00A531FF00A531FF00A5
      30FF05911AEE25710069276A001D2A6800090000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000002196200102A6D002D1E760090009A24FD00AD
      39FF00AB38FF00AB37FF00AB38FF00AB37FF00AB37FF00AB37FF00AA35FF00A9
      35FF00A935FF05951EEE257400692668001E2A68000900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000021C68000F2A69002C1E770090009E27FE00B23EFF00B0
      3DFF00B03BFF00B03DFF00B03DFF00B03BFF00AF3BFF00AE3AFF00AE3AFF00AC
      39FF00AC38FF00AC38FF059824EE25740069276A001D00510008000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000011C68000F2D6A00291E78038F00A22CFD00B542FF00B341FF00B4
      41FF00B441FF00B442FF00B441FF00B441FF00B340FF00B340FF00B23FFF00B2
      3EFF00B03DFF00AF3BFF00AF3BFF059C27EE267700662A68001B005100080000
      0000000000000000000000000000000000000000000000000000000000000000
      00011D6E000E2D6A00291E78038F00A631FE00BA47FF00B844FF00B844FF00B9
      45FF00B947FF00B945FF00B945FF00B945FF00B844FF00B845FF00B743FF00B6
      43FF00B442FF00B33FFF00B23FFF00B23EFF059F2AEE267705662A68001B0051
      0008000000000000000000000000000000000000000000000000000000011D6E
      000E2D6A00291C79038F00A933FE00BC49FF00BB48FF00BB49FF00BC4AFF00BD
      4AFF00BD4BFF00BD4BFF00BC47FF00BD49FF00BC47FF00BB47FF00BB49FF00BB
      48FF00B947FF00B744FF00B642FF00B441FF00B441FF05A22DEE257605672A68
      001B005100080000000000000000000000000000000000000000005100082C6D
      00221D79038D0CAD3EFE13C256FF11C053FF09C050FF00C04DFF00C14DFF00C2
      4EFF00C24FFF00C049FF36CC6EFF79DC9DFF73DA98FF1DC55CFF00BD47FF00BE
      4CFF00BD4BFF00BB4AFF00BA48FF00B844FF00B643FF00B642FF03A330EE2277
      05662A68001B0051000800000000000000000000000000000000006800061E7C
      0C751DB34BFD2CCA68FF2CC866FF2CC967FF2CCA68FF26CA65FF19C85EFF0AC7
      58FF00C44CFF3FD478FF75D593FF2F98389D42AA51BE84DFA5FF24CA62FF00C1
      4AFF00C24EFF00C04DFF00BE4AFF00BB48FF00BA44FF00B742FF00B844FF0CA8
      37EE227705662A68001B0051000800000000000000000000000000000000158C
      1CA13BCE73FF44D178FF40D077FF41D178FF41D278FF42D47AFF42D47BFF37D3
      75FF62DE92FF7ADA9AFF1D8D227B000000001C68000F38AA4CB68CE5ADFF27CE
      68FF00C44FFF09C554FF0DC455FF16C359FF22C35DFF2DC463FF39C568FF3FC7
      6DFF24AF48EE1E7605672A68001B005100080000000000000000000000002472
      00201DA238CB5AD88AFF5ADA8CFF53D887FF54DA89FF54DA8AFF4EDA86FF79E5
      A5FF8BDFA8FF1D8F257B000000000000000000000000196200103BAD51B69FEA
      BCFF61DB8FFF49D47EFF52D483FF55D484FF56D383FF56D182FF55CE7FFF55CD
      7DFF54CE7DFF2CB350EE207705662964001C2A68000900000001000000000000
      00001C6A001D29A843CB75E2A0FF6DE19BFF66DF97FF62DF95FF88EAB0FF8FE3
      ADFF2093277B0000000000000000000000000000000000000000196200103DB0
      55B6A9EEC5FF78E2A2FF64DB91FF68DA92FF67D991FF67D78FFF67D58DFF67D4
      8CFF68D28BFF69D38CFF35B658EE1C7705682B6B001A00680006000000000000
      0000000000001C6A001D32AE4ECB8CEAB2FF7EE8AAFF91EDB8FF8EE5AFFF2095
      2A7F000000000000000000000000000000000000000000000000000000001962
      001038B355B6A9EFC5FF87E5ACFF76E09EFF79DF9FFF79DE9EFF79DC9CFF79DA
      9BFF78D999FF7AD798FF7AD89AFF3FB960ED22790A592A680009000000000000
      000000000000000000001C6A001D39B356CAA2F3C6FF8DE6B0FF1D952B7B0000
      0000000000000000000000000000000000000000000000000000000000000000
      00001962001037B356B6A9F0C7FF97EAB7FF88E5ABFF8BE4ABFF8AE2AAFF8AE0
      A9FF8ADFA7FF8ADDA6FF8DDCA6FF8CE0AAFF27A842BA00680003000000000000
      00000000000000000000000000001D71001B2FA8459F24952C6E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001962001035B756B6AAF2C8FFA5ECC1FF98E8B7FF9AE7B7FF9AE6
      B6FF9AE5B4FF9BE3B3FFA2E5BAFF60CF85F71D88195400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001962001032B95AB6ADF3CBFFB4EFCBFFAAECC2FFABEB
      C2FFABEAC2FFB3EDC8FF6BD690F6158A19550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001962001032BA5BB6B3F4CFFFC3F3D6FFBBEF
      CEFFC4F3D7FF75DC9BF6158B1954000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001962001032BD5EB6BBF7D5FFDBFB
      EAFF7EE2A4F6158D1D5400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C68000F3ABF62AD6CDD
      97E4199021520000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006800031868
      0012000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 4
    OnClick = OkButClick
    SkinData.SkinSection = 'BUTTON'
  end
  object FillCheck: TsCheckBox
    Left = 7
    Top = 54
    Width = 122
    Height = 19
    Caption = 'Fill background color'
    TabOrder = 5
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object RCol: TsSpinEdit
    Left = 143
    Top = 53
    Width = 50
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 6
    Text = '0'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'R'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    MaxValue = 255
    MinValue = 0
    Value = 0
  end
  object GCol: TsSpinEdit
    Left = 207
    Top = 53
    Width = 50
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 7
    Text = '0'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'G'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    MaxValue = 255
    MinValue = 0
    Value = 0
  end
  object BCol: TsSpinEdit
    Left = 270
    Top = 53
    Width = 50
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 8
    Text = '0'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'B'
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    MaxValue = 255
    MinValue = 0
    Value = 0
  end
end
