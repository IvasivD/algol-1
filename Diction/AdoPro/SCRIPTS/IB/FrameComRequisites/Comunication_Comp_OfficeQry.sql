select COMUNICATION_COMP_OFFICE.*, COMUNICATION_COMPANY.id_company,COMUNICATION_COMPANY.id_comunication_type, 
       COMUNICATION_COMPANY.avalue,
       comunication_type.icon, comunication_type.weblink, comunication_type.template,  comunication_type.FORMAT_OUT

from COMUNICATION_COMP_OFFICE
left join COMUNICATION_COMPANY on COMUNICATION_COMP_OFFICE.id_comunication_company = COMUNICATION_COMPANY.id
left join comunication_type on comunication_type.id = COMUNICATION_COMPANY.id_comunication_type
where  COMUNICATION_COMP_OFFICE.ID_OFFICE = :OFFICEID
