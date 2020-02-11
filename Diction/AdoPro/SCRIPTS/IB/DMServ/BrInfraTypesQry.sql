select * From Infra_Type_Sel_Proc(:LangId)
WHERE GROUPID=:GROUPID
order by GroupName, Name
