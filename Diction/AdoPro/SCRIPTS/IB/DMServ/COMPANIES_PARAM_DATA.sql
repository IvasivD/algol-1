select COMPANIES_PARAM_DATA.*,COMPANIES_PARAM_NAME.name, COMPANIES_PARAM_NAME.atype from COMPANIES_PARAM_DATA
left join  COMPANIES_PARAM_NAME on COMPANIES_PARAM_NAME.id = COMPANIES_PARAM_DATA.id_companies_param_name where ID_COMPANIES =:COMPANYID