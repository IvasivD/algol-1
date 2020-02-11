select COMUNICATION_COMPANY.*,comunication_type.icon, comunication_type.weblink, comunication_type.template , comunication_type.format_out  from COMUNICATION_COMPANY
left join comunication_type on comunication_type.id = COMUNICATION_COMPANY.id_comunication_type

where ID_COMPANY = :COMPANYID
