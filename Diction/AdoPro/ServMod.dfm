object DMServ: TDMServ
  OldCreateOrder = False
  OnCreate = DMServCreate
  OnDestroy = DataModuleDestroy
  Left = 436
  Top = 321
  Height = 800
  Width = 1371
  object ReklamaQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM REKLAMA')
    Left = 141
    Top = 315
    object ReklamaQryREKLAMAID: TIntegerField
      FieldName = 'REKLAMAID'
      Required = True
    end
    object ReklamaQryName: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME'
      Size = 25
    end
    object ReklamaQryVendorId: TIntegerField
      FieldName = 'VENDORID'
    end
    object ReklamaQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
      Size = 8
    end
    object ReklamaQryLookVendor: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
      FieldKind = fkLookup
      FieldName = 'LookVendor'
      LookupKeyFields = 'COMPANYID'
      LookupResultField = 'NAME'
      KeyFields = 'VendorId'
      Size = 30
      Lookup = True
    end
    object ReklamaQryPRIORORDER: TSmallintField
      FieldName = 'PRIORORDER'
    end
    object ReklamaQryPRESETTYPE: TSmallintField
      FieldName = 'PRESETTYPE'
    end
  end
  object DrvSrvLnkQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnCalcFields = HtlSrvLnkQryCalcFields
    DataSource = BrDriveSrc
    Parameters = <
      item
        Name = 'DRIVEID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select DrvServLinks.DriveId, DrvServLinks.LinkId, DrvServLinks.S' +
        'erviceId,'
      'S.HaveValue, DrvServLinks.IntValue, S.MeasureUnit,'
      
        'DrvServLinks.HaveCost, DrvServLinks.Cost,DrvServLinks.CurrId, Dr' +
        'vServLinks.Comments,'
      'S.Name, S.LargeIcon, S.SmallIcon, C.CurrencyShort'
      'from DrvServLinks'
      'left join SERVICES S on S.serviceid =DrvServLinks.serviceid'
      'left join Currency C on C.CurrencyId = DrvServLinks.CurrId'
      'where DrvServLinks.DriveId = :DriveId')
    Left = 309
    Top = 254
    object DrvSrvLnkQryDRIVEID: TIntegerField
      FieldName = 'DRIVEID'
    end
    object DrvSrvLnkQryLINKID: TIntegerField
      FieldName = 'LINKID'
    end
    object DrvSrvLnkQrySERVICEID: TIntegerField
      FieldName = 'SERVICEID'
    end
    object DrvSrvLnkQryHAVEVALUE: TStringField
      FieldName = 'HAVEVALUE'
      Size = 1
    end
    object DrvSrvLnkQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
    end
    object DrvSrvLnkQryMEASUREUNIT: TStringField
      FieldName = 'MEASUREUNIT'
      Size = 5
    end
    object DrvSrvLnkQryHAVECOST: TSmallintField
      FieldName = 'HAVECOST'
    end
    object DrvSrvLnkQryCOST: TFloatField
      DisplayLabel = #1062#1110#1085#1072
      FieldName = 'COST'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DrvSrvLnkQryCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object DrvSrvLnkQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object DrvSrvLnkQryNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME'
      Size = 190
    end
    object DrvSrvLnkQryLARGEICON: TBlobField
      FieldName = 'LARGEICON'
    end
    object DrvSrvLnkQrySMALLICON: TBlobField
      FieldName = 'SMALLICON'
    end
    object DrvSrvLnkQryCURRENCYSHORT: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1072#1083'.'
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object DrvSrvLnkQryCalcValue: TStringField
      DisplayLabel = #1042#1077#1083#1080#1095#1080#1085#1072
      FieldKind = fkCalculated
      FieldName = 'CalcValue'
      Calculated = True
    end
    object DrvSrvLnkQryCalcCost: TStringField
      DisplayLabel = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100'?'
      FieldKind = fkCalculated
      FieldName = 'CalcCost'
      Size = 10
      Calculated = True
    end
    object DrvSrvLnkQryCalcHaveCost: TStringField
      DisplayLabel = #1042#1093'.'#1091' '#1074#1072#1088#1090'?'
      FieldKind = fkCalculated
      FieldName = 'CalcHaveCost'
      Size = 11
      Calculated = True
    end
    object DrvSrvLnkQryCalcMemo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcMemo'
      Size = 255
      Calculated = True
    end
    object DrvSrvLnkQryCalcPrice: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcPrice'
      Size = 100
      Calculated = True
    end
  end
  object DriveFloorTotalQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT count(DriveId), sum(PlaceCount) FROM DrvMaps')
    Left = 133
    Top = 260
  end
  object CompAccountQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnNewRecord = CompAccountQryNewRecord
    DataSource = CompanySrc
    Parameters = <
      item
        Name = 'COMPANYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM COMPACCOUNTS where COMPANYID = :COMPANYID')
    Left = 133
    Top = 361
    object CompAccountQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object CompAccountQryACCOUNTID: TIntegerField
      FieldName = 'ACCOUNTID'
    end
    object CompAccountQryBANKID: TIntegerField
      FieldName = 'BANKID'
    end
    object CompAccountQryACCOUNTNO: TStringField
      FieldName = 'ACCOUNTNO'
    end
    object CompAccountQryACCOUNTNO2: TStringField
      FieldName = 'ACCOUNTNO2'
    end
    object CompAccountQryISCORRESP: TStringField
      FieldName = 'ISCORRESP'
      Required = True
      Size = 1
    end
    object CompAccountQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
    object CompAccountQryNOTUSE: TStringField
      FieldName = 'NOTUSE'
      Size = 1
    end
  end
  object BankLookQrySrc: TDataSource
    DataSet = BankLookQry
    Left = 473
    Top = 309
  end
  object BankLookQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'SELECT b.bankid, c.BankCorrId, c.CurrencyId, b.Name, b.Address, ' +
        'b.Swift'
      'FROM Banks b, BankCorrs c WHERE c.BankId = b.BankId')
    Left = 473
    Top = 255
  end
  object AnketTempQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TOURISTTEMPLATES')
    Left = 43
    Top = 13
    object AnketTempQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Required = True
    end
    object AnketTempQryTOURISTTEMPLATEID: TIntegerField
      FieldName = 'TOURISTTEMPLATEID'
    end
    object AnketTempQryIDENTCODE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076
      FieldName = 'IDENTCODE'
      Size = 1
    end
    object AnketTempQryOLDSURNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'OLDSURNAME'
      Size = 1
    end
    object AnketTempQryOLDSECONDNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1110#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'OLDSECONDNAME'
      Size = 1
    end
    object AnketTempQryBIRTHLOCALITY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1052#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'BIRTHLOCALITY'
      Size = 1
    end
    object AnketTempQryBIRTHCOUNTRY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1050#1088#1072#1111#1085#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'BIRTHCOUNTRY'
      Size = 1
    end
    object AnketTempQryPASSPORTISSUE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1047#1072#1082#1086#1088#1076#1086#1085#1085#1080#1081' '#1087#1072#1089#1087#1086#1088#1090' '#1082#1086#1076' '#1084#1110#1089#1094#1103' '#1074#1080#1076#1072#1095#1110
      FieldName = 'PASSPORTISSUE'
      Size = 1
    end
    object AnketTempQryPASSPORTISSUEADDRESS: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1047#1072#1082#1086#1088#1076#1086#1085#1085#1080#1081' '#1087#1072#1089#1087#1086#1088#1090' '#1072#1076#1088#1077#1089#1072' '#1084#1110#1089#1094#1103' '#1074#1080#1076#1072#1095#1110
      FieldName = 'PASSPORTISSUEADDRESS'
      Size = 1
    end
    object AnketTempQryNATIONALITY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086' '#1087#1086#1087#1077#1088#1077#1076#1085#1108
      FieldName = 'NATIONALITY'
      Size = 1
    end
    object AnketTempQryPRIORNATIONALITY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086' '#1087#1088#1080' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1110
      FieldName = 'PRIORNATIONALITY'
      Size = 1
    end
    object AnketTempQrySEX: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1057#1090#1072#1090#1100
      FieldName = 'SEX'
      Size = 1
    end
    object AnketTempQryMARRIED: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1057#1110#1084#1077#1081#1085#1080#1081' '#1089#1090#1072#1085
      FieldName = 'MARRIED'
      Size = 1
    end
    object AnketTempQrySPOUSENAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1110#1084#8217#1103
      FieldName = 'SPOUSENAME'
      Size = 1
    end
    object AnketTempQrySPOUSESURNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1087#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'SPOUSESURNAME'
      Size = 1
    end
    object AnketTempQrySPOUSEOLDSURNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1080#1079#1074#1080#1097#1077
      FieldName = 'SPOUSEOLDSURNAME'
      Size = 1
    end
    object AnketTempQrySPOUSEFIRSTNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1110#1084#8217#1103' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'SPOUSEFIRSTNAME'
      Size = 1
    end
    object AnketTempQrySPOUSESECONDNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1087#1088#1110#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'SPOUSESECONDNAME'
      Size = 1
    end
    object AnketTempQrySPOUSEOLDSECONDNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1080#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'SPOUSEOLDSECONDNAME'
      Size = 1
    end
    object AnketTempQrySPOUSEBIRTHDATE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1076#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'SPOUSEBIRTHDATE'
      Size = 1
    end
    object AnketTempQrySPOUSEBIRTHLOCALITY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1084#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'SPOUSEBIRTHLOCALITY'
      Size = 1
    end
    object AnketTempQrySPOUSEBIRTHCOUNTRY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1082#1088#1072#1111#1085#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'SPOUSEBIRTHCOUNTRY'
      Size = 1
    end
    object AnketTempQrySPOUSENATIONALITY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1076#1088#1091#1078#1078#1103' '#1075#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
      FieldName = 'SPOUSENATIONALITY'
      Size = 1
    end
    object AnketTempQryPROFESSION: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1088#1086#1092#1077#1089#1110#1103
      FieldName = 'PROFESSION'
      Size = 1
    end
    object AnketTempQryOCCUPATION: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1089#1072#1076#1072
      FieldName = 'OCCUPATION'
      Size = 1
    end
    object AnketTempQryEMPLOYER: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1088#1072#1094#1077#1076#1072#1074#1077#1094#1100
      FieldName = 'EMPLOYER'
      Size = 1
    end
    object AnketTempQryEMPLADDRESS: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1040#1076#1088#1077#1089#1072' '#1088#1086#1073#1086#1090#1086#1076#1072#1074#1094#1103
      FieldName = 'EMPLADDRESS'
      Size = 1
    end
    object AnketTempQryEMPLPHONE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085' '#1088#1086#1073#1086#1090#1086#1076#1072#1074#1094#1103
      FieldName = 'EMPLPHONE'
      Size = 1
    end
    object AnketTempQryDESTINATION: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTINATION'
      Size = 1
    end
    object AnketTempQrySHENGENENTRY: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SHENGENENTRY'
      Size = 1
    end
    object AnketTempQryARRIVECUSTOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ARRIVECUSTOM'
      Size = 1
    end
    object AnketTempQryDEPARTCUSTOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DEPARTCUSTOM'
      Size = 1
    end
    object AnketTempQryGARANT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GARANT'
      Size = 1
    end
    object AnketTempQryGARANTADDRESS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GARANTADDRESS'
      Size = 1
    end
    object AnketTempQryGARANTNATIONALITY: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GARANTNATIONALITY'
      Size = 1
    end
    object AnketTempQryGARANTPHONE: TStringField
      FieldName = 'GARANTPHONE'
      Size = 1
    end
    object AnketTempQryADDRTONAME: TStringField
      FieldName = 'ADDRTONAME'
      Size = 1
    end
    object AnketTempQryADDRESSTO: TStringField
      FieldName = 'ADDRESSTO'
      Size = 1
    end
    object AnketTempQryADDRTOPHONE: TStringField
      FieldName = 'ADDRTOPHONE'
      Size = 1
    end
    object AnketTempQryREFERENCE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCE'
      Size = 1
    end
    object AnketTempQryTRAVELOBJECT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRAVELOBJECT'
      Size = 1
    end
    object AnketTempQryDURATIONFROM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DURATIONFROM'
      Size = 1
    end
    object AnketTempQryDURATIONTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DURATIONTO'
      Size = 1
    end
    object AnketTempQryDRIVEKIND: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DRIVEKIND'
      Size = 1
    end
    object AnketTempQryLASTVISITDATE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LASTVISITDATE'
      Size = 1
    end
    object AnketTempQryLASTEMBASSYDATE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LASTEMBASSYDATE'
      Size = 1
    end
    object AnketTempQryDESTCOUNTRY: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTCOUNTRY'
      Size = 1
    end
    object AnketTempQryVISAKIND: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VISAKIND'
      Size = 1
    end
    object AnketTempQryVISAPERIOD: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VISAPERIOD'
      Size = 1
    end
    object AnketTempQryNATIONALVISA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NATIONALVISA'
      Size = 1
    end
    object AnketTempQryENDDESTINATION: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDDESTINATION'
      Size = 1
    end
    object AnketTempQryENDVISA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDVISA'
      Size = 1
    end
    object AnketTempQryBIRTHDATE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BIRTHDATE'
      Size = 1
    end
    object AnketTempQryADDITADDRESS: TStringField
      DisplayLabel = #1058#1080#1084#1095#1072#1089#1086#1074#1072' '#1072#1076#1088#1077#1089#1072
      FieldName = 'ADDITADDRESS'
      Size = 1
    end
    object AnketTempQryPARENTSCYR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PARENTSCYR'
      Size = 1
    end
    object AnketTempQryPARENTSLAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PARENTSLAT'
      Size = 1
    end
    object AnketTempQryFATHERCYR: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1110#1084#39#1103
      FieldName = 'FATHERCYR'
      Size = 1
    end
    object AnketTempQryFATHERLAT: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1110#1084#39#1103' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'FATHERLAT'
      Size = 1
    end
    object AnketTempQryMOTHERCYR: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1110#1084#8217#1103
      FieldName = 'MOTHERCYR'
      Size = 1
    end
    object AnketTempQryMOTHERLAT: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1110#1084#8217#1103' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'MOTHERLAT'
      Size = 1
    end
    object AnketTempQryMOTHEROLDCYR: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1080#1079#1074#1080#1097#1077
      FieldName = 'MOTHEROLDCYR'
      Size = 1
    end
    object AnketTempQryMOTHEROLDLAT: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1080#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'MOTHEROLDLAT'
      Size = 1
    end
    object AnketTempQryCHILDNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1110#1090#1080' '#1110#1084#39#1103
      FieldName = 'CHILDNAME'
      Size = 1
    end
    object AnketTempQryCHILDSURNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1110#1090#1080' '#1087#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'CHILDSURNAME'
      Size = 1
    end
    object AnketTempQryCHILDFIRSTNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1110#1090#1080' '#1110#1084#39#1103' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'CHILDFIRSTNAME'
      Size = 1
    end
    object AnketTempQryCHILDSECONDNAME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1110#1090#1080' '#1087#1088#1110#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'CHILDSECONDNAME'
      Size = 1
    end
    object AnketTempQryCHILDBIRTHDATE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1110#1090#1080' '#1076#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'CHILDBIRTHDATE'
      Size = 1
    end
    object AnketTempQryCHILDBIRTHLOCALITY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1110#1090#1080' '#1084#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'CHILDBIRTHLOCALITY'
      Size = 1
    end
    object AnketTempQryCHILDBIRTHCOUNTRY: TStringField
      DisplayLabel = #1044#1110#1090#1080' '#1082#1088#1072#1111#1085#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'CHILDBIRTHCOUNTRY'
      Size = 1
    end
    object AnketTempQryCHILDNATIONALITY: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1110#1090#1080' '#1075#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
      FieldName = 'CHILDNATIONALITY'
      Size = 1
    end
    object AnketTempQryRETURNVISA1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RETURNVISA1'
      Size = 1
    end
    object AnketTempQryRETURNVISA1NO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RETURNVISA1NO'
      Size = 1
    end
    object AnketTempQryRETURNVISA1DATE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RETURNVISA1DATE'
      Size = 1
    end
    object AnketTempQryRETURNVISA2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RETURNVISA2'
      Size = 1
    end
    object AnketTempQryRETURNVISA2NO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RETURNVISA2NO'
      Size = 1
    end
    object AnketTempQryRETURNVISA2DATE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RETURNVISA2DATE'
      Size = 1
    end
    object AnketTempQryOTHERINFO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OTHERINFO'
      Size = 1
    end
    object AnketTempQryHASMONEY: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'HASMONEY'
      Size = 1
    end
    object AnketTempQryENDVISAKIND: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDVISAKIND'
      Size = 1
    end
    object AnketTempQryENDVISANO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDVISANO'
      Size = 1
    end
    object AnketTempQryENDVISADATE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDVISADATE'
      Size = 1
    end
    object AnketTempQryENDVISAISSUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDVISAISSUE'
      Size = 1
    end
    object AnketTempQryLASTEMBASSYFILTER: TSmallintField
      FieldName = 'LASTEMBASSYFILTER'
    end
    object AnketTempQryLASTVISITFILTER: TSmallintField
      FieldName = 'LASTVISITFILTER'
    end
    object AnketTempQryDOCUMENTS: TMemoField
      FieldName = 'DOCUMENTS'
      BlobType = ftMemo
      Size = 1
    end
    object AnketTempQrySPOUSESEX: TStringField
      FieldName = 'SPOUSESEX'
      Size = 1
    end
    object AnketTempQryPASSPORTEXPIREMONTHS: TSmallintField
      FieldName = 'PASSPORTEXPIREMONTHS'
    end
    object AnketTempQrySECONDNAME: TStringField
      DisplayLabel = #1055#1088#1110#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'SECONDNAME'
      Size = 1
    end
    object AnketTempQryFIRSTNAME: TStringField
      DisplayLabel = #1030#1084#39#1103' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'FIRSTNAME'
      Size = 1
    end
    object AnketTempQryMIDDLENAME: TStringField
      DisplayLabel = #1055#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110
      FieldName = 'MIDDLENAME'
      Size = 1
    end
    object AnketTempQryMIDDLELNAME: TStringField
      DisplayLabel = #1055#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'MIDDLELNAME'
      Size = 1
    end
    object AnketTempQryPASSPORTNOINSIDE: TStringField
      DisplayLabel = #1042#1085#1091#1090#1088#1110#1096#1085#1110#1081' '#1087#1072#1089#1087#1086#1088#1090' '#1089#1077#1088#1110#1103' '#8470
      FieldName = 'PASSPORTNOINSIDE'
      Size = 1
    end
    object AnketTempQryPASSDATEINSIDE: TStringField
      DisplayLabel = #1042#1085#1091#1090#1088#1110#1096#1085#1110#1081' '#1087#1072#1089#1087#1086#1088#1090' '#1076#1072#1090#1072' '#1074#1080#1076#1072#1095#1110
      FieldName = 'PASSDATEINSIDE'
      Size = 1
    end
    object AnketTempQryPASSISSUEDINSIDE: TStringField
      DisplayLabel = #1042#1085#1091#1090#1088#1110#1096#1085#1110#1081' '#1087#1072#1089#1087#1086#1088#1090' '#1082#1080#1084' '#1074#1080#1076#1072#1085#1080#1081
      FieldName = 'PASSISSUEDINSIDE'
      Size = 1
    end
    object AnketTempQryFATHERSECONDCYR: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1087#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'FATHERSECONDCYR'
      Size = 1
    end
    object AnketTempQryFATHERSECONDLAT: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1087#1088#1110#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'FATHERSECONDLAT'
      Size = 1
    end
    object AnketTempQryFATHEROLDCYR: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'FATHEROLDCYR'
      Size = 1
    end
    object AnketTempQryFATHEROLDLAT: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1110#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'FATHEROLDLAT'
      Size = 1
    end
    object AnketTempQryFATHERNATIONALITY: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1075#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
      FieldName = 'FATHERNATIONALITY'
      Size = 1
    end
    object AnketTempQryFATHERBIRTHDATE: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1076#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'FATHERBIRTHDATE'
      Size = 1
    end
    object AnketTempQryFATHERBIRTHLOCALITY: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1084#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'FATHERBIRTHLOCALITY'
      Size = 1
    end
    object AnketTempQryADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111
      FieldName = 'ADDRESS'
      Size = 1
    end
    object AnketTempQryBIRTHSURNAME: TStringField
      DisplayLabel = #1055#1088#1110#1079#1074#1080#1097#1077' '#1087#1088#1080' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1110
      FieldName = 'BIRTHSURNAME'
      Size = 1
    end
    object AnketTempQryBIRTHSURNAMELAT: TStringField
      DisplayLabel = #1055#1088#1110#1079#1074#1080#1097#1077' '#1087#1088#1080' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1110' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'BIRTHSURNAMELAT'
      Size = 1
    end
    object AnketTempQryHOMEPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085' '#1076#1086#1084#1072#1096#1085#1110#1081
      FieldName = 'HOMEPHONE'
      Size = 1
    end
    object AnketTempQryMOBILPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085' '#1084#1086#1073#1110#1083#1100#1085#1080#1081
      FieldName = 'MOBILPHONE'
      Size = 1
    end
    object AnketTempQryEMAIL: TStringField
      DisplayLabel = 'e-Mail'
      FieldName = 'EMAIL'
      Size = 1
    end
    object AnketTempQryPASSPORTNO: TStringField
      DisplayLabel = #1047#1072#1082#1086#1088#1076#1086#1085#1085#1080#1081' '#1087#1072#1089#1087#1086#1088#1090' '#1089#1077#1088#1110#1103' '#8470
      FieldName = 'PASSPORTNO'
      Size = 1
    end
    object AnketTempQryPASSPORTDATE: TStringField
      DisplayLabel = #1047#1072#1082#1086#1088#1076#1086#1085#1085#1080#1081' '#1087#1072#1089#1087#1086#1088#1090' '#1076#1110#1081#1089#1085#1080#1081' '#1079
      FieldName = 'PASSPORTDATE'
      Size = 1
    end
    object AnketTempQryPASSPORTEXPIRE: TStringField
      DisplayLabel = #1047#1072#1082#1086#1088#1076#1086#1085#1085#1080#1081' '#1087#1072#1089#1087#1086#1088#1090' '#1076#1110#1081#1089#1085#1080#1081' '#1076#1086
      FieldName = 'PASSPORTEXPIRE'
      Size = 1
    end
    object AnketTempQryFATHERTO: TSmallintField
      FieldName = 'FATHERTO'
    end
    object AnketTempQryFATHERBIRTHCOUNTRY: TStringField
      DisplayLabel = #1041#1072#1090#1100#1082#1086' '#1082#1088#1072#1111#1085#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'FATHERBIRTHCOUNTRY'
      Size = 1
    end
    object AnketTempQryMOTHERSECONDCYR: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1087#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'MOTHERSECONDCYR'
      Size = 1
    end
    object AnketTempQryMOTHERSECONDLAT: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1087#1088#1110#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'MOTHERSECONDLAT'
      Size = 1
    end
    object AnketTempQryMOTHERNATIONALITY: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1075#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
      FieldName = 'MOTHERNATIONALITY'
      Size = 1
    end
    object AnketTempQryMOTHERBIRTHDATE: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1076#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'MOTHERBIRTHDATE'
      Size = 1
    end
    object AnketTempQryMOTHERBIRTHCOUNTRY: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1082#1088#1072#1111#1085#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'MOTHERBIRTHCOUNTRY'
      Size = 1
    end
    object AnketTempQryMOTHERBIRTHLOCALITY: TStringField
      DisplayLabel = #1052#1072#1090#1080' '#1084#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'MOTHERBIRTHLOCALITY'
      Size = 1
    end
    object AnketTempQryMOTHERTO: TSmallintField
      FieldName = 'MOTHERTO'
    end
    object AnketTempQrySPOUSEWITH: TSmallintField
      FieldName = 'SPOUSEWITH'
    end
    object AnketTempQryCHILDOLDCYR: TStringField
      DisplayLabel = #1044#1110#1090#1080' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1080#1079#1074#1080#1097#1077
      FieldName = 'CHILDOLDCYR'
      Size = 1
    end
    object AnketTempQryCHILDOLDLAT: TStringField
      DisplayLabel = #1044#1110#1090#1080' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1080#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'CHILDOLDLAT'
      Size = 1
    end
    object AnketTempQryCHILDWITH: TSmallintField
      FieldName = 'CHILDWITH'
    end
    object AnketTempQryGUARDIANCYR: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1110#1084#8217#1103
      FieldName = 'GUARDIANCYR'
      Size = 1
    end
    object AnketTempQryGUARDIANLAT: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1110#1084#8217#1103' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'GUARDIANLAT'
      Size = 1
    end
    object AnketTempQryGUARDIANSECONDCYR: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1087#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'GUARDIANSECONDCYR'
      Size = 1
    end
    object AnketTempQryGUARDIANSECONDLAT: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1087#1088#1110#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'GUARDIANSECONDLAT'
      Size = 1
    end
    object AnketTempQryGUARDIANOLDCYR: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1080#1079#1074#1080#1097#1077
      FieldName = 'GUARDIANOLDCYR'
      Size = 1
    end
    object AnketTempQryGUARDIANOLDLAT: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1087#1086#1087#1077#1088#1077#1076#1085#1108' '#1087#1088#1080#1079#1074#1080#1097#1077' '#1083#1072#1090#1080#1085#1086#1102
      FieldName = 'GUARDIANOLDLAT'
      Size = 1
    end
    object AnketTempQryGUARDIANNATIONALITY: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1075#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
      FieldName = 'GUARDIANNATIONALITY'
      Size = 1
    end
    object AnketTempQryGUARDIANBIRTHDATE: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1076#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'GUARDIANBIRTHDATE'
      Size = 1
    end
    object AnketTempQryGUARDIANBIRTHCOUNTRY: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1082#1088#1072#1111#1085#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'GUARDIANBIRTHCOUNTRY'
      Size = 1
    end
    object AnketTempQryGUARDIANBIRTHLOCALITY: TStringField
      DisplayLabel = #1054#1087#1110#1082#1091#1085' '#1084#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      FieldName = 'GUARDIANBIRTHLOCALITY'
      Size = 1
    end
    object AnketTempQryGUARDIANTO: TSmallintField
      DisplayLabel = #1054#1087#1110#1082#1091#1085
      FieldName = 'GUARDIANTO'
    end
    object AnketTempQryEMPLEMAIL: TStringField
      DisplayLabel = 'e-Mail '#1088#1086#1073#1086#1090#1086#1076#1072#1074#1094#1103
      FieldName = 'EMPLEMAIL'
      Size = 1
    end
    object AnketTempQryGAINSUM: TStringField
      DisplayLabel = #1054#1089#1085#1086#1074#1085#1080#1081' '#1076#1086#1093#1110#1076
      FieldName = 'GAINSUM'
      Size = 1
    end
    object AnketTempQryPERSGARANTSURNAME: TStringField
      FieldName = 'PERSGARANTSURNAME'
      Size = 1
    end
    object AnketTempQryPERSGARANTNAME: TStringField
      FieldName = 'PERSGARANTNAME'
      Size = 1
    end
    object AnketTempQryPERSGARANTBIRTHDATE: TStringField
      FieldName = 'PERSGARANTBIRTHDATE'
      Size = 1
    end
    object AnketTempQryPERSGARANTNATIONALITY: TStringField
      FieldName = 'PERSGARANTNATIONALITY'
      Size = 1
    end
    object AnketTempQryPERSGARANTADDRESS: TStringField
      FieldName = 'PERSGARANTADDRESS'
      Size = 1
    end
    object AnketTempQryPERSGARANTPHONE: TStringField
      FieldName = 'PERSGARANTPHONE'
      Size = 1
    end
    object AnketTempQryPERSGARANTFAX: TStringField
      FieldName = 'PERSGARANTFAX'
      Size = 1
    end
    object AnketTempQryPERSGARANTEMAIL: TStringField
      FieldName = 'PERSGARANTEMAIL'
      Size = 1
    end
    object AnketTempQryBIOMETRICS: TStringField
      FieldName = 'BIOMETRICS'
      Size = 1
    end
    object AnketTempQryOLDVISALASTYEAR: TStringField
      FieldName = 'OLDVISALASTYEAR'
      Size = 1
    end
    object AnketTempQryOLDVISAFORYEARS: TSmallintField
      FieldName = 'OLDVISAFORYEARS'
    end
    object AnketTempQryOLDVISASHENGEN: TStringField
      FieldName = 'OLDVISASHENGEN'
      Size = 1
    end
    object AnketTempQryOLDVISAALLWORLD: TStringField
      FieldName = 'OLDVISAALLWORLD'
      Size = 1
    end
    object AnketTempQryOLDVISANO: TStringField
      FieldName = 'OLDVISANO'
      Size = 1
    end
    object AnketTempQryOLDVISAFROM: TStringField
      FieldName = 'OLDVISAFROM'
      Size = 1
    end
    object AnketTempQryOLDVISATILL: TStringField
      FieldName = 'OLDVISATILL'
      Size = 1
    end
    object AnketTempQryOLDVISATRAVELOBJECT: TStringField
      FieldName = 'OLDVISATRAVELOBJECT'
      Size = 1
    end
    object AnketTempQryOLDVISAENTRYCOUNT: TStringField
      FieldName = 'OLDVISAENTRYCOUNT'
      Size = 1
    end
    object AnketTempQryOLDVISAPERIOD: TStringField
      FieldName = 'OLDVISAPERIOD'
      Size = 1
    end
    object AnketTempQryOLDVISACOUNTRY: TStringField
      FieldName = 'OLDVISACOUNTRY'
      Size = 1
    end
    object AnketTempQryOLDVISAEMBASADDRESS: TStringField
      FieldName = 'OLDVISAEMBASADDRESS'
      Size = 1
    end
    object AnketTempQryOLDVISAEMBASDATE: TStringField
      FieldName = 'OLDVISAEMBASDATE'
      Size = 1
    end
    object AnketTempQryVISAENTRYCOUNT: TStringField
      FieldName = 'VISAENTRYCOUNT'
      Size = 1
    end
    object AnketTempQryVISAFROM: TStringField
      FieldName = 'VISAFROM'
      Size = 1
    end
    object AnketTempQryVISATILL: TStringField
      FieldName = 'VISATILL'
      Size = 1
    end
    object AnketTempQryVISAHASMONEYCAST: TStringField
      FieldName = 'VISAHASMONEYCAST'
      Size = 1
    end
    object AnketTempQryVISAHASMONEYSPONSOR: TStringField
      FieldName = 'VISAHASMONEYSPONSOR'
      Size = 1
    end
    object AnketTempQryENDVISAFROM: TStringField
      FieldName = 'ENDVISAFROM'
      Size = 1
    end
    object AnketTempQryENDVISATILL: TStringField
      FieldName = 'ENDVISATILL'
      Size = 1
    end
    object AnketTempQryPERMSTAYNO: TStringField
      FieldName = 'PERMSTAYNO'
      Size = 1
    end
    object AnketTempQryPERMSTAYISSUE: TStringField
      FieldName = 'PERMSTAYISSUE'
      Size = 1
    end
    object AnketTempQryPERMSTAYFROM: TStringField
      FieldName = 'PERMSTAYFROM'
      Size = 1
    end
    object AnketTempQryPERMSTAYTILL: TStringField
      FieldName = 'PERMSTAYTILL'
      Size = 1
    end
    object AnketTempQryHOTELTONAME: TStringField
      FieldName = 'HOTELTONAME'
      Size = 1
    end
    object AnketTempQryADDRTOFAX: TStringField
      FieldName = 'ADDRTOFAX'
      Size = 1
    end
    object AnketTempQryADDRTOEMAIL: TStringField
      FieldName = 'ADDRTOEMAIL'
      Size = 1
    end
    object AnketTempQryGARANTFAX: TStringField
      FieldName = 'GARANTFAX'
      Size = 1
    end
    object AnketTempQryGARANTEMAIL: TStringField
      FieldName = 'GARANTEMAIL'
      Size = 1
    end
    object AnketTempQryPERSCONTNAME: TStringField
      FieldName = 'PERSCONTNAME'
      Size = 1
    end
    object AnketTempQryPERSCONTADDRESS: TStringField
      FieldName = 'PERSCONTADDRESS'
      Size = 1
    end
    object AnketTempQryPERSCONTPHONE: TStringField
      FieldName = 'PERSCONTPHONE'
      Size = 1
    end
    object AnketTempQryPERSCONTFAX: TStringField
      FieldName = 'PERSCONTFAX'
      Size = 1
    end
    object AnketTempQryPERSCONTEMAIL: TStringField
      FieldName = 'PERSCONTEMAIL'
      Size = 1
    end
    object AnketTempQryDELIVERYPALCE: TStringField
      FieldName = 'DELIVERYPALCE'
      Size = 1
    end
    object AnketTempQryDELIVERYDATE: TStringField
      FieldName = 'DELIVERYDATE'
      Size = 1
    end
    object AnketTempQryGROUPBY: TStringField
      FieldName = 'GROUPBY'
      Size = 1
    end
    object AnketTempQryPASSINSIDEWITH: TSmallintField
      FieldName = 'PASSINSIDEWITH'
    end
    object AnketTempQryOCCUPTRANSSTATELANG: TStringField
      FieldName = 'OCCUPTRANSSTATELANG'
      Size = 1
    end
    object AnketTempQryOCCUPTRANSENGLLANG: TStringField
      FieldName = 'OCCUPTRANSENGLLANG'
      Size = 1
    end
    object AnketTempQryADDITPHONE: TStringField
      FieldName = 'ADDITPHONE'
      Size = 1
    end
    object AnketTempQryBANKSUM: TStringField
      FieldName = 'BANKSUM'
      Size = 1
    end
  end
  object BrDrvMapSrc: TDataSource
    DataSet = BrDrvMapQry
    Left = 243
    Top = 205
  end
  object BrDrvMapQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = BrDriveSrc
    Parameters = <
      item
        Name = 'DRIVEID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM DRVMAPS where DRIVEID=:DRIVEID')
    Left = 243
    Top = 159
    object BrDrvMapQryDRIVEID: TIntegerField
      FieldName = 'DRIVEID'
    end
    object BrDrvMapQryPLACEMAPID: TIntegerField
      FieldName = 'PLACEMAPID'
      Required = True
    end
    object BrDrvMapQryFLOORNO: TSmallintField
      FieldName = 'FLOORNO'
    end
    object BrDrvMapQryFLOORNAME: TStringField
      FieldName = 'FLOORNAME'
      Size = 10
    end
    object BrDrvMapQryPLACECOUNT: TSmallintField
      FieldName = 'PLACECOUNT'
    end
    object BrDrvMapQryNUMBERORDER: TSmallintField
      FieldName = 'NUMBERORDER'
    end
    object BrDrvMapQryNUMBERCHARSET: TSmallintField
      FieldName = 'NUMBERCHARSET'
    end
    object BrDrvMapQryMAP: TMemoField
      FieldName = 'MAP'
      BlobType = ftMemo
    end
    object BrDrvMapQryNUMBERDIRECTION: TIntegerField
      FieldName = 'NUMBERDIRECTION'
    end
    object BrDrvMapQryGORIZONTDIRECTION: TIntegerField
      FieldName = 'GORIZONTDIRECTION'
    end
    object BrDrvMapQryVERTICALDIRECTION: TIntegerField
      FieldName = 'VERTICALDIRECTION'
    end
  end
  object HotelCopyProc: TADOStoredProc
    Connection = DMServDic.ADOConnection
    ProcedureName = 'HOTEL_COPY_PROC'
    Parameters = <
      item
        Name = 'FROMID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'CNTRYID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'CITYID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'UNIQUENAME'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ADDMANID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'HOTELID'
        DataType = ftInteger
        Direction = pdOutput
        Value = Null
      end>
    Left = 383
    Top = 13
  end
  object CompanyQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    AfterOpen = CompanyQryAfterOpen
    OnNewRecord = CompanyQryNewRecord
    Parameters = <
      item
        Name = 'COMPANYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select   COMPANIES.* from SEL_COMPANIES_PROC_NEW(0,:COMPANYID) C' +
        'OMPANIES ')
    Left = 464
    Top = 158
    object CompanyQryCOMPANYNAME: TStringField
      FieldName = 'COMPANYNAME'
      Size = 255
    end
    object CompanyQryMANAGER: TStringField
      FieldName = 'MANAGER'
      Size = 35
    end
    object CompanyQryTAXNAME: TStringField
      FieldName = 'TAXNAME'
      Size = 100
    end
    object CompanyQryORGFORMNAME: TStringField
      FieldName = 'ORGFORMNAME'
      Size = 75
    end
    object CompanyQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 25
    end
    object CompanyQryTRADENAME: TStringField
      FieldName = 'TRADENAME'
      Size = 150
    end
    object CompanyQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object CompanyQryNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object CompanyQryISENTERPR: TStringField
      FieldName = 'ISENTERPR'
      Size = 1
    end
    object CompanyQryISPRIVATE: TStringField
      FieldName = 'ISPRIVATE'
      Size = 1
    end
    object CompanyQryISVENDOR: TStringField
      FieldName = 'ISVENDOR'
      Size = 1
    end
    object CompanyQryISCLIENT: TStringField
      FieldName = 'ISCLIENT'
      Size = 1
    end
    object CompanyQryISAGENT: TStringField
      FieldName = 'ISAGENT'
      Size = 1
    end
    object CompanyQryISHOTEL: TStringField
      FieldName = 'ISHOTEL'
      Size = 1
    end
    object CompanyQryTAXPAYREGNO: TStringField
      FieldName = 'TAXPAYREGNO'
    end
    object CompanyQryTAXPAYCODE: TStringField
      FieldName = 'TAXPAYCODE'
      Size = 12
    end
    object CompanyQryIDENTCODE: TStringField
      FieldName = 'IDENTCODE'
      Size = 10
    end
    object CompanyQryCLASSCODE: TStringField
      FieldName = 'CLASSCODE'
      Size = 8
    end
    object CompanyQryFORWORK: TStringField
      FieldName = 'FORWORK'
      Size = 1
    end
    object CompanyQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object CompanyQryISBSMAN: TStringField
      FieldName = 'ISBSMAN'
      Size = 1
    end
    object CompanyQryCOMPKIND: TStringField
      FieldName = 'COMPKIND'
      Size = 40
    end
    object CompanyQryVCARDNO: TIntegerField
      FieldName = 'VCARDNO'
    end
    object CompanyQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
    object CompanyQryFULLNAME: TMemoField
      FieldName = 'FULLNAME'
      BlobType = ftMemo
    end
    object CompanyQryTAXPAYSTATEID: TIntegerField
      FieldName = 'TAXPAYSTATEID'
    end
    object CompanyQryDATEOBDZVIN: TDateTimeField
      FieldName = 'DATEOBDZVIN'
    end
    object CompanyQryMANOBDZVIN: TIntegerField
      FieldName = 'MANOBDZVIN'
    end
    object CompanyQryORGFORMID: TIntegerField
      FieldName = 'ORGFORMID'
    end
    object CompanyQryTAXPAY: TStringField
      FieldName = 'TAXPAY'
      Size = 1
    end
    object CompanyQryTAXPAYREGDATE: TDateTimeField
      FieldName = 'TAXPAYREGDATE'
    end
    object CompanyQryLICENSEDATE: TDateTimeField
      FieldName = 'LICENSEDATE'
    end
    object CompanyQryWARRANTYSUM: TFloatField
      FieldName = 'WARRANTYSUM'
    end
    object CompanyQryWARRANTYVAL: TIntegerField
      FieldName = 'WARRANTYVAL'
    end
    object CompanyQryWARRANTYTERM: TDateTimeField
      FieldName = 'WARRANTYTERM'
    end
    object CompanyQryLICENSETERMIN: TStringField
      FieldName = 'LICENSETERMIN'
      Size = 1
    end
    object CompanyQryLICENSENO: TStringField
      FieldName = 'LICENSENO'
      Size = 8
    end
    object CompanyQryOBDZVIN: TSmallintField
      FieldName = 'OBDZVIN'
    end
    object CompanyQryOBDZVINAGREEDATE: TDateTimeField
      FieldName = 'OBDZVINAGREEDATE'
    end
    object CompanyQryACTIONID: TIntegerField
      FieldName = 'ACTIONID'
    end
    object CompanyQryGOVREESTRTYPEID: TIntegerField
      FieldName = 'GOVREESTRTYPEID'
    end
    object CompanyQryGOVREESTRDATE: TDateTimeField
      FieldName = 'GOVREESTRDATE'
    end
    object CompanyQrySINGLETAXTYPEID: TIntegerField
      FieldName = 'SINGLETAXTYPEID'
    end
    object CompanyQryTAXPAYTYPEID: TIntegerField
      FieldName = 'TAXPAYTYPEID'
    end
    object CompanyQryAREAGENTCONTRACT: TStringField
      FieldName = 'AREAGENTCONTRACT'
      Size = 1
    end
    object CompanyQrySIGNDATE: TDateTimeField
      FieldName = 'SIGNDATE'
    end
    object CompanyQryTILLDATE: TDateTimeField
      FieldName = 'TILLDATE'
    end
    object CompanyQryDOCTODATE: TDateTimeField
      FieldName = 'DOCTODATE'
    end
    object CompanyQryISRCVORIG: TStringField
      FieldName = 'ISRCVORIG'
      Size = 1
    end
    object CompanyQryISSEND: TStringField
      FieldName = 'ISSEND'
      Size = 1
    end
    object CompanyQryISRCVCOPY: TStringField
      FieldName = 'ISRCVCOPY'
      Size = 1
    end
    object CompanyQryISSENDORIG: TStringField
      FieldName = 'ISSENDORIG'
      Size = 1
    end
    object CompanyQryISPRINTED: TStringField
      FieldName = 'ISPRINTED'
      Size = 1
    end
    object CompanyQryISSIGN: TStringField
      FieldName = 'ISSIGN'
      Size = 1
    end
    object CompanyQryOURPERSONID: TIntegerField
      FieldName = 'OURPERSONID'
    end
    object CompanyQryITSPERSONID: TIntegerField
      FieldName = 'ITSPERSONID'
    end
    object CompanyQryNUMCONTRACT: TStringField
      FieldName = 'NUMCONTRACT'
      Size = 15
    end
    object CompanyQryFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 100
    end
    object CompanyQryCOMPCONTRACTID: TIntegerField
      FieldName = 'COMPCONTRACTID'
    end
    object CompanyQrySORTBYCONTRACT: TIntegerField
      FieldName = 'SORTBYCONTRACT'
    end
    object CompanyQryAREAGCNTRWITHOUTTDATE: TStringField
      FieldName = 'AREAGCNTRWITHOUTTDATE'
      Size = 1
    end
    object CompanyQryFIXDEFECTTODATE: TDateTimeField
      FieldName = 'FIXDEFECTTODATE'
    end
    object CompanyQryEXPTOURCOMPNOTE: TMemoField
      FieldName = 'EXPTOURCOMPNOTE'
      BlobType = ftMemo
    end
    object CompanyQryISEXTEND: TStringField
      FieldName = 'ISEXTEND'
      Size = 1
    end
    object CompanyQryALLDATAFILL: TStringField
      FieldName = 'ALLDATAFILL'
      Size = 1
    end
    object CompanyQrySTANDOC: TIntegerField
      FieldName = 'STANDOC'
    end
    object CompanyQryWORKMANID: TIntegerField
      FieldName = 'WORKMANID'
    end
    object CompanyQryPERSCOUNT: TIntegerField
      FieldName = 'PERSCOUNT'
    end
    object CompanyQryORDERCOUNT: TIntegerField
      FieldName = 'ORDERCOUNT'
    end
    object CompanyQryLASTDATECRORDER: TDateTimeField
      FieldName = 'LASTDATECRORDER'
    end
    object CompanyQryISTOUROPER: TStringField
      FieldName = 'ISTOUROPER'
      Size = 1
    end
    object CompanyQryASAUPAIR: TStringField
      FieldName = 'ASAUPAIR'
      Size = 1
    end
    object CompanyQryCONTRACTCOMPNOTE: TMemoField
      FieldName = 'CONTRACTCOMPNOTE'
      BlobType = ftMemo
    end
    object CompanyQryNOTEADDMANID: TIntegerField
      FieldName = 'NOTEADDMANID'
    end
    object CompanyQryCNTREDITMANID: TIntegerField
      FieldName = 'CNTREDITMANID'
    end
    object CompanyQryHEADOFFICEID: TIntegerField
      FieldName = 'HEADOFFICEID'
    end
    object CompanyQryHEADOFFICENAME: TStringField
      FieldName = 'HEADOFFICENAME'
      Size = 100
    end
    object CompanyQryISFILIYA: TStringField
      FieldName = 'ISFILIYA'
      Size = 1
    end
    object CompanyQryISHEADOFFICE: TStringField
      FieldName = 'ISHEADOFFICE'
      Size = 1
    end
    object CompanyQryTRADENAMEID: TIntegerField
      FieldName = 'TRADENAMEID'
    end
    object CompanyQryNOTWORK: TStringField
      FieldName = 'NOTWORK'
      Size = 1
    end
    object CompanyQryAGENCYLOGO: TStringField
      FieldName = 'AGENCYLOGO'
      Size = 30
    end
    object CompanyQryPEYMTOAGENCY: TStringField
      FieldName = 'PEYMTOAGENCY'
      Size = 1
    end
    object CompanyQryPERMREREESTR: TStringField
      FieldName = 'PERMREREESTR'
      Size = 1
    end
    object CompanyQryREREESTR: TStringField
      FieldName = 'REREESTR'
      Size = 1
    end
    object CompanyQrySINGLETAXDATE: TDateTimeField
      FieldName = 'SINGLETAXDATE'
    end
    object CompanyQryCOMPIDFORCNTRCT: TIntegerField
      FieldName = 'COMPIDFORCNTRCT'
    end
    object CompanyQryCONTRACTPROMPT: TMemoField
      FieldName = 'CONTRACTPROMPT'
      BlobType = ftMemo
    end
    object CompanyQryLOGDATETIME: TDateTimeField
      FieldName = 'LOGDATETIME'
    end
    object CompanyQryEXPNOTEMANAGER: TStringField
      FieldName = 'EXPNOTEMANAGER'
      Size = 35
    end
    object CompanyQryCOMPNOTEID: TIntegerField
      FieldName = 'COMPNOTEID'
    end
    object CompanyQryCONTRACTLOGID: TIntegerField
      FieldName = 'CONTRACTLOGID'
    end
    object CompanyQryORGFORMINNAME: TStringField
      FieldName = 'ORGFORMINNAME'
      Size = 1
    end
    object CompanyQryADDDATE: TDateTimeField
      FieldName = 'ADDDATE'
    end
    object CompanyQryASRESIDENT: TStringField
      FieldName = 'ASRESIDENT'
      Size = 1
    end
    object CompanyQryCOMMONNOTE: TBlobField
      FieldName = 'COMMONNOTE'
    end
    object CompanyQryCOMMONNOTEADDDATE: TDateTimeField
      FieldName = 'COMMONNOTEADDDATE'
    end
    object CompanyQryCOMMONNOTEMANID: TIntegerField
      FieldName = 'COMMONNOTEMANID'
    end
    object CompanyQryRCVORIGDATE: TDateTimeField
      FieldName = 'RCVORIGDATE'
    end
    object CompanyQryCOMPANYTRADENAME: TStringField
      FieldName = 'COMPANYTRADENAME'
      Size = 250
    end
    object CompanyQryNOTWORKDATE: TDateTimeField
      FieldName = 'NOTWORKDATE'
    end
    object CompanyQryNOTWORKMANID: TIntegerField
      FieldName = 'NOTWORKMANID'
    end
    object CompanyQryARENEWCONTRACT: TStringField
      FieldName = 'ARENEWCONTRACT'
      Size = 1
    end
    object CompanyQryAREWEB: TStringField
      FieldName = 'AREWEB'
      Size = 1
    end
    object CompanyQryASNETAGENT: TIntegerField
      FieldName = 'ASNETAGENT'
    end
    object CompanyQryASTOURS: TIntegerField
      FieldName = 'ASTOURS'
    end
    object CompanyQryCalcTaxPayStateId: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CalcTaxPayStateId'
      Calculated = True
    end
    object CompanyQryCalcDateContract: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcDateContract'
      Size = 100
      Calculated = True
    end
    object CompanyQryISBUDGET: TIntegerField
      FieldName = 'ISBUDGET'
    end
    object CompanyQryISOTHER: TIntegerField
      FieldName = 'ISOTHER'
    end
  end
  object CompanySrc: TDataSource
    DataSet = CompanyQry
    Left = 464
    Top = 207
  end
  object InterestQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select I.InterestId, I.Name, I.Stars,'
      
        '  Ci.Name as City,  ( Select NAME FROM COUNTRIES_LNG where ID_CO' +
        'UNTRIES = CO.countryid and ID_LNG = 350 ) COUNTRY_ENG,'
      '  K.name InterestKind, T.NAME InterestType,'
      
        '  I.CountryId, I.ID_CITY_ADM_UNIT, I.EnterpriseId, I.ShowWeb, I.' +
        'Comments'
      'from Interests I'
      '  left join Countries Co on Co.CountryId = I.CountryId'
      '  left join CITY_ADM_UNIT Ci on Ci.Id = I.ID_CITY_ADM_UNIT'
      '  left join INTERESTKIND K on K.id = I.InterestKind'
      '  left join INTERESTTYPE T on T.Id = I.InterestType'
      'order by I.Name, I.Stars desc, I.InterestId')
    Left = 239
    Top = 63
    object InterestQryINTERESTID: TIntegerField
      FieldName = 'INTERESTID'
    end
    object InterestQryNAME: TStringField
      DisplayLabel = #1054#1073#39#1108#1082#1090
      FieldName = 'NAME'
      Size = 60
    end
    object InterestQrySTARS: TStringField
      DisplayLabel = '*'
      FieldName = 'STARS'
      Size = 6
    end
    object InterestQryCITY: TStringField
      DisplayLabel = #1052#1110#1089#1090#1086', '#1082#1091#1088#1086#1088#1090
      FieldName = 'CITY'
      Size = 25
    end
    object InterestQryCOUNTRY_ENG: TStringField
      FieldName = 'COUNTRY_ENG'
      Size = 41
    end
    object InterestQryINTERESTKIND: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      FieldName = 'INTERESTKIND'
      Size = 40
    end
    object InterestQryINTERESTTYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1086#1073#39#1108#1082#1090#1091
      FieldName = 'INTERESTTYPE'
      Size = 40
    end
    object InterestQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object InterestQryENTERPRISEID: TIntegerField
      FieldName = 'ENTERPRISEID'
    end
    object InterestQrySHOWWEB: TStringField
      DisplayLabel = 'Web'
      FieldName = 'SHOWWEB'
      Size = 1
    end
    object InterestQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object InterestQryID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
  end
  object IntrstImgQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnCalcFields = IntrstImgQryCalcFields
    OnNewRecord = IntrstImgQryNewRecord
    DataSource = InterestSrc
    Parameters = <
      item
        Name = 'INTERESTID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from IntrstImages'
      'where InterestId = :InterestId'
      'order by ImgKind, OrderNo')
    Left = 303
    Top = 61
    object IntrstImgQryINTERESTID: TIntegerField
      FieldName = 'INTERESTID'
      Origin = 'DICT.INTRSTIMAGES.INTERESTID'
    end
    object IntrstImgQryINTERESTIMAGEID: TIntegerField
      FieldName = 'INTERESTIMAGEID'
      Origin = 'DICT.INTRSTIMAGES.INTERESTIMAGEID'
    end
    object IntrstImgQryFILENAME: TStringField
      DisplayLabel = #1060#1072#1081#1083' '#1084#1072#1083#1102#1085#1082#1091
      FieldName = 'FILENAME'
      Origin = 'DICT.INTRSTIMAGES.FILENAME'
      Size = 128
    end
    object IntrstImgQryORDERNO: TIntegerField
      FieldName = 'ORDERNO'
      Origin = 'DICT.INTRSTIMAGES.ORDERNO'
    end
    object IntrstImgQryDESCRIPT: TMemoField
      FieldName = 'DESCRIPT'
      Origin = 'DICT.INTRSTIMAGES.DESCRIPT'
      BlobType = ftMemo
    end
    object IntrstImgQryIMGKIND: TSmallintField
      FieldName = 'IMGKIND'
      Origin = 'DICT.INTRSTIMAGES.IMGKIND'
    end
    object IntrstImgQrySHOWLOC: TStringField
      FieldName = 'SHOWLOC'
      Origin = 'DICT.INTRSTIMAGES.SHOWLOC'
      Size = 1
    end
    object IntrstImgQrySHOWWEB: TStringField
      DisplayLabel = 'Web'
      FieldName = 'SHOWWEB'
      Origin = 'DICT.INTRSTIMAGES.SHOWWEB'
      Size = 1
    end
    object IntrstImgQryCalcFileName: TStringField
      DisplayLabel = #1060#1086#1090#1086' '#1095#1080' '#1084#1072#1083#1102#1085#1086#1082
      FieldKind = fkCalculated
      FieldName = 'CalcFileName'
      Size = 50
      Calculated = True
    end
  end
  object IntrstImgSrc: TDataSource
    DataSet = IntrstImgQry
    Left = 306
    Top = 109
  end
  object InterestSrc: TDataSource
    DataSet = InterestQry
    Left = 242
    Top = 109
  end
  object IntrstVendorSrc: TDataSource
    DataSet = IntrstVendorQry
    Left = 384
    Top = 109
  end
  object IntrstVendorQry: TADOQuery
    Connection = DMServDic.ADOConnection
    DataSource = InterestSrc
    Parameters = <
      item
        Name = 'INTERESTID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select V.InterestId, V.InterestVendorId, C.CompanyId, C.Name'
      'from IntrstVendors V, Companies C'
      'where V.InterestId = :InterestId and V.VendorId = C.CompanyId'
      'order by C.Name')
    Left = 384
    Top = 63
    object IntrstVendorQryINTERESTID: TIntegerField
      FieldName = 'INTERESTID'
    end
    object IntrstVendorQryINTERESTVENDORID: TIntegerField
      FieldName = 'INTERESTVENDORID'
    end
    object IntrstVendorQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object IntrstVendorQryNAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1080
      FieldName = 'NAME'
      Size = 60
    end
  end
  object DrvImgSrc: TDataSource
    DataSet = DrvImgQry
    Left = 307
    Top = 205
  end
  object DrvImgQry: TADOQuery
    Connection = DMServDic.ADOConnection
    OnCalcFields = DrvImgQryCalcFields
    OnNewRecord = DrvImgQryNewRecord
    DataSource = BrDriveSrc
    Parameters = <
      item
        Name = 'DRIVEID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from DrvImages'
      'where DriveId = :DriveId'
      'order by ImgKind, OrderNo')
    Left = 307
    Top = 160
    object DrvImgQryDRIVEIMAGEID: TIntegerField
      FieldName = 'DRIVEIMAGEID'
      Origin = 'DICT.DRVIMAGES.DRIVEIMAGEID'
    end
    object DrvImgQryDRIVEID: TIntegerField
      FieldName = 'DRIVEID'
      Origin = 'DICT.DRVIMAGES.DRIVEID'
    end
    object DrvImgQryFILENAME: TStringField
      FieldName = 'FILENAME'
      Origin = 'DICT.DRVIMAGES.FILENAME'
      Size = 128
    end
    object DrvImgQryORDERNO: TIntegerField
      FieldName = 'ORDERNO'
      Origin = 'DICT.DRVIMAGES.ORDERNO'
    end
    object DrvImgQryDESCRIPT: TMemoField
      FieldName = 'DESCRIPT'
      Origin = 'DICT.DRVIMAGES.DESCRIPT'
      BlobType = ftMemo
      Size = 1
    end
    object DrvImgQryIMGKIND: TSmallintField
      FieldName = 'IMGKIND'
      Origin = 'DICT.DRVIMAGES.IMGKIND'
    end
    object DrvImgQrySHOWLOC: TStringField
      FieldName = 'SHOWLOC'
      Origin = 'DICT.DRVIMAGES.SHOWLOC'
      Size = 1
    end
    object DrvImgQrySHOWWEB: TStringField
      FieldName = 'SHOWWEB'
      Origin = 'DICT.DRVIMAGES.SHOWWEB'
      Size = 1
    end
    object DrvImgQryCalcFileName: TStringField
      DisplayLabel = #1060#1086#1090#1086' '#1095#1080' '#1084#1072#1083#1102#1085#1086#1082
      FieldKind = fkCalculated
      FieldName = 'CalcFileName'
      Size = 50
      Calculated = True
    end
  end
  object DrvVendorSrc: TDataSource
    DataSet = DrvVendorQry
    Left = 385
    Top = 205
  end
  object DrvVendorQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = BrDriveSrc
    Parameters = <
      item
        Name = 'DriveId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ' select V.DriveId, V.DriveVendorId, C.CompanyId, C.Name,'
      
        ' ( select FIRST 1 AVALUE from GET_COMPANY_PARAM (C.CompanyId,'#39'IS' +
        'PRIVATE'#39') ) ISPRIVATE,'
      ' C.ISVENDOR, C.ISENTERPR, V.vendorid,'
      ''
      ' case'
      '     when C.isfiliya = '#39'T'#39' then C.headofficeid'
      '     else C.companyid'
      '  end CompIdForCntrct,'
      ' case'
      
        '    when ( ( (C.ORGFORMID is not Null) or (C.IsFiliya = '#39'T'#39') or ' +
        '(C.OrgFormInName = '#39'T'#39') )'
      '    and ( C.ISENTERPR is not null or C.ACTIONID Is not Null )'
      
        '    and ( C.GOVREESTRTYPEID is not Null and C.IDENTCODE Is not N' +
        'ull )'
      
        '    and ( C.GOVREESTRDATE is not Null and C.TAXPAYSTATEID Is not' +
        ' Null ) ) then 1'
      '  else 0'
      ' end AllDataFill,'
      
        ' C.ACTIONID,  C.GOVREESTRTYPEID,  C.IDENTCODE, C.GOVREESTRDATE,C' +
        '.ASRESIDENT'
      ''
      'from DrvVendors V'
      'left join Companies C on V.vendorid = C.companyid  '
      'where V.DriveId = :DriveId and V.VendorId = C.CompanyId')
    Left = 385
    Top = 157
    object DrvVendorQryDRIVEID: TIntegerField
      FieldName = 'DRIVEID'
    end
    object DrvVendorQryDRIVEVENDORID: TIntegerField
      FieldName = 'DRIVEVENDORID'
    end
    object DrvVendorQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object DrvVendorQryNAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1080
      FieldName = 'NAME'
      Size = 60
    end
    object DrvVendorQryCOMPIDFORCNTRCT: TIntegerField
      FieldName = 'COMPIDFORCNTRCT'
    end
    object DrvVendorQryISPRIVATE: TIntegerField
      FieldName = 'ISPRIVATE'
    end
    object DrvVendorQryALLDATAFILL: TIntegerField
      FieldName = 'ALLDATAFILL'
    end
    object DrvVendorQryISVENDOR: TStringField
      FieldName = 'ISVENDOR'
      Size = 1
    end
    object DrvVendorQryISENTERPR: TStringField
      FieldName = 'ISENTERPR'
      Size = 1
    end
    object DrvVendorQryACTIONID: TIntegerField
      FieldName = 'ACTIONID'
    end
    object DrvVendorQryGOVREESTRTYPEID: TIntegerField
      FieldName = 'GOVREESTRTYPEID'
    end
    object DrvVendorQryIDENTCODE: TStringField
      FieldName = 'IDENTCODE'
      Size = 10
    end
    object DrvVendorQryGOVREESTRDATE: TDateTimeField
      FieldName = 'GOVREESTRDATE'
    end
    object DrvVendorQryASRESIDENT: TStringField
      FieldName = 'ASRESIDENT'
      Size = 1
    end
    object DrvVendorQryVENDORID: TIntegerField
      FieldName = 'VENDORID'
    end
  end
  object AllDocQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = DMServDic.BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select Distinct(D.TypeDocId), V.DocId, N.NAME ViewName,'
      '  V.TypeId, L.ItemName TypeName'
      'from VisaDocuments_New D'
      '    left join VisaTypeDocs V on D.TypeDocId = V.VisaTypeDocId'
      '    left join NameLists L on L.NameId = V.TypeId'
      '    left join VISADOC N on N.id = V.DocId'
      'where D.CountryId = :CountryId')
    Left = 136
    Top = 15
    object AllDocQryTYPEDOCID: TIntegerField
      FieldName = 'TYPEDOCID'
    end
    object AllDocQryDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object AllDocQryVIEWNAME: TStringField
      FieldName = 'VIEWNAME'
      Size = 350
    end
    object AllDocQryTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object AllDocQryTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 75
    end
  end
  object VisaDocAddProc: TADOStoredProc
    Connection = DMServDic.ADOConnection
    ProcedureName = 'VISADOCUMENT_ADD_PROC'
    Parameters = <
      item
        Name = 'COUNTRYID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'DOCID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'OBLIGATORY'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'NEEDCOUNT'
        DataType = ftSmallint
        Value = Null
      end
      item
        Name = 'AGERESTRICTION'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'EXPIREMONTHS'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'ISSUEDMONTHS'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'COMMENTS'
        DataType = ftBlob
        Size = -1
        Value = Null
      end>
    Left = 239
    Top = 15
  end
  object VisaDocDelProc: TADOStoredProc
    Connection = DMServDic.ADOConnection
    ProcedureName = 'VISADOCUMENT_DEL_PROC'
    Parameters = <
      item
        Name = 'VISADOCUMENTID'
        DataType = ftInteger
        Value = Null
      end>
    Left = 303
    Top = 15
  end
  object VISADOCUMENTS_NEWQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM VISADOCUMENTS_NEW')
    Left = 135
    Top = 111
    object VISADOCUMENTS_NEWQryVISADOCUMENTID: TIntegerField
      FieldName = 'VISADOCUMENTID'
      Required = True
    end
    object VISADOCUMENTS_NEWQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object VISADOCUMENTS_NEWQryEMBASSYID: TIntegerField
      FieldName = 'EMBASSYID'
    end
    object VISADOCUMENTS_NEWQryDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object VISADOCUMENTS_NEWQryNEEDCOUNT: TIntegerField
      FieldName = 'NEEDCOUNT'
    end
    object VISADOCUMENTS_NEWQryAGERESTRICTION: TIntegerField
      FieldName = 'AGERESTRICTION'
    end
    object VISADOCUMENTS_NEWQryEXPIREMONTHS: TIntegerField
      FieldName = 'EXPIREMONTHS'
    end
    object VISADOCUMENTS_NEWQryISSUEDMONTHS: TIntegerField
      FieldName = 'ISSUEDMONTHS'
    end
    object VISADOCUMENTS_NEWQrySUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object VISADOCUMENTS_NEWQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object ItsDocumVisaListQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnCalcFields = ItsDocumVisaListQryCalcFields
    Parameters = <
      item
        Name = 'COUNTRYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'COMPANYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ' select D.VisaDocumentId, V.DocId, N.Name,'
      '  D.NeedCount, D.AgeRestriction,'
      '  D.ExpireMonths, D.IssuedMonths, D.Comments, D.Summa,'
      '  V.TypeId, L.ItemName TypeName, D.Period, D.IsUse, N.shortname,'
      '  D.ExpirePeriod, D.IssuesPeriod, D.TypeVal, D.TypeDocId,'
      '  D.MarriedState, P.NAME Posada, D.ForInd, D.ForAddManual,'
      
        '  D.Funding, D.Posada PosadaId, D.Returned, D.Transmit, D.Fundin' +
        'gCount,'
      '  D.VisaDocGroupId, G.GroupName, '
      '  D.BeginDoc, D.DocForLastCount, D.DocForLastPeriod,'
      
        '  N.onetypedoc,  D.EmbassyId, sG.name SUBGROUPNAME, sG.id SubGro' +
        'upId,'
      
        '  DL.Link, D.Comments, D.CountryId, D.BeforeFiling, BeforeFiling' +
        'Period, BankWithOutSum,'
      '  D.SameTypeDocId, D.SetOfDocument, FilingAtWork, ForOwnerVisa'
      'from VisaDocuments_New D'
      '    left join VisaTypeDocs V on D.TypeDocId = V.VisaTypeDocId'
      
        '    left join VisaDocLinks DL on DL.DocId = V.DocId and DL.TypeI' +
        'd = V.TypeId'
      '    left join NameLists L on L.NameId = V.TypeId'
      '    left join POSADA P on P.ID = D.Posada'
      
        '    left join VisaDocGroups_View G on G.VisaDocGroupId = D.VisaD' +
        'ocGroupId'
      '    left join VISASUBGROUPDOC sG on sG.id = D.SubGroupId,'
      '    VISADOC N'
      
        'where D.CountryId = :CountryId and N.id = V.DocId and D.EmbassyI' +
        'd = :COMPANYID')
    Left = 955
    Top = 104
    object ItsDocumVisaListQryDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object ItsDocumVisaListQryVISADOCUMENTID: TIntegerField
      FieldName = 'VISADOCUMENTID'
    end
    object ItsDocumVisaListQryVIEWNAME: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'NAME'
      Size = 75
    end
    object ItsDocumVisaListQryNEEDCOUNT: TIntegerField
      DisplayLabel = #1050#1110#1083#1100#1082'.'
      FieldName = 'NEEDCOUNT'
      DisplayFormat = '##'
    end
    object ItsDocumVisaListQryAGERESTRICTION: TIntegerField
      DisplayLabel = #1055#1086' '#1074#1110#1082#1091
      FieldName = 'AGERESTRICTION'
    end
    object ItsDocumVisaListQryEXPIREMONTHS: TIntegerField
      DisplayLabel = #1058#1077#1088#1084#1110#1085
      FieldName = 'EXPIREMONTHS'
    end
    object ItsDocumVisaListQryISSUEDMONTHS: TIntegerField
      DisplayLabel = #1044#1072#1074#1085#1110#1089#1090#1100
      FieldName = 'ISSUEDMONTHS'
    end
    object ItsDocumVisaListQryCalcAgeRestr: TStringField
      DisplayLabel = #1055#1086' '#1074#1110#1082#1091
      FieldKind = fkCalculated
      FieldName = 'CalcAgeRestr'
      Size = 15
      Calculated = True
    end
    object ItsDocumVisaListQrySUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object ItsDocumVisaListQryTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object ItsDocumVisaListQryTYPENAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1076#1086#1082#1091#1084'.'
      FieldName = 'TYPENAME'
      Size = 75
    end
    object ItsDocumVisaListQryPERIOD: TIntegerField
      FieldName = 'PERIOD'
    end
    object ItsDocumVisaListQryISUSE: TStringField
      FieldName = 'ISUSE'
      Size = 1
    end
    object ItsDocumVisaListQrySHORTNAME: TStringField
      DisplayLabel = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
      FieldName = 'SHORTNAME'
      Size = 10
    end
    object ItsDocumVisaListQryEXPIREPERIOD: TIntegerField
      FieldName = 'EXPIREPERIOD'
    end
    object ItsDocumVisaListQryISSUESPERIOD: TIntegerField
      FieldName = 'ISSUESPERIOD'
    end
    object ItsDocumVisaListQryTYPEVAL: TIntegerField
      FieldName = 'TYPEVAL'
    end
    object ItsDocumVisaListQryTYPEDOCID: TIntegerField
      FieldName = 'TYPEDOCID'
    end
    object ItsDocumVisaListQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object ItsDocumVisaListQryFUNDINGCOUNT: TSmallintField
      FieldName = 'FUNDINGCOUNT'
    end
    object ItsDocumVisaListQryMARRIEDSTATE: TIntegerField
      DisplayLabel = #1057#1110#1084#1077#1081#1085#1080#1081' '#1089#1090#1072#1085
      FieldName = 'MARRIEDSTATE'
    end
    object ItsDocumVisaListQryFORIND: TStringField
      DisplayLabel = #1030#1085#1076'.'
      FieldName = 'FORIND'
      Size = 1
    end
    object ItsDocumVisaListQryFORADDMANUAL: TStringField
      DisplayLabel = #1042#1088#1091#1095#1085#1091
      FieldName = 'FORADDMANUAL'
      Size = 1
    end
    object ItsDocumVisaListQryPOSADA: TStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1072
      FieldName = 'POSADA'
      Size = 75
    end
    object ItsDocumVisaListQryCalcMarried: TStringField
      DisplayLabel = #1057#1110#1084#1077#1081#1085'. '#1089#1090#1072#1085
      FieldKind = fkCalculated
      FieldName = 'CalcMarried'
      Calculated = True
    end
    object ItsDocumVisaListQryFUNDING: TStringField
      FieldName = 'FUNDING'
      Size = 1
    end
    object ItsDocumVisaListQryPOSADAID: TIntegerField
      FieldName = 'POSADAID'
    end
    object ItsDocumVisaListQryRETURNED: TStringField
      DisplayLabel = #1055#1086#1074#1077#1088#1085#1077#1085#1085#1103' '#1090#1091#1088#1080#1089#1090#1091
      FieldName = 'RETURNED'
      Size = 1
    end
    object ItsDocumVisaListQryCalcExpireMonths: TStringField
      DisplayLabel = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
      FieldKind = fkCalculated
      FieldName = 'CalcExpireMonths'
      Calculated = True
    end
    object ItsDocumVisaListQryCalcIssuedMonths: TStringField
      DisplayLabel = #1044#1086' '#1074#1110#1079#1080
      FieldKind = fkCalculated
      FieldName = 'CalcIssuedMonths'
      Calculated = True
    end
    object ItsDocumVisaListQryCalcSum: TStringField
      DisplayLabel = #1057#1091#1084#1072
      FieldKind = fkCalculated
      FieldName = 'CalcSum'
      Size = 80
      Calculated = True
    end
    object ItsDocumVisaListQryTRANSMIT: TStringField
      DisplayLabel = #1053#1072#1096#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1080
      FieldName = 'TRANSMIT'
      Size = 1
    end
    object ItsDocumVisaListQryVisaDocGroupId: TIntegerField
      DisplayLabel = #1043#1088#1091#1087#1072
      FieldName = 'VisaDocGroupId'
    end
    object ItsDocumVisaListQryGROUPNAME: TStringField
      DisplayLabel = #1043#1088#1091#1087#1072
      FieldName = 'GROUPNAME'
      Size = 30
    end
    object ItsDocumVisaListQryBEGINDOC: TStringField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
      FieldName = 'BEGINDOC'
      Size = 1
    end
    object ItsDocumVisaListQryDOCFORLASTCOUNT: TIntegerField
      FieldName = 'DOCFORLASTCOUNT'
    end
    object ItsDocumVisaListQryDOCFORLASTPERIOD: TIntegerField
      FieldName = 'DOCFORLASTPERIOD'
    end
    object ItsDocumVisaListQryCalcDocForLast: TStringField
      DisplayLabel = #1058#1088#1080#1074#1072#1083#1110#1089#1090#1100
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CalcDocForLast'
      Calculated = True
    end
    object ItsDocumVisaListQryONETYPEDOC: TIntegerField
      FieldName = 'ONETYPEDOC'
    end
    object ItsDocumVisaListQryEMBASSYID: TIntegerField
      FieldName = 'EMBASSYID'
    end
    object ItsDocumVisaListQrySUBGROUPNAME: TStringField
      DisplayLabel = #1055#1110#1076#1075#1088#1091#1087#1072
      FieldName = 'SUBGROUPNAME'
      Size = 75
    end
    object ItsDocumVisaListQrySUBGROUPID: TIntegerField
      FieldName = 'SUBGROUPID'
    end
    object ItsDocumVisaListQryLINK: TStringField
      FieldName = 'LINK'
      Size = 255
    end
    object ItsDocumVisaListQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object ItsDocumVisaListQryBEFOREFILING: TIntegerField
      FieldName = 'BEFOREFILING'
    end
    object ItsDocumVisaListQryBEFOREFILINGPERIOD: TIntegerField
      FieldName = 'BEFOREFILINGPERIOD'
    end
    object ItsDocumVisaListQryCalcBeforeFiling: TStringField
      Alignment = taCenter
      DisplayLabel = #1044#1086' '#1087#1086#1076#1072#1095#1110
      FieldKind = fkCalculated
      FieldName = 'CalcBeforeFiling'
      Size = 50
      Calculated = True
    end
    object ItsDocumVisaListQryBANKWITHOUTSUM: TStringField
      FieldName = 'BANKWITHOUTSUM'
      Size = 1
    end
    object ItsDocumVisaListQrySAMETYPEDOCID: TIntegerField
      FieldName = 'SAMETYPEDOCID'
    end
    object ItsDocumVisaListQrySETOFDOCUMENT: TIntegerField
      DisplayLabel = #1053#1072#1073#1110#1088
      FieldName = 'SETOFDOCUMENT'
    end
    object ItsDocumVisaListQryCalcSameTypeDoc: TStringField
      DisplayLabel = #1053#1072#1073#1110#1088
      FieldKind = fkCalculated
      FieldName = 'CalcSameTypeDoc'
      Size = 10
      Calculated = True
    end
    object ItsDocumVisaListQryFILINGATWORK: TStringField
      FieldName = 'FILINGATWORK'
      Size = 1
    end
    object ItsDocumVisaListQryFOROWNERVISA: TSmallintField
      DisplayLabel = #1044#1083#1103' '#1074#1083#1072#1089#1085#1080#1082#1072' '#1074#1110#1079#1080
      FieldName = 'FOROWNERVISA'
    end
  end
  object StoreEmbassyProc: TADOStoredProc
    Connection = DMServDic.ADOConnection
    ProcedureName = 'EMBASSY_UPD_PROC'
    Parameters = <
      item
        Name = 'CountryId'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'ListEmbassyId'
        DataType = ftString
        Size = 250
        Value = Null
      end
      item
        Name = 'OUREMBASSY'
        DataType = ftString
        Size = 1
        Value = Null
      end>
    Left = 645
    Top = 14
  end
  object UpdLinkProc: TADOStoredProc
    Connection = DMServDic.ADOConnection
    ProcedureName = 'UPDATE_LINK_PROC'
    Parameters = <
      item
        Name = 'VISADOCLINKID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'DOCID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'TYPEID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'LINK'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'DELLINK'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 463
    Top = 15
  end
  object SelPartnersQry: TADOQuery
    Connection = DMServDic.ADOConnection
    OnCalcFields = SelPartnersQryCalcFields
    Parameters = <
      item
        Name = 'CountryId'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'Select P.PartnerId, P.PayForServ, C.CurrencyShort, P.CurrId, Cp.' +
        'Name PartnerName, P.CompanyId, P.EmbassyId'
      'From Partners P'
      'left join Companies Cp on Cp.Companyid = P.Companyid'
      'left join Currency C on C.CurrencyId = P.CurrId'
      'where P.CountryId = :CountryId')
    Left = 832
    Top = 112
    object SelPartnersQryPARTNERID: TIntegerField
      FieldName = 'PARTNERID'
    end
    object SelPartnersQryCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object SelPartnersQryPARTNERNAME: TStringField
      DisplayLabel = #1055#1072#1088#1090#1085#1077#1088
      FieldName = 'PARTNERNAME'
      Size = 80
    end
    object SelPartnersQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object SelPartnersQryPAYFORSERV: TFloatField
      FieldName = 'PAYFORSERV'
    end
    object SelPartnersQryCURRENCYSHORT: TStringField
      FieldName = 'CURRENCYSHORT'
      Size = 3
    end
    object SelPartnersQryEMBASSYID: TIntegerField
      FieldName = 'EMBASSYID'
      Origin = '"PARTNERS"."EMBASSYID"'
      Required = True
    end
    object SelPartnersQryCalcPayServ: TStringField
      DisplayLabel = #1042#1072#1088#1090#1110#1089#1090#1100
      FieldKind = fkCalculated
      FieldName = 'CalcPayServ'
      Calculated = True
    end
  end
  object SelTaxSystemQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnCalcFields = SelTaxSystemQryCalcFields
    Parameters = <>
    SQL.Strings = (
      'Select T.TAXSYSTEMID, T.TAXNAME, D.PAYER, T.COMMENTS,'
      
        '       D.INCOMETAXABS, D.INCOMETAXVAL, D.PDVSUM, SingleTax, D.Ta' +
        'xDetailId'
      ' from TaxSystem T'
      ' left join TaxSystemDetails D on D.TaxSystemId = T.TaxSystemId'
      
        ' where FromDate <= '#39'Now'#39' and (ToDate is null or (ToDate >= '#39'Now'#39 +
        ') )')
    Left = 1075
    Top = 111
    object SelTaxSystemQryTAXSYSTEMID: TIntegerField
      FieldName = 'TAXSYSTEMID'
    end
    object SelTaxSystemQryTAXNAME: TStringField
      FieldName = 'TAXNAME'
      Size = 100
    end
    object SelTaxSystemQryPAYER: TSmallintField
      FieldName = 'PAYER'
    end
    object SelTaxSystemQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object SelTaxSystemQryINCOMETAXABS: TFloatField
      FieldName = 'INCOMETAXABS'
    end
    object SelTaxSystemQryINCOMETAXVAL: TFloatField
      FieldName = 'INCOMETAXVAL'
    end
    object SelTaxSystemQryPDVSUM: TFloatField
      FieldName = 'PDVSUM'
    end
    object SelTaxSystemQrySINGLETAX: TStringField
      FieldName = 'SINGLETAX'
      Size = 1
    end
    object SelTaxSystemQryTAXDETAILID: TIntegerField
      FieldName = 'TAXDETAILID'
    end
    object SelTaxSystemQryCalcNameTax: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNameTax'
      Size = 200
      Calculated = True
    end
    object SelTaxSystemQryCalcIncomTax: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcIncomTax'
      Size = 200
      Calculated = True
    end
  end
  object SelItsPersonQry: TADOQuery
    Connection = DMServDic.ADOConnection
    OnCalcFields = SelItsPersonQryCalcFields
    Parameters = <
      item
        Name = 'COMPANYID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select Cp.CompanyId, Cp.PersonId,'
      
        '  Cp.Name, Cp.SecondName, Cp.FullName, Cp.Occupation, Cp.SignRig' +
        'ht,'
      '  Cph.AreaCode, Cph.PhoneNo'
      'from CompPersons Cp'
      'left join CompPhones Cph on Cph.PhoneId = Cp.Phone1Id'
      'where Cp.CompanyId = :CompanyId'
      '  and not Cp.SecondName is null and not Cp.Occupation is null'
      '  and (Cp.Dismissed is null or Cp.Dismissed <> '#39'T'#39')'
      'order by Cp.SignRight, Cp.FullName, Cp.Occupation')
    Left = 135
    Top = 158
    object SelItsPersonQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object SelItsPersonQryPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object SelItsPersonQryFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 50
    end
    object SelItsPersonQryOCCUPATION: TStringField
      FieldName = 'OCCUPATION'
      Size = 40
    end
    object SelItsPersonQrySIGNRIGHT: TStringField
      FieldName = 'SIGNRIGHT'
      Size = 1
    end
    object SelItsPersonQryNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object SelItsPersonQrySECONDNAME: TStringField
      FieldName = 'SECONDNAME'
      Size = 30
    end
    object SelItsPersonQryCalcFullName: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcFullName'
      Size = 255
      Calculated = True
    end
    object SelItsPersonQryAREACODE: TStringField
      FieldName = 'AREACODE'
      Size = 6
    end
    object SelItsPersonQryPHONENO: TStringField
      FieldName = 'PHONENO'
      Size = 10
    end
    object SelItsPersonQryCalcPhoneNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcPhoneNo'
      Size = 17
      Calculated = True
    end
  end
  object LastNoteQry: TADOQuery
    Connection = DMServDic.ADOConnection
    DataSource = CompanySrc
    Parameters = <
      item
        Name = 'CompanyId'
        Size = -1
        Value = Null
      end
      item
        Name = 'CompanyId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select N.Memo from CompNotes N'
      'where N.CompanyId = :CompanyId and N.CompNoteId = ('
      '  select max(M.CompNoteId) from CompNotes M'
      '  where M.CompanyId = :CompanyId)')
    Left = 44
    Top = 160
    object LastNoteQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object SelPersonQry: TADOQuery
    Connection = DMServDic.ADOConnection
    DataSource = CompanySrc
    Parameters = <
      item
        Name = 'COMPANYID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select CompanyId, PersonId,'
      '  Name, SecondName, FullName, Occupation, SignRight'
      'from CompPersons'
      'where CompanyId = :CompanyId'
      '  and not SecondName is null and not Occupation is null'
      '  and (Dismissed is null or Dismissed <> '#39'T'#39' )'
      'order by SignRight, FullName, Occupation')
    Left = 730
    Top = 307
    object SelPersonQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object SelPersonQryPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object SelPersonQryFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 50
    end
    object SelPersonQryOCCUPATION: TStringField
      FieldName = 'OCCUPATION'
      Size = 40
    end
    object SelPersonQrySIGNRIGHT: TStringField
      FieldName = 'SIGNRIGHT'
      Size = 1
    end
    object SelPersonQryNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object SelPersonQrySECONDNAME: TStringField
      FieldName = 'SECONDNAME'
      Size = 30
    end
  end
  object SelCompCntrctsQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <
      item
        Name = 'TradeNameId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select C.CompanyId, T.TradeName, Cc.CompContractId, Cc.TillDate'
      'from Companies C'
      'left join CompContracts Cc on Cc.CompanyId = C.CompanyId and'
      ' (Tilldate is Null or (TillDate > '#39'Now'#39'))'
      'left join TradeNames T on T.TradeNameId = C.TradeNameId'
      
        'where C.TradeNameId = :TradeNameId and C.HeadOfficeId is not Nul' +
        'l')
    Left = 729
    Top = 259
    object SelCompCntrctsQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object SelCompCntrctsQryTRADENAME: TStringField
      FieldName = 'TRADENAME'
      Size = 150
    end
    object SelCompCntrctsQryCONTRACTID: TIntegerField
      FieldName = 'COMPCONTRACTID'
    end
    object SelCompCntrctsQryTILLDATE: TDateTimeField
      FieldName = 'TILLDATE'
    end
  end
  object ServiceAddProc: TADOStoredProc
    Connection = DMServDic.ADOConnection
    ProcedureName = 'SERVICE_ADD_PROC'
    Parameters = <>
    Left = 733
    Top = 13
  end
  object ServGroupAddProc: TADOStoredProc
    Connection = DMServDic.ADOConnection
    ProcedureName = 'SERVGROUP_ADD_PROC'
    Parameters = <
      item
        Name = 'SERVICEGROUPID'
        DataType = ftInteger
        Direction = pdOutput
        Value = Null
      end
      item
        Name = 'UNIQUENAME'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 551
    Top = 17
  end
  object CheckRoomQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <
      item
        Name = 'HOTELBUILDID'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'RoomTypeId'
        Size = -1
        Value = Null
      end
      item
        Name = 'HotelRoomId'
        Size = -1
        Value = Null
      end
      item
        Name = 'ExpandNameId'
        Size = -1
        Value = Null
      end
      item
        Name = 'ExpandNameId'
        Size = -1
        Value = Null
      end
      item
        Name = 'Capacity'
        Size = -1
        Value = Null
      end
      item
        Name = 'AddCapacity'
        Size = -1
        Value = Null
      end
      item
        Name = 'AddCapacity'
        Size = -1
        Value = Null
      end
      item
        Name = 'AddCapAdult'
        Size = -1
        Value = Null
      end
      item
        Name = 'AddCapAdult'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select H.HotelRoomId from HtlRooms H'
      'where H.BuildId = :HotelBuildId and H.RoomTypeId = :RoomTypeId'
      '  and H.HotelRoomId <> :HotelRoomId'
      
        '  and ((H.ExpandNameId is null and :ExpandNameId = 0) or (H.Expa' +
        'ndNameId = :ExpandNameId))'
      '  and H.Capacity = :Capacity'
      
        '  and ((H.AddCapacity is null and :AddCapacity = 0) or (H.AddCap' +
        'acity = :AddCapacity))'
      
        '  and ((H.AddCapAdult is null and :AddCapAdult = 0) or (H.AddCap' +
        'Adult = :AddCapAdult))'
      '')
    Left = 132
    Top = 211
  end
  object DriveNoteQry: TADOQuery
    Connection = DMServDic.ADOConnection
    OnCalcFields = DriveNoteQryCalcFields
    DataSource = BrDriveSrc
    Parameters = <
      item
        Name = 'DriveId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select N.LeavingId, N.DriveNoteId, N.Memo, N.Deleted,'
      '  N.AddDate, M.Manager as AddManager,'
      '  N.DelDate, D.Manager as DelManager,'
      '  N.DriveId'
      'from DriveNotes N'
      '  left join TmUser_view M on M.TmUserId = N.AddManId'
      '  left join TmUser_view D on D.TmUserId = N.DelManId'
      'where N.DriveId = :DriveId'
      'order by N.AddDate desc, N.DriveNoteId desc')
    Left = 559
    Top = 159
    object DriveNoteQryCalcMemo: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldKind = fkCalculated
      FieldName = 'CalcMemo'
      Size = 255
      Calculated = True
    end
    object DriveNoteQryLEAVINGID: TIntegerField
      DisplayLabel = #8470' '#1088#1077#1081#1089#1091
      FieldName = 'LEAVINGID'
    end
    object DriveNoteQryDRIVENOTEID: TIntegerField
      FieldName = 'DRIVENOTEID'
    end
    object DriveNoteQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
      Size = 1
    end
    object DriveNoteQryDELETED: TStringField
      FieldName = 'DELETED'
      Size = 1
    end
    object DriveNoteQryADDDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1087#1080#1089#1091
      FieldName = 'ADDDATE'
    end
    object DriveNoteQryADDMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldName = 'ADDMANAGER'
      Size = 35
    end
    object DriveNoteQryDELDATE: TDateTimeField
      FieldName = 'DELDATE'
    end
    object DriveNoteQryDELMANAGER: TStringField
      FieldName = 'DELMANAGER'
      Size = 35
    end
    object DriveNoteQryDRIVEID: TIntegerField
      FieldName = 'DRIVEID'
    end
  end
  object DriveNoteSrc: TDataSource
    DataSet = DriveNoteQry
    Left = 551
    Top = 215
  end
  object GridViewRepository: TcxGridViewRepository
    Left = 1232
    Top = 128
    object ViewCompany: TcxGridDBTableView
      OnCustomDrawCell = ViewCompanyCustomDrawCell
      DataController.DataSource = CompanySrc
      DataController.Filter.OnGetValueList = ViewCompanyDataControllerFilterGetValueList
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewCompanyCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCompanyShowNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1092#1110#1088#1084#1080' '
        DataBinding.FieldName = 'NAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 300
        Options.HorzSizing = False
        Options.SortByDisplayText = isbtOn
        Width = 300
      end
      object ViewCompanyCOMPANYNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1092#1110#1088#1084#1080' '
        DataBinding.FieldName = 'COMPANYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 0
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 300
      end
      object ViewCompanyCOMPANYTRADENAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1092#1110#1088#1084#1080' '
        DataBinding.FieldName = 'COMPANYTRADENAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 0
        Options.Filtering = False
        SortIndex = 1
        SortOrder = soAscending
        Width = 300
      end
      object ViewCompanyPERSCOUNT: TcxGridDBColumn
        Caption = #1058#1091#1088#1080#1089#1090#1080' '
        DataBinding.FieldName = 'PERSCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 47
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 47
      end
      object ViewCompanyORDERCOUNT: TcxGridDBColumn
        Caption = #1047#1072#1084#1086#1074#1083#1077#1085#1085#1103' '
        DataBinding.FieldName = 'ORDERCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 35
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 35
      end
      object ViewCompanyLASTDATECRORDER: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1089#1090#1072#1085#1085#1100#1086#1075#1086' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103' '
        DataBinding.FieldName = 'LASTDATECRORDER'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 64
      end
      object ViewCompanySORTBYCONTRACT: TcxGridDBColumn
        Caption = #1059#1075#1086#1076#1080' '
        DataBinding.FieldName = 'SORTBYCONTRACT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 61
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 61
      end
      object ViewCompanyOBDZVIN: TcxGridDBColumn
        Caption = #1045#1082#1089#1087#1086#1088#1090' '#1090#1091#1088#1110#1074' '
        DataBinding.FieldName = 'OBDZVIN'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewCompanyOBDZVINAGREEDATE: TcxGridDBColumn
        DataBinding.FieldName = 'OBDZVINAGREEDATE'
        Visible = False
        MinWidth = 112
        Options.HorzSizing = False
      end
      object ViewCompanyAreWeb: TcxGridDBColumn
        DataBinding.FieldName = 'AREWEB'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyCOMMONNOTEADDDATE: TcxGridDBColumn
        Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1085#1086#1090#1072#1090#1082#1072' '
        DataBinding.FieldName = 'COMMONNOTEADDDATE'
        HeaderAlignmentVert = vaCenter
        MinWidth = 62
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 62
      end
      object ViewCompanyFIXDEFECTTODATE: TcxGridDBColumn
        DataBinding.FieldName = 'FIXDEFECTTODATE'
        Visible = False
        MinWidth = 112
        Options.HorzSizing = False
      end
      object ViewCompanyISHEADOFFICE: TcxGridDBColumn
        DataBinding.FieldName = 'ISHEADOFFICE'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyNOTWORK: TcxGridDBColumn
        DataBinding.FieldName = 'NOTWORK'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyAGENCYLOGO: TcxGridDBColumn
        DataBinding.FieldName = 'AGENCYLOGO'
        Visible = False
        MinWidth = 184
        Options.HorzSizing = False
      end
      object ViewCompanyDOCTODATE: TcxGridDBColumn
        DataBinding.FieldName = 'DOCTODATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        MinWidth = 112
        Options.HorzSizing = False
      end
      object ViewCompanyISAGENT: TcxGridDBColumn
        DataBinding.FieldName = 'ISAGENT'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyISCLIENT: TcxGridDBColumn
        DataBinding.FieldName = 'ISCLIENT'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyISVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'ISVENDOR'
        Visible = False
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 42
      end
      object ViewCompanyISTOUROPER: TcxGridDBColumn
        DataBinding.FieldName = 'ISTOUROPER'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyASTOURS: TcxGridDBColumn
        DataBinding.FieldName = 'ASTOURS'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewCompanyASNETAGENT: TcxGridDBColumn
        DataBinding.FieldName = 'ASNETAGENT'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewCompanyASAUPAIR: TcxGridDBColumn
        DataBinding.FieldName = 'ASAUPAIR'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyISENTERPR: TcxGridDBColumn
        DataBinding.FieldName = 'ISENTERPR'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyISPRIVATE: TcxGridDBColumn
        DataBinding.FieldName = 'ISPRIVATE'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyISBSMAN: TcxGridDBColumn
        DataBinding.FieldName = 'ISBSMAN'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanyISBUDGET: TcxGridDBColumn
        DataBinding.FieldName = 'ISBUDGET'
        Visible = False
      end
      object ViewCompanyWORKMANID: TcxGridDBColumn
        DataBinding.FieldName = 'WORKMANID'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewCompanyADDMANID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDMANID'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewCompanyName: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
        MinWidth = 604
        Options.HorzSizing = False
      end
      object ViewCompanyTRADENAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1092#1110#1088#1084#1080' '
        DataBinding.FieldName = 'TRADENAME'
        Visible = False
        MinWidth = 300
        Options.HorzSizing = False
        Width = 300
      end
      object ViewCompanyAREAGENTCONTRACT: TcxGridDBColumn
        DataBinding.FieldName = 'AREAGENTCONTRACT'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewCompanySTANDOC: TcxGridDBColumn
        DataBinding.FieldName = 'STANDOC'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewCompanyMANAGER: TcxGridDBColumn
        DataBinding.FieldName = 'MANAGER'
        Visible = False
      end
      object ViewCompanyISOTHER: TcxGridDBColumn
        DataBinding.FieldName = 'ISOTHER'
        Visible = False
      end
    end
    object ViewCompanyCountry: TcxGridDBTableView
      DataController.DataSource = CountryCompSrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewCompanyCountryCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCompanyCountryNAME: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 303
      end
      object ViewCompanyCountryLATNAME: TcxGridDBColumn
        Caption = #1051#1072#1090'.'
        DataBinding.FieldName = 'LATNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 39
      end
    end
    object ViewCompanyCity: TcxGridDBTableView
      DataController.DataSource = CityCompanySrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewCompanyCityID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompanyCityNAME: TcxGridDBColumn
        Caption = #1052#1110#1089#1090#1086
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompanyCityNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewContEmbasInprovince: TcxGridDBTableView
      DataController.DataSource = CNTREMBAS_INPROVINCESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewContEmbasInprovinceID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewContEmbasInprovinceCNTREMBASSYID: TcxGridDBColumn
        DataBinding.FieldName = 'CNTREMBASSYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewContEmbasInprovinceNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewContEmbasInprovinceID_CITY_ADM_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNIT'
        Visible = False
      end
    end
    object ViewSelTradeName: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      OnCustomDrawCell = ViewSelTradeNameCustomDrawCell
      DataController.DataSource = SelTradeNameSrc
      DataController.KeyFieldNames = 'TRADENAMEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewSelTradeNameTRADENAMEID: TcxGridDBColumn
        DataBinding.FieldName = 'TRADENAMEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelTradeNameTRADENAME: TcxGridDBColumn
        Caption = #1050#1086#1084#1077#1088#1094#1110#1081#1085#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'TRADENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelTradeNameAGENCYLOGO: TcxGridDBColumn
        DataBinding.FieldName = 'AGENCYLOGO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 32
        IsCaptionAssigned = True
      end
      object ViewSelTradeNamePEYMTOAGENCY: TcxGridDBColumn
        DataBinding.FieldName = 'PEYMTOAGENCY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelTradeNameISNETAGENCY: TcxGridDBColumn
        DataBinding.FieldName = 'ISNETAGENCY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelTradeNameEMAILID: TcxGridDBColumn
        DataBinding.FieldName = 'EMAILID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelTradeNameNOINCLUDEAGENTTOBILL: TcxGridDBColumn
        DataBinding.FieldName = 'NOINCLUDEAGENTTOBILL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewSelCompanyByTradeName: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      OnCustomDrawCell = ViewSelCompanyByTradeNameCustomDrawCell
      DataController.DataSource = SelCompanyByTradeNameSrc
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewSelCompanyByTradeNameCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelCompanyByTradeNameCOMPANYNAME: TcxGridDBColumn
        Caption = #1055#1072#1088#1090#1085#1077#1088
        DataBinding.FieldName = 'COMPANYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelCompanyByTradeNameISHEADOFFICE: TcxGridDBColumn
        DataBinding.FieldName = 'ISHEADOFFICE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewSelTradeNameList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SelTradeNameSrc
      DataController.KeyFieldNames = 'TRADENAMEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewSelTradeNameListTRADENAMEID: TcxGridDBColumn
        DataBinding.FieldName = 'TRADENAMEID'
        Visible = False
      end
      object ViewSelTradeNameListTRADENAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'TRADENAME'
      end
    end
    object ViewExistsCompany: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ExistCompSrc
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewExistsCompanyCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewExistsCompanyCalcName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'CalcName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewExistsCompanyTRADENAME: TcxGridDBColumn
        DataBinding.FieldName = 'TRADENAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewExistsCompanyNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewExistsCompanyCOMPKIND: TcxGridDBColumn
        DataBinding.FieldName = 'COMPKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewExistsCompanyOffice: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ExistOfficeQrySrc
      DataController.KeyFieldNames = 'OFFICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewExistsCompanyOfficeOFFICEID: TcxGridDBColumn
        DataBinding.FieldName = 'OFFICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExistsCompanyOfficeCOUNTRY: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'COUNTRY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 139
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 139
      end
      object ViewExistsCompanyOfficeADDRESS: TcxGridDBColumn
        Caption = #1040#1076#1088#1077#1089#1072
        DataBinding.FieldName = 'ADDRESS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 132
      end
      object ViewExistsCompanyOfficeHOUSE: TcxGridDBColumn
        Caption = #1041#1091#1076'.'
        DataBinding.FieldName = 'HOUSE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 47
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 47
      end
      object ViewExistsCompanyOfficeTENEMENT: TcxGridDBColumn
        Caption = #1054#1092#1110#1089
        DataBinding.FieldName = 'TENEMENT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 53
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 53
      end
      object ViewExistsCompanyOfficeISDEFAULT: TcxGridDBColumn
        DataBinding.FieldName = 'ISDEFAULT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewExistsCompanyOfficeZIPCODE: TcxGridDBColumn
        Caption = #1030#1085#1076#1077#1082#1089
        DataBinding.FieldName = 'ZIPCODE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 55
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 55
      end
    end
    object ViewCompNotesBlackListVip: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CompanyNotesSrc
      DataController.KeyFieldNames = 'COMPANYNOTEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewCompNotesBlackListVipCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCompNotesBlackListVipCOMPANYNOTEID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYNOTEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCompNotesBlackListVipCalcStatusNote: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'CalcStatusNote'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 64
      end
      object ViewCompNotesBlackListVipMEMO: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 621
      end
      object ViewCompNotesBlackListVipADDDATE: TcxGridDBColumn
        DataBinding.FieldName = 'ADDDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
      end
      object ViewCompNotesBlackListVipADDMANAGER: TcxGridDBColumn
        DataBinding.FieldName = 'ADDMANAGER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
      end
      object ViewCompNotesBlackListVipVIP: TcxGridDBColumn
        DataBinding.FieldName = 'VIP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
      end
      object ViewCompNotesBlackListVipBLACKLIST: TcxGridDBColumn
        DataBinding.FieldName = 'BLACKLIST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
      end
    end
    object ViewSelTaxSystemList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SelTaxSystemSrc
      DataController.KeyFieldNames = 'TAXDETAILID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewSelTaxSystemListTAXSYSTEMID: TcxGridDBColumn
        DataBinding.FieldName = 'TAXSYSTEMID'
        Visible = False
      end
      object ViewSelTaxSystemListTAXNAME: TcxGridDBColumn
        DataBinding.FieldName = 'TAXNAME'
        Visible = False
      end
      object ViewSelTaxSystemListPAYER: TcxGridDBColumn
        DataBinding.FieldName = 'PAYER'
        Visible = False
      end
      object ViewSelTaxSystemListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
      end
      object ViewSelTaxSystemListINCOMETAXABS: TcxGridDBColumn
        DataBinding.FieldName = 'INCOMETAXABS'
        Visible = False
      end
      object ViewSelTaxSystemListINCOMETAXVAL: TcxGridDBColumn
        DataBinding.FieldName = 'INCOMETAXVAL'
        Visible = False
      end
      object ViewSelTaxSystemListPDVSUM: TcxGridDBColumn
        DataBinding.FieldName = 'PDVSUM'
        Visible = False
      end
      object ViewSelTaxSystemListSINGLETAX: TcxGridDBColumn
        DataBinding.FieldName = 'SINGLETAX'
        Visible = False
      end
      object ViewSelTaxSystemListTAXDETAILID: TcxGridDBColumn
        DataBinding.FieldName = 'TAXDETAILID'
        Visible = False
      end
      object ViewSelTaxSystemListCalcNameTax: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'CalcNameTax'
      end
      object ViewSelTaxSystemListCalcIncomTax: TcxGridDBColumn
        DataBinding.FieldName = 'CalcIncomTax'
        Visible = False
      end
    end
    object ViewImportLog: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ImportLogSrc
      DataController.KeyFieldNames = 'LOGID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewImportLogLOGID: TcxGridDBColumn
        DataBinding.FieldName = 'LOGID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewImportLogHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewImportLogMANAGERID: TcxGridDBColumn
        DataBinding.FieldName = 'MANAGERID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewImportLogIMPORTDATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'IMPORTDATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 112
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewImportLogWEBSITE: TcxGridDBColumn
        Caption = #1057#1072#1081#1090
        DataBinding.FieldName = 'WEBSITE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewImportLogMANAGER: TcxGridDBColumn
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088
        DataBinding.FieldName = 'MANAGER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 214
        Options.Filtering = False
        Options.HorzSizing = False
      end
    end
    object ViewDrvVendor: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DrvVendorSrc
      DataController.KeyFieldNames = 'DRIVEVENDORID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewDrvVendorDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvVendorDRIVEVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEVENDORID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvVendorCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvVendorNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvVendorCOMPIDFORCNTRCT: TcxGridDBColumn
        DataBinding.FieldName = 'COMPIDFORCNTRCT'
        Visible = False
      end
      object ViewDrvVendorISPRIVATE: TcxGridDBColumn
        DataBinding.FieldName = 'ISPRIVATE'
        Visible = False
      end
      object ViewDrvVendorISVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'ISVENDOR'
        Visible = False
      end
      object ViewDrvVendorISENTERPR: TcxGridDBColumn
        DataBinding.FieldName = 'ISENTERPR'
        Visible = False
      end
      object ViewDrvVendorALLDATAFILL: TcxGridDBColumn
        DataBinding.FieldName = 'ALLDATAFILL'
        Visible = False
      end
      object ViewDrvVendorACTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIONID'
        Visible = False
      end
      object ViewDrvVendorGOVREESTRTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'GOVREESTRTYPEID'
        Visible = False
      end
      object ViewDrvVendorIDENTCODE: TcxGridDBColumn
        DataBinding.FieldName = 'IDENTCODE'
        Visible = False
      end
      object ViewDrvVendorGOVREESTRDATE: TcxGridDBColumn
        DataBinding.FieldName = 'GOVREESTRDATE'
        Visible = False
      end
      object ViewDrvVendorASRESIDENT: TcxGridDBColumn
        DataBinding.FieldName = 'ASRESIDENT'
        Visible = False
      end
      object ViewDrvVendorVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
      end
    end
    object ViewBrDrive: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrDriveSrc
      DataController.KeyFieldNames = 'DRIVEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewBrDriveDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewBrDriveMODEL: TcxGridDBColumn
        DataBinding.FieldName = 'MODEL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.HorzSizing = False
        Width = 150
      end
      object ViewBrDriveDRIVENO: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVENO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDrivePLACECOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'PLACECOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDriveYEARBUS: TcxGridDBColumn
        DataBinding.FieldName = 'YEARBUS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDriveEUROCLASS: TcxGridDBColumn
        Caption = #1044#1074#1080#1075#1091#1085
        DataBinding.FieldName = 'EUROCLASS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDriveFLOORS: TcxGridDBColumn
        DataBinding.FieldName = 'FLOORS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDrivePLACEMAPNO: TcxGridDBColumn
        DataBinding.FieldName = 'PLACEMAPNO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveDRIVEKIND: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1091
        DataBinding.FieldName = 'DRIVEKIND'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveISPROTO: TcxGridDBColumn
        DataBinding.FieldName = 'ISPROTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewBrDriveREGCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'REGCOUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveADDMANID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDMANID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.HorzSizing = False
      end
      object ViewBrDriveKIND: TcxGridDBColumn
        DataBinding.FieldName = 'KIND'
        Visible = False
      end
      object ViewBrDriveCLASSNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CLASSNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
      end
      object ViewBrDriveLookDriveKind: TcxGridDBColumn
        DataBinding.FieldName = 'LookDriveKind'
        Visible = False
      end
      object ViewBrDriveVENDORNAME: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
        DataBinding.FieldName = 'VENDORNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrDriveVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
      end
    end
    object ViewDriveNoteQry: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DriveNoteSrc
      DataController.KeyFieldNames = 'DRIVENOTEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewDriveNoteQryADDDATE: TcxGridDBColumn
        DataBinding.FieldName = 'ADDDATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 110
        Options.HorzSizing = False
        Width = 110
      end
      object ViewDriveNoteQryADDMANAGER: TcxGridDBColumn
        DataBinding.FieldName = 'ADDMANAGER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 160
        Options.HorzSizing = False
        Width = 160
      end
      object ViewDriveNoteQryLEAVINGID: TcxGridDBColumn
        DataBinding.FieldName = 'LEAVINGID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.HorzSizing = False
        Width = 60
      end
      object ViewDriveNoteQryCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 600
      end
      object ViewDriveNoteQryDRIVENOTEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVENOTEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryDELETED: TcxGridDBColumn
        DataBinding.FieldName = 'DELETED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryDELDATE: TcxGridDBColumn
        DataBinding.FieldName = 'DELDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryDELMANAGER: TcxGridDBColumn
        DataBinding.FieldName = 'DELMANAGER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewSelectVendorList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SelectVendorSrc
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewSelectVendorListCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelectVendorListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelectVendorListISPRIVATE: TcxGridDBColumn
        DataBinding.FieldName = 'ISPRIVATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelectVendorListISVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'ISVENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewDrvSrvLnkList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DrvSrvLnkSrc
      DataController.KeyFieldNames = 'LinkId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewDrvSrvLnkListDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 100
        Options.Filtering = False
        Width = 100
      end
      object ViewDrvSrvLnkListHAVECOST: TcxGridDBColumn
        Tag = 100
        Caption = #1054#1087#1083#1072#1090#1072
        DataBinding.FieldName = 'HAVECOST'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1054#1082#1088#1077#1084#1072' '#1087#1083#1072#1090#1072
            Value = 1
          end
          item
            Description = #1054#1087#1083#1072#1095#1091#1108#1090#1100#1089#1103' '#1095#1072#1089#1090#1082#1086#1074#1086
            Value = 2
          end
          item
            Description = #1053#1077#1084#1072#1108' '#1074#1072#1088#1090#1086#1089#1090#1110
            Value = 3
          end
          item
            Value = '-1'
          end>
        Properties.OnEditValueChanged = ViewDrvSrvLnkListHAVECOSTPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewDrvSrvLnkListCOST: TcxGridDBColumn
        Tag = -100
        DataBinding.FieldName = 'COST'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCOMMENTS: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 28
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 124
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 70
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 1534
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCalcCost: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        DataBinding.FieldName = 'CalcCost'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 133
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 133
      end
      object ViewDrvSrvLnkListCalcPrice: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        DataBinding.FieldName = 'CalcPrice'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = ViewDrvSrvLnkListCalcPricePropertiesButtonClick
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 70
      end
    end
    object ViewCOMPANIES_PARAM_DATAList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMPANIES_PARAM_DATASrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewCOMPANIES_PARAM_DATAListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewCOMPANIES_PARAM_DATAListID_COMPANIES: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COMPANIES'
        Visible = False
      end
      object ViewCOMPANIES_PARAM_DATAListID_COMPANIES_PARAM_NAME: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1076#1110#1103#1083#1100#1085#1086#1089#1090#1110
        DataBinding.FieldName = 'ID_COMPANIES_PARAM_NAME'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = DMServDic.ViewCOMPANIES_PARAM_NAMEList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = DMServDic.ViewCOMPANIES_PARAM_NAMEListDESCRIPT
      end
      object ViewCOMPANIES_PARAM_DATAListAVALUE: TcxGridDBColumn
        Caption = #1047#1085#1072#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'AVALUE'
        Visible = False
        Width = 143
      end
      object ViewCOMPANIES_PARAM_DATAListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
      end
      object ViewCOMPANIES_PARAM_DATAListATYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ATYPE'
        Visible = False
      end
    end
    object ViewDrvSrvLnk: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DrvSrvLnkSrc
      DataController.KeyFieldNames = 'LINKID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewDrvSrvLnkDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkHAVECOST: TcxGridDBColumn
        DataBinding.FieldName = 'HAVECOST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCOST: TcxGridDBColumn
        DataBinding.FieldName = 'COST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewDrvSrvLnkCOMMENTS: TcxGridDBColumn
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
      end
      object ViewDrvSrvLnkLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcPrice: TcxGridDBColumn
        DataBinding.FieldName = 'CalcPrice'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewCoutriesHaveHotels: TcxGridDBTableView
      DataController.DataSource = CountriesHaveHotelsSrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object ViewCoutriesHaveHotelsCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        IsCaptionAssigned = True
      end
      object ViewCoutriesHaveHotelsName: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'NAME'
      end
      object ViewCoutriesHaveHotelsSHOWWEB: TcxGridDBColumn
        Caption = 'WEB'
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Width = 30
      end
      object ViewCoutriesHaveHotelsLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewCoutriesHaveHotelsLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewCoutriesHaveHotelsSHORTSIGN: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTSIGN'
        Visible = False
      end
      object ViewCoutriesHaveHotelsTIMEBIAS: TcxGridDBColumn
        DataBinding.FieldName = 'TIMEBIAS'
        Visible = False
      end
      object ViewCoutriesHaveHotelsCCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CCODE'
        Visible = False
      end
      object ViewCoutriesHaveHotelsCODE2: TcxGridDBColumn
        DataBinding.FieldName = 'CODE2'
        Visible = False
      end
      object ViewCoutriesHaveHotelsCODE3: TcxGridDBColumn
        DataBinding.FieldName = 'CODE3'
        Visible = False
      end
      object ViewCoutriesHaveHotelsNEEDVISA: TcxGridDBColumn
        DataBinding.FieldName = 'NEEDVISA'
        Visible = False
      end
      object ViewCoutriesHaveHotelsPHONECODEUNI: TcxGridDBColumn
        DataBinding.FieldName = 'PHONECODEUNI'
        Visible = False
      end
    end
    object ViewCountriesHaveHotelList: TcxGridDBTableView
      DataController.DataSource = CountriesHaveHotelsSrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object ViewCountriesHaveHotelListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object ViewCountriesHaveHotelListName: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewCountriesHaveHotelListNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
        Visible = False
      end
      object ViewCountriesHaveHotelListLATNAME: TcxGridDBColumn
        DataBinding.FieldName = 'LATNAME'
        Visible = False
      end
      object ViewCountriesHaveHotelListMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
      end
    end
  end
  object CountryCompQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select C.CountryId, C.Name,  (select FIRST 1 NAME from Countries' +
        '_LNG WHERE id_lng = 350 and C.countryid = Countries_LNG.id_count' +
        'ries ) LatName'
      'from Countries C'
      
        'where exists (select * from CompOffices O where O.CountryId = C.' +
        'CountryId)')
    Left = 463
    Top = 61
    object IntegerField1: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object StringField1: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object CountryCompQryLATNAME: TStringField
      FieldName = 'LATNAME'
      Size = 300
    end
  end
  object CountryCompSrc: TDataSource
    DataSet = CountryCompQry
    Left = 463
    Top = 112
  end
  object CityCompanyQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = CountryCompSrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select C.Id, C.Name, (select NAME from CITY_ADM_UNIT_LNG WHERE i' +
        'd_lng = 350 and C.ID = id_city_adm_unit) NAME_ENG'
      'from CITY_ADM_UNIT C'
      
        'where C.ID_Country = :CountryId and exists (select * from CompOf' +
        'fices O where O.Id_CITY_ADM_UNIT = C.ID )')
    Left = 551
    Top = 61
    object CityCompanyQryID: TIntegerField
      FieldName = 'ID'
    end
    object StringField3: TStringField
      FieldName = 'NAME'
      Size = 25
    end
    object CityCompanyQryNAME_ENG: TStringField
      FieldName = 'NAME_ENG'
      Size = 100
    end
  end
  object CityCompanySrc: TDataSource
    DataSet = CityCompanyQry
    Left = 559
    Top = 112
  end
  object Repository_EmbassyDocumDlg: TcxGridViewRepository
    Left = 1231
    Top = 80
    object View_EmbassyDocumDlg_DocTypesDBGrid: TcxGridDBTableView
      DataController.DataSource = DMServDic.DocumVisaSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object View_EmbassyDocumDlg_DocTypesDBGridView_EmbassyDocumDlg_DocTypesDBGridDOCNAME: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 415
      end
      object View_EmbassyDocumDlg_DocTypesDBGridView_EmbassyDocumDlg_DocTypesDBGridSHORTNAME: TcxGridDBColumn
        Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 67
      end
      object View_EmbassyDocumDlg_DocTypesDBGridDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object View_EmbassyDocumDlg_DocTypesDBGridMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
      end
      object View_EmbassyDocumDlg_DocTypesDBGridORDERINCATEGORY: TcxGridDBColumn
        DataBinding.FieldName = 'ORDERINCATEGORY'
        Visible = False
      end
      object View_EmbassyDocumDlg_DocTypesDBGridONETYPEDOC: TcxGridDBColumn
        DataBinding.FieldName = 'ONETYPEDOC'
        Visible = False
      end
      object View_EmbassyDocumDlg_DocTypesDBGridCNTLINK: TcxGridDBColumn
        DataBinding.FieldName = 'CNTLINK'
        Visible = False
      end
    end
    object View_EmbassyDocumDlg_EmbassyDBGrid: TcxGridDBTableView
      FilterBox.Visible = fvNever
      OnCustomDrawCell = View_EmbassyDocumDlg_EmbassyDBGridCustomDrawCell
      DataController.DataSource = DMServDic.CNTREMBASSIESSrc
      DataController.DetailKeyFieldNames = 'CNTREMBASSYID'
      DataController.KeyFieldNames = 'CNTREMBASSYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object View_EmbassyDocumDlg_EmbassyDBGridCNTREMBASSYID: TcxGridDBColumn
        DataBinding.FieldName = 'CNTREMBASSYID'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGridCalcEmbassyName: TcxGridDBColumn
        Caption = #1050#1086#1085#1089#1091#1083#1100#1089#1090#1074#1086
        DataBinding.FieldName = 'CalcEmbassyName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 209
      end
      object View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGridCalcFundingSum: TcxGridDBColumn
        Caption = #1044#1086#1093#1110#1076
        DataBinding.FieldName = 'CalcFundingSum'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 110
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 110
      end
      object View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGridCalcBankSum: TcxGridDBColumn
        Caption = #1047#1072#1083#1080#1096#1086#1082' '#1074' '#1041#1072#1085#1082#1091
        DataBinding.FieldName = 'CalcBankSum'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 110
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 110
      end
      object View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGridCalcOnTourSum: TcxGridDBColumn
        Caption = '+ '#1053#1072' '#1090#1091#1088
        DataBinding.FieldName = 'CalcOnTourSum'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 50
      end
      object View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGrid1: TcxGridDBColumn
        DataBinding.FieldName = 'FILINGPLACEWORK'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        Properties.ShowDescriptions = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderImageIndex = 118
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 20
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGrid2: TcxGridDBColumn
        DataBinding.FieldName = 'OURFILING'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        Properties.ShowDescriptions = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderImageIndex = 116
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 20
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_EmbassyDBGridOUREMBASSY: TcxGridDBColumn
        DataBinding.FieldName = 'OUREMBASSY'
        Visible = False
        MinWidth = 10
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridEMBASSYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYNAME'
        Visible = False
        MinWidth = 604
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridCityName: TcxGridDBColumn
        DataBinding.FieldName = 'CityName'
        Visible = False
        MinWidth = 154
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridFOROWNERVISA: TcxGridDBColumn
        DataBinding.FieldName = 'FOROWNERVISA'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridFUNDINGSUM: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGSUM'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridFUNDINGVAL: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGVAL'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridFUNDINGCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGCOUNT'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridFUNDINGPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGPERIOD'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridBANKSUM: TcxGridDBColumn
        DataBinding.FieldName = 'BANKSUM'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridBANKVAL: TcxGridDBColumn
        DataBinding.FieldName = 'BANKVAL'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridBANKCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'BANKCOUNT'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridBANKPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'BANKPERIOD'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridONTOURSUM: TcxGridDBColumn
        DataBinding.FieldName = 'ONTOURSUM'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridOURFILING: TcxGridDBColumn
        DataBinding.FieldName = 'OURFILING'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridFILINGPLACEWORK: TcxGridDBColumn
        DataBinding.FieldName = 'FILINGPLACEWORK'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridPERMTRANSFDOC: TcxGridDBColumn
        DataBinding.FieldName = 'PERMTRANSFDOC'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridPAYBANKSERV: TcxGridDBColumn
        DataBinding.FieldName = 'PAYBANKSERV'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridREADYTODAYS: TcxGridDBColumn
        DataBinding.FieldName = 'READYTODAYS'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridAUTOFILLING: TcxGridDBColumn
        DataBinding.FieldName = 'AUTOFILLING'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridUSECODE: TcxGridDBColumn
        DataBinding.FieldName = 'USECODE'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridTYPEFUNDING: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEFUNDING'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridREADYTOTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'READYTOTYPE'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridAPPLTYPEDATE: TcxGridDBColumn
        DataBinding.FieldName = 'APPLTYPEDATE'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridSERVCOST: TcxGridDBColumn
        DataBinding.FieldName = 'SERVCOST'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridSERVCOSTVAL: TcxGridDBColumn
        DataBinding.FieldName = 'SERVCOSTVAL'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridCURRSERV: TcxGridDBColumn
        DataBinding.FieldName = 'CURRSERV'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
      end
      object View_EmbassyDocumDlg_EmbassyDBGridINPROVINCE: TcxGridDBColumn
        DataBinding.FieldName = 'INPROVINCE'
        Visible = False
      end
    end
    object View_EmbassyDocumDlg_FilingDBGrid: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object View_EmbassyDocumDlg_FilingDBGridView_EmbassyDocumDlg_FilingDBGridCalcFieldName: TcxGridDBColumn
        DataBinding.FieldName = 'CalcFieldName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 237
      end
    end
    object View_EmbassyDocumDlg_SelPartnerDBGrid: TcxGridDBTableView
      DataController.DataSource = SelPartnerSrc
      DataController.KeyFieldNames = 'PARTNERID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object View_EmbassyDocumDlg_SelPartnerDBGridView_EmbassyDocumDlg_SelPartnerDBGridPARTNERNAME: TcxGridDBColumn
        DataBinding.FieldName = 'PARTNERNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 186
      end
      object View_EmbassyDocumDlg_SelPartnerDBGridView_EmbassyDocumDlg_SelPartnerDBGridCalcPayServ: TcxGridDBColumn
        DataBinding.FieldName = 'CalcPayServ'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 50
      end
      object View_EmbassyDocumDlg_SelPartnerDBGridPARTNERID: TcxGridDBColumn
        DataBinding.FieldName = 'PARTNERID'
        Visible = False
      end
      object View_EmbassyDocumDlg_SelPartnerDBGridCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
      end
      object View_EmbassyDocumDlg_SelPartnerDBGridCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
      end
      object View_EmbassyDocumDlg_SelPartnerDBGridPAYFORSERV: TcxGridDBColumn
        DataBinding.FieldName = 'PAYFORSERV'
        Visible = False
      end
      object View_EmbassyDocumDlg_SelPartnerDBGridCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
      end
      object View_EmbassyDocumDlg_SelPartnerDBGridEMBASSYID: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYID'
        Visible = False
      end
    end
    object View_EmbassyDocumDlg_VisaCenterDBGrid: TcxGridDBTableView
      DataController.DataSource = VisaCenterSrc
      DataController.KeyFieldNames = 'CntrEmbassyId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGridCalcEmbassyName: TcxGridDBColumn
        DataBinding.FieldName = 'CalcEmbassyName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 226
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGridCalcServCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcServCost'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 51
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGridCalcPayBank: TcxGridDBColumn
        DataBinding.FieldName = 'CalcPayBank'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 51
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGridCalcReadyToDay: TcxGridDBColumn
        DataBinding.FieldName = 'CalcReadyToDay'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 66
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGrid: TcxGridDBColumn
        DataBinding.FieldName = 'AUTOFILLING'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderImageIndex = 119
        Options.Filtering = False
        Options.Sorting = False
        Width = 22
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'USECODE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        HeaderImageIndex = 120
        Width = 22
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'OURFILING'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 114
            Value = 'T'
          end
          item
            ImageIndex = 51
            Value = 'F'
          end>
        HeaderImageIndex = 116
        Width = 22
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'APPLTYPEDATE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 117
            Value = 0
          end
          item
            ImageIndex = 115
            Value = 1
          end>
        HeaderImageIndex = 117
        Width = 22
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'PERMTRANSFDOC'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 1
          end
          item
            ImageIndex = 69
            Value = 3
          end>
        HeaderImageIndex = 51
        Width = 22
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'PERMTRANSFDOC'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 2
          end
          item
            ImageIndex = 69
            Value = 4
          end>
        HeaderImageIndex = 113
        Width = 22
        IsCaptionAssigned = True
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridEMBASSYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYNAME'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridCntrEmbassyId: TcxGridDBColumn
        DataBinding.FieldName = 'CntrEmbassyId'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridITSKONSUL: TcxGridDBColumn
        DataBinding.FieldName = 'ITSKONSUL'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridFUNDINGSUM: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGSUM'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridFUNDINGVAL: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGVAL'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridFUNDINGCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGCOUNT'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridFUNDINGPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGPERIOD'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridBANKSUM: TcxGridDBColumn
        DataBinding.FieldName = 'BANKSUM'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridBANKVAL: TcxGridDBColumn
        DataBinding.FieldName = 'BANKVAL'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridBANKCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'BANKCOUNT'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridBANKPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'BANKPERIOD'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridPERMTRANSFDOC: TcxGridDBColumn
        DataBinding.FieldName = 'PERMTRANSFDOC'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridONTOURSUM: TcxGridDBColumn
        DataBinding.FieldName = 'ONTOURSUM'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridPAYBANKSERV: TcxGridDBColumn
        DataBinding.FieldName = 'PAYBANKSERV'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridCURRSERV: TcxGridDBColumn
        DataBinding.FieldName = 'CURRSERV'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridREADYTODAYS: TcxGridDBColumn
        DataBinding.FieldName = 'READYTODAYS'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridREADYTOTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'READYTOTYPE'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridAUTOFILLING: TcxGridDBColumn
        DataBinding.FieldName = 'AUTOFILLING'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridUSECODE: TcxGridDBColumn
        DataBinding.FieldName = 'USECODE'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridOURFILING: TcxGridDBColumn
        DataBinding.FieldName = 'OURFILING'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridAPPLTYPEDATE: TcxGridDBColumn
        DataBinding.FieldName = 'APPLTYPEDATE'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridSERVCOST: TcxGridDBColumn
        DataBinding.FieldName = 'SERVCOST'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridSERVCOSTVAL: TcxGridDBColumn
        DataBinding.FieldName = 'SERVCOSTVAL'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridPARENTID: TcxGridDBColumn
        DataBinding.FieldName = 'PARENTID'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridCITYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CITYNAME'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridFILINGPLACEWORK: TcxGridDBColumn
        DataBinding.FieldName = 'FILINGPLACEWORK'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridFULLFUNDING: TcxGridDBColumn
        DataBinding.FieldName = 'FULLFUNDING'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridTYPEFUNDING: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEFUNDING'
        Visible = False
      end
      object View_EmbassyDocumDlg_VisaCenterDBGridCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
      end
    end
    object View_EmbassyDocumDlg_UsedDocsDBGrid: TcxGridDBTableView
      OnCustomDrawCell = View_EmbassyDocumDlg_UsedDocsDBGridCustomDrawCell
      DataController.DataSource = ItsDocumVisaListSrc
      DataController.KeyFieldNames = 'VisaDocumentId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridVIEWNAME: TcxGridDBColumn
        DataBinding.FieldName = 'VIEWNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 424
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridTYPENAME: TcxGridDBColumn
        DataBinding.FieldName = 'TYPENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 101
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 101
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcSameTypeDoc: TcxGridDBColumn
        DataBinding.FieldName = 'CalcSameTypeDoc'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 61
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 61
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridNEEDCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'NEEDCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 40
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 40
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcBeforeFiling: TcxGridDBColumn
        DataBinding.FieldName = 'CalcBeforeFiling'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 60
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcIssuedMonths: TcxGridDBColumn
        DataBinding.FieldName = 'CalcIssuedMonths'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 63
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 63
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridBEGINDOC: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDOC'
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 33
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcExpireMonths: TcxGridDBColumn
        DataBinding.FieldName = 'CalcExpireMonths'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 72
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 72
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcDocForLast: TcxGridDBColumn
        DataBinding.FieldName = 'CalcDocForLast'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 68
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 68
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcAgeRestr: TcxGridDBColumn
        DataBinding.FieldName = 'CalcAgeRestr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 69
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 69
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcMarried: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMarried'
        HeaderAlignmentVert = vaCenter
        MinWidth = 68
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 68
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridPOSADA: TcxGridDBColumn
        DataBinding.FieldName = 'POSADA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 69
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 69
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcSum: TcxGridDBColumn
        DataBinding.FieldName = 'CalcSum'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 116
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 116
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridFORIND: TcxGridDBColumn
        DataBinding.FieldName = 'FORIND'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 26
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 26
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridFORADDMANUAL: TcxGridDBColumn
        DataBinding.FieldName = 'FORADDMANUAL'
        HeaderAlignmentVert = vaCenter
        MinWidth = 26
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 26
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridTRANSMIT: TcxGridDBColumn
        DataBinding.FieldName = 'TRANSMIT'
        HeaderAlignmentVert = vaCenter
        MinWidth = 26
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 26
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridRETURNED: TcxGridDBColumn
        DataBinding.FieldName = 'RETURNED'
        HeaderAlignmentVert = vaCenter
        MinWidth = 26
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 26
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridGROUPNAME: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 61
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 61
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridSUBGROUPNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SUBGROUPNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 117
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 117
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridISUSE: TcxGridDBColumn
        DataBinding.FieldName = 'ISUSE'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridLINK: TcxGridDBColumn
        DataBinding.FieldName = 'LINK'
        Visible = False
        MinWidth = 1534
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBFILINGATWORK: TcxGridDBColumn
        DataBinding.FieldName = 'FILINGATWORK'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridFOROWNERVISA: TcxGridDBColumn
        DataBinding.FieldName = 'FOROWNERVISA'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridVisaDocumentId: TcxGridDBColumn
        DataBinding.FieldName = 'VISADOCUMENTID'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'DOCID'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridAGERESTRICTION: TcxGridDBColumn
        DataBinding.FieldName = 'AGERESTRICTION'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridEXPIREMONTHS: TcxGridDBColumn
        DataBinding.FieldName = 'EXPIREMONTHS'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridISSUEDMONTHS: TcxGridDBColumn
        DataBinding.FieldName = 'ISSUEDMONTHS'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridSUMMA: TcxGridDBColumn
        DataBinding.FieldName = 'SUMMA'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEID'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'PERIOD'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridSHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridEXPIREPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'EXPIREPERIOD'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridISSUESPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'ISSUESPERIOD'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridTYPEVAL: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEVAL'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridTYPEDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEDOCID'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridMARRIEDSTATE: TcxGridDBColumn
        DataBinding.FieldName = 'MARRIEDSTATE'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridFUNDING: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDING'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridPOSADAID: TcxGridDBColumn
        DataBinding.FieldName = 'POSADAID'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridFUNDINGCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGCOUNT'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridVisaDocGroupId: TcxGridDBColumn
        DataBinding.FieldName = 'VisaDocGroupId'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridDOCFORLASTCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DOCFORLASTCOUNT'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridDOCFORLASTPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'DOCFORLASTPERIOD'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridONETYPEDOC: TcxGridDBColumn
        DataBinding.FieldName = 'ONETYPEDOC'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridEMBASSYID: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYID'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridSUBGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'SUBGROUPID'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridBEFOREFILING: TcxGridDBColumn
        DataBinding.FieldName = 'BEFOREFILING'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridBEFOREFILINGPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'BEFOREFILINGPERIOD'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridBANKWITHOUTSUM: TcxGridDBColumn
        DataBinding.FieldName = 'BANKWITHOUTSUM'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridSAMETYPEDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'SAMETYPEDOCID'
        Visible = False
      end
      object View_EmbassyDocumDlg_UsedDocsDBGridSETOFDOCUMENT: TcxGridDBColumn
        DataBinding.FieldName = 'SETOFDOCUMENT'
        Visible = False
      end
    end
    object View_EmbassyDocumDlg_OneTypeDocDBGrid: TcxGridDBTableView
      OnCustomDrawCell = View_EmbassyDocumDlg_OneTypeDocDBGridCustomDrawCell
      DataController.DataSource = OneTypeDocSrc
      DataController.KeyFieldNames = 'VISADOCUMENTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridDOCNAME: TcxGridDBColumn
        DataBinding.FieldName = 'DOCNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 426
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridTYPENAME: TcxGridDBColumn
        DataBinding.FieldName = 'TYPENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 100
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcSameTypeDoc: TcxGridDBColumn
        Caption = #1053#1072#1073#1110#1088
        DataBinding.FieldName = 'CalcSameTypeDoc'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 61
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 61
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridNEEDCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'NEEDCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 40
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 40
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGrid: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 62
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 62
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcIssuedMonths: TcxGridDBColumn
        DataBinding.FieldName = 'CalcIssuedMonths'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 61
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 61
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridBEGINDOC: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDOC'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 34
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 34
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcExpireMonths: TcxGridDBColumn
        DataBinding.FieldName = 'CalcExpireMonths'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 71
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 71
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcDocForLast: TcxGridDBColumn
        DataBinding.FieldName = 'CalcDocForLast'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 69
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 69
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcAgeRestr: TcxGridDBColumn
        DataBinding.FieldName = 'CalcAgeRestr'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 69
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 69
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcMarried: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMarried'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 69
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 69
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridPOSADA: TcxGridDBColumn
        DataBinding.FieldName = 'POSADA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 69
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 69
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcSum: TcxGridDBColumn
        DataBinding.FieldName = 'CalcSum'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 117
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 117
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridFORIND: TcxGridDBColumn
        DataBinding.FieldName = 'FORIND'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 25
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 25
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridFORADDMANUAL: TcxGridDBColumn
        DataBinding.FieldName = 'FORADDMANUAL'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 25
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 25
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridTRANSMIT: TcxGridDBColumn
        DataBinding.FieldName = 'TRANSMIT'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 25
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 25
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridRETURNED: TcxGridDBColumn
        DataBinding.FieldName = 'RETURNED'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 69
            Value = 'T'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 25
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 25
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridGROUPNAME: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 61
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 61
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridSUBGROUPNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SUBGROUPNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 117
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 117
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridISUSE: TcxGridDBColumn
        DataBinding.FieldName = 'ISUSE'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridMARRIEDSTATE: TcxGridDBColumn
        DataBinding.FieldName = 'MARRIEDSTATE'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridAGERESTRICTION: TcxGridDBColumn
        DataBinding.FieldName = 'AGERESTRICTION'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridDOCFORLASTCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DOCFORLASTCOUNT'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridDOCFORLASTPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'DOCFORLASTPERIOD'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridEXPIREMONTHS: TcxGridDBColumn
        DataBinding.FieldName = 'EXPIREMONTHS'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridISSUEDMONTHS: TcxGridDBColumn
        DataBinding.FieldName = 'ISSUEDMONTHS'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridEXPIREPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'EXPIREPERIOD'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridISSUESPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'ISSUESPERIOD'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridSUMMA: TcxGridDBColumn
        DataBinding.FieldName = 'SUMMA'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridFUNDING: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDING'
        Visible = False
        MinWidth = 10
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridSHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'DOCID'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridSETOFDOCUMENT: TcxGridDBColumn
        DataBinding.FieldName = 'SETOFDOCUMENT'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridSAMETYPEDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'SAMETYPEDOCID'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
      object View_EmbassyDocumDlg_OneTypeDocDBGridVISADOCUMENTID: TcxGridDBColumn
        DataBinding.FieldName = 'VISADOCUMENTID'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
    end
  end
  object ItsDocumVisaListSrc: TDataSource
    DataSet = ItsDocumVisaListQry
    Left = 953
    Top = 149
  end
  object CNTREMBAS_INPROVINCE: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = DMServDic.CNTREMBASSIESSrc
    Parameters = <
      item
        Name = 'CNTREMBASSYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select CNTREMBAS_INPROVINCE.ID,CNTREMBAS_INPROVINCE.cntrembassyi' +
        'd,CNTREMBAS_INPROVINCE.id_city_adm_unit ,CITY_ADM_UNIT.name from' +
        ' CNTREMBAS_INPROVINCE'
      
        'left join CITY_ADM_UNIT on CNTREMBAS_INPROVINCE.id_city_adm_unit' +
        ' = CITY_ADM_UNIT.id'
      'where CNTREMBAS_INPROVINCE.CNTREMBASSYID = :CNTREMBASSYID')
    Left = 952
    Top = 16
    object CNTREMBAS_INPROVINCEID: TIntegerField
      FieldName = 'ID'
      Origin = '"CNTREMBAS_INPROVINCE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CNTREMBAS_INPROVINCECNTREMBASSYID: TIntegerField
      FieldName = 'CNTREMBASSYID'
      Origin = '"CNTREMBAS_INPROVINCE"."CNTREMBASSYID"'
    end
    object CNTREMBAS_INPROVINCENAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"PROVINCES"."NAME"'
      Size = 200
    end
    object CNTREMBAS_INPROVINCEID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
  end
  object CNTREMBAS_INPROVINCESrc: TDataSource
    DataSet = CNTREMBAS_INPROVINCE
    Left = 952
    Top = 56
  end
  object VisaCenterSrc: TDataSource
    DataSet = SelVisaCentersQry
    Left = 836
    Top = 56
  end
  object SelVisaCentersQry: TADOQuery
    Connection = DMServDic.ADOConnection
    OnCalcFields = SelVisaCentersQryCalcFields
    DataSource = DMServDic.CNTREMBASSIESSrc
    Parameters = <
      item
        Name = 'CNTREMBASSYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  Co.CompanyId, Co.Name EmbassyName,'
      '              E.InProvince ItsKonsul, E.CountryId,'
      '              COALESCE(FUNDINGSUM, 0) FUNDINGSUM, FUNDINGVAL,'
      '              FUNDINGCOUNT, FUNDINGPERIOD,'
      
        '              COALESCE(BANKSUM, 0) BANKSUM, BANKVAL, BANKCOUNT, ' +
        'BANKPERIOD,'
      '              PERMTRANSFDOC, COALESCE(ONTOURSUM, 0) ONTOURSUM,'
      
        '              PayBankServ, CurrServ, ReadyToDays, ReadyToType, A' +
        'utoFilling,'
      '              UseCode, OurFiling, ApplTypeDate,'
      
        '              ServCost, ServCostVal, E.ParentId, E.CntrEmbassyId' +
        ','
      
        '              Ci.Name CityName, FilingPlaceWork, FullFunding, TY' +
        'PEFUNDING, E.Comments'
      '            from CntrEmbassies E'
      '            left join Companies Co on Co.CompanyId = E.EmbassyId'
      
        '            left join CompOffices Cof on Cof.CompanyId = Co.Comp' +
        'anyId and Cof.IsDefault = '#39'T'#39
      
        '            left join city_adm_unit Ci on Ci.Id = Cof.ID_CITY_AD' +
        'M_UNIT'
      
        '          where E.ParentId = :CntrEmbassyId and (E.NotUsed is nu' +
        'll or (E.NotUsed = '#39'F'#39'))'
      'order by Co.Name')
    Left = 835
    Top = 12
    object SelVisaCentersQryEMBASSYNAME: TStringField
      FieldName = 'EMBASSYNAME'
      Size = 100
    end
    object SelVisaCentersQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object SelVisaCentersQryCntrEmbassyId: TIntegerField
      FieldName = 'CntrEmbassyId'
    end
    object SelVisaCentersQryITSKONSUL: TStringField
      FieldName = 'ITSKONSUL'
      Size = 80
    end
    object SelVisaCentersQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object SelVisaCentersQryFUNDINGSUM: TFloatField
      FieldName = 'FUNDINGSUM'
    end
    object SelVisaCentersQryFUNDINGVAL: TSmallintField
      FieldName = 'FUNDINGVAL'
    end
    object SelVisaCentersQryFUNDINGCOUNT: TIntegerField
      FieldName = 'FUNDINGCOUNT'
    end
    object SelVisaCentersQryFUNDINGPERIOD: TSmallintField
      FieldName = 'FUNDINGPERIOD'
    end
    object SelVisaCentersQryBANKSUM: TFloatField
      FieldName = 'BANKSUM'
    end
    object SelVisaCentersQryBANKVAL: TSmallintField
      FieldName = 'BANKVAL'
    end
    object SelVisaCentersQryBANKCOUNT: TIntegerField
      FieldName = 'BANKCOUNT'
    end
    object SelVisaCentersQryBANKPERIOD: TSmallintField
      FieldName = 'BANKPERIOD'
    end
    object SelVisaCentersQryPERMTRANSFDOC: TSmallintField
      FieldName = 'PERMTRANSFDOC'
    end
    object SelVisaCentersQryONTOURSUM: TFloatField
      FieldName = 'ONTOURSUM'
    end
    object SelVisaCentersQryPAYBANKSERV: TFloatField
      FieldName = 'PAYBANKSERV'
    end
    object SelVisaCentersQryCURRSERV: TSmallintField
      FieldName = 'CURRSERV'
    end
    object SelVisaCentersQryREADYTODAYS: TIntegerField
      FieldName = 'READYTODAYS'
    end
    object SelVisaCentersQryREADYTOTYPE: TIntegerField
      FieldName = 'READYTOTYPE'
    end
    object SelVisaCentersQryAUTOFILLING: TStringField
      FieldName = 'AUTOFILLING'
      Size = 1
    end
    object SelVisaCentersQryUSECODE: TStringField
      FieldName = 'USECODE'
      Size = 1
    end
    object SelVisaCentersQryOURFILING: TStringField
      FieldName = 'OURFILING'
      Size = 1
    end
    object SelVisaCentersQryAPPLTYPEDATE: TIntegerField
      FieldName = 'APPLTYPEDATE'
    end
    object SelVisaCentersQrySERVCOST: TFloatField
      FieldName = 'SERVCOST'
    end
    object SelVisaCentersQrySERVCOSTVAL: TSmallintField
      FieldName = 'SERVCOSTVAL'
    end
    object SelVisaCentersQryPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object SelVisaCentersQryCalcEmbassyName: TStringField
      DisplayLabel = #1055#1055#1042#1040
      FieldKind = fkCalculated
      FieldName = 'CalcEmbassyName'
      Size = 250
      Calculated = True
    end
    object SelVisaCentersQryCalcPayBank: TStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldKind = fkCalculated
      FieldName = 'CalcPayBank'
      Calculated = True
    end
    object SelVisaCentersQryCalcServCost: TStringField
      DisplayLabel = ' '
      FieldKind = fkCalculated
      FieldName = 'CalcServCost'
      Calculated = True
    end
    object SelVisaCentersQryCITYNAME: TStringField
      FieldName = 'CITYNAME'
      Size = 190
    end
    object SelVisaCentersQryFILINGPLACEWORK: TStringField
      FieldName = 'FILINGPLACEWORK'
      Size = 1
    end
    object SelVisaCentersQryCalcReadyToDay: TStringField
      DisplayLabel = #1056#1086#1079#1075#1083#1103#1076
      FieldKind = fkCalculated
      FieldName = 'CalcReadyToDay'
      Size = 50
      Calculated = True
    end
    object SelVisaCentersQryFULLFUNDING: TStringField
      FieldName = 'FULLFUNDING'
      Size = 1
    end
    object SelVisaCentersQryTYPEFUNDING: TIntegerField
      FieldName = 'TYPEFUNDING'
    end
    object SelVisaCentersQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object SelPartnerSrc: TDataSource
    DataSet = SelPartnersQry
    Left = 830
    Top = 157
  end
  object OneTypeDocQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnCalcFields = OneTypeDocQryCalcFields
    DataSource = ItsDocumVisaListSrc
    Parameters = <
      item
        Name = 'VisaDocumentId'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'EmbassyId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CountryId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'SameTypeDocId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'SetOfDocument'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ''
      '   select D.VISADOCUMENTID,'
      '         N.name DocName, NT.NAME TypeName, G.GroupName,'
      
        '         D.IsUse, sG.name SubGroupName, D.ForInd, D.ForAddManual' +
        ','
      '         D.Returned, D.Transmit, P.name Posada,'
      '         D.AgeRestriction, D.MarriedState,'
      '         D.ExpireMonths, D.IssuedMonths,'
      '         D.ExpirePeriod, D.IssuesPeriod,'
      '         D.DocForLastCount, D.DocForLastPeriod,'
      '         D.Summa, D.Funding, D.NeedCount, N.shortname,'
      '         D.BeginDoc, T.DocId, D.SetOfDocument, D.SAMETYPEDOCID'
      '    from VisaDocuments_New D'
      '    left join VisaTypeDocs T on T.VisaTypeDocId = D.TypeDocId'
      '    left join VISADOCTYPE NT on NT.id = T.TypeId'
      '    left join VISADOC N on N.id = T.DocId'
      '    left join Posada P on P.id = D.Posada'
      
        '    left join VisaDocGroups_View G on G.VisaDocGroupId = D.VisaD' +
        'ocGroupId'
      '    left join VISASUBGROUPDOC sG on sG.id = D.SubGroupId'
      '  '
      ' where D.VisaDocumentId <> :VisaDocumentId'
      '     and D.EmbassyId = :EmbassyId and D.CountryId = :CountryId'
      
        '     and ((D.SameTypeDocId = :SameTypeDocId) or (D.SetOfDocument' +
        ' = :SetOfDocument))')
    Left = 1079
    Top = 14
    object OneTypeDocQryDOCNAME: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'DOCNAME'
      Size = 75
    end
    object OneTypeDocQryTYPENAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      FieldName = 'TYPENAME'
      Size = 75
    end
    object OneTypeDocQryISUSE: TStringField
      FieldName = 'ISUSE'
      Size = 1
    end
    object OneTypeDocQryNEEDCOUNT: TIntegerField
      DisplayLabel = #1050#1110#1083#1100#1082'.'
      FieldName = 'NEEDCOUNT'
      DisplayFormat = '##'
    end
    object OneTypeDocQryMARRIEDSTATE: TIntegerField
      DisplayLabel = #1057#1110#1084#1077#1081#1085#1080#1081' '#1089#1090#1072#1085
      FieldName = 'MARRIEDSTATE'
    end
    object OneTypeDocQryAGERESTRICTION: TIntegerField
      DisplayLabel = #1055#1086' '#1074#1110#1082#1091
      FieldName = 'AGERESTRICTION'
    end
    object OneTypeDocQryCalcExpireMonths: TStringField
      DisplayLabel = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
      FieldKind = fkCalculated
      FieldName = 'CalcExpireMonths'
      Calculated = True
    end
    object OneTypeDocQryCalcIssuedMonths: TStringField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1080#1076#1072#1095#1110
      FieldKind = fkCalculated
      FieldName = 'CalcIssuedMonths'
      Calculated = True
    end
    object OneTypeDocQryCalcAgeRestr: TStringField
      DisplayLabel = #1055#1086' '#1074#1110#1082#1091
      FieldKind = fkCalculated
      FieldName = 'CalcAgeRestr'
      Size = 15
      Calculated = True
    end
    object OneTypeDocQryFORIND: TStringField
      DisplayLabel = #1030#1085#1076'.'
      FieldName = 'FORIND'
      Size = 1
    end
    object OneTypeDocQryFORADDMANUAL: TStringField
      DisplayLabel = #1042#1088#1091#1095#1085#1091
      FieldName = 'FORADDMANUAL'
      Size = 1
    end
    object OneTypeDocQryPOSADA: TStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1072
      FieldName = 'POSADA'
      Size = 75
    end
    object OneTypeDocQryCalcMarried: TStringField
      DisplayLabel = #1057#1110#1084#1077#1081#1085'. '#1089#1090#1072#1085
      FieldKind = fkCalculated
      FieldName = 'CalcMarried'
      Calculated = True
    end
    object OneTypeDocQryRETURNED: TStringField
      DisplayLabel = #1055#1086#1074#1077#1088#1085#1077#1085#1085#1103' '#1090#1091#1088#1080#1089#1090#1091
      FieldName = 'RETURNED'
      Size = 1
    end
    object OneTypeDocQryCalcSum: TStringField
      DisplayLabel = #1057#1091#1084#1072
      FieldKind = fkCalculated
      FieldName = 'CalcSum'
      Size = 80
      Calculated = True
    end
    object OneTypeDocQryTRANSMIT: TStringField
      DisplayLabel = #1053#1077' '#1087#1077#1088#1077#1076#1072#1074#1072#1090#1080' '#1074' '#1082#1086#1085#1089#1091#1083#1100#1089#1090#1074#1086
      FieldName = 'TRANSMIT'
      Size = 1
    end
    object OneTypeDocQryBEGINDOC: TStringField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
      FieldName = 'BEGINDOC'
      Size = 1
    end
    object OneTypeDocQryDOCFORLASTCOUNT: TIntegerField
      FieldName = 'DOCFORLASTCOUNT'
    end
    object OneTypeDocQryDOCFORLASTPERIOD: TIntegerField
      FieldName = 'DOCFORLASTPERIOD'
    end
    object OneTypeDocQryCalcDocForLast: TStringField
      DisplayLabel = #1058#1088#1080#1074#1072#1083#1110#1089#1090#1100
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CalcDocForLast'
      Calculated = True
    end
    object OneTypeDocQryGROUPNAME: TStringField
      DisplayLabel = #1043#1088#1091#1087#1072
      FieldName = 'GROUPNAME'
      Size = 30
    end
    object OneTypeDocQryEXPIREMONTHS: TIntegerField
      DisplayLabel = #1058#1077#1088#1084#1110#1085
      FieldName = 'EXPIREMONTHS'
    end
    object OneTypeDocQryISSUEDMONTHS: TIntegerField
      DisplayLabel = #1044#1072#1074#1085#1110#1089#1090#1100
      FieldName = 'ISSUEDMONTHS'
    end
    object OneTypeDocQryEXPIREPERIOD: TIntegerField
      FieldName = 'EXPIREPERIOD'
    end
    object OneTypeDocQryISSUESPERIOD: TIntegerField
      FieldName = 'ISSUESPERIOD'
    end
    object OneTypeDocQrySUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object OneTypeDocQryFUNDING: TStringField
      FieldName = 'FUNDING'
      Size = 1
    end
    object OneTypeDocQrySHORTNAME: TStringField
      DisplayLabel = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
      FieldName = 'SHORTNAME'
      Size = 10
    end
    object OneTypeDocQrySUBGROUPNAME: TStringField
      FieldName = 'SUBGROUPNAME'
      Size = 75
    end
    object OneTypeDocQryDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object OneTypeDocQrySETOFDOCUMENT: TIntegerField
      DisplayLabel = #1053#1072#1073#1110#1088
      FieldName = 'SETOFDOCUMENT'
    end
    object OneTypeDocQrySAMETYPEDOCID: TIntegerField
      FieldName = 'SAMETYPEDOCID'
    end
    object OneTypeDocQryCalcSameTypeDoc: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcSameTypeDoc'
      Size = 10
      Calculated = True
    end
    object OneTypeDocQryVISADOCUMENTID: TIntegerField
      FieldName = 'VISADOCUMENTID'
      Origin = '"VISADOCUMENTS_NEW"."VISADOCUMENTID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object OneTypeDocSrc: TDataSource
    DataSet = OneTypeDocQry
    Left = 1079
    Top = 66
  end
  object ADOConnection_: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True' +
      ';User ID=SYSDBA;Extended Properties="Driver=Firebird/InterBase(r' +
      ') driver;Dbname=troll:D:\_Apollo\_TOURIB_TEST.GDB;PWD=masterkey;' +
      'UID=SYSDBA;"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 1231
    Top = 12
  end
  object AnketTempSrc: TDataSource
    DataSet = AnketTempQry
    Left = 44
    Top = 54
  end
  object MemDataAddresHistory: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 1234
    Top = 496
    object MemDataAddresHistoryID: TIntegerField
      FieldName = 'ID'
    end
    object MemDataAddresHistoryKindStreet: TIntegerField
      FieldName = 'KindStreet'
    end
    object MemDataAddresHistoryStreetName: TStringField
      FieldName = 'StreetName'
      Size = 100
    end
    object MemDataAddresHistoryBuilding: TStringField
      FieldName = 'Building'
      Size = 10
    end
    object MemDataAddresHistoryOffice: TStringField
      FieldName = 'Office'
      Size = 10
    end
    object MemDataAddresHistoryCityId: TIntegerField
      FieldName = 'CityId'
    end
    object MemDataAddresHistoryProvinceId: TIntegerField
      FieldName = 'ProvinceId'
    end
  end
  object NotesQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = CompanySrc
    Parameters = <
      item
        Name = 'CompanyId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * From CompNotes Where CompanyId = :CompanyId')
    Left = 1053
    Top = 551
    object NotesQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object NotesQryCOMPNOTEID: TIntegerField
      FieldName = 'COMPNOTEID'
    end
    object NotesQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object NotesQryDELETED: TStringField
      FieldName = 'DELETED'
      Size = 1
    end
    object NotesQryADDDATE: TDateTimeField
      FieldName = 'ADDDATE'
    end
    object NotesQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
    object NotesQryDELDATE: TDateTimeField
      FieldName = 'DELDATE'
    end
    object NotesQryDELMANID: TIntegerField
      FieldName = 'DELMANID'
    end
    object NotesQryTYPENOTE: TIntegerField
      FieldName = 'TYPENOTE'
    end
    object NotesQryCATEGORYNOTE: TSmallintField
      FieldName = 'CATEGORYNOTE'
    end
    object NotesQryNDATE: TDateTimeField
      FieldName = 'NDATE'
    end
    object NotesQryREPORTDATE: TDateTimeField
      FieldName = 'REPORTDATE'
    end
    object NotesQryREPORTSENDPR: TStringField
      FieldName = 'REPORTSENDPR'
      Size = 1
    end
    object NotesQryREPORTSENDBOSS: TStringField
      FieldName = 'REPORTSENDBOSS'
      Size = 1
    end
  end
  object NotesSrc: TDataSource
    DataSet = NotesQry
    Left = 1053
    Top = 597
  end
  object COMPANIES_PARAM_DATA: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    AfterOpen = CompanyQryAfterOpen
    DataSource = CompanySrc
    Parameters = <
      item
        Name = 'COMPANYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select COMPANIES_PARAM_DATA.*,COMPANIES_PARAM_NAME.name, COMPANI' +
        'ES_PARAM_NAME.atype from COMPANIES_PARAM_DATA'
      
        'left join  COMPANIES_PARAM_NAME on COMPANIES_PARAM_NAME.id = COM' +
        'PANIES_PARAM_DATA.id_companies_param_name where ID_COMPANIES =:C' +
        'OMPANYID')
    Left = 728
    Top = 163
    object COMPANIES_PARAM_DATAID: TIntegerField
      FieldName = 'ID'
    end
    object COMPANIES_PARAM_DATAID_COMPANIES: TIntegerField
      FieldName = 'ID_COMPANIES'
    end
    object COMPANIES_PARAM_DATAID_COMPANIES_PARAM_NAME: TIntegerField
      FieldName = 'ID_COMPANIES_PARAM_NAME'
    end
    object COMPANIES_PARAM_DATAAVALUE: TIntegerField
      FieldName = 'AVALUE'
    end
    object COMPANIES_PARAM_DATANAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object COMPANIES_PARAM_DATAATYPE: TIntegerField
      FieldName = 'ATYPE'
    end
  end
  object COMPANIES_PARAM_DATASrc: TDataSource
    DataSet = COMPANIES_PARAM_DATA
    Left = 728
    Top = 212
  end
  object SelTradeNameSrc: TDataSource
    DataSet = SelTradeNameQry
    Left = 512
    Top = 408
  end
  object SelTradeNameQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * From TRADENAMES')
    Left = 512
    Top = 360
    object SelTradeNameQryTRADENAMEID: TIntegerField
      FieldName = 'TRADENAMEID'
    end
    object SelTradeNameQryTRADENAME: TStringField
      FieldName = 'TRADENAME'
      Size = 150
    end
    object SelTradeNameQryAGENCYLOGO: TStringField
      FieldName = 'AGENCYLOGO'
      Size = 30
    end
    object SelTradeNameQryPEYMTOAGENCY: TStringField
      FieldName = 'PEYMTOAGENCY'
      Size = 1
    end
    object SelTradeNameQryISNETAGENCY: TStringField
      FieldName = 'ISNETAGENCY'
      Size = 1
    end
    object SelTradeNameQryEMAILID: TIntegerField
      FieldName = 'EMAILID'
    end
    object SelTradeNameQryNOINCLUDEAGENTTOBILL: TStringField
      FieldName = 'NOINCLUDEAGENTTOBILL'
      Size = 1
    end
  end
  object SelCompanyByTradeNameQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = SelTradeNameSrc
    Parameters = <
      item
        Name = 'TradeNameId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select CompanyId, Name CompanyName, ISHEADOFFICE'
      'From Companies'
      'Where TradeNameId = :TradeNameId'
      'Order By Name ')
    Left = 392
    Top = 360
    object SelCompanyByTradeNameQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object SelCompanyByTradeNameQryCOMPANYNAME: TStringField
      FieldName = 'COMPANYNAME'
      Size = 100
    end
    object SelCompanyByTradeNameQryISHEADOFFICE: TStringField
      FieldName = 'ISHEADOFFICE'
      Size = 1
    end
  end
  object SelCompanyByTradeNameSrc: TDataSource
    DataSet = SelCompanyByTradeNameQry
    Left = 392
    Top = 408
  end
  object SelHeadDataQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = CompanySrc
    Parameters = <
      item
        Name = 'CompanyId'
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'Select D.TaxSystemId TAXPAYSTATEID, L.TaxDetailId, L.SINGLETAXTY' +
        'PEID, L.FromDate SINGLETAXDATE,'
      '    L.TAXPAYCODE, L.TAXPAYTYPEID, L.TAXPAYREGDATE,'
      
        '    WARRANTYSUM, WARRANTYTERM, LICENSEDATE, LICENSENO, WARRANTYV' +
        'AL, LICENSETERMIN, Name, TradeNameId'
      'from Companies C'
      
        'left join CompTaxSystemLog L on L.CompanyId = C.CompanyId and L.' +
        'FromDate < '#39'NOW'#39
      '  and ((L.ToDate >= '#39'NOW'#39') or L.ToDate is null)'
      'left join TaxSystemDetails D on D.TaxDetailId = L.TaxDetailId'
      'where C.CompanyId = :CompanyId')
    Left = 832
    Top = 200
    object SelHeadDataQryTAXPAYSTATEID: TIntegerField
      FieldName = 'TAXPAYSTATEID'
    end
    object SelHeadDataQryTAXDETAILID: TIntegerField
      FieldName = 'TAXDETAILID'
    end
    object SelHeadDataQrySINGLETAXTYPEID: TIntegerField
      FieldName = 'SINGLETAXTYPEID'
    end
    object SelHeadDataQrySINGLETAXDATE: TDateTimeField
      FieldName = 'SINGLETAXDATE'
    end
    object SelHeadDataQryTAXPAYCODE: TStringField
      FieldName = 'TAXPAYCODE'
      Size = 12
    end
    object SelHeadDataQryTAXPAYTYPEID: TIntegerField
      FieldName = 'TAXPAYTYPEID'
    end
    object SelHeadDataQryTAXPAYREGDATE: TDateTimeField
      FieldName = 'TAXPAYREGDATE'
    end
    object SelHeadDataQryWARRANTYSUM: TFloatField
      FieldName = 'WARRANTYSUM'
    end
    object SelHeadDataQryWARRANTYTERM: TDateTimeField
      FieldName = 'WARRANTYTERM'
    end
    object SelHeadDataQryLICENSEDATE: TDateTimeField
      FieldName = 'LICENSEDATE'
    end
    object SelHeadDataQryLICENSENO: TStringField
      FieldName = 'LICENSENO'
      Size = 8
    end
    object SelHeadDataQryWARRANTYVAL: TIntegerField
      FieldName = 'WARRANTYVAL'
    end
    object SelHeadDataQryLICENSETERMIN: TStringField
      FieldName = 'LICENSETERMIN'
      Size = 1
    end
    object SelHeadDataQryNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object SelHeadDataQryTRADENAMEID: TIntegerField
      FieldName = 'TRADENAMEID'
    end
  end
  object ExistCompQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnCalcFields = ExistCompQryCalcFields
    Parameters = <
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'CompanyId'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select C.CompanyId, Tr.TradeName ,  C.Name  , C.CompKind from Co' +
        'mpanies C'
      'left join TradeNames Tr on Tr.TradeNameId = C.TradeNameId'
      
        'where ((LoCase(C.Name) like :Name) or (LoCase(Tr.TradeName) like' +
        ' :Name)) and C.CompanyId <> :CompanyId')
    Left = 834
    Top = 256
    object ExistCompQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object ExistCompQryTRADENAME: TStringField
      FieldName = 'TRADENAME'
      Size = 150
    end
    object ExistCompQryNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object ExistCompQryCOMPKIND: TStringField
      FieldName = 'COMPKIND'
      Size = 40
    end
    object ExistCompQryCalcName: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcName'
      Size = 500
      Calculated = True
    end
  end
  object ExistCompSrc: TDataSource
    DataSet = ExistCompQry
    Left = 834
    Top = 304
  end
  object ExistOfficeQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = ExistCompSrc
    Parameters = <
      item
        Name = 'CompanyId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select O.officeid, O.isdefault, o.HOUSE,o.TENEMENT, ( Select FIR' +
        'ST 1 NAME FROM CITY_PATH_PROC( O.id_city_adm_unit, null,0, 448 )' +
        ' ) ADDRESS, N.Name as Country'
      'from CompOffices O'
      ' left join Countries N on N.CountryId = O.CountryId'
      'where O.CompanyId = :CompanyId')
    Left = 922
    Top = 256
    object ExistOfficeQryOFFICEID: TIntegerField
      FieldName = 'OFFICEID'
    end
    object ExistOfficeQryISDEFAULT: TStringField
      FieldName = 'ISDEFAULT'
      Size = 1
    end
    object ExistOfficeQryADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 35
    end
    object ExistOfficeQryCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object ExistOfficeQryHOUSE: TStringField
      FieldName = 'HOUSE'
      Size = 7
    end
    object ExistOfficeQryTENEMENT: TStringField
      FieldName = 'TENEMENT'
      Size = 5
    end
  end
  object ExistOfficeQrySrc: TDataSource
    DataSet = ExistOfficeQry
    Left = 922
    Top = 304
  end
  object CompanyNotesSrc: TDataSource
    DataSet = CompanyNotesQry
    Left = 1152
    Top = 600
  end
  object CompanyNotesQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnCalcFields = CompanyNotesQryCalcFields
    DataSource = CompanySrc
    Parameters = <
      item
        Name = 'CompanyId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select N.CompanyId, N.CompanyNoteId, N.Memo, '
      '  N.AddDate, M.Manager as AddManager,'
      '  N.VIP, N.BlackList'
      'from CompanyNotes N'
      '  left join TmUser_view M on M.TmUserId = N.AddManId'
      'where CompanyId = :CompanyId')
    Left = 1152
    Top = 552
    object CompanyNotesQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object CompanyNotesQryCOMPANYNOTEID: TIntegerField
      FieldName = 'COMPANYNOTEID'
    end
    object CompanyNotesQryCalcStatusNote: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcStatusNote'
      Size = 100
      Calculated = True
    end
    object CompanyNotesQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object CompanyNotesQryADDDATE: TDateTimeField
      FieldName = 'ADDDATE'
    end
    object CompanyNotesQryADDMANAGER: TStringField
      FieldName = 'ADDMANAGER'
      Size = 35
    end
    object CompanyNotesQryVIP: TStringField
      FieldName = 'VIP'
      Size = 1
    end
    object CompanyNotesQryBLACKLIST: TStringField
      FieldName = 'BLACKLIST'
      Size = 1
    end
  end
  object SelTaxSystemSrc: TDataSource
    DataSet = SelTaxSystemQry
    Left = 1074
    Top = 160
  end
  object ImportLogQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'HOTELID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select L.*, U.Manager'
      'from IMPORTHOTELLOG L'
      'left join TmUser_View U on U.tmuserid = L.Managerid'
      'where HOTELID = :HOTELID')
    Left = 52
    Top = 216
    object ImportLogQryLOGID: TIntegerField
      FieldName = 'LOGID'
    end
    object ImportLogQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
    end
    object ImportLogQryMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
    end
    object ImportLogQryIMPORTDATE: TDateTimeField
      FieldName = 'IMPORTDATE'
    end
    object ImportLogQryWEBSITE: TStringField
      FieldName = 'WEBSITE'
      Size = 250
    end
    object ImportLogQryMANAGER: TStringField
      FieldName = 'MANAGER'
      Size = 35
    end
  end
  object ImportLogSrc: TDataSource
    DataSet = ImportLogQry
    Left = 52
    Top = 264
  end
  object BrDriveSrc: TDataSource
    DataSet = BrDriveQry
    Left = 243
    Top = 301
  end
  object BrDriveQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = DMServDic.BrDrvKindSrc
    Parameters = <
      item
        Name = 'DRIVEKIND'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select D.*, K.Kind, V.name ClassName, Vend.vendorid, C.name Vend' +
        'orName'
      'from Drive D'
      'left join DrvKinds K on K.DriveKind = D.DriveKind'
      'left join DriveEuroClass V on V.id = D.EuroClass'
      'left join DrvVendors Vend on Vend.driveid = D.driveid'
      'left join Companies C on Vend.vendorid = C.companyid'
      'where  D.DRIVEKIND = :DRIVEKIND'
      'order by K.Kind, D.Model')
    Left = 240
    Top = 255
    object BrDriveQryDRIVEKIND: TIntegerField
      FieldName = 'DRIVEKIND'
    end
    object BrDriveQryDRIVEID: TIntegerField
      FieldName = 'DRIVEID'
    end
    object BrDriveQryMODEL: TStringField
      DisplayLabel = #1052#1072#1088#1082#1072', '#1084#1086#1076#1077#1083#1100
      FieldName = 'MODEL'
      Size = 15
    end
    object BrDriveQryPLACECOUNT: TSmallintField
      DisplayLabel = #1052#1110#1089#1085#1110#1089#1090#1100
      FieldName = 'PLACECOUNT'
    end
    object BrDriveQryFLOORS: TSmallintField
      DisplayLabel = #1055#1086#1074#1077#1088#1093'.'
      FieldName = 'FLOORS'
    end
    object BrDriveQryPLACEMAPNO: TSmallintField
      FieldName = 'PLACEMAPNO'
    end
    object BrDriveQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object BrDriveQryKIND: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1091
      FieldName = 'KIND'
      Size = 15
    end
    object BrDriveQryDRIVENO: TStringField
      Alignment = taCenter
      DisplayLabel = #1056#1077#1108#1089#1090#1088'.'#8470
      FieldName = 'DRIVENO'
      Size = 10
    end
    object BrDriveQryISPROTO: TStringField
      FieldName = 'ISPROTO'
      Size = 1
    end
    object BrDriveQryREGCOUNTRY: TIntegerField
      FieldName = 'REGCOUNTRY'
    end
    object BrDriveQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
    object BrDriveQryYEARBUS: TIntegerField
      DisplayLabel = #1056#1110#1082' '#1074#1080#1087#1091#1089#1082#1091
      FieldName = 'YEARBUS'
    end
    object BrDriveQryEUROCLASS: TIntegerField
      FieldName = 'EUROCLASS'
    end
    object BrDriveQryCLASSNAME: TStringField
      DisplayLabel = #1044#1074#1080#1075#1091#1085
      FieldName = 'CLASSNAME'
      Size = 75
    end
    object BrDriveQryDISABLED: TStringField
      FieldName = 'DISABLED'
      Size = 1
    end
    object BrDriveQryLookDriveKind: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDriveKind'
      LookupDataSet = DMServDic.BrDrvKindQry
      LookupKeyFields = 'DRIVEKIND'
      LookupResultField = 'KIND'
      KeyFields = 'DRIVEKIND'
      LookupCache = True
      Size = 100
      Lookup = True
    end
    object BrDriveQryVENDORNAME: TStringField
      FieldName = 'VENDORNAME'
      Size = 100
    end
    object BrDriveQryVENDORID: TIntegerField
      FieldName = 'VENDORID'
    end
  end
  object GridRepositoryScanDoc: TcxGridViewRepository
    Left = 1232
    Top = 176
    object ViewCompanyDocs: TcxGridDBTableView
      DataController.DataSource = CompanyDocsSrc
      DataController.KeyFieldNames = 'DOCID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.FocusRect = False
      OptionsView.NoDataToDisplayInfoText = '  '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLineColor = clSilver
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 18
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewCompanyDocsDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'DOCID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCompanyDocsDOCNAME: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'DOCNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 459
      end
      object ViewCompanyDocsCalcFilaCount: TcxGridDBColumn
        Caption = #1050'-'#1089#1090#1100' '#1092#1072#1081#1083#1110#1074
        DataBinding.FieldName = 'CalcFileCount'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 84
        Options.HorzSizing = False
        Width = 84
      end
      object ViewCompanyDocsCATEGORYID: TcxGridDBColumn
        DataBinding.FieldName = 'CATEGORYID'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
      end
    end
    object ViewFiles: TcxGridDBTableView
      DataController.KeyFieldNames = 'RecId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.FocusRect = False
      OptionsView.NoDataToDisplayInfoText = '  '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLineColor = clSilver
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewFilesRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewFilesFileName: TcxGridDBColumn
        Caption = #1030#1084#39#1103
        DataBinding.FieldName = 'FileName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 323
      end
      object ViewFilesFileDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FileDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.SaveTime = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 105
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 105
      end
      object ViewFilesFileSize: TcxGridDBColumn
        Caption = #1056#1086#1079#1084#1110#1088
        DataBinding.FieldName = 'FileSize'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 70
      end
      object ViewFilesFileType: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'FileType'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 175
      end
      object ViewFilesFilePath: TcxGridDBColumn
        DataBinding.FieldName = 'FilePath'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewFilesFileOpt: TcxGridDBColumn
        DataBinding.FieldName = 'FileOpt'
        Visible = False
      end
      object ViewFilesICON: TcxGridDBColumn
        DataBinding.FieldName = 'ICON'
        Visible = False
      end
    end
    object ViewDictSection: TcxGridDBTableView
      DataController.DataSource = DictSectSrc
      DataController.KeyFieldNames = 'DICTSECTIONID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewDictSectionDICTSECTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'DICTSECTIONID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
      end
      object ViewDictSectionSECTIONNAME: TcxGridDBColumn
        Caption = #1057#1077#1082#1094#1110#1103
        DataBinding.FieldName = 'SECTIONNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Width = 378
      end
      object ViewDictSectionSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
      end
      object ViewDictSectionLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
      end
      object ViewDictSectionKEYNAME: TcxGridDBColumn
        Caption = 'Key ('#1042#1077#1073')'
        DataBinding.FieldName = 'KEYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.HorzSizing = False
        Width = 100
      end
      object ViewDictSectionCOMMENTS: TcxGridDBColumn
        Tag = 100
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Width = 306
      end
    end
    object ViewDictSectionItem: TcxGridDBTableView
      DataController.DataSource = DictSect_ItemSrc
      DataController.KeyFieldNames = 'ITEMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewDictSectionItemITENID: TcxGridDBColumn
        DataBinding.FieldName = 'ITEMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDictSectionItemITEMNAME: TcxGridDBColumn
        Caption = #1055#1091#1085#1082#1090
        DataBinding.FieldName = 'ITEMNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 420
      end
      object ViewDictSectionItemDICTSECTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'DICTSECTIONID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDictSectionItemLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
      end
      object ViewDictSectionItemSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
      end
      object ViewDictSectionItemKEYNAME: TcxGridDBColumn
        Caption = 'Key ('#1042#1077#1073')'
        DataBinding.FieldName = 'KEYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.HorzSizing = False
        Width = 100
      end
      object ViewDictSectionItemCOMMENTS: TcxGridDBColumn
        Tag = 100
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 264
      end
    end
    object ViewDicSectionList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DictSectSrc
      DataController.KeyFieldNames = 'DICTSECTIONID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewDicSectionListDICTSECTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'DICTSECTIONID'
        Visible = False
      end
      object ViewDicSectionListSECTIONNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SECTIONNAME'
      end
      object ViewDicSectionListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
      end
      object ViewDicSectionListSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
      end
      object ViewDicSectionListLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
      end
    end
    object ViewDicSectionItemsList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DictSect_ItemSrc
      DataController.KeyFieldNames = 'ITEMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewDicSectionItemsListITEMID: TcxGridDBColumn
        DataBinding.FieldName = 'ITEMID'
        Visible = False
      end
      object ViewDicSectionItemsListITEMNAME: TcxGridDBColumn
        DataBinding.FieldName = 'ITEMNAME'
      end
      object ViewDicSectionItemsListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
      end
      object ViewDicSectionItemsListDICTSECTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'DICTSECTIONID'
        Visible = False
      end
      object ViewDicSectionItemsListLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
      end
      object ViewDicSectionItemsListSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
      end
    end
  end
  object DictSectQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DICTSECTIONS')
    Left = 1003
    Top = 256
    object DictSectQryDICTSECTIONID: TIntegerField
      FieldName = 'DICTSECTIONID'
      Origin = '"DICTSECTIONS"."DICTSECTIONID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DictSectQrySECTIONNAME: TIBStringField
      FieldName = 'SECTIONNAME'
      Origin = '"DICTSECTIONS"."SECTIONNAME"'
      Size = 250
    end
    object DictSectQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      Origin = '"DICTSECTIONS"."COMMENTS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object DictSectQrySMALLICON: TBlobField
      FieldName = 'SMALLICON'
      Origin = '"DICTSECTIONS"."SMALLICON"'
      ProviderFlags = [pfInUpdate]
    end
    object DictSectQryLARGEICON: TBlobField
      FieldName = 'LARGEICON'
      Origin = '"DICTSECTIONS"."LARGEICON"'
      ProviderFlags = [pfInUpdate]
    end
    object DictSectQryKEYNAME: TStringField
      FieldName = 'KEYNAME'
      Required = True
      Size = 10
    end
  end
  object DictSectSrc: TDataSource
    DataSet = DictSectQry
    Left = 1003
    Top = 306
  end
  object DictSect_ItemQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = DictSectSrc
    Parameters = <
      item
        Name = 'DICTSECTIONID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from DICTSECTION_ITEMS '
      'where DictSectionId = :DictSectionId')
    Left = 1093
    Top = 255
    object DictSect_ItemQryITEMID: TIntegerField
      FieldName = 'ITEMID'
      Origin = '"DICTSECTION_ITEMS"."ITENID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DictSect_ItemQryITEMNAME: TIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'ITEMNAME'
      Origin = '"DICTSECTION_ITEMS"."ITEMNAME"'
      Size = 25
    end
    object DictSect_ItemQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      Origin = '"DICTSECTION_ITEMS"."COMMENTS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object DictSect_ItemQryDICTSECTIONID: TIntegerField
      FieldName = 'DICTSECTIONID'
      Origin = '"DICTSECTION_ITEMS"."DICTSECTIONID"'
    end
    object DictSect_ItemQryLARGEICON: TBlobField
      FieldName = 'LARGEICON'
      Origin = '"DICTSECTION_ITEM_SEL_PROC"."LARGEICON"'
      ProviderFlags = [pfInUpdate]
    end
    object DictSect_ItemQrySMALLICON: TBlobField
      FieldName = 'SMALLICON'
      Origin = '"DICTSECTION_ITEM_SEL_PROC"."SMALLICON"'
      ProviderFlags = [pfInUpdate]
    end
    object DictSect_ItemQryKEYNAME: TStringField
      FieldName = 'KEYNAME'
      Required = True
      Size = 10
    end
  end
  object DictSect_ItemSrc: TDataSource
    DataSet = DictSect_ItemQry
    Left = 1093
    Top = 305
  end
  object DrvSrvLnkSrc: TDataSource
    DataSet = DrvSrvLnkQry
    Left = 310
    Top = 300
  end
  object SelCountryObjectLinksQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'objectid'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'typeobj'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select distinct ObjectLinks.countryid, COUNTRIES.name COUNTRINAM' +
        'E'
      'from ObjectLinks'
      
        'left join COUNTRIES on COUNTRIES.countryid = ObjectLinks.country' +
        'id'
      
        'where ObjectLinks.objectid = :objectid and ObjectLinks.typeobj =' +
        ' :typeobj')
    Left = 241
    Top = 464
    object SelCountryObjectLinksQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object SelCountryObjectLinksQryCOUNTRINAME: TStringField
      FieldName = 'COUNTRINAME'
      Size = 30
    end
  end
  object SelCountryObjectLinksSrc: TDataSource
    DataSet = SelCountryObjectLinksQry
    Left = 241
    Top = 512
  end
  object VisaDocumentsSrc: TDataSource
    DataSet = AllDocQry
    Left = 136
    Top = 64
  end
  object CompContractNumsQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnNewRecord = ContractQryNewRecord
    Parameters = <
      item
        Name = 'ContractDate'
        DataType = ftDateTime
        NumericScale = 4
        Precision = 24
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from CompContractNums where ContractDate=:ContractDate')
    Left = 242
    Top = 568
    object CompContractNumsQryCOMPCONTRACTNUMID: TIntegerField
      FieldName = 'COMPCONTRACTNUMID'
    end
    object CompContractNumsQryCONTRACTDATE: TDateTimeField
      FieldName = 'CONTRACTDATE'
    end
    object CompContractNumsQryCONTRACTNUM: TIntegerField
      FieldName = 'CONTRACTNUM'
    end
  end
  object CompContractNumsSrc: TDataSource
    DataSet = CompContractNumsQry
    Left = 244
    Top = 616
  end
  object SelCntrTemplQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ContractId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ContractType'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select Pp.RDB$DESCRIPTION DESCRIPT, T.*'
      '     from ContractTemplates T'
      
        '     LEFT OUTER JOIN RDB$PROCEDURE_PARAMETERS Pp ON Pp.RDB$PROCE' +
        'DURE_NAME = T.sourcetable'
      
        '     and Pp.RDB$PARAMETER_NAME = T.requiredfield and Pp.rdb$PROC' +
        'EDURE_NAME = T.SourceTable'
      
        '     where ( Pp.RDB$PARAMETER_TYPE = 1 )  and ( Pp.RDB$DESCRIPTI' +
        'ON is not null ) and ( ContractId = :ContractId) or (ContractTyp' +
        'e = :ContractType )')
    Left = 384
    Top = 576
    object SelCntrTemplQryCONTRACTTEMPLATEID: TIntegerField
      FieldName = 'CONTRACTTEMPLATEID'
      Origin = 'DICT.CONTRACTTEMPLATES.CONTRACTTEMPLATEID'
    end
    object SelCntrTemplQryCONTRACTID: TIntegerField
      FieldName = 'CONTRACTID'
      Origin = 'DICT.CONTRACTTEMPLATES.CONTRACTID'
    end
    object SelCntrTemplQryREQUIREDFIELD: TStringField
      FieldName = 'REQUIREDFIELD'
      Origin = 'DICT.CONTRACTTEMPLATES.REQUIREDFIELD'
      Size = 30
    end
    object SelCntrTemplQryBOOKMARK: TStringField
      DisplayLabel = #1047#1072#1082#1083#1072#1076#1082#1072
      FieldName = 'BOOKMARK'
      Origin = 'DICT.CONTRACTTEMPLATES.BOOKMARK'
      Size = 30
    end
    object SelCntrTemplQryDESCRIPT: TMemoField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'DESCRIPT'
      BlobType = ftMemo
      Size = 1
    end
    object SelCntrTemplQrySOURCETABLE: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1103
      FieldName = 'SOURCETABLE'
      Size = 40
    end
    object SelCntrTemplQryUSECOUNT: TSmallintField
      FieldName = 'USECOUNT'
    end
  end
  object SelCntrTemplSrc: TDataSource
    DataSet = SelCntrTemplQry
    Left = 384
    Top = 624
  end
  object CompEnterpriseHoteQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    AfterOpen = CompanyQryAfterOpen
    OnNewRecord = CompanyQryNewRecord
    Parameters = <
      item
        Name = 'hotelid'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ' select COMPANIES.*, HOTELS.hotelid,'
      
        '  case  when COMPANIES.isfiliya = '#39'T'#39' then COMPANIES.headofficei' +
        'd'
      ' else COMPANIES.companyid end CompIdForCntrct'
      '  from COMPANIES'
      ' left join HOTELS on HOTELS.enterpriseid = COMPANIES.companyid'
      ' where HOTELS.hotelid = :hotelid')
    Left = 56
    Top = 318
    object CompEnterpriseHoteQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object CompEnterpriseHoteQryISVENDOR: TStringField
      FieldName = 'ISVENDOR'
      Size = 1
    end
    object CompEnterpriseHoteQryISCLIENT: TStringField
      FieldName = 'ISCLIENT'
      Size = 1
    end
    object CompEnterpriseHoteQryCLASSCODE: TStringField
      FieldName = 'CLASSCODE'
      Size = 8
    end
    object CompEnterpriseHoteQryTAXPAYCODE: TStringField
      FieldName = 'TAXPAYCODE'
      Size = 12
    end
    object CompEnterpriseHoteQryASDRIVE: TStringField
      FieldName = 'ASDRIVE'
      Size = 1
    end
    object CompEnterpriseHoteQryASHOTEL: TStringField
      FieldName = 'ASHOTEL'
      Size = 1
    end
    object CompEnterpriseHoteQryASVISAS: TStringField
      FieldName = 'ASVISAS'
      Size = 1
    end
    object CompEnterpriseHoteQryASINSUR: TStringField
      FieldName = 'ASINSUR'
      Size = 1
    end
    object CompEnterpriseHoteQryASEXCRS: TStringField
      FieldName = 'ASEXCRS'
      Size = 1
    end
    object CompEnterpriseHoteQryASREKLM: TStringField
      FieldName = 'ASREKLM'
      Size = 1
    end
    object CompEnterpriseHoteQryASOTHER: TStringField
      FieldName = 'ASOTHER'
      Size = 1
    end
    object CompEnterpriseHoteQryLICENSENO: TStringField
      FieldName = 'LICENSENO'
      Size = 8
    end
    object CompEnterpriseHoteQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object CompEnterpriseHoteQryASTICKT: TStringField
      FieldName = 'ASTICKT'
      Size = 1
    end
    object CompEnterpriseHoteQryASTOURS: TStringField
      FieldName = 'ASTOURS'
      Size = 1
    end
    object CompEnterpriseHoteQryISOTHER: TStringField
      FieldName = 'ISOTHER'
      Size = 1
    end
    object CompEnterpriseHoteQryISENTERPR: TStringField
      FieldName = 'ISENTERPR'
      Size = 1
    end
    object CompEnterpriseHoteQryISPRIVATE: TStringField
      FieldName = 'ISPRIVATE'
      Size = 1
    end
    object CompEnterpriseHoteQryIDENTCODE: TStringField
      FieldName = 'IDENTCODE'
      Size = 10
    end
    object CompEnterpriseHoteQryASSCOLL: TStringField
      FieldName = 'ASSCOLL'
      Size = 1
    end
    object CompEnterpriseHoteQryASAPAIR: TStringField
      FieldName = 'ASAPAIR'
      Size = 1
    end
    object CompEnterpriseHoteQryASEMPLS: TStringField
      FieldName = 'ASEMPLS'
      Size = 1
    end
    object CompEnterpriseHoteQryISAGENT: TStringField
      FieldName = 'ISAGENT'
      Size = 1
    end
    object CompEnterpriseHoteQryISPROPS: TStringField
      FieldName = 'ISPROPS'
      Size = 1
    end
    object CompEnterpriseHoteQryISGOVERN: TStringField
      FieldName = 'ISGOVERN'
      Size = 1
    end
    object CompEnterpriseHoteQryISBUDGET: TStringField
      FieldName = 'ISBUDGET'
      Size = 1
    end
    object CompEnterpriseHoteQryISPOTENT: TStringField
      FieldName = 'ISPOTENT'
      Size = 1
    end
    object CompEnterpriseHoteQryASFOODS: TStringField
      FieldName = 'ASFOODS'
      Size = 1
    end
    object CompEnterpriseHoteQryASURIST: TStringField
      FieldName = 'ASURIST'
      Size = 1
    end
    object CompEnterpriseHoteQryASMEDIC: TStringField
      FieldName = 'ASMEDIC'
      Size = 1
    end
    object CompEnterpriseHoteQryISHOTEL: TStringField
      FieldName = 'ISHOTEL'
      Size = 1
    end
    object CompEnterpriseHoteQryASRECRE: TStringField
      FieldName = 'ASRECRE'
      Size = 1
    end
    object CompEnterpriseHoteQryASEXTRM: TStringField
      FieldName = 'ASEXTRM'
      Size = 1
    end
    object CompEnterpriseHoteQryFORWORK: TStringField
      FieldName = 'FORWORK'
      Size = 1
    end
    object CompEnterpriseHoteQryASMUSEM: TStringField
      FieldName = 'ASMUSEM'
      Size = 1
    end
    object CompEnterpriseHoteQryASXHIBT: TStringField
      FieldName = 'ASXHIBT'
      Size = 1
    end
    object CompEnterpriseHoteQryASAMBAS: TStringField
      FieldName = 'ASAMBAS'
      Size = 1
    end
    object CompEnterpriseHoteQryASCOMMC: TStringField
      FieldName = 'ASCOMMC'
      Size = 1
    end
    object CompEnterpriseHoteQryASCMPTR: TStringField
      FieldName = 'ASCMPTR'
      Size = 1
    end
    object CompEnterpriseHoteQryASSTNRY: TStringField
      FieldName = 'ASSTNRY'
      Size = 1
    end
    object CompEnterpriseHoteQryASFURNT: TStringField
      FieldName = 'ASFURNT'
      Size = 1
    end
    object CompEnterpriseHoteQryASGOODS: TStringField
      FieldName = 'ASGOODS'
      Size = 1
    end
    object CompEnterpriseHoteQryASPETRL: TStringField
      FieldName = 'ASPETRL'
      Size = 1
    end
    object CompEnterpriseHoteQryASMEDIA: TStringField
      FieldName = 'ASMEDIA'
      Size = 1
    end
    object CompEnterpriseHoteQryASCONSL: TStringField
      FieldName = 'ASCONSL'
      Size = 1
    end
    object CompEnterpriseHoteQryASGUARD: TStringField
      FieldName = 'ASGUARD'
      Size = 1
    end
    object CompEnterpriseHoteQryASBANKS: TStringField
      FieldName = 'ASBANKS'
      Size = 1
    end
    object CompEnterpriseHoteQryASLEASE: TStringField
      FieldName = 'ASLEASE'
      Size = 1
    end
    object CompEnterpriseHoteQryASKOMUN: TStringField
      FieldName = 'ASKOMUN'
      Size = 1
    end
    object CompEnterpriseHoteQryASBUILD: TStringField
      FieldName = 'ASBUILD'
      Size = 1
    end
    object CompEnterpriseHoteQryASMASTR: TStringField
      FieldName = 'ASMASTR'
      Size = 1
    end
    object CompEnterpriseHoteQryISBSMAN: TStringField
      FieldName = 'ISBSMAN'
      Size = 1
    end
    object CompEnterpriseHoteQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
    object CompEnterpriseHoteQryNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object CompEnterpriseHoteQryCOMPKIND: TStringField
      FieldName = 'COMPKIND'
      Size = 40
    end
    object CompEnterpriseHoteQryMEETINGPLACE: TIntegerField
      FieldName = 'MEETINGPLACE'
    end
    object CompEnterpriseHoteQryVCARDNO: TIntegerField
      FieldName = 'VCARDNO'
    end
    object CompEnterpriseHoteQryASPARSL: TStringField
      FieldName = 'ASPARSL'
      Size = 1
    end
    object CompEnterpriseHoteQryASGUIDE: TStringField
      FieldName = 'ASGUIDE'
      Size = 1
    end
    object CompEnterpriseHoteQryFULLNAME: TMemoField
      FieldName = 'FULLNAME'
      BlobType = ftMemo
    end
    object CompEnterpriseHoteQryORGFORMID: TIntegerField
      FieldName = 'ORGFORMID'
    end
    object CompEnterpriseHoteQryTAXPAY: TStringField
      FieldName = 'TAXPAY'
      Size = 1
    end
    object CompEnterpriseHoteQryTAXPAYREGDATE: TDateTimeField
      FieldName = 'TAXPAYREGDATE'
    end
    object CompEnterpriseHoteQryPRIVATEID: TIntegerField
      FieldName = 'PRIVATEID'
    end
    object CompEnterpriseHoteQryBUS01: TStringField
      FieldName = 'BUS01'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS02: TStringField
      FieldName = 'BUS02'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS03: TStringField
      FieldName = 'BUS03'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS04: TStringField
      FieldName = 'BUS04'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS05: TStringField
      FieldName = 'BUS05'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS06: TStringField
      FieldName = 'BUS06'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS07: TStringField
      FieldName = 'BUS07'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS08: TStringField
      FieldName = 'BUS08'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS09: TStringField
      FieldName = 'BUS09'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS10: TStringField
      FieldName = 'BUS10'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS11: TStringField
      FieldName = 'BUS11'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS12: TStringField
      FieldName = 'BUS12'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS13: TStringField
      FieldName = 'BUS13'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS14: TStringField
      FieldName = 'BUS14'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS15: TStringField
      FieldName = 'BUS15'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS16: TStringField
      FieldName = 'BUS16'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS17: TStringField
      FieldName = 'BUS17'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS18: TStringField
      FieldName = 'BUS18'
      Size = 1
    end
    object CompEnterpriseHoteQryBUS19: TStringField
      FieldName = 'BUS19'
      Size = 1
    end
    object CompEnterpriseHoteQryASPARSE: TStringField
      FieldName = 'ASPARSE'
      Size = 1
    end
    object CompEnterpriseHoteQryTAXPAYSTATEID: TIntegerField
      FieldName = 'TAXPAYSTATEID'
    end
    object CompEnterpriseHoteQryNEWTAXPAYREGNO: TStringField
      FieldName = 'NEWTAXPAYREGNO'
    end
    object CompEnterpriseHoteQryTAXPAYREGNO: TStringField
      FieldName = 'TAXPAYREGNO'
    end
    object CompEnterpriseHoteQryAGENTINFO1: TStringField
      FieldName = 'AGENTINFO1'
      Size = 16
    end
    object CompEnterpriseHoteQryAGENTINFO2: TStringField
      FieldName = 'AGENTINFO2'
      Size = 16
    end
    object CompEnterpriseHoteQryADDDATE: TDateTimeField
      FieldName = 'ADDDATE'
    end
    object CompEnterpriseHoteQryWORKINGHOURS: TStringField
      FieldName = 'WORKINGHOURS'
      Size = 38
    end
    object CompEnterpriseHoteQryRECEPTIONHOURS: TStringField
      FieldName = 'RECEPTIONHOURS'
      Size = 38
    end
    object CompEnterpriseHoteQryLICENSEDATE: TDateTimeField
      FieldName = 'LICENSEDATE'
    end
    object CompEnterpriseHoteQrySEMINAR: TStringField
      FieldName = 'SEMINAR'
      Size = 1
    end
    object CompEnterpriseHoteQryDATEOBDZVIN: TDateTimeField
      FieldName = 'DATEOBDZVIN'
    end
    object CompEnterpriseHoteQryMANOBDZVIN: TIntegerField
      FieldName = 'MANOBDZVIN'
    end
    object CompEnterpriseHoteQryWARRANTYSUM: TFloatField
      FieldName = 'WARRANTYSUM'
    end
    object CompEnterpriseHoteQryWARRANTYVAL: TIntegerField
      FieldName = 'WARRANTYVAL'
    end
    object CompEnterpriseHoteQryWARRANTYTERM: TDateTimeField
      FieldName = 'WARRANTYTERM'
    end
    object CompEnterpriseHoteQryISTOUROPER: TStringField
      FieldName = 'ISTOUROPER'
      Size = 1
    end
    object CompEnterpriseHoteQryTRADENAMEID: TIntegerField
      FieldName = 'TRADENAMEID'
    end
    object CompEnterpriseHoteQryVIPCLIENT: TStringField
      FieldName = 'VIPCLIENT'
      Size = 1
    end
    object CompEnterpriseHoteQryBLACKLIST: TStringField
      FieldName = 'BLACKLIST'
      Size = 1
    end
    object CompEnterpriseHoteQryLICENSETERMIN: TStringField
      FieldName = 'LICENSETERMIN'
      Size = 1
    end
    object CompEnterpriseHoteQryACTIONID: TIntegerField
      FieldName = 'ACTIONID'
    end
    object CompEnterpriseHoteQryTAXPAYTYPEID: TIntegerField
      FieldName = 'TAXPAYTYPEID'
    end
    object CompEnterpriseHoteQrySINGLETAXTYPEID: TIntegerField
      FieldName = 'SINGLETAXTYPEID'
    end
    object CompEnterpriseHoteQrySINGLETAXREGNO: TStringField
      FieldName = 'SINGLETAXREGNO'
      Size = 10
    end
    object CompEnterpriseHoteQrySINGLETAXDATE: TDateTimeField
      FieldName = 'SINGLETAXDATE'
    end
    object CompEnterpriseHoteQryGOVREESTRTYPEID: TIntegerField
      FieldName = 'GOVREESTRTYPEID'
    end
    object CompEnterpriseHoteQryGOVREESTRDATE: TDateTimeField
      FieldName = 'GOVREESTRDATE'
    end
    object CompEnterpriseHoteQryOBDZVIN: TSmallintField
      FieldName = 'OBDZVIN'
    end
    object CompEnterpriseHoteQryOBDZVINAGREEDATE: TDateTimeField
      FieldName = 'OBDZVINAGREEDATE'
    end
    object CompEnterpriseHoteQryWORKMANID: TIntegerField
      FieldName = 'WORKMANID'
    end
    object CompEnterpriseHoteQryASNETAGENT: TStringField
      FieldName = 'ASNETAGENT'
      Size = 1
    end
    object CompEnterpriseHoteQryARENEWCONTRACT: TStringField
      FieldName = 'ARENEWCONTRACT'
      Size = 1
    end
    object CompEnterpriseHoteQryPERMEXTRAAGENT: TStringField
      FieldName = 'PERMEXTRAAGENT'
      Size = 1
    end
    object CompEnterpriseHoteQryDOCTODATE: TDateTimeField
      FieldName = 'DOCTODATE'
    end
    object CompEnterpriseHoteQryFIXDEFECTTODATE: TDateTimeField
      FieldName = 'FIXDEFECTTODATE'
    end
    object CompEnterpriseHoteQrySTANDOC: TIntegerField
      FieldName = 'STANDOC'
    end
    object CompEnterpriseHoteQryASAUPAIR: TStringField
      FieldName = 'ASAUPAIR'
      Size = 1
    end
    object CompEnterpriseHoteQryISFILIYA: TStringField
      FieldName = 'ISFILIYA'
      Size = 1
    end
    object CompEnterpriseHoteQryHEADOFFICEID: TIntegerField
      FieldName = 'HEADOFFICEID'
    end
    object CompEnterpriseHoteQryISHEADOFFICE: TStringField
      FieldName = 'ISHEADOFFICE'
      Size = 1
    end
    object CompEnterpriseHoteQryNOTWORK: TStringField
      FieldName = 'NOTWORK'
      Size = 1
    end
    object CompEnterpriseHoteQryNOTWORKMANID: TIntegerField
      FieldName = 'NOTWORKMANID'
    end
    object CompEnterpriseHoteQryNOTWORKDATE: TDateTimeField
      FieldName = 'NOTWORKDATE'
    end
    object CompEnterpriseHoteQryORGFORMINNAME: TStringField
      FieldName = 'ORGFORMINNAME'
      Size = 1
    end
    object CompEnterpriseHoteQryWASDELETED: TStringField
      FieldName = 'WASDELETED'
      Size = 1
    end
    object CompEnterpriseHoteQryASRESIDENT: TStringField
      FieldName = 'ASRESIDENT'
      Size = 1
    end
    object CompEnterpriseHoteQryCODEID1C: TStringField
      FieldName = 'CODEID1C'
      Size = 12
    end
    object CompEnterpriseHoteQryFILIYACODE: TStringField
      FieldName = 'FILIYACODE'
      Size = 10
    end
    object CompEnterpriseHoteQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
    end
    object CompEnterpriseHoteQryCOMPIDFORCNTRCT: TIntegerField
      FieldName = 'COMPIDFORCNTRCT'
    end
  end
  object CompEnterpriseHoteSrc: TDataSource
    DataSet = CompEnterpriseHoteQry
    Left = 56
    Top = 367
  end
  object VisaDocGroupsQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From VisaDocGroups_View')
    Left = 48
    Top = 512
    object VisaDocGroupsQryVISADOCGROUPID: TIntegerField
      FieldName = 'VISADOCGROUPID'
    end
    object VisaDocGroupsQrySORTORDER: TIntegerField
      FieldName = 'SORTORDER'
    end
    object VisaDocGroupsQryGROUPNAME: TStringField
      FieldName = 'GROUPNAME'
      Size = 75
    end
    object VisaDocGroupsQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
    end
  end
  object VisaDocSubGroupsQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From VISASUBGROUPDOC')
    Left = 48
    Top = 560
    object VisaDocSubGroupsQryID: TIntegerField
      FieldName = 'ID'
    end
    object VisaDocSubGroupsQryNAME: TStringField
      FieldName = 'NAME'
      Size = 300
    end
    object VisaDocSubGroupsQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object VisaDocumentsQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = DMServDic.BrCountrySrc
    Parameters = <
      item
        Name = 'CountryId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select D.visadocumentid, D.docid, D.isuse , N.Name DocName, D.Ne' +
        'edCount, D.AgeRestriction, D.ExpireMonths, D.comments'
      'from VISADOCUMENTS_NEW D, PERSONDOCUMENTS N'
      'where D.CountryId = :CountryId and N.ID = D.DocId'
      '')
    Left = 48
    Top = 608
    object StringField2: TStringField
      FieldName = 'SUBGROUPNAME'
      Size = 75
    end
    object IntegerField3: TIntegerField
      FieldName = 'SORTORDER'
    end
    object VisaDocumentsQryVISADOCUMENTID: TIntegerField
      FieldName = 'VISADOCUMENTID'
    end
    object VisaDocumentsQryDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object VisaDocumentsQryISUSE: TStringField
      FieldName = 'ISUSE'
      Size = 1
    end
    object VisaDocumentsQryDOCNAME: TStringField
      FieldName = 'DOCNAME'
      Size = 300
    end
    object VisaDocumentsQryNEEDCOUNT: TIntegerField
      FieldName = 'NEEDCOUNT'
    end
    object VisaDocumentsQryAGERESTRICTION: TIntegerField
      FieldName = 'AGERESTRICTION'
    end
    object VisaDocumentsQryEXPIREMONTHS: TIntegerField
      FieldName = 'EXPIREMONTHS'
    end
    object VisaDocumentsQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
  end
  object VendorTourQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select companies.companyid, companies.Name, TourVendorContracts.' +
        'id, TourVendorContracts.contractpath'
      'from companies'
      
        'left join TourVendorContracts on TourVendorContracts.vendorid = ' +
        'companies.companyid'
      'where companies.isvendor = '#39'T'#39' and'
      
        '  (select  FIRST 1 AVALUE  from GET_COMPANY_PARAM (companies.Com' +
        'panyId,'#39'astours'#39'))  = 1')
    Left = 47
    Top = 659
    object VendorTourQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object VendorTourQryNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME'
      Size = 100
    end
    object VendorTourQryID: TIntegerField
      FieldName = 'ID'
    end
    object VendorTourQryCONTRACTPATH: TStringField
      FieldName = 'CONTRACTPATH'
      Size = 500
    end
  end
  object SelContractQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    OnCalcFields = SelContractQryCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from COMP_CONTRACTS_KIND')
    Left = 48
    Top = 419
    object SelContractQryID: TIntegerField
      FieldName = 'ID'
    end
    object SelContractQryNAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1091#1075#1086#1076#1080
      FieldName = 'NAME'
      Size = 300
    end
    object SelContractQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 100
    end
    object SelContractQryTEMPLATS: TMemoField
      DisplayLabel = #1064#1072#1073#1083#1086#1085
      FieldName = 'TEMPLATS'
      BlobType = ftMemo
    end
    object SelContractQryCalcActualDate: TDateTimeField
      DisplayLabel = #1040#1082#1090#1091#1072#1083#1100#1085#1072' '#1076#1072#1090#1072
      FieldKind = fkCalculated
      FieldName = 'CalcActualDate'
      Calculated = True
    end
    object SelContractQryCalcShablon: TStringField
      DisplayLabel = #1064#1072#1073#1083#1086#1085
      FieldKind = fkCalculated
      FieldName = 'CalcShablon'
      Size = 250
      Calculated = True
    end
    object SelContractQryDAYCOUNT: TIntegerField
      FieldName = 'DAYCOUNT'
    end
  end
  object CntrTemplQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <>
    Left = 130
    Top = 507
    object CntrTemplQryFIELD_NAME: TStringField
      DisplayLabel = #1047#1072#1082#1083#1072#1076#1082#1072
      FieldName = 'FIELD_NAME'
      FixedChar = True
      Size = 250
    end
    object CntrTemplQryDESCRIPT: TMemoField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'DESCRIPT'
      BlobType = ftMemo
      Size = 1
    end
    object CntrTemplQryTABLE_NAME: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1103
      FieldName = 'TABLE_NAME'
      Size = 250
    end
    object CntrTemplQryANUMBER: TIntegerField
      FieldName = 'ANUMBER'
    end
  end
  object VendorTourSrc: TDataSource
    DataSet = VendorTourQry
    Left = 44
    Top = 702
  end
  object SelContracSrc: TDataSource
    DataSet = SelContractQry
    Left = 47
    Top = 463
  end
  object CntrTemplSrc: TDataSource
    DataSet = CntrTemplQry
    Left = 133
    Top = 552
  end
  object GridRepositoryContractTemplate: TcxGridViewRepository
    Left = 1231
    Top = 280
    object ViewVendorTour: TcxGridDBTableView
      DataController.DataSource = VendorTourSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewVendorTourCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
      end
      object ViewVendorTourID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewVendorTourNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 300
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 300
      end
      object ViewVendorTourcontractpath: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1096#1072#1073#1083#1086#1085#1091
        DataBinding.FieldName = 'contractpath'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 600
      end
    end
    object ViewSelContractQry: TcxGridDBTableView
      DataController.DataSource = SelContracSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewSelContractQryCONTRACTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 187
        Options.HorzSizing = False
        Width = 187
      end
      object ViewSelContractQryCalcActualDate: TcxGridDBColumn
        DataBinding.FieldName = 'CalcActualDate'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 95
        Options.HorzSizing = False
        Width = 95
      end
      object ViewSelContractQryCalcShablon: TcxGridDBColumn
        DataBinding.FieldName = 'CalcShablon'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewSelContractQryTEMPLATS: TcxGridDBColumn
        DataBinding.FieldName = 'TEMPLATS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewSelContractQryDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
        Visible = False
      end
      object ViewSelContractQrySHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        Visible = False
      end
      object ViewSelContractQryID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
    end
    object ViewCntrTemplQry: TcxGridDBTableView
      DataController.DataSource = CntrTemplSrc
      DataController.KeyFieldNames = 'ANUMBER'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewCntrTemplQryFIELD_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'FIELD_NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 95
        Options.HorzSizing = False
        Width = 95
      end
      object ViewCntrTemplQryDESCRIPT: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 180
      end
      object ViewCntrTemplQryTABLE_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'TABLE_NAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 1504
        Options.HorzSizing = False
      end
      object ViewCntrTemplQryANUMBER: TcxGridDBColumn
        DataBinding.FieldName = 'ANUMBER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
    end
    object ViewSelCntrTemplQry: TcxGridDBTableView
      DataController.DataSource = SelCntrTemplSrc
      DataController.KeyFieldNames = 'CONTRACTTEMPLATEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DMServDic.MyStyle
      object ViewSelCntrTemplQrySOURCETABLE: TcxGridDBColumn
        DataBinding.FieldName = 'SOURCETABLE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 95
        Options.HorzSizing = False
        Width = 95
      end
      object ViewSelCntrTemplQryDESCRIPT: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 187
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 187
      end
      object ViewSelCntrTemplQryBOOKMARK: TcxGridDBColumn
        DataBinding.FieldName = 'BOOKMARK'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 180
      end
      object ViewSelCntrTemplQryUSECOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'USECOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 30
        Options.HorzSizing = False
        Width = 30
      end
      object ViewSelCntrTemplQryCONTRACTTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'CONTRACTTEMPLATEID'
        Visible = False
      end
      object ViewSelCntrTemplQryCONTRACTID: TcxGridDBColumn
        DataBinding.FieldName = 'CONTRACTID'
        Visible = False
      end
      object ViewSelCntrTemplQryREQUIREDFIELD: TcxGridDBColumn
        DataBinding.FieldName = 'REQUIREDFIELD'
        Visible = False
      end
      object ViewSelCntrTemplQryNOTUSE: TcxGridDBColumn
        DataBinding.FieldName = 'NOTUSE'
        Visible = False
      end
    end
  end
  object VendorTourContractQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from TourVendorContracts')
    Left = 130
    Top = 460
    object VendorTourContractQryID: TIntegerField
      FieldName = 'ID'
    end
    object VendorTourContractQryVENDORID: TIntegerField
      FieldName = 'VENDORID'
    end
    object VendorTourContractQryCONTRACTPATH: TStringField
      FieldName = 'CONTRACTPATH'
      Size = 500
    end
  end
  object PopupMenuCopyNameHotel: TPopupMenu
    Left = 1234
    Top = 440
    object N1: TMenuItem
      Caption = #1050#1086#1087#1110#1102#1074#1072#1090#1080' '#1085#1072#1079#1074#1091' '#1075#1086#1090#1077#1083#1103
      OnClick = N1Click
    end
  end
  object SHEMA_VEHICLE_DETAILDS: TDataSource
    DataSet = SHEMA_VEHICLE_DETAIL
    Left = 240
    Top = 408
  end
  object SHEMA_VEHICLE_DETAIL: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    DataSource = BrDrvMapSrc
    Parameters = <
      item
        Name = 'PLACEMAPID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from SHEMA_VEHICLE_DETAIL '
      'where ID_DRVMAPS = :PLACEMAPID'
      'order by Alevel, AROW, ACol')
    Left = 240
    Top = 360
    object SHEMA_VEHICLE_DETAILID: TIntegerField
      FieldName = 'ID'
    end
    object SHEMA_VEHICLE_DETAILPLACE: TStringField
      FieldName = 'PLACE'
      Size = 10
    end
    object SHEMA_VEHICLE_DETAILATYPE: TIntegerField
      FieldName = 'ATYPE'
    end
    object SHEMA_VEHICLE_DETAILDIRECTION: TIntegerField
      FieldName = 'DIRECTION'
    end
    object SHEMA_VEHICLE_DETAILCOL: TIntegerField
      FieldName = 'ACOL'
    end
    object SHEMA_VEHICLE_DETAILAROW: TIntegerField
      FieldName = 'AROW'
    end
    object SHEMA_VEHICLE_DETAILALEVEL: TIntegerField
      FieldName = 'ALEVEL'
    end
    object SHEMA_VEHICLE_DETAILID_DRVMAPS: TIntegerField
      FieldName = 'ID_DRVMAPS'
    end
  end
  object SelectVendor: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'VENDORID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ' select C.CompanyId, C.Name,'
      
        ' ( select FIRST 1 AVALUE from GET_COMPANY_PARAM (C.CompanyId,'#39'IS' +
        'PRIVATE'#39') ) ISPRIVATE,'
      ' C.ISVENDOR, C.ISENTERPR,'
      ''
      ' case'
      '     when C.isfiliya = '#39'T'#39' then C.headofficeid'
      '     else C.companyid'
      '  end CompIdForCntrct,'
      ' case'
      
        '    when ( ( (C.ORGFORMID is not Null) or (C.IsFiliya = '#39'T'#39') or ' +
        '(C.OrgFormInName = '#39'T'#39') )'
      '    and ( C.ISENTERPR is not null or C.ACTIONID Is not Null )'
      
        '    and ( C.GOVREESTRTYPEID is not Null and C.IDENTCODE Is not N' +
        'ull )'
      
        '    and ( C.GOVREESTRDATE is not Null and C.TAXPAYSTATEID Is not' +
        ' Null ) ) then 1'
      '  else 0'
      ' end AllDataFill,'
      
        ' C.ACTIONID,  C.GOVREESTRTYPEID,  C.IDENTCODE, C.GOVREESTRDATE,C' +
        '.ASRESIDENT'
      ''
      ' from companies C'
      'where  C.companyid=:VENDORID')
    Left = 729
    Top = 61
    object SelectVendorCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object SelectVendorNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object SelectVendorGOVREESTRTYPEID: TIntegerField
      FieldName = 'GOVREESTRTYPEID'
    end
    object SelectVendorIDENTCODE: TStringField
      FieldName = 'IDENTCODE'
      Size = 10
    end
    object SelectVendorGOVREESTRDATE: TDateTimeField
      FieldName = 'GOVREESTRDATE'
    end
    object SelectVendorASRESIDENT: TStringField
      FieldName = 'ASRESIDENT'
      Size = 1
    end
    object SelectVendorISPRIVATE: TIntegerField
      FieldName = 'ISPRIVATE'
    end
    object SelectVendorISVENDOR: TStringField
      FieldName = 'ISVENDOR'
      Size = 1
    end
    object SelectVendorISENTERPR: TStringField
      FieldName = 'ISENTERPR'
      Size = 1
    end
    object SelectVendorCOMPIDFORCNTRCT: TIntegerField
      FieldName = 'COMPIDFORCNTRCT'
    end
    object SelectVendorALLDATAFILL: TIntegerField
      FieldName = 'ALLDATAFILL'
    end
    object SelectVendorACTIONID: TIntegerField
      FieldName = 'ACTIONID'
    end
  end
  object SelectVendorSrc: TDataSource
    DataSet = SelectVendor
    Left = 729
    Top = 109
  end
  object CompanyDocsQry: TADOQuery
    Connection = DMServDic.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'select CategoryId, CategoryId DocId, Category DocName from Categ' +
        'oryDocs'
      'where TypeId = 0'
      'order by FolderId')
    Left = 392
    Top = 464
    object CompanyDocsQryDOCID: TIntegerField
      FieldName = 'DOCID'
      Origin = '"COMPANYDOCLINKS"."DOCID"'
      Required = True
    end
    object CompanyDocsQryDOCNAME: TIBStringField
      FieldName = 'DOCNAME'
      Origin = '"COMPANYDOCS"."DOCNAME"'
      Size = 250
    end
    object CompanyDocsQryCalcFileCount: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CalcFileCount'
      Calculated = True
    end
    object CompanyDocsQryCATEGORYID: TIntegerField
      FieldName = 'CATEGORYID'
      Origin = '"CATEGORYDOCS"."CATEGORYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object CompanyDocsSrc: TDataSource
    DataSet = CompanyDocsQry
    Left = 392
    Top = 512
  end
  object CountriesHaveHotelsSrc: TDataSource
    DataSet = CountriesHaveHotelsQry
    Left = 520
    Top = 520
  end
  object CountriesHaveHotelsQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        '    select distinct Co.CountryId, Co.Name, Co.ShowWeb, Co.SHORTS' +
        'IGN, Co.TIMEBIAS,  Co.ccode, Co.Code2,Co.Code3,Co.NEEDVISA, Co.P' +
        'HONECODEUNI,'
      '   '
      '     ( select Count(Languages.ID) from Languages'
      
        '      left join countries_lng on countries_lng.id_lng = Language' +
        's.id and countries_lng.id_countries = Co.CountryId'
      
        '      where Languages.active_translate is not null and countries' +
        '_lng.id_lng is null ) LNGNOTFOUND,'
      
        '     ( select sum( countries_lng.change_name ) from countries_ln' +
        'g where countries_lng.id_countries = Co.CountryId ) LNGCHANGE'
      ''
      '  from Countries Co'
      '    inner join hotels hot on Co.countryid = hot.countryid'
      '')
    Left = 520
    Top = 472
    object CountriesHaveHotelsQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object CountriesHaveHotelsQryNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object CountriesHaveHotelsQrySHOWWEB: TStringField
      FieldName = 'SHOWWEB'
      Size = 1
    end
    object CountriesHaveHotelsQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object CountriesHaveHotelsQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object CountriesHaveHotelsQrySHORTSIGN: TStringField
      FieldName = 'SHORTSIGN'
      Size = 3
    end
    object CountriesHaveHotelsQryTIMEBIAS: TFloatField
      FieldName = 'TIMEBIAS'
    end
    object CountriesHaveHotelsQryCCODE: TStringField
      FieldName = 'CCODE'
      Size = 3
    end
    object CountriesHaveHotelsQryCODE2: TStringField
      FieldName = 'CODE2'
      Size = 2
    end
    object CountriesHaveHotelsQryCODE3: TStringField
      FieldName = 'CODE3'
      Size = 3
    end
    object CountriesHaveHotelsQryNEEDVISA: TStringField
      FieldName = 'NEEDVISA'
      Size = 1
    end
    object CountriesHaveHotelsQryPHONECODEUNI: TStringField
      FieldName = 'PHONECODEUNI'
      Size = 1
    end
  end
end
