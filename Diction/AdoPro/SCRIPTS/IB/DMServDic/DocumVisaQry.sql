select VISADOC.*, ( select Count(L.VisaDocLinkId) from VisaDocLinks L where DocId = VISADOC.ID ) CntLink from  VISADOC
