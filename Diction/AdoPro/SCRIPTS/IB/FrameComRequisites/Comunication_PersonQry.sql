select COMUNICATION_PERSON.*,comunication_type.icon, comunication_type.weblink, comunication_type.template, comunication_type.format_out  from COMUNICATION_PERSON
left join comunication_type on comunication_type.id = COMUNICATION_PERSON.id_comunication_type

where ID_COMPPERSONS = :PERSONID
