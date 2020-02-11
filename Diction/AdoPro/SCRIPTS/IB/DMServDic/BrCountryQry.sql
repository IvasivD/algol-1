 select Co.CountryId, Co.Name, Co.ShowWeb, Co.SHORTSIGN, Co.TIMEBIAS,  Co.ccode, Co.Code2,Co.Code3,Co.NEEDVISA, Co.PHONECODEUNI,
   
     ( select Count(Languages.ID) from Languages
      left join countries_lng on countries_lng.id_lng = Languages.id and countries_lng.id_countries = Co.CountryId
      where Languages.active_translate is not null and countries_lng.id_lng is null ) LNGNOTFOUND,
     ( select sum( countries_lng.change_name ) from countries_lng where countries_lng.id_countries = Co.CountryId ) LNGCHANGE

  from Countries Co 
