object FrameSearchCityAdmUnit: TFrameSearchCityAdmUnit
  Left = 0
  Top = 0
  Width = 488
  Height = 47
  TabOrder = 0
  DesignSize = (
    488
    47)
  object EdSearchCity: TcxTextEdit
    Left = 0
    Top = 0
    Anchors = [akLeft, akTop, akRight]
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.Color = clInfoBk
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    OnExit = EdSearchCityExit
    OnKeyDown = EdSearchCityKeyDown
    Width = 440
  end
  object PanelControl: TPanel
    Left = 441
    Top = 0
    Width = 47
    Height = 47
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      47
      47)
    object butOptSeacrh: TSpeedButton
      Left = 0
      Top = 0
      Width = 23
      Height = 21
      Hint = #1057#1087#1110#1074#1087#1072#1076#1110#1085#1085#1103' ( '#1087#1086#1095#1072#1090#1086#1082' / '#1074' '#1089#1077#1088#1077#1076#1080#1085#1110' )'
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 9
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFF6F3B15
        6D3913D6A07CFFFFFFC9946F7C48227B48227A47217A47217A47217B48227B48
        227B4822AB7752FFFFFF78451FAA7952AA795288562FA16D4887552EC19169C0
        9068C09068C09068BA8A62BA8A62BA8A62BA8A6273401AFFFFFF7E4B25C1916A
        C1916995643D703C16BC8C64C09068C09068C09068C090689968417C49237C49
        237C492375421CFCC8A7814E28C3936CC2926B96653E703C16C3936CC2926BC2
        926BC2926BC2926BC3936CC5956DC5956DC6966EAB7A53B07C5785532CC4946D
        C4946C9A69428C5B34C5956EC4946DC4946DC4946DC5956E996841703C16713D
        17713D1774411BBA8661B17E58F9C8A3E9B891AE7D568C5B34C4946DC4946DC4
        946DC4946DC4946DD3A37CDDAD86EAB992F9CAA6FADBC3AE7B55B3805AFADAC1
        FADAC1D9A680996841FADAC1FAD9C0FAD9C0FAD9C0FADAC1B9866098653F9865
        3F98653F94613B94613BB7845EFADBC3FADBC3DDAA84996841FADAC1FAD9C0FA
        D9C0FAD9C0FADAC1FAC7A2FAC7A2FAC7A2FAC7A2D8A57F98653FBC8862A16E48
        A06D4798653F8C5A33FAC7A2FADCC4FADBC3FADBC3FADCC4FADCC4FADDC6FADD
        C6FADDC6FADDC6B98660FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5825CFACAA7FA
        DDC6FADDC6FACEAEB4815BA5724CA6734DA6734DCA9670E8B48FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB27F59FAD9C0FADEC7E6B38EFDDDC8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2
        9F79FADFC9FACDADD8A580FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7764FFADDC6FAE0CBB7865FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
        B48FFADEC7FAE2CEBD8C65FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9A74FAE0CBFADAC1E5B28DFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        DCC5D7A67FD2A17AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
    end
    object butSearchCityGlobal: TSpeedButton
      Left = 24
      Top = 0
      Width = 23
      Height = 21
      Hint = #1055#1086#1096#1091#1082' '#1075#1083#1086#1073#1072#1083#1100#1085#1080#1081
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 10
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF4D74AB234179C5ABA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666663F3F3F999999FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4173
        AF553FF5553FF51F4B80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF5151513C3C3C2C2C2C3B3B3BFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF2F6EB25640
        F5553FF5553FF5568BC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF5555555858585151513A3A3A5A5A5AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF2974BB5640F55640
        F5553FF56696C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFCFCFC5F5F5F7A7A7A777777545454545454FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D8FD55640F55640F5553F
        F5669DD2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF7B7B7B858585B0B0B07171717C7C7CFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEA188898A6A6A93736E866567B09595BAA8B1553FF55640F55640F563A1
        DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFBDBDBDB2B2B2ACACACAAAAAAA4
        A4A4A9A9A9B2B2B26969697B7B7B828282FFFFFFFFFFFFFFFFFFFFFFFFD7CDCD
        7E5857DFD3CBFFFFF7FFFFE7FFFEDBD6BB9E90584D817B8E553FF56BB5E9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7C8C8C8CECECECCCCCCCACACACCCCCCC7
        C7C7A3A3A3B1B1B1B5B5B59D9D9DFFFFFFFFFFFFFFFFFFFFFFFFEDE9E9886565
        FFFFFFFFFFFFFDF8E8E9F7DBE9F7DBE9F7DBE9F7DB9F5945C0C7D5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFECECECCCCCCCD6D6D6D3D3D3D7D7D7D8D8D8D4D4D4CF
        CFCFCECECEA7A7A7AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA38889F6EFEA
        FFFFFFFEFBF5FBF7E8E9F7DBE9F7DBB6DD8FB6DD8F9BC86FAB8B8EFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC9C9C9E2E2E2DFDFDFE6E6E6E9E9E9E8E8E8E7E7E7E0
        E0E0D9D9D9D7D7D78A8A8AF3F3F3FFFFFFFFFFFFFFFFFFFFFFFF937674FFFFFF
        FDFBF1FCF8EEE9F7DBE9F7DBE9F7DBB6DD8FB6DD8F9BC86FA87E75F8F6F6FFFF
        FFFFFFFFFFFFFFFFFFFFB9B9B9EBEBEBEDEDEDECECECEDEDEDECECECEDEDEDEC
        ECECE5E5E5E3E3E3A4A4A4DADADAFFFFFFFFFFFFFFFFFFFFFFFF997D7AFFFFFC
        E9F7DBE9F7DBFAF7E5E9F7DBE9F7DBB6DD8FECD8B99BC86FAF8679EDE8E9FFFF
        FFFFFFFFFFFFFFFFFFFFA9A9A9F6F6F6ECECECE9E9E9EAEAEAEDEDEDEBEBEBEB
        EBEBECECECEEEEEEA9A9A9CDCDCDFFFFFFFFFFFFFFFFFFFFFFFF9C807BFFFFEB
        E9F7DBE9F7DBE9F7DBB6DD8FFEFBF9FFFFF0EFDFC09BC86FB0857BF5F2F3FFFF
        FFFFFFFFFFFFFFFFFFFFBABABAF7F7F7F2F2F2F9F9F9F9F9F9EEEEEEEEEEEEEC
        ECECEAEAEAF7F7F7A8A8A8DADADAFFFFFFFFFFFFFFFFFFFFFFFFAF9596E9F7DB
        F9EBCCB6DD8FB6DD8FB6DD8FFDFCECFAF5DDEFDCBCB6DD8FB59A9AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC7C7C7F7F7F7F7F7F7FFFFFFFFFFFFF4F4F4F2F2F2ED
        EDEDF2F2F2FBFBFB919191FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFDED4D7BA998C
        E9F7DBB6DD8FB6DD8FEFDBBFF2E3C4F2DEBCB6DD8FBB8E7DE7DFE2FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDEDEDECCCCCCFCFCFCFCFCFCFCFCFCF9F9F9F7F7F7FC
        FCFCFDFDFDC2C2C2D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEBFC5
        BE9A8DE9F7DBB6DD8FB6DD8FB6DD8FB6DD8FBE9585DFD6D7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6C7C7C7F4F4F4FDFDFDFDFDFDFCFCFCF9
        F9F9BCBCBCC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E9E4E6C9B3B4B99C93C3A097BF9F96CCB9B7F1EEEFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1CECECEC4C4C4C3C3C3C2C2C2CE
        CECEDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = butSearchCityGlobalClick
      OnMouseDown = butSearchCityGlobalMouseDown
      OnMouseMove = butSearchCityGlobalMouseMove
    end
  end
  object CitySrc: TDataSource
    Left = 187
    Top = 4
  end
  object ADOCity: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select CITY_ADM_UNIT.*,ADMIN_UNIT.atype from CITY_ADM_UNIT'
      
        'left join ADMIN_UNIT on CITY_ADM_UNIT.id_admin_unit = ADMIN_UNIT' +
        '.id'
      'where ID_COUNTRY = :ID_COUNTRY')
    Left = 240
    Top = 4
  end
end
