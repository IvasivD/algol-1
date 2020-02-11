select Pp.RDB$DESCRIPTION DESCRIPT, T.*
     from ContractTemplates T
     LEFT OUTER JOIN RDB$PROCEDURE_PARAMETERS Pp ON Pp.RDB$PROCEDURE_NAME = T.sourcetable
     and Pp.RDB$PARAMETER_NAME = T.requiredfield and Pp.rdb$PROCEDURE_NAME = T.SourceTable
     where ( Pp.RDB$PARAMETER_TYPE = 1 )  and ( Pp.RDB$DESCRIPTION is not null ) and ( ContractId = :ContractId) or (ContractType = :ContractType )
