object FrmDriveEditInfo: TFrmDriveEditInfo
  Left = 583
  Top = 209
  BorderStyle = bsDialog
  Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1080#1081' '#1079#1072#1089#1110#1073
  ClientHeight = 322
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CtrlPanel: TPanel
    Left = 0
    Top = 289
    Width = 651
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      651
      33)
    object CancelBtn: TBitBtn
      Left = 561
      Top = 5
      Width = 82
      Height = 25
      HelpContext = 802
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      OnClick = CancelBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object ChNotUse: TcxCheckBox
      Left = 6
      Top = 6
      Caption = #1040#1074#1090#1086#1073#1091#1089' '#1085#1077#1076#1086#1089#1090#1091#1087#1085#1080#1081
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 137
    end
    object BtnSaveData: TBitBtn
      Left = 473
      Top = 5
      Width = 80
      Height = 25
      HelpContext = 801
      Anchors = [akTop, akRight]
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      TabOrder = 2
      OnClick = BtnSaveDataClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000C1761BC27519
        BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
        04BC690AB96A15C3791F71717170707067676762626263636362626262626263
        6363636363626262636363636363626262666666676767747474D5933DEFB736
        CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DBE8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6
        FFCDC6C0EAA714C0761D8C8C8CA9A9A9C4C4C4F9F9F9E8E8E8EBEBEBEBEBEBEA
        EAEAEBEBEBEAEAEAEAEAEAE8E8E8F8F8F8C5C5C59C9C9C707070CD9551E8AE3C
        DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
        E9DCD7D4E59E20C77B258E8E8EA3A3A3D7D7D7E9E9E9A2A2A29D9D9D9494948A
        8A8A8282827A7A7A737373616161E8E8E8D7D7D7939393767676D09653EAB447
        DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDFE0DDE0DFDDDFDEDDDFE0DEDBD9D9EDED
        EDDCD7D4E7A62BC9802B8F8F8FA8A8A8D7D7D7EFEFEFDEDEDEE0E0E0DFDFDFDF
        DFDFDEDEDEDEDEDEE0E0E0D9D9D9EEEEEED7D7D79B9B9B7B7B7BD49B58EBB950
        DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
        E9DCD7D4E8AC37CC8531959595ACACACD7D7D7E8E8E89E9E9E9C9C9C9292928A
        8A8A8181817A7A7A7474745E5E5EE8E8E8D6D6D6A1A1A17F7F7FD69E5BEDBD5A
        DCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDCD7D4EAB340D08B34979797B1B1B1D6D6D6FFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7A7A7A7848484D9A45EF0C263
        DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
        E9DCD7D4EDB749D2903A9D9D9DB7B7B7D6D6D6E8E8E89F9F9F9A9A9A93939389
        89898181817A7A7A7373735E5E5EE8E8E8D7D7D7ABABAB888888D8A35CF0C66D
        DCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDCD7D4EEBD54D7963E9A9A9ABABABAD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7B0B0B08D8D8DDEAC69F9D281
        C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
        5EC19A64F7CA6BD99B44A4A4A4C7C7C78F8F8F78787875757576767676767676
        7676757575767676767676737373767676939393BDBDBD939393DDAB67F6D58B
        FFD056C0A887C8C5C9CEC6BFCDC6C0CDC6C0CDC6BFD6D0CAD6D3D0CFCED4C0A8
        88FFD25DF3CC75DCA148A3A3A3C9C9C9C1C1C1A2A2A2C6C6C6C5C5C5C5C5C5C6
        C6C6C5C5C5D0D0D0D2D2D2CFCFCFA4A4A4C3C3C3C1C1C1989898DCA966F6D993
        FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
        A9FBCB63F3D07EE0A74CA2A2A2CECECEBBBBBBB1B1B1E0E0E0DDDDDDDDDDDDDC
        DCDCE8E8E8B6B6B6969696B1B1B1B9B9B9BEBEBEC4C4C49E9E9EE5B973F6DA97
        FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDFDDDCEFF3F99F886FE5AF479E9189C7BD
        B2FDCF6AF5D484E3AC51AFAFAFD0D0D0BFBFBFB7B7B7E1E1E1DEDEDEDFDFDFDD
        DDDDF4F4F4858585A4A4A4909090BBBBBBC2C2C2C8C8C8A2A2A2E9BC75F8DD9E
        FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
        B8FFD26EF9DA8EE7B25BB3B3B3D3D3D3C1C1C1BDBDBDE9E9E9E5E5E5E5E5E5E3
        E3E3F7F7F79F9F9FD7D7D7A8A8A8BFBFBFC4C4C4CECECEA8A8A8EAC079F8E09B
        FBD165D3C4AFEAEEF6ECEBE8ECEBE9EBE9E6FBFFFFA28E78DEAF4FA89C95D1C7
        B9FFDA78F5D889E2A442B7B7B7D5D5D5C3C3C3C0C0C0EFEFEFEAEAEAEAEAEAE9
        E9E9FFFFFF8C8C8CA4A4A49B9B9BC6C6C6CCCCCCCCCCCC999999ECC47EFEF4D5
        FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
        E2FFDE88E4AA45FCF5ECBABABAEEEEEED6D6D6D7D7D7FFFFFFFEFEFEFDFDFDFD
        FDFDFFFFFFDDDDDDB6B6B6DDDDDDE4E4E4D1D1D1A0A0A0F4F4F4ECC681F0CA82
        F4CA7DE8C788EFCF94EFD498EDCF92EED092EED093F2D396F7D79BF6D69BE6C4
        8AEBB552FDF9F2FFFFFFBDBDBDBFBFBFBFBFBFBEBEBEC7C7C7CACACAC5C5C5C7
        C7C7C7C7C7C9C9C9CDCDCDCDCDCDBBBBBBAAAAAAF8F8F8FFFFFF}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 289
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 4
      Width = 73
      Height = 13
      Caption = #1052#1072#1088#1082#1072'.'#1084#1086#1076#1077#1083#1100
    end
    object Label3: TLabel
      Left = 147
      Top = 4
      Width = 58
      Height = 13
      Caption = #1056#1110#1082' '#1074#1080#1087#1091#1089#1082#1091
    end
    object Label4: TLabel
      Left = 216
      Top = 4
      Width = 37
      Height = 13
      Caption = #1044#1074#1080#1075#1091#1085
    end
    object PlaceMapBtn: TSpeedButton
      Left = 291
      Top = 17
      Width = 24
      Height = 22
      Hint = #1055#1088#1080#1079#1085#1072#1095#1080#1090#1080' '#1089#1093#1077#1084#1091' '#1088#1086#1079#1084#1110#1097#1077#1085#1085#1103' '#1084#1110#1089#1094#1100
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00774777771777
        7747777700007444444717444444777700007747777717777747777700007777
        7777177777777777000070000000000000007747000070788888078888807444
        000070F777780F7777807747000070F777780F7777807747000070F777780F77
        77807747000070F777780F7777807747000070FFFFF70FFFFF70777700007000
        0000000000001111000070788888078888807777000070F777780F7777807747
        000070F777780F7777807747000070F777780F7777807747000070F777780F77
        77807747000070FFFFF70FFFFF70744400007000000000000000774700007777
        77777777777777770000}
      OnClick = PlaceMapBtnClick
    end
    object PlaceLabel: TLabel
      Left = 332
      Top = 4
      Width = 27
      Height = 13
      Caption = #1052#1110#1089#1094#1077
    end
    object Label5: TLabel
      Left = 8
      Top = 44
      Width = 33
      Height = 13
      Caption = #1050#1088#1072#1111#1085#1072
    end
    object DriveNoLabel: TLabel
      Left = 224
      Top = 44
      Width = 105
      Height = 13
      Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088
    end
    object Label6: TLabel
      Left = 7
      Top = 83
      Width = 72
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
    end
    object butAddVendor: TSpeedButton
      Tag = 2
      Left = 305
      Top = 97
      Width = 26
      Height = 22
      Hint = #1044#1086#1076#1072#1090#1080
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B00
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF1C1C1C1D1D1D1D1D1D1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF1C1C1CDCDCDCDCDCDC1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF1D1D1DDCDCDCDCDCDC1D1D1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B000000FF0000FF007B00
        007B00007B00007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1C1C1D
        1D1D1E1E1E1D1D1DDCDCDCDCDCDC1D1D1D1C1C1C1C1C1C1C1C1CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1DDC
        DCDCDDDDDDDCDCDCDCDCDCDDDDDDDCDCDCDCDCDCDDDDDD1C1C1CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1C1CDD
        DDDDDCDCDCDCDCDCDCDCDCDDDDDDDCDCDCDCDCDCDCDCDC1C1C1CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B000000FF0000FF007B00
        007B00007B00007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1D1D
        1D1D1C1C1C1D1D1DDCDCDCDCDCDC1D1D1D1D1D1D1C1C1C1C1C1C000000000000
        0000000000000000000000000000000000000000007B000000FF0000FF007B00
        00000000000000FFFFFF00000000000000000000000000000000000000000000
        00000000001D1D1DDCDCDCDCDCDC1C1C1C000000000000FFFFFF000000FFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
        00FFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF1C1C1CDCDCDCDCDCDC1C1C1CFFFFFF000000FFFFFF000000FF0000
        000000FFFFFFFF0000FF0000FF0000FFFFFFFF00007B00007B00007B00007B00
        00FFFFFF000000FFFFFF000000454545000000FFFFFF464646474747454545FF
        FFFF4545451D1D1D1D1D1D1D1D1D1D1D1DFFFFFF000000FFFFFF000000FFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FF0000
        000000FFFFFFFF0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FF00
        00FFFFFF000000FFFFFF000000454545000000FFFFFF464646454545454545FF
        FFFF454545464646454545454545454545FFFFFF000000FFFFFF000000FFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000FFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000FFFFFF000000FFFFFF
        000000FFFFFFFF0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FF00
        00FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF454545464646454545FF
        FFFF464646454545464646464646454545FFFFFF000000FFFFFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000FFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000FFFFFF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = butAddVendorClick
    end
    object butEditVendor: TSpeedButton
      Tag = 2
      Left = 329
      Top = 97
      Width = 26
      Height = 22
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD0000
        BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD00
        00FFFFFFFFFFFFFFFFFFFFFFFF31313131313132323230303031313130303031
        3131313131303030313131313131303030FFFFFFFFFFFFFFFFFFFFFFFFBD0000
        D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9BD00
        00FFFFFFFFFFFFFFFFFFFFFFFF313131C1BCC2C1BCC2C1BCC2C1BCC2C1BCC2C1
        BCC2C1BCC2C1BCC2C1BCC2C1BCC2323232FFFFFFFFFFFFFFFFFFFFFFFFBD0000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFBD00
        00FFFFFFFFFFFFFFFFFFFFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFBD0000
        FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000000000BD00
        00FFFFFFFFFFFFFFFFFFFFFFFF323232FFFFFF000000000000FFFFFF00000000
        0000FFFFFF000000000000000000323232FFFFFFFFFFFFFFFFFFFFFFFFBD0000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        00FFFFFFFFFFFFFFFFFFFFFFFF323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFBD0000
        FFFFFF000000000000FFFFFF000000000000FFFFFF00000000000000FFFFFFFF
        FF000000FFFFFFFFFFFFFFFFFF313131FFFFFF000000000000FFFFFF00000000
        0000FFFFFF000000000000F7F7F7FFFFFF000000FFFFFFFFFFFFFFFFFFBD0000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF
        FF000000FFFFFFFFFFFFFFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000F8F8F8FFFFFF000000FFFFFFFFFFFFFFFFFFBD0000
        BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD000000000000FF
        FFFFFFFF000000FFFFFFFFFFFF31313132323231313130303030303032323231
        3131313131313131323232000000F8F8F8FFFFFF000000FFFFFFFFFFFFBD0000
        FFFFFFBD0000BD0000FFFFFFBD0000BD0000FFFFFFBD0000BD000000000000FF
        FFFFFFFF000000FFFFFFFFFFFF303030FFFFFF313131323232FFFFFF32323230
        3030FFFFFF323232313131000000F8F8F8FFFFFF000000FFFFFFFFFFFFBD0000
        BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD00000000
        0000FFFFFFFFFF000000FFFFFF31313131313132323231313131313132323232
        3232313131313131313131323232000000F8F8F8FFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        0000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F8F8F8FFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000000000C600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000A8A3A9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000C600FFC600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000A8A3A9A8A3A9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = butEditVendorClick
    end
    object butDelVendor: TSpeedButton
      Tag = 2
      Left = 353
      Top = 97
      Width = 26
      Height = 22
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000A1A1A0A1A1A0
        A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014140000FF801414A1A1A0A1A1A0A1A1
        A08014140000FF7B0000A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D
        2D2D8282822D2D2DA1A1A0A1A1A0A1A1A02D2D2D8282821E1E1EA1A1A0A1A1A0
        A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF1414F3801414A1A1A08014
        141414F30000FF0000FFA1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D2D2D85
        85858181818686862E2E2DA1A1A02D2D2D868686818181828282A1A1A0A1A1A0
        A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF1414F38014141414
        F30000FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D
        2D2D8686868282828686862D2D2D8585858282828686862E2E2EA1A1A0A1A1A0
        A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000
        FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
        A1A02D2D2D8686868282828282828282828686862E2E2EA1A1A0A1A1A0A1A1A0
        A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014140000FF0000FF0000
        FF801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
        A1A0A1A1A02E2E2D8282828181818282822E2E2DA1A1A0A1A1A0A1A1A0A1A1A0
        A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000
        FF801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
        A1A02D2D2D8585858282828282828282822E2E2DA1A1A0A1A1A0A1A1A0A1A1A0
        A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000FF0000
        FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02E
        2E2D8686868181818282828181818282828686862D2D2DA1A1A0262626262626
        3535352626262626262626268426262626E90000FF1414F38014148014141414
        F30000FF1414F38014142626262626263535352626262626262626263C3C3C89
        89898282828686862D2D2D2D2D2D8686868282828585852D2D2D141414A1A1A0
        262626A1A1A0A1A1A0A1A1A0A1A1A08014141414F3801414A1A1A0A1A1A08014
        140000FF0000FF0000FF141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A02E
        2E2D8686862D2D2DA1A1A0A1A1A02E2E2D828282838383828282262626E92626
        353535A1A1A0F31414F31414F31414A1A1A0801414842626E92626E92626E926
        268014142626E98014142626265B5B5B353535A1A1A0515151515150515151A1
        A1A02D2D2D3C3C3C5B5B5A5B5B5B5B5B5A2D2D2D8989892E2E2D141414A1A1A0
        262626A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1
        A0A1A1A0842626A1A1A0141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A0A1
        A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A03C3C3CA1A1A0262626E92626
        353535A1A1A0F31414F31414F31414A1A1A0F31414F31414F31414F31414F314
        14A1A1A0262626A1A1A02626265B5B5A353535A1A1A0515150525252515150A1
        A1A0515151515151515150515151525252A1A1A0262626A1A1A0141414A1A1A0
        262626A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1
        A0A1A1A0262626A1A1A0141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A0A1
        A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0262626A1A1A0262626262626
        4242422626262626261414142626262626262626261414141414141414142626
        26262626353535A1A1A026262626262642424226262626262614141426262626
        2626262626141414141414141414262626262626353535A1A1A0141414A1A1A0
        262626A1A1A0F31414FF0000F31414A1A1A0F31414FF0000FF0000FF0000F314
        14A1A1A0262626A1A1A0141414A1A1A0262626A1A1A0515150464646515150A1
        A1A0515151464646454545464646515150A1A1A0262626A1A1A0141414141414
        2626261414141414140000001414141414141414140000000000000000001414
        14141414262626A1A1A014141414141426262614141414141400000014141414
        1414141414000000000000000000141414141414262626A1A1A0}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = butDelVendorClick
    end
    object Bevel1: TBevel
      Left = 8
      Top = 128
      Width = 372
      Height = 2
    end
    object Panel3: TPanel
      Left = 0
      Top = 138
      Width = 385
      Height = 151
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 385
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 41
          Height = 13
          Caption = #1055#1086#1089#1083#1091#1075#1080
        end
        object ListViewLargeBtn: TSpeedButton
          Tag = 1
          Left = 296
          Top = 0
          Width = 20
          Height = 20
          Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080'|'#1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1090#1080#1087' '#1085#1086#1084#1077#1088#1072' '#1074' '#1094#1100#1086#1084#1091' '#1075#1086#1090#1077#1083#1110
          GroupIndex = 1
          Flat = True
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000
            000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C100010001000
            10001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000FF7FFF7F
            10001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000FF7FFF7F
            10001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1000FF7F1000
            10001F7C1F7C1F7C0000000000000000000000001F7C1F7C1F7C100010001000
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C10001000100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1000FF7FFF7F10001F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1000FF7FFF7F10001F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1000FF7F100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1000100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = ListViewLargeBtnClick
        end
        object ListViewListBtn: TSpeedButton
          Tag = 3
          Left = 316
          Top = 0
          Width = 20
          Height = 20
          Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080'|'#1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1090#1080#1087' '#1085#1086#1084#1077#1088#1072' '#1074' '#1094#1100#1086#1084#1091' '#1075#1086#1090#1077#1083#1110
          GroupIndex = 1
          Flat = True
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1000100010001F7C1F7C1F7C1F7C1F7C1000100010001F7C1F7C
            1F7C1F7C1F7C1000FF7F10001F7C0000000000001F7C1000FF7F10001F7C0000
            000000001F7C100010001F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1000100010001F7C1F7C1F7C1F7C1F7C1000100010001F7C1F7C
            1F7C1F7C1F7C1000FF7F10001F7C0000000000001F7C1000FF7F10001F7C0000
            000000001F7C100010001F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1000100010001F7C1F7C1F7C1F7C1F7C1000100010001F7C1F7C
            1F7C1F7C1F7C1000FF7F10001F7C0000000000001F7C1000FF7F10001F7C0000
            000000001F7C100010001F7C1F7C1F7C1F7C1F7C1F7C100010001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = ListViewLargeBtnClick
        end
        object ListViewDetailBtn: TSpeedButton
          Tag = 4
          Left = 336
          Top = 0
          Width = 20
          Height = 20
          Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080'|'#1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1090#1080#1087' '#1085#1086#1084#1077#1088#1072' '#1074' '#1094#1100#1086#1084#1091' '#1075#1086#1090#1077#1083#1110
          GroupIndex = 1
          Down = True
          Flat = True
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C10001F7C1F7C00000000000000001F7C0000000000001F7C0000
            000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C10001F7C1F7C00000000000000001F7C0000000000001F7C0000
            000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C10001F7C1F7C00000000000000001F7C0000000000001F7C0000
            000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C10001F7C1F7C00000000000000001F7C0000000000001F7C0000
            000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C10001F7C1F7C00000000000000001F7C0000000000001F7C0000
            000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1000100010001000100010001000100010001000100010001000
            1000100010001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C0000000000001F7C0000
            000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = ListViewLargeBtnClick
        end
        object butEditDrvKind: TSpeedButton
          Tag = 2
          Left = 357
          Top = 0
          Width = 23
          Height = 21
          Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD0000
            BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD00
            00FFFFFFFFFFFFFFFFFFFFFFFF31313131313132323230303031313130303031
            3131313131303030313131313131303030FFFFFFFFFFFFFFFFFFFFFFFFBD0000
            D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9BD00
            00FFFFFFFFFFFFFFFFFFFFFFFF313131C1BCC2C1BCC2C1BCC2C1BCC2C1BCC2C1
            BCC2C1BCC2C1BCC2C1BCC2C1BCC2323232FFFFFFFFFFFFFFFFFFFFFFFFBD0000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFBD00
            00FFFFFFFFFFFFFFFFFFFFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF000000FFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFBD0000
            FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000000000BD00
            00FFFFFFFFFFFFFFFFFFFFFFFF323232FFFFFF000000000000FFFFFF00000000
            0000FFFFFF000000000000000000323232FFFFFFFFFFFFFFFFFFFFFFFFBD0000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
            00FFFFFFFFFFFFFFFFFFFFFFFF323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFBD0000
            FFFFFF000000000000FFFFFF000000000000FFFFFF00000000000000FFFFFFFF
            FF000000FFFFFFFFFFFFFFFFFF313131FFFFFF000000000000FFFFFF00000000
            0000FFFFFF000000000000F7F7F7FFFFFF000000FFFFFFFFFFFFFFFFFFBD0000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF
            FF000000FFFFFFFFFFFFFFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF000000F8F8F8FFFFFF000000FFFFFFFFFFFFFFFFFFBD0000
            BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD000000000000FF
            FFFFFFFF000000FFFFFFFFFFFF31313132323231313130303030303032323231
            3131313131313131323232000000F8F8F8FFFFFF000000FFFFFFFFFFFFBD0000
            FFFFFFBD0000BD0000FFFFFFBD0000BD0000FFFFFFBD0000BD000000000000FF
            FFFFFFFF000000FFFFFFFFFFFF303030FFFFFF313131323232FFFFFF32323230
            3030FFFFFF323232313131000000F8F8F8FFFFFF000000FFFFFFFFFFFFBD0000
            BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD00000000
            0000FFFFFFFFFF000000FFFFFF31313131313132323231313131313132323232
            3232313131313131313131323232000000F8F8F8FFFFFF000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            0000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F8F8F8FFFFFF000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000000000C600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000A8A3A9FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000C600FFC600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000A8A3A9A8A3A9FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = butEditDrvKindClick
        end
      end
      object Panel2: TPanel
        Left = 381
        Top = 22
        Width = 4
        Height = 129
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
      end
      object ServiceListView: TListView
        Left = 0
        Top = 22
        Width = 381
        Height = 129
        Hint = '|'#1057#1087#1080#1089#1086#1082' '#1087#1086#1089#1083#1091#1075', '#1097#1086' '#1085#1072#1076#1072#1102#1090#1100#1089#1103
        HelpContext = 910
        Align = alClient
        Color = clInfoBk
        Columns = <
          item
            Caption = #1053#1072#1079#1074#1072
            Width = 120
          end
          item
            Caption = #1062#1110#1085#1072
            Width = 60
          end
          item
            Caption = #1042#1072#1083
            Width = 35
          end
          item
            Caption = #1059' '#1074#1072#1088#1090'?'
            Width = 52
          end
          item
            Caption = #1055#1088#1080#1084#1110#1090#1082#1072
            Width = 88
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        IconOptions.AutoArrange = True
        ParentFont = False
        SortType = stText
        TabOrder = 2
        ViewStyle = vsReport
      end
    end
    object EdNameHotel: TcxTextEdit
      Left = 7
      Top = 20
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 138
    end
    object EdYearBus: TcxTextEdit
      Left = 147
      Top = 19
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 67
    end
    object CmbxEuroClass: TcxExtLookupComboBox
      Left = 216
      Top = 19
      Hint = #1050#1088#1072#1111#1085#1072', '#1076#1077' '#1092#1110#1088#1084#1072' '#1084#1072#1108' '#1086#1092#1110#1089'|'#1050#1088#1072#1111#1085#1072', '#1076#1077' '#1092#1110#1088#1084#1072' '#1084#1072#1108' '#1086#1092#1110#1089
      Properties.DropDownListStyle = lsEditList
      Properties.DropDownRows = 24
      Properties.HideSelection = False
      Properties.IncrementalFiltering = False
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 74
    end
    object PlaceCountDBEdit: TcxSpinEdit
      Left = 331
      Top = 18
      Properties.MinValue = 5.000000000000000000
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Value = 5
      Width = 49
    end
    object CmbxSearchCountry: TcxExtLookupComboBox
      Left = 7
      Top = 58
      Hint = #1050#1088#1072#1111#1085#1072', '#1076#1077' '#1092#1110#1088#1084#1072' '#1084#1072#1108' '#1086#1092#1110#1089'|'#1050#1088#1072#1111#1085#1072', '#1076#1077' '#1092#1110#1088#1084#1072' '#1084#1072#1108' '#1086#1092#1110#1089
      Properties.DropDownListStyle = lsEditList
      Properties.DropDownRows = 24
      Properties.HideSelection = False
      Properties.IncrementalFiltering = False
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Width = 214
    end
    object EdDriveNoDB: TcxTextEdit
      Left = 222
      Top = 58
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Width = 158
    end
    object CmbxSearchDrvVendor: TcxExtLookupComboBox
      Left = 7
      Top = 98
      Hint = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
      Properties.DropDownListStyle = lsEditList
      Properties.DropDownRows = 24
      Properties.HideSelection = False
      Properties.IncrementalFiltering = False
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 7
      Width = 298
    end
  end
  object PanelImageList: TPanel
    Left = 385
    Top = 0
    Width = 266
    Height = 289
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    inline FramePhotoList: TFramePhotoList
      Left = 0
      Top = 0
      Width = 266
      Height = 289
      Align = alClient
      TabOrder = 0
      inherited PhotoPanel: TPanel
        Width = 266
        Height = 289
        inherited PanelCanvas: TPanel
          Width = 266
          Height = 260
          inherited ImgShow: TcxImage
            Height = 236
            Width = 266
          end
          inherited PanelInfoButton: TPanel
            Top = 236
            Width = 266
            inherited PanelFotoDate: TPanel
              Width = 196
            end
            inherited Panel1: TPanel
              Left = 196
            end
          end
        end
        inherited PanelBottom: TPanel
          Top = 260
          Width = 266
          inherited Panel2: TPanel
            Width = 266
            inherited MemoDescript: TcxMemo
              Width = 266
            end
          end
        end
      end
    end
  end
end
