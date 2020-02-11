select COMUNICATION_COMP_PERSON.*, COMUNICATION_COMPANY.id_company,COMUNICATION_COMPANY.id_comunication_type,
       COMUNICATION_COMPANY.avalue,
       comunication_type.icon, comunication_type.weblink, comunication_type.template, comunication_type.format_out from COMUNICATION_COMP_PERSON
left join COMUNICATION_COMPANY on COMUNICATION_COMP_PERSON.id_comunication_company = COMUNICATION_COMPANY.id
left join comunication_type on comunication_type.id = COMUNICATION_COMPANY.id_comunication_type
where  COMUNICATION_COMP_PERSON.id_comppersons = :PERSONID
