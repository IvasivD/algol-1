unit OrderHtmlConst;

interface
resourcestring
  sHtml =
    '%s<br>' +  // firm header
    '<style type="text/css"> ' +
    '<!--' +
    'body {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #000000} ' +
    'td {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #000000} ' +
    'p {padding: 0px; margin: 0px;} ' +
    'ul {padding-bottom:0; margin-bottom:0; padding-top:0; margin-top:0;} ' +
    '-->' +
    '</style>' +
    '<div contenteditable=true>' +
    // report title
    '<div align=center><font size="3" face="Arial, Helvetica, sans-serif"><strong>%s</strong></font></div>' +
    // order date and other order info
    '<br><div align=left>%s</div>' +
    // tourname and tourdate
    '<div align=left>%s</div>' +
    // report table
    '<br>%s<br>' +
    // signature
//    '<table width=99%%><tr><td width=50%% align=center>%s: %s</td><td align=right>%s</td></tr></table>';
    '</div>'+
    '<table width=99%%><tr><td width=50%% align=left>' +
    '<span style="font-size:12px; font-weight:bold; white-space:nowrap;">Менеджер, відповідальний за замовлення:</span> %s</a>' +
    '<br /><br /><br /><span style="font-size:12px; white-space:nowrap;"><span id=signmanagerTag>____________________ %s </span></a></span>' +
    '</td><td align=right>' +
    '<br /><br /><br /><span style="font-size:12px; white-space:nowrap;"><span id=signclientTag>%s ____________________</span></a></span></td></tr>' +
    '<tr><td></td><td align=right><br />%s</td></tr>' +
    '</table>';    
//    '</td><td align=right>%s</td></tr></table>';
  sTable =
    '<div align=left><strong>%s</strong></div>' +
    '<table width="100%%" border=1 cellpadding=0 cellspacing=0 bgcolor="#FFFFFF">' +
    '<tr align=center valign=center>' +
    '<td><strong>Турист</strong></td>' +
    '<td><strong>Необхідні для подачі в консульство документи туриста</strong></td>' +
    '</tr>%s</table><br>';
  sOneRow = '<tr valign=top>' +
    '<td rowspan=%d>%s&nbsp;</td>';
  sOneRowNotHave =  '<td><strong><font color="red">%s</font></strong><br>%s&nbsp;</td></tr>';
  sOneRowHaveScan = '<td><strong><font color="green">Документи, які відповідають вимогам консульства (скан-копії документів перевірені фірмою Алголь):</font></strong><ul></br>%s&nbsp;</ul></td></tr>';
  sOneRowHaveBadScan = '<td><strong><font color="red">Документи, які не відповідають вимогам консульства (скан-копії документів перевірені фірмою Алголь):</font></strong><ul></br>%s&nbsp;</ul></td></tr>';
  sOneRowHaveDoc = '<td><strong><font color="green">Отримані фірмою Алголь документи туриста, які відповідають вимогам консульства:</font></strong><ul></br>%s&nbsp;</ul></td></tr>';
  sOneRowHaveBadDoc = '<td><strong><font color="red">Отримані фірмою Алголь документи туриста, які не відповідають вимогам консульства:</font></strong><ul></br>%s&nbsp;</ul></td></tr>';
  sOneRowTake = '<td><strong>Передані в консульство документи туриста:</strong><ul>%s&nbsp;</ul></td></tr>';
  sOneRowReturnDoc = '<tr valign=top>' +
    '<td rowspan=1>%s&nbsp;</td>' +
    '<td><strong>Повернуті туристу:</strong><br>%s&nbsp;</td>' +
    '</tr>';
  sOneRowClientReturnDoc = '<td><strong><font color="blue">Повернуті %s документи:</font></strong><ul></br>%s&nbsp;</ul></td></tr>';
  sOneRowTakePartner = '<td><strong>Передано партнеру:</strong><ul>%s&nbsp;</ul></td></tr>';
  sBreak = '<br>';
  sDelimit = ';';
  sMismatch = ' (<font color="red"> %s </font>)';
  sResponsible = '(<font color="green">Відповідає вимогам консульства</font>)';
  sMis = '<strong>Документ не відповідає вимогам консульства:</strong> %s';
  sSumaFunding = '<font color="red">Сума доходу %s не задовільняє вимогам консульства: дохід - %s;</font><br />';
  sSumaBank = '<font color="red">Вклад в банку %s не задовільняє вимогам консульства: з розрахунку %s на день%s; </font>';
  sOnTourSum = ' + сума на тур %s';
  sOr = '<strong> %s </strong><br>';
  sGeneralDocs = '<br><strong><font size="2" color="Blue"> Загальні документи: </font></strong><ul>';
  sMainFunding = '<br><strong><font size="2" color="Blue"> Власне фінансове забезпечення - основне: </font></strong>';
  sGroup1 = '<br><strong><font size="2"> Від працюючих: </font></strong><ul>';
  sGroup2 = '<br><strong><font size="2"> Від підприємців: </font></strong><ul>';
  sGroup3 = '<br><strong><font size="2"> Від пенсіонерів: </font></strong><ul>';
  sGroup4 = '<strong><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Загальні документи: </font></strong><ul>';
  sGroup5 = '<br><strong><font size="2" color="Blue"> Власне фінансове забезпечення - додатково до основного: </font></strong><br><br>' +
            '<strong><font size="2"> Для всіх: </font></strong><ul>';
  sExtraDoc = '<strong><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;а також, якщо і цього недостатньо: </font></strong><ul>';
  sPosada = '<br><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %s: </strong><ul>';
  sExtraFunding = '<br><strong><font size="2" color="Blue"> Фінансове забезпечення від інших осіб: </font></strong>';
  sPimpa = '<li> %s </li>';
  sOneItemWithLink = '<a href="%s" target="_blank">%s</a> (%s) - %s шт.';
  sOneItem = '%s (%s) - %s шт.';
  sOfficeName = '<strong><font color="green"> Знаходиться: %s </font></strong>';
  sTransferToOfficeName = '<strong><font color="green"> В дорозі в: %s </font></strong>';
  sSignOfPartner = '<br /><br /><br /><span style="font-size:15px; font-weight:bold; white-space:nowrap;">Від імені фірми "%s" отримав _______________  </a></span>';
  sTitleForPartner = 'Реєстр документів туристів по замовленню № %d, <br /> переданих фірмі "%s".';
  sVisaApplFormSubject = 'У вкладеному файлі Аплікаційна форма туриста <br />' +
    '%s, %s, %s %s. <br /><br />' +
    'Аплікаційну форму потрібно роздрукувати на лазерному принтері на двох аркушах формату А4 з використанням двостороннього режиму друку. <br /><br />' +
    'Аплікаційна форма повинна бути власноручно підписана туристом ручкою з чорнилом (пастою, гелем) синього кольору в п.37 на ст.3 та в аналогічному пункті на ст.4. <br />' +
    'Увага! Підпис на анкеті має бути тотожній підпису в закордонному паспорті! <br /><br />' +
    'Замість дитини анкету заповнює та підписує один з батьків. Якщо один з батьків дав нотаріально завірений ' +
    '<strong><a href="http://www.algol.com.ua/_lib/blocks.php?lang=448&jump=43" target="_blank">дозвіл на виїзд дитини за кордон</a></strong>, саме він підписує анкету замість дитини. <br />' +
    'Увага! Підпис на анкеті має бути тотожній підпису в дозволі на виїзд дитини за кордон. <br /><br />' +
    'Увага! Підписання анкети іншою особою є підставою для відмови у видачі візи та занесення туриста в "чорний список" Шенгену.';  
  sMessageTable = 
    '<table border="0" cellpadding="1" cellspacing="1" style="width: 500px;">' +
    '  <tbody>' +
    '%s' +
    '  </tbody>' +
    '</table>'; 

  sMessagePassport =
		'<tr>' +
		'	<td style="vertical-align: top;"><strong><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0' +
    'AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD1SURBVFhH7ZjhCsMwCITbvf9D9c22HuzAiYacDYSBH8jKqV' +
    'lyS/2x87qu99HowLjbuQ4h4Nnr618j0sYVaeOKPDLuDILYZ+K1qA8outVGOUumKzy+cfew/IlZsGnbx0OoutUQRF1HZdurik3PwLqZepoCZtev0jOuyGPj' +
    '8CszPDYX5Qly9oaMeqj7GxVpwNfjkxqiytIZ57G5KA/soYjt8YfL9IyonhqiytZXNTKtwqp1FLYZpx529oaRrF5dJ2PpjFM3FfXCTKvR3EzPWLVOxiPj8K' +
    'U+iH0mPu+DRBoY6RGj+khX2Drj/pk2rkgbV6T/AS5xHB+8KPuHbBJELAAAAABJRU5ErkJggg==" /></strong></td>' +
		'	<td style="width: 100%;">Термін дії паспорту не відповідає вимогам країни по туру.</td>' +
		'</tr>';    
  sMessageAnketData = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADQSURBVFhH7ZgBCsMwCADTPaCP2Qe2p6cf2GP2gQ5LBBFTUmfFF' +
    'g+ExNiCR6TQqda6luQwm7jX8922yQjLp5ZHWycHSXFKUpwSF3HT3BYEKWfJ2e+/7Y1bv21xEjmqSsKIg9HCkKDnvEbK8xpr3MTR5nhTsIfRwuDniFQz+qw' +
    '1buJocxAcaBijB62R3gH08taEGVUqdU8Kxp5gD0J+HP6R4iU0hDi8QRi9GyfVjD5rjYs4qRmegz2GBD3nNVKe11gTclSvQIpTkuKU5B9gFaX8AIGbXuGJp' +
    'cbzAAAAAElFTkSuQmCC" /></td>' +
    '      <td style="width: 100%;">Серед незаповнених полів є поля, необхідні для реєстрації на подачу в консульство.</td>' +
    '    </tr>';
  sMessageAnketData1 = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADPSURBVFhH7ZgBCsMwCACTfaTsJf16+pLRl2Q4IhMxJXVWsuKBk' +
    'Bhb8IgUmkspNQWn+Yhb12fbBiNs2ys92jo4SYhTEuKUuIjLeWmrL1LOkqvff9sbV+veVtcQo6pkGnEwWhgS9JzXSHleY42bONocbwr2MFoY/ByRakaftcZ' +
    'NHG0OggMNY/SgNdI7gF7emmlGlUo9koJxJNiDKT8Ov0jxEjqFOLxBGL0bJ9WMPmuNizipGZ6DPYYEPec1Up7XWDPlqP4DIU5JiFMSf4BVpPQG2K2H4QHsm' +
    'aIAAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">Серед незаповнених полів відсутні поля, необхідні для реєстрації на подачу в консульство.</td>' +
    '    </tr>';
  sMessageAnketData2 = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACVSURBVFhH7djhCYAgFATgV4tEkzhatJlOEk1SGEoW/nheVAr3g' +
    'ZDor8MTrLPWbkLFjuCMGcOUNJxbpA/fVIjBgRgcqI7g5uE6NLT7XlLPiZvWc2hC8ft+xKqC2gguV2NWNUjDSWsY5yU1/kB7d5xfrwDvOFB7wbGqNz6QONI' +
    '6xurm1n7ERz6Aj/wHGByIwYH4BxgisgPHEDYfFiFJRwAAAABJRU5ErkJggg==" /></td>' +
    '      <td style="width: 100%;">Заповнені всі необхідні поля.</td>' +
    '    </tr>';
  sMessageEmbassy = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABZSURBVFhH7dixDcAgEATBNyW5Abv0owG3BJJFAbDxTnSfbvhXk' +
    'lE69od77ned2tG/VFtbhwwHGQ4yHGQ4yHCQ4SDDQYaDDAcZDjIcZDjIcJDhIMNBfoCRqgmzwAzh+eTrzgAAAABJRU5ErkJggg==" /></td>' +
    '      <td style="width: 100%;">В туриста не заповнено розділ "Адреса реєстрації".</td>' +
    '    </tr>';
  sMessageFiling = 
    '    <tr>' +
    '     <td style="vertical-align: top;">' +
    '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAQCAYAAAAmlE46AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAA' +
    'AJcEhZcwAADsMAAA7DAcdvqGQAAAKhSURBVDhPVZJbSJNhGMd/37fDt4Nbm3OuzQ5UzkNampWFER3Ekm6MSEgqCCKIvCjoVqSgi+o+opsoieqii0ioIKSC' +
    'EgopyUTtIE6XqSvbpm7fzs3Xafa/efk/PL/3ed7nfaRgMJghJ0PwM0QCqJ59uUg2Nv4STE5UW2UusiA5dwrpXRUkQ36sRp3whrHnRHrvkvz5UfjlEmD66S' +
    'l4cY5MQiXRfZ3Yw0ZWrFAEZFpXh6n6BOnOFpSvD5YuFaBkdKD63hLtvoZh/2VUawlTvc8xVjajr2kl8fMDmoIylMpj2SpxTJHviDdalUz29nuk/K8I7bnB' +
    'l3evUYe62OgtJeOuQZ+ZZlVFHfFolERfBxqLawEUtbMKBhWGb1aztcDH+ISd0/1HaXYNUF+coLC2IdtmCtm9A9W5899wdOjxP+2g1jNG2i9jVtP4bFaehE' +
    'oITQeQ3HuJbz4voHktgbO+YWxj9xl5n093TwmyTuaA/hsD4Xw+zbiJTQ6iKNZc9jLQ4FKzLoZ2QqbqyCSepklKvVNsMv/CaoqQjI0SmZvJZS8D085yUsX7' +
    'sZlj2DxR0tUScwkDh11f2b3ORyo7JI12aRwL4PzfaKa/o6xZSTQgI/WkiX9TqDeO0eLtJ8+SwLq+QQCL0rQ1FV368+g4RkmHa9dZAhX5/OjNEO5QsDuThG' +
    'tbyVReJO9dOwbHWpKGQgFK6sgbUV+Xv4H40ONsS+VEcKH2daO1rUWji2D3FDHb1UYq6MOytx11dSPy/PLq3VuI9twi9PoqJkcVdiWMxfAeU/k2zL/fEPt4' +
    'm7z6K2gcJSQDg6KieGMq5ENTtJ3CM68IxyRifc/I+EdFgs57EElrRusoQz50h2TNBRH/b3MWpR/pJB0Ngs57EElrRusoQz50h2TNBRH/b3MWpR/pJB0Nki' +
    'w/Kfz8SiLrCUcTwgP8BSt2/jwIvrcmAAAAAElFTkSuQmCC" /></td>' +
    '      <td style="width: 100%;">Алголь подає документи туристів, відповідно програма контролює наявність у нас всіх нео' +
    'бхідних для подачі в консульство документів туриста.</td>' +
    '    </tr>';
  sMessageFiling1 = 
    '    <tr>' +
    '<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAAAXNSR' +
    '0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKpSURBVDhPhZNdSFNhHMZ/nnM2t3mcH6nLmoWmMOmiAk3LPrywD4Xuo6i' +
    'LoOi2LrqIoCDourtAr8JuE8yoi0CEyOiLxGZu+TXndF9nX25zx21ndpgjsogeePnz/t/3eXh43v9bFo/Ht/gNyWSSUDhMk92O0Wgsdf+NHQJut5vBoSG9K' +
    '9G420ZnZwfnz50lk8mUbvwNoVSLGB17id/nZeBQA72OaqypBdByxTOzSaTC8rcjqVSLWPQsYxVVTrRWYbUfQBMMbCgeRkYGEcuiNO/bw/6Ww+x1XCCd0Yq' +
    'cHQ6a6mR6HPV4VoOsuJ2EPPNsbmaxVduoN9cRCij8+D7JwsyrEuOPDAQKPH10E1uVhWq5gsJWgZ6r95HWV9DWg/jnZ3kz9RZLYwNXbjzRA0/vdFDQt7l8j' +
    'jmvj2m3i1hWQK6x4XN91slOEokY5YVy4oqCqiaLnF8CiXSOx88mScaSqBEvwYyFk5fukFD8TIyPMruwhGtpmdWYgmAwU26Ui7yiwKxf4+FEDWu1/ZiO3sZ' +
    'ht9Fy8DTDTjteX5Cc2cKU6wfOpTniapqu4xdJpTe2BQTJzPAXkfSGiKzLSY5+Om6N0jtwXres8nzFQf+Z67TqQRrJcbmlC/tXN1pgrSggNnZde+BK1BKJi' +
    '+yqBIMuYq40Y6/MMb5chXFhmrO+14gnBuju7sMhGrFGFdbHXiB1HkNY052ksxJhPZNICqL6+jinz0QYQqpEW3QamSyNrR00yzUIWZUtrUBNdpPFe3cR2mo' +
    'h4FcIxnJ4wgUWgxrO5Qwf5lVO1Qfo7WsiEMsjzy/Cp3egxCmLxJDi65R9/rQ9BwnVoL9vilS+HKspT/MujSNt1ZDf/gPZQICNbzMYnO+REzoxFEHZzJPo7' +
    'tk5SP+DxWRC+T5DQZ9Oub1d78BPOiEvBLbvdU0AAAAASUVORK5CYII=" /></td>' +
		' <td style="width: 100%;">Турист самостійно подає документи, відповідно програма контролює відсутність у нас будь-яких' +
    ' необхідних для подачі в консульство документів туриста.</td>' +
    '    </tr>';
  sMessageFiling2 = 
    '    <tr>' +
		'<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNS' +
    'R0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAM9SURBVDhPVZNtaFt1FMZ/uXm5SfPSNJnr0q3t3JZuNcWt4uqsdk5ht' +
    'IJTBJmIX/zsJ2EgCIJviFL95hdBJ4IglYGIMhjF6cpsHLJ1S0teuqYxS5a7LEnT3Lzn5ibxLp12PnD4fznn+Z/znOfoCoVChweQyOdZj6eQUll0ehGdTk' +
    'dTrTHoeYjxI4dwGkz3M7fwH0HLKHI9ECAYiVGu1HG6+mnUm4iiiMvtpFjIQkdldGQvj46NQb36f4KL/iBXl1bQG8y4duzEbnfg6O3DaDTSaasUizLVcpF' +
    '6rYR3/xDHj450CYSqycSlpTDzF/1k8zV6HE72ew9or4XTkz5e1hINZj27Bjzs2jNEpa7jr2shlqKpLYK/k3nO/XSBXKGBrW8HmBq8OD6C3d3hcjrKYiaG' +
    '22NkxreXYj2L1elGaYtcWrxGWhURfvvjBoFIgqbQg9LR8c7pV5lbuYxgEqkoKnKlRlyS+GrxPG9MHWc1Fie0nmLhyjJ/LkXQq3bv+3JR0RTvwel2IXXOU' +
    'GuolIomqrUeEgmZlWAU6a7EfOAV/P4QwXCMZOoOeqMFIXzzFjVVICdXOXvmNcJrMUKrCSLRNIGVBGuxTdS2tTtiVWlx4/vPEUSbpkWbeGoDQW11yOTypO' +
    '5kuqIEgquEbka760xKWe7mZO33TTbkElIm380pVxvQ1lavjSz4HhlBVerUK1X6Z95E0BloNBU25RzlWoFiJcdt6ZZWVEHRRjM/+TrtpqrJD+OHfQgnnz0' +
    'GalljbFAvl/h99j0Meqg20iyvLrB++ypqJ0+lLPPrJ+8itFtabROnw8TEY6MI0yeO8vTEGGZdg/LmBrZjz7Mw+ykOW6/muoMMDuxmz8AgwW++xjwxjaIZ' +
    'qlXNc2p6ihNPeLecOHfez+xnZ0mlZfQWSzdKcpFO+EJ3ZuHIS4h6rWdFwao5c9/wTj768C2mJ0e3rTz3o58vvvyWcExCtLq06KVcb3SP6V7bfXYL+UySx' +
    '8cO8vEHbzPuc4PevE1wD4Fwku9++IVzP8+j6iy0OwKqqnY1OTDczwsnp5h5bpLDo7vvVzxwTP+ijI1QVOL68hqRtThWq5XhIQ+HHvbwzFNe2poG24B/AJ' +
    'vkjcHe/VerAAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Турист має візу. </td>' +
    '    </tr>';
  sMessageDocumentNone = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADkSURBVFhH7ZgBCoMwDEXrLjJ2Eq9eTzJ2ko4M//grEW1nWpU8C' +
    'CSpteabVnCIMabgFPMRbhwfc+hsYZqe4Tb7TiEuXCUuXCUmwg3D/ceYPG7F3uuadVxKr6/xQ0vcg73X9a1aSXPhuPvEhzFaPvc1wxizlP8XM+FQjJi2TZD' +
    'PxzgvJrEGz2W/Fc3PuFJqBJH1YFZc8ozjl2bF4YVD16BzLbuohC5nHIrHOHyBBRLjueLn9+qFiXAoUCsU8do1Wl5Dm8sg3nKvErpsVa2ItcKWurAXp/k4i' +
    'FiwI3Aa4Y6G/wGuIoQ3Z4Gi4YsVsksAAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">У нас відсутні будь-які документи туриста чи їхні скани.</td>' +
    '    </tr>';
  sMessageDocumentNotAll = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADQSURBVFhH7ZgBCoMwDABbPyJ7iV+vLxm+pCOjYSGkUuNSq+Qg0' +
    'KZRyNEgGFNKOTiH+YpbllfZOi2s6ztMZe0cxMUpcXFKzMXFOJfVDyn3T6zfDzzyxuW8lZUdPqpKhhAHo4UhQc95jZTnNRZ0EUeb403BHkYLg58jUk3rsxZ' +
    '0EUebg+BAwxg1aI30DqCWt2CIUaVS96Rg7AnuxXAfhzNSegq9XBzeIIzajZNqWp+1wFyc1AzPwR5Dgp7zGinPaywYblTvgotT4uKU+B9gFSF8AMTLh+G2P' +
    '5+YAAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">У нас є хоча б один документ туриста, або, у випадку <img src="data:image/png;base64,iVBORw0' +
    'KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKpSURBVDhPh' +
    'ZNdSFNhHMZ/nnM2t3mcH6nLmoWmMOmiAk3LPrywD4Xuo6iLoOi2LrqIoCDourtAr8JuE8yoi0CEyOiLxGZu+TXndF9nX25zx21ndpgjsogeePnz/t/3eXh' +
    '43v9bFo/Ht/gNyWSSUDhMk92O0Wgsdf+NHQJut5vBoSG9K9G420ZnZwfnz50lk8mUbvwNoVSLGB17id/nZeBQA72OaqypBdByxTOzSaTC8rcjqVSLWPQsY' +
    'xVVTrRWYbUfQBMMbCgeRkYGEcuiNO/bw/6Ww+x1XCCd0YqcHQ6a6mR6HPV4VoOsuJ2EPPNsbmaxVduoN9cRCij8+D7JwsyrEuOPDAQKPH10E1uVhWq5gsJ' +
    'WgZ6r95HWV9DWg/jnZ3kz9RZLYwNXbjzRA0/vdFDQt7l8jjmvj2m3i1hWQK6x4XN91slOEokY5YVy4oqCqiaLnF8CiXSOx88mScaSqBEvwYyFk5fukFD8T' +
    'IyPMruwhGtpmdWYgmAwU26Ui7yiwKxf4+FEDWu1/ZiO3sZht9Fy8DTDTjteX5Cc2cKU6wfOpTniapqu4xdJpTe2BQTJzPAXkfSGiKzLSY5+Om6N0jtwXre' +
    's8nzFQf+Z67TqQRrJcbmlC/tXN1pgrSggNnZde+BK1BKJi+yqBIMuYq40Y6/MMb5chXFhmrO+14gnBuju7sMhGrFGFdbHXiB1HkNY052ksxJhPZNICqL6+' +
    'jinz0QYQqpEW3QamSyNrR00yzUIWZUtrUBNdpPFe3cR2moh4FcIxnJ4wgUWgxrO5Qwf5lVO1Qfo7WsiEMsjzy/Cp3egxCmLxJDi65R9/rQ9BwnVoL9vilS' +
    '+HKspT/MujSNt1ZDf/gPZQICNbzMYnO+REzoxFEHZzJPo7tk5SP+DxWRC+T5DQZ9Oub1d78BPOiEvBLbvdU0AAAAASUVORK5CYII=" />, є скан хоча' +
    ' б одного його документу.</td>' +
    '    </tr>'; 
  sMessageDocumentHaveAll =  
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACcSURBVFhH7ZhLCsAgDAW1Fyk9iVfXk5SexJKixUoWMVA/8AYCS' +
    'rIafFlovffRgGYecc4d6QokhHCaLZ1BIxCnBOKUTCHO2v1TEqRzfzHNi4vxeksiheZGgqgqWUIcF2NENVHKKWOY7y0x7sFyO476M4Adp2Q5cYhqBQnJVcY' +
    'xR5frjWQKcSSjrBqux831BDtOCcQpgTgl+AFWYcwNVzxR4QgMpcQAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">У нас є всі документи туриста, або, у випадку <img src="data:image/png;base64,iVBORw0KGgoAAA' +
    'ANSUhEUgAAABAAAAAPCAYAAADtc08vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKpSURBVDhPhZNdSFNh' +
    'HMZ/nnM2t3mcH6nLmoWmMOmiAk3LPrywD4Xuo6iLoOi2LrqIoCDourtAr8JuE8yoi0CEyOiLxGZu+TXndF9nX25zx21ndpgjsogeePnz/t/3eXh43v9bFo' +
    '/Ht/gNyWSSUDhMk92O0Wgsdf+NHQJut5vBoSG9K9G420ZnZwfnz50lk8mUbvwNoVSLGB17id/nZeBQA72OaqypBdByxTOzSaTC8rcjqVSLWPQsYxVVTrRW' +
    'YbUfQBMMbCgeRkYGEcuiNO/bw/6Ww+x1XCCd0YqcHQ6a6mR6HPV4VoOsuJ2EPPNsbmaxVduoN9cRCij8+D7JwsyrEuOPDAQKPH10E1uVhWq5gsJWgZ6r95' +
    'HWV9DWg/jnZ3kz9RZLYwNXbjzRA0/vdFDQt7l8jjmvj2m3i1hWQK6x4XN91slOEokY5YVy4oqCqiaLnF8CiXSOx88mScaSqBEvwYyFk5fukFD8TIyPMruw' +
    'hGtpmdWYgmAwU26Ui7yiwKxf4+FEDWu1/ZiO3sZht9Fy8DTDTjteX5Cc2cKU6wfOpTniapqu4xdJpTe2BQTJzPAXkfSGiKzLSY5+Om6N0jtwXres8nzFQf' +
    '+Z67TqQRrJcbmlC/tXN1pgrSggNnZde+BK1BKJi+yqBIMuYq40Y6/MMb5chXFhmrO+14gnBuju7sMhGrFGFdbHXiB1HkNY052ksxJhPZNICqL6+jinz0QY' +
    'QqpEW3QamSyNrR00yzUIWZUtrUBNdpPFe3cR2moh4FcIxnJ4wgUWgxrO5Qwf5lVO1Qfo7WsiEMsjzy/Cp3egxCmLxJDi65R9/rQ9BwnVoL9vilS+HKspT/' +
    'MujSNt1ZDf/gPZQICNbzMYnO+REzoxFEHZzJPo7tk5SP+DxWRC+T5DQZ9Oub1d78BPOiEvBLbvdU0AAAAASUVORK5CYII=" />, всі скани його ' +
    'документів.</td>' +
		'   </tr>';
  sMessageDocumentOk =
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADuSURBVFhH7ZgNCsMgDIXdLlJ2kh5t7Gb2JGMn2choWEjjT2JFH' +
    'PlAqM9g46tpsZcY4zs4ar7Grett7zo1bNszXPdrR4kbZ8SNM9Ju3GM5ttkw5HzOjru/fm1GDHl7qRrpb1yqhCWdalQHUjogjaU0Cva5XkFf4yAhWsY0UUk' +
    'HJD0XT8eQXPxJjClVXCQsCBeJoMZ1LXQeSkpXMvYdJ+0I1Liuhc4DDZE0A23GwcIsCTQ+bTUd7mc/q5aSQUNpHDVZ0vmcNfE8RpqrFM/1AnBWbTMudTNlI' +
    'rPRdsjPGfPHpiFjPw4T48YZ8T/AJkL4AHH2ir0oYG8TAAAAAElFTkSuQmCC" /></td>' +
    '      <td style="width: 100%;">Можна готувати документи на подачу в консульство.</td>' +
    '    </tr>';
  sMessageDocumentReady = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACwSURBVFhH7ZgNCoAgDIWtgwSdpKNFN9OTBF3EWDiwH6NWU4T3w' +
    'UDHYvjYA62x1noDXrMJNwx92IInODebNqzBSyCcEAgnRF24qelOoU2OHlkmbvTLLrTJ0QNWFaJ+HSHbpCYgthTVXFmMvz3WEsf6OJ/q+QdFryN8OI54T8T' +
    'rq1omldemequSWBwkXi6qFw4TVxnFhOMJeWKzu9pUXhs88gXgkf8BCCcEwgnBH2ARxqw9bnp9vK3UAgAAAABJRU5ErkJggg==" /></td>' +
    '      <td style="width: 100%;">Документи готові для відправки в консульство. Потрібно відправити в консульство та ' +
    'перевести в стан &quot;Відправлені&quot;.</td>' +
    '    </tr>';
  sMessageDocumentSent = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD9SURBVFhH7ZgNDoIwDIWHBzHxJFwdTmLiRTA1vPhciltn/Zn0S' +
    'xq312a0dYzAME3TkgIzt8aN42mdBjXM8zkd1nFgJBrXSDSukfrGDcdHY/J5rxjqsO245XI3vojM/wFDHXGrNuLTON59MoYB1tinaUDTWWMdaL4tjcE8159' +
    'gaxwSENO2NXTNBz33sc6JW3Xt2qzl8S/ic8a9A1kfxrAueZTgeGZLr+Q3zzgphv8khvWaojleDGiagX09HBp3l4bfGYek4Me4BOLFsKb8ss6wjngeM/k6W' +
    'kwjfi/5WmKlZJ2L+RS+L/laAzpsSi3fPeM6buy+Hg6OxBfgJlK6AqwlhMGp9v+6AAAAAElFTkSuQmCC" /></td>' +
    '      <td style="width: 100%;">Документи відправлені в консульство. Потрібно проконтролювати, чи вони здані та перевести' +
    ' їх в стан &quot;Здані&quot;.</td>' +
    '    </tr>';
  sMessageDocumentToEmbas =
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADRSURBVFhH7ZhhCsMgDEZ1BxnsJL26PUlhF3Fk9CtBIptSP/2RB' +
    '6E2tYKPxEJjSikHp5mvuG17nbfOP+z7ER7n2GnExXXi4jqhi4vxecXdjFizBlWcbCzn9xV3b1TWZEEVx9zYaJY549C+ZRVaeWuOvjKYIg4iUIEYWxWJvAR' +
    'TzC+miGsRAcnl3FqexTKtaiFSdMVpankWNHGzKmMUNHFSGbq9UE0QihzGQvnOSlBbFa2FALW8YD2z5ugrg+lnnLVZpoBelv44rIyL68T/AHcRwgcr3YHh1' +
    'fl0nwAAAABJRU5ErkJggg==" /></td>' +
    '      <td style="width: 100%;">Документи здані в консульство. На дату видачі потрібно проконтролювати, чи вийшла віза.</td>' +
    '    </tr>';
  sMessageDocumentToken =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNS' +
    'R0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADhSURBVFhH7ZgBCoMwDEXrLjJ2Eo82drN6krGTOL4YCZI6G5PSQR4E67' +
    'eG5huFOuSc5xRUsxg3jo/1NDjDNL3TbR0HlYRxSsI4JW7GvYb7FrVo7jnCOh9wMQ4Lfc6fLc4uHPPoXkus8wEX4zQL5Wb/A82/cdRVCILGks6DI+nSHH60' +
    'xNU4Kox3EXUVghdkpbfC1TipMIwprlDKU9KtafqqohjeKVqO8pR0a8yN837SveCyV92bx59+6RrXJQ38ygNtP0fSr4K9atebfOuCrYhN/gW6Nq7HbiOi45' +
    'TEH2AVKX0BmjKe6fPchFMAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">Документи забрано з консульства.</td>' +
    '    </tr>';
  sMessageDocumentRcEmbas =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNS' +
    'R0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADcSURBVFhH7ZhhCoMwDEbrLjJ2Eo82drN6krGTOD7xgxha1jY6K+RBsI' +
    'lWmof9UYcY4xycahZx4/hYU6eEaXqH2zp2KnFxjbi4RnYRN7zum+idPdZoFodFzM/PJnqXhzVa8a3ayKHiuHVlpOpEjgFzXSd6LoPoecx1vYVDxXHr6jFg' +
    'jihpJCeB1L7PSrdbNSWGNVyRS1BjSHJ1K12KQ5NaDKC8lDTUGJJc3Up34nLSesMsDk2iWRkljeee/zU3dV+v4R+ccsjXsq6GH/INnCLuyl8b8S+uEf8D3E' +
    'QIX+W0iBKSq7g0AAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Документи&nbsp;надійшли в офіс. Їх потрібно видати туристу або замовнику.</td>' +
    '    </tr>';
  sMessageDocumentTourist =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNS' +
    'R0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADRSURBVFhH7ZjRCcMwDESdLlI6SVZPJimdJOVKRFUjE0dwkQt6IGwpB0' +
    'aHrY9My7JsJTnNx7h5fuxp0sO6Pstt3ycnSeOcpHFOuMZN99+4EvJ5/Bu3vb5xpXk4j0g+VSdxxtW3T+fYS2isuqXRKwm+cdIoouf5iM7SSh1BNuaIMWZc' +
    'rwnQSWhadSLxMw7NwtQjRCehadWJxBrXa9qAxM64OodGVr0H0EpdaoFwjUOzOjStXOstTf3N0uiVRPyM01jNkg3wMpZxf0Qa5yT/ALso5Q3gF2Lhc9J9yQ' +
    'AAAABJRU5ErkJggg==" /></td>' +
		'	<td style="width: 100%;">Документи видані туристу або замовнику.</td>' +
    '    </tr>';
  sMessageDocumentInTourist =   
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNS' +
    'R0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD2SURBVFhH7Zh9DoMgDMVxF1l2Eq+uJ1l2Epe3+LKu4UPoDCH2lzQWKB' +
    'Uelj+clmXZglPNR7h5fuxN5wjr+gy33XcqceEaceEasQk33X/tQti/uO31tQuJ56XayPnC6XLmV8knkH3SiPSBHpPxsi37QayvEbtwcjEoVw3LWPspGAMr' +
    'bZDvlPH0gfQB27BS7gLj3XG5d2ANOTCXZmSsOw4bLomTgnNpRvoJh8XXnP4R0Y7m+gPn33E5YqefyhfLjb5UvEbHGrEJh8VIy1EaJ7F8eq4e0/FAt4GMjY' +
    '1X0K9U5ekbN9GDvnecPvmBBOwn3OD4H+AmQngDikKI4aItmkMAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">У випадку <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAOCAYAAADwikbvAAAAAX' +
    'NSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAJRSURBVDhPbZJfSFNxFMc/3rs/bs45/8xlXhNNYVBQgaaklQ9lKvTQ' +
    'WxT1EBS91kP0VhD03EsE+hQGPSWYUQ+BCIEQFJmt3NTpptNtenWb29zVuzu7zEEN9nk5/M7vfM85v3N+ZfF4/ID/SCaTbGxu0iRJmEymgrc0RWKfz8fwyI' +
    'juNdBwxEVnZwcDV/rJZDKFiGKEgs0zPvGBcGiFoVP19Lkd2FN+0NT8naVcpMJa3ImhYPMsBYLYRYXetirs0nE0wciuHGBsbBixbJuWY0dpbj1No/sq6YxW' +
    'XLmpzkaP20lgLcqqz8NGYJG9vX1cDhdOSx0bEZn5P9P4f3/Mxxe9WSDH6+f3cVVZcdgqyB3k6Ln9BMPOKtpOlPDiHJ9nvmBtqOfWvVfFlXP6Uc2qLKyEmP' +
    'V5ie0L2KpdhLzfdKGHRCKGOWcmLssoSvKfOJFWefFmmmQsibK1QjRj5fyNRyTkMFOT48z5l/EuB1mLyQhGC2aT7VA8F9Z4NlXNes0g5Wcf4pZctJ64yKhH' +
    'YiUURbVYmfHO41leIK6k6Tp3nVR6F0EwWBj9LpLeFbHpqQzuQToejNM3NKC3qfBu1c3g5bu06UMzoXKztQvphw8tso7Y0HXnqTdRw1ZcpLYSjHoCS6UFqV' +
    'JlMliFyT9Lf+gTYu8Q3d2XcIsm7NsyOxPvKXv8dung13YzoajASQmcdnBYoU9a4+XPRkauJfIzKYXQXgORsEw0phLYzLEU1fAEM3xdVLjgjBTCSpPfc0Ix' +
    '6vtLkcqasZdnaanVONPugGzpP30I/AVTPfVtkBkMCwAAAABJRU5ErkJggg==" /> документи отримані з консульства туристом.</td>' +
		'</tr>';
    
  sMessageDocTo =
    '  <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNS' +
    'R0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD5SURBVFhH7ZgBCsMgDEV1F+uObk/WLcMPQRIbY1sc5EEgxmjsN92guZ' +
    'RypGCYn3Db9q7DwMK+l/SqfjBICOckhHMyJVzO1anQuDUJaZ7H2jmONq/FCS2m5VtwCacVPL7/z9wkaB3P4fvwOFmLtrYXh8/R8kdwCYeCPXC4Kxndz3JO' +
    'wnPOpX7j0CGeDniaW4Tzdhs6hOxMPG8NgAs6q6OxTMeNiDArGoELIvOId7lwVzxUj7v3t7JMx1lufRXRiEeE46Lg1YBBCC1OPofnYE5bqzGaLzElnFTQEq' +
    'MxjCPFW781IMWAFtPyLSzzqv4bIZyTEM5JfAF2kdIH8fiY4Z38wTwAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">Очікувана дата надходження документів.</td>' +
    '    </tr>';  
  sMessageDocTo1 = 
		'    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNS' +
    'R0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD0SURBVFhH7ZhZDoMwDESh9z8UN6OMxEhu5IHYLEolP8lqcJylj8AH87' +
    'Is61TEgbjNXEUg4Oyz+yuClLgkJS7JJXHz/ktw3YaH129zbZ9F9as8UDlV30NKnFpwe3H+hAfG2Ro7j80jWtTYozzbFlUfISWOCx7Bzd1JdL6efYLMPod6' +
    'x/GEZE7A2zwiLnvaeEIQZ/KyaxDeoLN1FMOcuIiEq9IAbxAiI+92cXf8qSOenr+XYU5cz10fRRp4RZyVwkeDQREqj7bF1rBPjVVE6z0uifMW7MnhmmHx8m' +
    '27DeLliMqp+h6GeVT/jRKXpMQlqS/AKabpC3AH6ofOfMY6AAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Протермінована дата надходження документів.</td>' +
    '    </tr>';
  sMessageDocTo2 = 
    '  <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNS' +
    'R0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABXSURBVFhH7dgxDQAgDAXRghOUYL0oQQokBAFw873pd72xJTNX6NsJ13' +
    'u7p16MMaPerU+GgwwHGQ4yHGQ4yHCQ4SDDQYaDDAcZDjIcZDjIcJDhID/ASMQGnmAM4fDSNSEAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">Документи надійшли.</td>' +
    '    </tr>';
  sMessageAutoFilTillDate = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAA' +
    'AXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD5SURBVFhH7ZgBCsMgDEV1F+uObk/WLcMPQRIbY1sc5EEgxmjsN92' +
    'guZRypGCYn3Db9q7DwMK+l/SqfjBICOckhHMyJVzO1anQuDUJaZ7H2jmONq/FCS2m5VtwCacVPL7/z9wkaB3P4fvwOFmLtrYXh8/R8kdwCYeCPXC4Kxndz3' +
    'JOwnPOpX7j0CGeDniaW4Tzdhs6hOxMPG8NgAs6q6OxTMeNiDArGoELIvOId7lwVzxUj7v3t7JMx1lufRXRiEeE46Lg1YBBCC1OPofnYE5bqzGaLzElnFTQE' +
    'qMxjCPFW781IMWAFtPyLSzzqv4bIZyTEM5JfAF2kdIH8fiY4Z38wTwAAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">Не проставлено дату подачі, а &quot;Подача по&quot; припадає на найближчий робочий день.</td>' +
    '    </tr>';
  sMessageAutoFilTillDate1 = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAA' +
    'AXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD0SURBVFhH7ZhZDoMwDESh9z8UN6OMxEhu5IHYLEolP8lqcJylj8A' +
    'H87Is61TEgbjNXEUg4Oyz+yuClLgkJS7JJXHz/ktw3YaH129zbZ9F9as8UDlV30NKnFpwe3H+hAfG2Ro7j80jWtTYozzbFlUfISWOCx7Bzd1JdL6efYLMPo' +
    'd6x/GEZE7A2zwiLnvaeEIQZ/KyaxDeoLN1FMOcuIiEq9IAbxAiI+92cXf8qSOenr+XYU5cz10fRRp4RZyVwkeDQREqj7bF1rBPjVVE6z0uifMW7MnhmmHx8' +
    'm27DeLliMqp+h6GeVT/jRKXpMQlqS/AKabpC3AH6ofOfMY6AAAAAElFTkSuQmCC" /></td>' +
    '      <td style="width: 100%;">Не проставлено дату подачі, а &quot;Подача по&quot; припадає на сьогодні.</td>' +
    '    </tr>';
  sMessageFilingDate = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAA' +
    'AXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABUSURBVFhH7dixDQAgDMTAwGJh9DAZSIgBwLWv+rQu06pqhb6dcJn' +
    'jnnoxZ0W/W58MBxkOMhxkOMhwkOEgw0GGgwwHGQ4yHGQ4yHCQ4SDDQX6AkYgNwzAM4aJ5TUcAAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">Проставлено діапазон дат подач, але не проставлено дату подачі.</td>' +
    '   </tr>';
  sMessageFilingDate1 = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAA' +
    'AXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADsSURBVFhH7ZhtCsMgDIZ1Fxk7Sa9uTzJ2Ekc2A6kYq6+2+CMPBGz' +
    '83GM26HwIITqjm5+4bXulR6OFfX+7R2obnZg4EBMHMiTO+2dq/aHnPEqU+mUu75No/Vqe0HLa+BYgcdqGMX4OUYLmyTFyHZmnyNHm1vLclmjje4DE8YY1+H' +
    'Az6V2v5ZwEcs6lfuO4QpAKuJtLxKHVxhVCcSYP3YPhCzrbR2OZiuuRMCqN4AuiQORNFzfjQ9W4ev1Wlqm4lltfRRpxizgphb8aHCxCy1NbIsdwnzZXo3d8C' +
    'XvJB7CX/AFMHIiJA7F/gCGc+wJo5KX1kMxBLQAAAABJRU5ErkJggg==" /></td>' +
    '      <td style="width: 100%;">Дату подачі проставлено.</td>' +
    '    </tr>' ;
  sMessageFilingDate2 = 
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR' +
    '0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD5SURBVFhH7ZgBCsMgDEV1F+uObk/WLcMPQRIbY1sc5EEgxmjsN92guZRy' +
    'pGCYn3Db9q7DwMK+l/SqfjBICOckhHMyJVzO1anQuDUJaZ7H2jmONq/FCS2m5VtwCacVPL7/z9wkaB3P4fvwOFmLtrYXh8/R8kdwCYeCPXC4Kxndz3JOwnP' +
    'OpX7j0CGeDniaW4Tzdhs6hOxMPG8NgAs6q6OxTMeNiDArGoELIvOId7lwVzxUj7v3t7JMx1lufRXRiEeE46Lg1YBBCC1OPofnYE5bqzGaLzElnFTQEqMxjC' +
    'PFW781IMWAFtPyLSzzqv4bIZyTEM5JfAF2kdIH8fiY4Z38wTwAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">Дата подачі документів призначена:</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="width: 100%; vertical-align: top;">' +
		'	<ul>' +
		'		<li>на найближчий робочий день, а стан документів &quot;Готові&quot; і нижче</li>' +
		'		<li>на сьогодні, а стан документів &quot;Відправлені&quot;.</li>' +
		'	</ul>' +
		'	</td>' +
    '    </tr>';
  sMessageFilingDate3 = 
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR' +
    '0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD0SURBVFhH7ZhZDoMwDESh9z8UN6OMxEhu5IHYLEolP8lqcJylj8AH87Is' +
    '61TEgbjNXEUg4Oyz+yuClLgkJS7JJXHz/ktw3YaH129zbZ9F9as8UDlV30NKnFpwe3H+hAfG2Ro7j80jWtTYozzbFlUfISWOCx7Bzd1JdL6efYLMPod6x/G' +
    'EZE7A2zwiLnvaeEIQZ/KyaxDeoLN1FMOcuIiEq9IAbxAiI+92cXf8qSOenr+XYU5cz10fRRp4RZyVwkeDQREqj7bF1rBPjVVE6z0uifMW7MnhmmHx8m27De' +
    'LliMqp+h6GeVT/jRKXpMQlqS/AKabpC3AH6ofOfMY6AAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Дата подачі документів призначена:</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="width: 100%;">' +
		'	<ul>' +
		'		<li>на сьогодні або на попередні дні, а стан документів &quot;Готові&quot; і нижче</li>' +
		'		<li>на попередні дні, а стан документів &quot;Відправлені&quot;.</li>' +
		'	</ul>' +
		'	</td>' +
    '    </tr>';
  sMessageBiometrics = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAAATCAYAAACa0IPnAAAA' +
    'AXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAERSURBVGhD7ZkBCoMwDEXrLjJ2Eq+uJxk7iSPDLwHztXXtNCMPCpr' +
    'mJ5JfGbhuGIYpBa74mNb3j/k2uDrj+Ey3+TpwRJjmkDDNIaZpXXdflobFNXs5R7QsLrAYy9ew/RydVZ/Fa7MyTRpO02tZeAAW1+zlWBrAtFtxXGtYvmZLa8' +
    'U1sm/VZ/EWrEyThmdQ2hfD2cPKYdrcmmfzs980nESPtHxrjrBp2lmD/rav6LFqcLXDRk2raVhJrRp9RY9Vy7grYZpW0zAgNTFANsgWff+RlWktBodTj7pW/' +
    'TAsH/qm6SXIQHUMA8a+wHIYWitoLfZKa5bm5yB1AKvfoi8jPhg7Iz4YOyVMc0iY5pD459odKb0BRpPUoluVlT0AAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">Повідомлення про призначення дати подачі документів не надіслано.</td>' +
    '    </tr>';
  sMessageBiometrics1 = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAAATCAYAAACa0IPnAAAA' +
    'AXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAFbSURBVGhD7ZkBbsIwDEWTXWTaSZA4OConQTtJhqFfMul3QiBtieY' +
    'nWUqd2K78G6WFOE1TCs5Q3EQ7HH7mS+fTOZ8v4WseOwPhog2IizYg9EyL8XsehZDS7zyy/ZraGplvjS3lZPlq9wCse7H8wMpfq6vnW0E+eqbhhmEoZPk1tT' +
    'UsBlixJT/GGmu9phTL/BqZZ/ktf05KqdlyFqJJwT1orYvm1GBrrNhnc75LjPHBGKerX4yx2ZmGJ3FErF3zKrWdVKMo2l6NfreuxMN6sEcPjlcxxRimaD0Fa' +
    '8nVo67Ew3oJtxYxnqiVoKL1FAxITjTQauQadT+dlI7USixEW6NxeOqRl+X/j4IJrbtMWHynsV2AZuo57dPNZms0en0+zmFzeU6dA5TWa1iskPvZNXjGD+55' +
    '2l885A0T+eQ7zX8w3hAtaitatM1e+Z174181jYs2IC7agPg/18MRwh+47o4KT7ZNDQAAAABJRU5ErkJggg==" /></td>' +
    '      <td style="width: 100%;">Надіслано лист з повідомленням про призначення дати подачі документів.</td>' +
    '    </tr>';
  sMessageBiometrics2 = 
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAAATCAYAAACa0IPnAAAA' +
    'AXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAGxSURBVGhD7ZlhbsIwDEbjXWTaSZA4DJfY/u4SHAaVk6DtIlm/pmY' +
    'mtZumS2k75UkWrRMnKI80CKhpGu8qu6KTdji89beVJSF67a/y8R5769tdrzf3ElKVZ4HFz42YKm0FiOghNC5tHqFRpa1AaielUKXh2cshsfKSVJ85tVYeWD' +
    'mrv8Rqn1KnjW/l53BsZSI0BtIwofdf9+A3YOUlqT5aDWPVjuX5WmL1l4zVankJ2rXxrXwKoosaYwykYcI1yJ2XFyeF1seqnTpmSbw/3qM9yboI1wGiD4f9h' +
    'lfmaWcafxL3yNRdM4ff3QU5n302IHOybVTaWgv913lRz1GCJdeAd5iUA1mxRHLv/dWItJLCcsYqMS/qOUqJK0X8dT985W9FCSmQFQvz/tTfGdJKCmMwJi+g' +
    'tZBLzLsl5IdpGKcHcUwsDAykLbFw8s3xfcx/FzYFS1yMudNkACyozPECczuw+ljIWiBruS13zNz+U8A4jDV+iXmJzg+PRRDOuHN/F6g/GG+EWFj3WFTOtfq' +
    'D8UZQhUWPStlepW0AKYiFgTjPVGkboRPVnoMsjNHy9Z/r3eHcD3Qifuizf6TEAAAAAElFTkSuQmCC" /></td>' +
    '      <td style="width: 100%;">Надіслано лист з повідомленням про скасування дати подачі документів.</td>' +
    '    </tr>';
  sMessageApplForm =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAOCAYAAAAmL5yKAAAAAXNSR' +
    '0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACzSURBVDhPlZPBDcMgDEVNJ2Cd5Ji1eu5aOSbrsAHlGz51SEjok4yRkf0t' +
    'DC6EEKXBe192fVKe+peuBiTHGG/NcipAnHMnY5zq4FCA6qBVZbzlsoNWGcY4gBDvqRYYVd+2vIfXImUKQ5aSDh6GnhBI7pl5dqpsvRbIx+NQsBbodbCun7I' +
    'TWZa3equOcd4WmKZ862Dff6qE7wEnf1kSVI8B6F/AOHpdWNr2Qf1MfBgjMFlE5AsCc7EqhAq49gAAAABJRU5ErkJggg==" /></td>' +
    '      <td style="width: 100%;">Аплікаційну форму надруковано.</td>' +
    '    </tr>';
  sMessageApplForm1 =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAAAXNSR' +
    '0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADASURBVDhPjVLBEcMgDINOwDzZqy/6bF/di3lgAoLciAODc9WdgBhsCROf' +
    'c65OIYRwrWy0PJkfMg5Acq31liOWAoT3fiHjVAemAlQHtCrjGlsHWhlkHIAQ+9QLWOrORWEpRaz/7EeHnRC+0k2sDUaUkFnHSHiqKWFvxnG82unP9dXsixN' +
    'U2MVMzmojsQf3pgNCOwGgnPNT1uZ/QKT07lYtQP6G+2v0K2DAE/7byKWJKLB/ylmZikucBXbkYSav8VhPHUgFzZTdl1IAAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">Відмінено друк аплікаційної форми.</td>' +
    '    </tr>';
  sMessageApplForm2 =
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAKCAYAAABrGwT5AAAAAXNSR0IArs4' +
    'c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABRSURBVChTrY4BCsAgDAMTn7aH+7XaapUOZNhtB4GkEFICENUrelkZKQFJFPc9RO2oejdNVtnWo' +
    '0749Pa2TFZ3d0Qudw/lE1LLcdX4Z3nELEADbZ4thR4yY3cAAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">Аплікаційну форму надіслано.</td>' +
    '    </tr>';
  sMessageApplForm3 =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR' +
    '0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAC3SURBVDhPnZLBDcMwCEWhE2Sm7tSTzz11pmYmb0D5xHZwA43SJ/0IY/gh' +
    'KExEovqLWivdEIjIZXXMADDzpIhV85BnGGRvOMN2cKWhgymxg9CAeW3RjMi9RbsBgEEKUTF57Kx9211gQPRu2gs7PdeVTnAsbJMcchZkmhu8cKc7EMZDi1O' +
    'W5aXVz3baYCq6wIfF4z/IQCEaMk4NoglwRh78NPhu9pMME+wgUrTxKJ9O4L/dL23OF/oAGkwrs0ZKZPUAAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">Відмінено надсилання аплікаційної форми, про що Замовнику надіслано відповідне повідомлення.</td>' +
    '    </tr>';
  sMessageGivingDate =
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4' +
    'c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD5SURBVFhH7ZgBCsMgDEV1F+uObk/WLcMPQRIbY1sc5EEgxmjsN92guZRypGCYn3Db9q7DwMK+l' +
    '/SqfjBICOckhHMyJVzO1anQuDUJaZ7H2jmONq/FCS2m5VtwCacVPL7/z9wkaB3P4fvwOFmLtrYXh8/R8kdwCYeCPXC4Kxndz3JOwnPOpX7j0CGeDniaW4Tzdhs6hOxMPG8' +
    'NgAs6q6OxTMeNiDArGoELIvOId7lwVzxUj7v3t7JMx1lufRXRiEeE46Lg1YBBCC1OPofnYE5bqzGaLzElnFTQEqMxjCPFW781IMWAFtPyLSzzqv4bIZyTEM5JfAF2kdIH8' +
    'fiY4Z38wTwAAAAASUVORK5CYII=" /></td>' +
    '      <td style="width: 100%;">Дата отримання візи призначена на сьогодні, а стан документів &quot;Здані&quot;. Потрібно з&#39;ясувати, чи отримано документи.</td>' +
    '    </tr>';
  sMessageGivingDate1 =
    '    <tr>' +
    '      <td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4' +
    'c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD0SURBVFhH7ZhZDoMwDESh9z8UN6OMxEhu5IHYLEolP8lqcJylj8AH87Is61TEgbjNXEUg4Oyz+' +
    'yuClLgkJS7JJXHz/ktw3YaH129zbZ9F9as8UDlV30NKnFpwe3H+hAfG2Ro7j80jWtTYozzbFlUfISWOCx7Bzd1JdL6efYLMPod6x/GEZE7A2zwiLnvaeEIQZ/KyaxDeoLN' +
    '1FMOcuIiEq9IAbxAiI+92cXf8qSOenr+XYU5cz10fRRp4RZyVwkeDQREqj7bF1rBPjVVE6z0uifMW7MnhmmHx8m27DeLliMqp+h6GeVT/jRKXpMQlqS/AKabpC3AH6ofOf' +
    'MY6AAAAAElFTkSuQmCC" /></td>' +
    '      <td style="width: 100%;">Дата отримання візи призначена на попередні дні, а стан документів &quot;Здані&quot;. Конче потрібно з&#39;ясувати, чи отримано документи.</td>' +
    '    </tr>';
  sMessageGarant =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABXSURBVFhH7dgxDQAgDAXRghOUYL0oQQokBAFw873pd72xJTNX6NsJ13u7p16MMaPerU+GgwwHGQ4yHG' +
    'Q4yHCQ4SDDQYaDDAcZDjIcZDjIcJDhID/ASMQGnmAM4fDSNSEAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">Для туристів з власною візою &quot;Дані для візи по групі&quot; не проставляються.</td>' +
    '    </tr>';
  sMessageGarant1 =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADuSURBVFhH7ZgLDsIwCIZbL2I8ya7encR4khq0JIxQAuh8LHwJEaH7t1LaZKuttV4SN4/CLctl/E0srO' +
    'u1nIafOMnCBcnCBZkWrtbz8J4+N0TLIVpeGg/QOL0WTWIW3wNzx/V+2xiF5+gEwNfyVrjGt/mJrcoL+cnOiXLYMw6LD7/SwkhxD+bCaTejOTDvVoLxqDu7nupbQS1Jn8e9' +
    'hM44Ds2BRR9Gg+pbsYz16FE2hdtjwlZgAtgN/8Bhzzgrb9mquOrSymMczQrVRJt1ldZtXCMKfx68J9Wc+ZR8yQ+QL/kvkIULkoULkl+AQ5RyB6xIndyKtHiqAAAAAElFTk' +
    'SuQmCC" /></td>' +
		'	<td style="width: 100%;">Для туристів, яким потрібна віза, проставлено &quot;Дані для візи по групі&quot;.</td>' +
    '    </tr>';
  sMessageGarant2 =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD1SURBVFhH7ZhLDsIwDEQDR2DPgpN0wbmR0pOwYM8VqIxqNFhxZJvyq/ykqGkcJskksVQ2tdZbSdzcjR' +
    'uGw/yaWBjHc9nO9cRJGhckjQui5rjr/lh2l9OjLrHEGNkH4zgOYh0f0bSWxpXjaEJYEBnDhfJitLgVqfFtfuKqSiMjxn6a1eY4Np+erY1ptXswG9cbDGNUvFeJ+rOu9nvU' +
    't8JaLX3Z7iWU4yQYoxKdTA/Ut2Lp69FDnox7x4Kt0AL4NPwDq81xVha5qrzrrZ3ndi5WUJOLdqp6p01qRJHz4TFRU6sj+ZEfID/yXyCNC5LGBcl/gEOUMgHhzMAxJLOnPw' +
    'AAAABJRU5ErkJggg==" /></td>' +
		'	<td style="width: 100%;">Відбулась зміна або видалення консульства - потрібно підтвердити або змінити &quot;Дані для візи по групі&quot;.</td>' +
    '    </tr>';
  sMessageGarant3 =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABbSURBVFhH7dixDYAwDAVRQ80o7JDVnR0yCj1IkQfAV9+rvtsrfWTmG2rb4cZ91ak/5nrirK0mw0GGgw' +
    'wHGQ4yHGQ4yHCQ4SDDQYaDDAcZDjIcZDjIcJAfYCTiA27gDOHVMKH1AAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Для туристів, яким потрібна віза, не проставлено &quot;Дані для візи по групі&quot;.</td>' +
    '    </tr>';
  sMessageGarant4 =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADzSURBVFhH7Zg9DsIwDIVTZkaOwcjO1cPOyDEY2VsZ1ehhxZFtyl/lT4qaxuEleUkslaHWOpbEzd2443' +
    '47vyYWTpdb2cz1xEkaFySNC6LmuGF3KOP1/KhLLDFG9sE4joNYx0c0raVx5TiaEBZExnChvBgtbkVqfJufuKrSyIixn2a1OY7Np2drY1rtHszG9QbDGBXvVaL+rKv9HvWt' +
    'sFZLX7Z7CeU4CcaoRCfTA/WtWPp69JAn496xYCu0AD4N/8Bqc5yVRa4q73pr57mdixXU5KKdqt5pkxpR5Hx4TNTU6kh+5AfIj/wXSOOCpHFB8h/gEKVMcea6Exhiko0AAA' +
    'AASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">&quot;Дані для візи по групі&quot; - не проставлено готелі.</td>' +
    '    </tr>';
  sMessageGarant5 =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD4SURBVFhH7ZjNDcIwDIUDZ07MwYENWIMRGSNswIE5OPUOMqrRw4oj25S/yp8UNY3DS/KSWCqLWuu1JG' +
    '7uxu02q/E1sXA8D2U51hMnaVyQNC6ImuMu231Znw6PusQSY2QfjOM4iHV8RNOaGleOowlhQWQMF8qL0eJWpMa3+YmrKo2MGPtpZpvj2Hx6tjam1e7BbFxvMIxR8V4l6s+6' +
    '2u9R3wprtfRlu5dQjpNgjEp0Mj1Q34qlr0cPeTLuHQu2Qgvg0/APzDbHWZnkqvKut3ae27lYQU0u2qnqnTapEUXOh8dETa2O5Ed+gPzIf4E0LkgaFyT/AQ5Ryg3G6sEhQa' +
    'JcSAAAAABJRU5ErkJggg==" /></td>' +
		'	<td style="width: 100%;">Відбулась зміна або видалення консульства - потрібно підтвердити або змінити &quot;Дані для візи по групі' +
    '&quot;. Не проставлено готелі.</td>' +
    '    </tr>';   
  sMessagePartner =
    '    <tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADDSURBVFhH7ZhBCsMgEEVtj5B9Fz1JFj13wZyki+57hZZf/GDSMcTpIhP4DwZ0nIh+fgQ95ZzfSXTzFW' +
    '4cr6UrtjBNj3QubdGJhHMi4Zw0hXtdbqUlLOQ4J6ZwcNvwvMt1K7gcB0EZyz5zwMqR5ZhVE5kf4bABuA1YruM4awhzzNd1iHqe1hxHItQZB0EZ0WmecXtsoOXQiMyEw2Lr' +
    'xR9lE3vQ9atS2C1QcAa/W5vDqo+KLvkOdMn/AwnnRMI50Quwi5Q+UmJzY+JjLwwAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">Відбулась зміна або видалення консульства - потрібно підтвердити або змінити Партнера.</td>' +
    '    </tr>';
  sMessageAlarm1 =
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACGSURBVFhH7dixDYAgEEDR094ZjJOwOkxinMEBNBholAO5lv8SEghUP1cxee8vQbcnnHNbOuKPEHaZ0x' +
    '6dCGdEuOxcv6uCcJEWqRKPcI3J0u7HDteKlhXeMXFGhDMinBHhjMYOtxxp01B4x8S14in3hIu0eJWohMtipPeqIJwR4Yz4ATYRuQH1MiLhxI0CIgAAAABJRU5ErkJggg==" /></td>' +
		'	<td style="width: 100%;">Алярм про невідповідність хоча б однієї характеристики хоча б одного документа вимогам консульства.</td>' +
		'</tr>';
  sMessageAlarm2 =
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAA' +
    'AARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADeSURBVFhH7dihDsIwEAbggprGI0hQewAMYgLBMyNIOoHhAVAkCDwaB7ml1x1br9wqd/cll6xb1Z+/Yl' +
    '147z/OTNYF1zSbsDQSbfvog7veKrc97sMn3v10cbv6HVY6QXDL8CwKDUj3zV0MDq2eZ3ZMbxQceK0P3cDxxWcYRN/BwD5tksFhw+z48rKNQ/S4DkerbOMoejSHwWokahyg' +
    'LUsFq401rpA1rpA1rtAoOC4Y2rRUsNrE4OAfNIcLVKsYHPy45xrFvdcqe600pV2aAv25HUn5d3yRdN+c2A1wEee+D0KqO9peuPAAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">У випадку&nbsp;<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAQCAYAAADJViUEAAAAAXNSR0IAr' +
    's4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKtSURBVDhPZZN7SFNRHMe/d5vb3N3LpWmbDB+EIkk+ICssIwiCkUWZSJCUECSEEAQRRkXSX/3' +
    'TXxFl9EeZRkWPDTIjZIVWhlb/VD6zlo80t7u7x93D7XTvcd0lfeBwzu/w/Z5zfud3DsNxHME/sEkOIYU5FQGktxXGvdcQiK6SURSpnmJkNfA/aBYX8NE40/8Z0fE+QJlBY' +
    '4OWof1fqFnx7jLgbgej0kJpyoevsw4mkxGCqxXa8oPi9gkknUcRHrpOTTLSsSOT/WT+vJH4nW2ExDgSfNxCFuYmyOJIN5Hgu+oJ5zpJxwmBI+FPPSQ2O0zknKUjMaP3MMj' +
    'UYKTrLqzzz5Er7k6KKlG8uxlWqwXcswtIBjzQlDig1Oqw6sIGp7QYOr0dzaUfMa0rRMdwLRoy3ajaUQdbRTX0490wNNxCSJVN9fKFaXQmxG4cQ3vjEOIz2cidDaGs5hc6E' +
    'w7Ypm/C58+EoskpGyVkc2DJh2pLH77152FOb4bNGsF+7yR+BnWIs0ZoZl0pZRrZTNRRCB41gq/0KK1YQoY9DHvRbxSwPKBWQKUOp5RpZLPekgchx47srAVos+Jg9sTwuiA' +
    'fB2wTsKzjkLBvTCnTpHP+MQhN/T7wAo/QEyViX1jUejicKHZjMbwW5s3nUso0TODlRRIddYGEvTC0fcDUmx6EWs6A1SXBbvUhUrkFTHkr8lUBxEoOpWwrMHzfWaLQmqDbd' +
    'gqRt1eRUCYQKKyH7+lDqNZsAJsTF8u0Cd6uJvGcBObDTgSE5RW3VGfaHh0n8x0WsuyfIcQ7RrjbO+k8f8dBhLEX9HX57h8hUc/7Fb3YaM5GowFJYQlZ4qpBwiL0tRdJoqe' +
    'LK8saEXZfgvSSmF1XIBjW03mJ/76kBDPQgQxbFWIFDhqrv/eKH6QRPC+WTQb4AzmmNoS5xqp/AAAAAElFTkSuQmCC" /> алярм про відсутність в нас хоча б ' +
    'одного документа туриста.<br />' +
		'	У випадку&nbsp;<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQ' +
    'UAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKpSURBVDhPhZNdSFNhHMZ/nnM2t3mcH6nLmoWmMOmiAk3LPrywD4Xuo6iLoOi2LrqIoCDourtAr8JuE8yoi0CEyOiLxGZu+TXn' +
    'dF9nX25zx21ndpgjsogeePnz/t/3eXh43v9bFo/Ht/gNyWSSUDhMk92O0Wgsdf+NHQJut5vBoSG9K9G420ZnZwfnz50lk8mUbvwNoVSLGB17id/nZeBQA72OaqypBdByxT' +
    'OzSaTC8rcjqVSLWPQsYxVVTrRWYbUfQBMMbCgeRkYGEcuiNO/bw/6Ww+x1XCCd0YqcHQ6a6mR6HPV4VoOsuJ2EPPNsbmaxVduoN9cRCij8+D7JwsyrEuOPDAQKPH10E1uV' +
    'hWq5gsJWgZ6r95HWV9DWg/jnZ3kz9RZLYwNXbjzRA0/vdFDQt7l8jjmvj2m3i1hWQK6x4XN91slOEokY5YVy4oqCqiaLnF8CiXSOx88mScaSqBEvwYyFk5fukFD8TIyPMr' +
    'uwhGtpmdWYgmAwU26Ui7yiwKxf4+FEDWu1/ZiO3sZht9Fy8DTDTjteX5Cc2cKU6wfOpTniapqu4xdJpTe2BQTJzPAXkfSGiKzLSY5+Om6N0jtwXres8nzFQf+Z67TqQRrJ' +
    'cbmlC/tXN1pgrSggNnZde+BK1BKJi+yqBIMuYq40Y6/MMb5chXFhmrO+14gnBuju7sMhGrFGFdbHXiB1HkNY052ksxJhPZNICqL6+jinz0QYQqpEW3QamSyNrR00yzUIWZ' +
    'UtrUBNdpPFe3cR2moh4FcIxnJ4wgUWgxrO5Qwf5lVO1Qfo7WsiEMsjzy/Cp3egxCmLxJDi65R9/rQ9BwnVoL9vilS+HKspT/MujSNt1ZDf/gPZQICNbzMYnO+REzoxFEHZ' +
    'zJPo7tk5SP+DxWRC+T5DQZ9Oub1d78BPOiEvBLbvdU0AAAAASUVORK5CYII=" /> алярм про наявність в нас хоча б одного документа туриста.</td>' +
		'</tr>';

  sMessageAlarm3 =
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAAA' +
    'ARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADfSURBVFhH7ZjBDYMwDEWT3tsVqk7C6jBJ1RXaAUJMbcuxcFW4+j8pIg7k8vSNAnWe51bAYTZx0/TgEvzD' +
    'sjzLhefgIKnF1XrXUT7BYPQ5Bolj6o0nni5PhLX22q5EanEkor256OzJkzUrjcidOG7FSJ5Ko/umbYm84pwIL2+QJpg9eMcZBkkdX1sgzmDblPC1BeIYK4mSJmmL5EFcx0s' +
    'TfsnLK+76PV5E0oRBHu8hUicuakOPysOXwwiJ2Uub0pOGA7BBZVALmjZUovVO+sQNSRJRgTD7LFr1JPgDfIpSVvwcV+Gg4tQYAAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Алярм про незаповненість хоча б однієї обов&#39;язкової характеристики хоча б&nbsp;в одному документі.</td>' +
		'</tr>';

  sMessageAlarm4 =
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAAA' +
    'ARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADxSURBVFhH7ZjdDYMgFEZpF2k6CWwmTNJVdJKOonzlXpA/oz6WexJSSOrLyQESHvM8r0q4zE+c1m9aCmdY' +
    'lq960ryLcx8/XrQSmENxMDtN1o8wFxKH4vw2phnmhmYC6Irj2hipLqcrjmtzLgwg1SWa4va1Wf+DAXlSXaIpbn+2lUh1gUpcebaVSHWBSlxZG7YpgDDmqMhRyMT1arNsj8B' +
    '/Rq8uE9cqKZRWyxz9rIvierXhNuVbdc/oZ10Up/X1gu588y9EcWVRDMpa1/xyYHrfjEB8VsK2C2dcvV3bWGWM8dWN9yQFV/Ied4MojtbCaZTaAB1jeBM+cDMTAAAAAElFTk' +
    'SuQmCC" /></td>' +
		'	<td style="width: 100%;">Алярм, якщо у вікні &quot;Документи на візу&quot; в 1-му розділі є:</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAAA' +
    'ARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADJSURBVFhH7ZjtCoMwDEXbvZh79Ppkbhm9cInNsGGo7XIgaK7+yalfmEspWwq6+YhblmdtgyOsa0mPuh90' +
    'EuKchDgnO3E51x2ilf07l15xWJARF+ZScdv7Q0ikyXY0XOJkWBTgTOcMemwhTZ93d5riZAguRnoZFsXHrXxGmuJYgNRRIBpyNZbMESX/9BnHsrWMbzJb+d055eUwmzShWxy' +
    'uJhQPbuWWnFGlCTtxrWF0Jj0KcKZzBr2Vj8Ipt+qMhDgnIc5J/AF2kdILpPNa4YlcQvoAAAAASUVORK5CYII=" /> документ, який був доданий в Довідник необхідних' +
    ' по даному консульству документів вже після додавання для туриста послуги &quot;Віза&quot;</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAAA' +
    'ARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAEGSURBVFhH7Zg9DsIwDIVTJM7FxDUYOBgD12AJ52JoZdSHTHBo7BCIij/JauLE+XluU7VDjHEMjpq7cKfd' +
    'fq46JRyvl7CZy44SF86IC2fkRbjzcHsyTlrXUhvfE+Iddxi3D+ObpXoNtfEasO5WyVrto4qkt0qWSjiePSrDAC9z4E+vIB0DBnL9l/wQLe33CUThaCKYlDH4c22ctP4OPi6' +
    'ZJvbbqM64EngMhJCgNhhH6wdafy1NzjiIlxONoDYYh/t5m+QDubmW1lBD1y+HkrvlF6IR6jOOfLjycopl0RSDcclKxsj1scyvQf2RL22odJNrwfSRLwn0T6KBrs+4nnHhjP' +
    'gfYBMhTFFXv1FKAn8dAAAAAElFTkSuQmCC" /> документ, який був видалений з Довідника необхідних по даному консульству документів вже після' +
    ' додавання для туриста послуги &quot;Віза&quot;</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAAA' +
    'ARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAEKSURBVFhH7ZgBDoIwDEU3r+A5PANXH2fwHJ4BU8PXpqxjLUIi9iWLWykt/XQhM5dSphSYeQk35Nu8DHoY' +
    'p3u6zPPASAjnJIRzogqXh+tiBB+aHTeNj/c4E2iCLc3wl1uVGoFE29IQbuGwfeVb67XztbQDPiekL8Ft0s7BGr8QTfr14hKOkmEL4+1Ju0T6cz8+B/ABWk5Cs+/JYVuVCsJ' +
    'Yg3xIhF547Np9Wk7N3sMhwqEgjDXIx1IUjy3vQ26JZu+lKtzWoN+gJoKVvUQjFmfVtYdFQu7XKrLmT3A7L6K15jG8cTW7BTqrVoXTAlmveR7qF6ge8luFWq+dUTRw2Ff1bI' +
    'RwTuIfYBcpPQE9D9Xgw8tE5wAAAABJRU5ErkJggg==" /> документ, який вимагається від даного туриста додатково до документів з Довідника необхідних по даному консульству.</td>' +
		'</tr>' ;
  sMessageAlarm41 =
		'<tr>' +
		'	<td colspan="2" style="vertical-align: top;">Цей алярм закриває собою <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAA' +
    'AAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACMSURBVDhPYzx59eV/FXdrBkLgzs6jDOrS7FAeAjC+lVH' +
    '5D2UTBMxXzkBZCAA3QOjxbbAANvBOVhVMEzQAphDkXGK9hdUFMIOIAVhdAAPEeAuvC7AZCgLI4qMuQDIAGyDGBUygxIAPgBTCMDbA+OHDBwwX/NUxAdNEhQE+A4gBTFAaBR' +
    'DyFgzc2XmUAQASGXhcHj8+0QAAAABJRU5ErkJggg==" /> та:</td>' +
		'</tr>' +
		'<tr>' +
		'	<td colspan="2" style="vertical-align: top;">а) Зникає для всіх документів, якщо Замовнику відправити:</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="width: 100%; text-align: left;">&quot;Звіт про необхідні документи&quot;</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="width: 100%; text-align: left;">&quot;Звіт про відсутні документи&quot;</td>' +
		'</tr>' +
		'<tr>' +
		'	<td colspan="2" style="vertical-align: top;">після чого документи перетворюються на стандартні <img src="data:image/png;base64,iVB' +
    'ORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD6SURBVFhH7ZgBCsIwDE' +
    'U7LyKeZFffTiKepBLZ15imXRvXOUYeBLY0se2jZeAwTVMMTjMvceN4W16dGub5Hi7Ls9OIizPi4oxkxQ3DNQnnQ/HExfh4h/ONX1UjZnHaFW555jmOrEUA2cdrePTGJI4Wx' +
    'q+xXCjG19D6wNocHNTI555sflVrpRFUByFaH+UQnFx+TzYXx2XUgHpNNuV4AC23N6q43EZqoV4uD+8tQiW/9PYgEYcFYqMI5AgugkKTrMnT6ohSf2mOf6KeOGxSBkfLazU5' +
    'cmPy9xBA9pXGepKIK01uXdiRT46VzT8OGiQLcRZ2EXdG/B9gEyE8Af+vyeGSKI5xAAAAAElFTkSuQmCC" />.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td colspan="2" style="vertical-align: top;">б) Зникає для Нових та Додаткових документів, якщо:</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="width: 100%; text-align: left;">Замовнику відправити &quot;Звіт про нові документи&quot;</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="width: 100%; text-align: left;">прийняти ці документи в 2-ий розділ</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="width: 100%; text-align: left;">приєднати скани цих документів в 1-му розділі</td>' +
		'</tr>' +
		'<tr>' +
		'	<td colspan="2" rowspan="1" style="vertical-align: top;">після чого документи перетворюються на стандартні <img src="data:image/png;' +
    'base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAD6SURBVFhH7Z' +
    'gBCsIwDEU7LyKeZFffTiKepBLZ15imXRvXOUYeBLY0se2jZeAwTVMMTjMvceN4W16dGub5Hi7Ls9OIizPi4oxkxQ3DNQnnQ/HExfh4h/ONX1UjZnHaFW555jmOrEUA2cdrePT' +
    'GJI4Wxq+xXCjG19D6wNocHNTI555sflVrpRFUByFaH+UQnFx+TzYXx2XUgHpNNuV4AC23N6q43EZqoV4uD+8tQiW/9PYgEYcFYqMI5AgugkKTrMnT6ohSf2mOf6KeOGxSBkfL' +
    'azU5cmPy9xBA9pXGepKIK01uXdiRT46VzT8OGiQLcRZ2EXdG/B9gEyE8Af+vyeGSKI5xAAAAAElFTkSuQmCC" />.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td colspan="2" style="vertical-align: top;">в) Зникає для Відмінених документів, якщо:</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td style="width: 100%; text-align: left; vertical-align: top;">Замовнику відправити &quot;Звіт про відмінені документи&quot;, після' +
    ' чого самі Відмінені документи видаляються.</td>' +
		'</tr>';      
  sVisaFromWarningDocument =
    '<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,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" /></td>' +
		'	<td>Документи туристів подає фірма Алголь.<br />' +
		'	<br />' +
		'	Документи з розділу №2 &quot;Документи, які отримані від туриста&quot;,<br />' +
		'	які знаходяться в офісі &quot;%s&quot;,<br />' +
		'	будуть перенесені в розділ №3 &quot;Документи, які відправлені в консульство&quot;.</td>' +
		'</tr>';  
  sVisaFromWarningDocument2 =
    '<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td><br /><span style="color: rgb(255, 0, 0);">Увага!</span> В замовленнях: %s<br />' +
		'	в розділі №2 &quot;Документи, які отримані від туриста&quot;<br />' +
		'	є документи, які знаходяться в іншому офісі/інших офісах.</td>' +
		'</tr>';    
  sVisaFromWarningDocument3 =
    '<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td><br /><span style="color: rgb(255, 0, 0);">Увага!</span> В замовленнях: %s<br />' +
		'	в розділі №2 &quot;Документи, які отримані від туриста&quot;<br />' +
		'	є документи туристів в прооцесі переміщення між офісами.</td>' +
		'</tr>';  
  sVisaFromWarningDocument4 =
    '<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td><br /><span style="color: rgb(255, 0, 0);">Увага!</span> В замовленнях: %s<br />' +
		'	в розділі №1 &quot;Документи, які турист повинен донести&quot;<br />' +
	  '	є документи.</td>' +
		'</tr>';  
  sVisaFromWarningTrstDocument =
    '<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,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' +
    'lgs78ol1PCAAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Документи туристів подають туристи.<br />' +
		'	<br />' +
		'	Замовникам будуть надіслані листи з проханням повідомити<br />' +
		'	про подачу туристами документів на візи та<br />' +
		'	призначену дату отримання віз туристами.</td>' +
		'</tr>';  
  sVisaFromWarningTrstDocument2 =
    '<tr>' +
		'	<td style="vertical-align: top;">&nbsp;</td>' +
		'	<td><br /><span style="color: rgb(255, 0, 0);">Увага!</span> В замовленнях %s<br />' +
		'	в розділі №2 &quot;Документи, які отримані від туриста&quot;<br />' +
		'	є документи.</td>' +
		'</tr>'; 
  sTourGroupHelpContent =  
		'<tr>' +
		'	<td colspan="2" style="vertical-align: top;">Кількість заброньованих туристів / Кількість туристів по запитах</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACgSURBVEhL7ZcBCoAgDEVnl+kYHqczdRs9RqcxlIQFpZvNUPGB' +
    'UCB/e82glDHGwQAEEX3o67ZP7Gphua67Z4q0BltEbeq2KOT24rzUvhQskVjE7S4sT2nhiFQmSwQXk0Iqs/o7gp94TYpEfHPSDX7NLBLBxyEWf4LTGDX' +
    'zjepH6y9YInj8OajT4GSmYIng0VMbzSGVOT8aW2OKtMYgf4gAJ3O8VjkkcYLhAAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Кількість запитів від 1 до 3.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACfSURBVEhL7ZdJDoAgDADB/z+Kn6FVm1SidIGERSbpiZpmuhz0' +
    'IYToZuAUiXHoAIft9hmeJdIbdhHvr5CQy8W3NJTYRAyFWI67fYSSH6+WdhqYz3UZV8o47X4mQlfKIKMTkXYXkeRTgQLKj924CrXRiWD3aAe/uimdHuR' +
    'VaEb7G0FRKsTJv2AXgWK5gtw7BXM13yS0n0gllkhvTPKH6NwO+kzQj11volMAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">Кількість запитів від 4 до 8</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACpSURBVEhL7ZeNCYAgEEa1ZRyjbWqmmsbGcBpD8eAQy5PUVHwg' +
    '9sfXPfSguJRSswGwImpV7rRPxCXY4o67Z4q0BrlHNr7b+dSHnQ1wzQc/EyKUhfFzY3mkHjGhbwXjkQMsCZlP78dERahF4gL+oHqPlBLOIpKzOMgwmZQ' +
    'tBVRdEaqwuQ+DymeRUlsllWorQhVO3VJA9WaPAaJYiLLa86OxNaZIawzyh8jYDRBhXiVbAAA+AAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Кількість запитів від&nbsp;9 до 12</td>' +
	 	'	</tr>' +
		'	<tr>' +
		'		<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAC7SURBVEhL7ZdrCsQgDIRt738ob2YJGBhiJ1W3WVbZD/zjJM' +
    'bxBR4555J2QIyUkpZu4uGsfpbnb+TXuDdymIZ4GqMnlsVoP9MrrRENlrdM3zPt87RZJJ+NMVCvNYJJFk+b5aV68XcEVzUQbgS33E7C0yLoqMeNSIIm6' +
    'SCKpyFvme2oF3+0vkRrRByzVfY0i8Z9shsD9VojuIV2Mp4WwUC9+6MlwdgQT0OedAuL136mVza+I4uyjZFNfogpXR4vzI+9BcxUAAAAAElFTkSuQmCC"' +
    ' /></td>' +
		'		<td style="width: 100%;">Кількість запитів 13 та більше</td>' +
		'	</tr>';
  sTourGroupHelpContent2=  
		'	<tr>' +
		'		<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABoSURBVEhL7ZfRCcAgDERjF5FO4upxkuIkFotiFzg4wz04MH' +
    '8+DAkmd+8WgE+klHuWZ1LrY9c8H49E2MCLpLwDBCsyLt/bDlBGrcWGRNiQCBtYkTVyV0YNAv8i/z0CRK3FRhiRID9EsxenShzh5oRmfQAAAABJRU5Er' +
    'kJggg==" /></td>' +
		'		<td style="width: 100%;">Гарантована група, кількість туристів&nbsp;= 0</td>' +
		'	</tr>' +
		'	<tr>' +
		'		<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAB3SURBVEhL7ZdBCsAgDARjP1L6Er8eX1L6EktbA/HWywYTMr' +
    'Bgbg5mDxZm7hSAV6TWY4w+ae2kbZzdkyKrgRUp+xwgOBG5eL++PABlcCJawIDsyG90P4AvhBdx3xFjcCJ6pQzAieh1ct8R6YcESHZkNcKIBPkhEt2yC' +
    'CbhHxmdmgAAAABJRU5ErkJggg==" /></td>' +
		'		<td style="width: 100%;">Гарантована група, кількість туристів&nbsp;&gt; 0</td>' +
		'	</tr>' +
		'	<tr>' +
	 	'		<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABpSURBVEhL7ZfRCcAgDESTLiKdxNXjJMVJUiwqXeAghntwYP' +
    '58GBJUM3NJwCdS6z3LM2ntkWuej4ci0YCLqJYdJFCRcXn3voOUYWtFgyLRoEg0oCJr5K6MGgX8Rf57BAlbKxppRJL8EEVeY90k4dGEPMwAAAAASUVOR' +
    'K5CYII=" /></td>' +
		'		<td style="width: 100%;">Негарантована група, кількість туристів&nbsp;= 0</td>' +
		'	</tr>' +
		'	<tr>' +
		'		<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAB4SURBVEhL7ZdBCsAgDARjP1L6Er8eX1L6EkvFQLz1ssGEDC' +
    'yYm4PZg4WZOwVgiNR6zdEnrd10zLN7UmQ3oCKlnEuQwETk4r0/Ix9IGZiIFrAgO/IX3Q/kC8FF3HfEGpiIXikLYCJ6ndx3RPohQZId2Y0wIkF+iEQvK' +
    'Qkz4R8S19oAAAAASUVORK5CYII=" /></td>' +
		'		<td style="width: 100%;">Негарантована група, кількість туристів&nbsp;&gt; 0</td>' +
		'	</tr>' +
		'	<tr>' +
		'		<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAATCAYAAADSz14iAAA' +
    'AAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADWSURBVEhL3ddBCsIwEIXhxCPoVhHBrWfowmu49JqF9B6CiG' +
    '71CpEJnfCEtiQ2Uzr9IbSlm35MKal1znmzgALkdLmGi/WzDkdtNc3drOiEALQ+u3Nc2goQjkEaUT8QTBuqF4KNQVm7j0uyJAiWg6KH9/4RlyQmG4Llo' +
    'KQbBcG6UO/tsb0rXzEIxqDN6zbZlEQgGE6JJiSFEodwPCFGlZ7UZBCMp1QSFfZaVXVoL8uHn1z6BA+FGEKmRnstcci/5aDipnGO5b5+s4VgKSgVEKwL' +
    'RS3kD9GYLxKjpZ/izZ46AAAAAElFTkSuQmCC" /></td>' +
		'		<td style="width: 100%;">Анульована група</td>' +
		'	</tr>';
  sMessageAlarm5 =
    '<table border="0" cellpadding="1" cellspacing="1" style="width: 500px;">' +
	  '<tbody>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADfSURBVFhH7ZjBDYMwDEWT3tsVqk7C6jBJ1RXaAUJMbcuxcFW4' +
    '+j8pIg7k8vSNAnWe51bAYTZx0/TgEvzDsjzLhefgIKnF1XrXUT7BYPQ5Bolj6o0nni5PhLX22q5EanEkor256OzJkzUrjcidOG7FSJ5Ko/umbYm84pw' +
    'IL2+QJpg9eMcZBkkdX1sgzmDblPC1BeIYK4mSJmmL5EFcx0sTfsnLK+76PV5E0oRBHu8hUicuakOPysOXwwiJ2Uub0pOGA7BBZVALmjZUovVO+sQNSR' +
    'JRgTD7LFr1JPgDfIpSVvwcV+Gg4tQYAAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Алярм про незаповненість хоча б однієї обов&#39;язкової характеристики хоча б в одному документі.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACGSURBVFhH7dixDYAgEEDR094ZjJOwOkxinMEBNBholAO5lv8S' +
    'EghUP1cxee8vQbcnnHNbOuKPEHaZ0x6dCGdEuOxcv6uCcJEWqRKPcI3J0u7HDteKlhXeMXFGhDMinBHhjMYOtxxp01B4x8S14in3hIu0eJWohMtipPe' +
    'qIJwR4Yz4ATYRuQH1MiLhxI0CIgAAAABJRU5ErkJggg==" /></td>' +
		'	<td style="width: 100%;">Алярм про невідповідність хоча б однієї характеристики хоча б одного документа вимогам консульства.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACLSURBVFhH7dixDYAgEIVhdAR7CyexcG4TmMTC3hWUmLOSO+RZ' +
    '3vsSEwxUf6C5LsZ4Bmp2h5vnSX7pi5S20MuaGjEciOHEMS6vz8JwmRbJiuc+XO1mafuuw9WiPUrn+FRBDAdiOBDDgVyHG/ZVVrbSOfc3rhZP2+dTzbQ' +
    '4VlRORwCcjvzAcCBOgCEhXL2NK6XJBCRfAAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Алярм про невідповідність паспортних даних вимогам консульства.</td>' +
		'</tr>';
  sMessageAlarm6 =
		'<tr>' +
		'	<td style="color: rgb(255, 0, 0);">Назва док</td>' +
		'	<td style="width: 100%;">Алярм про те, що документ не стосується туриста.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADJSURBVFhH7ZjtCoMwDEXbvZh79Ppkbhm9cInNsGGo7XIgaK7+' +
    'yalfmEspWwq6+YhblmdtgyOsa0mPuh90EuKchDgnO3E51x2ilf07l15xWJARF+ZScdv7Q0ikyXY0XOJkWBTgTOcMemwhTZ93d5riZAguRnoZFsXHrXx' +
    'GmuJYgNRRIBpyNZbMESX/9BnHsrWMbzJb+d055eUwmzShWxyuJhQPbuWWnFGlCTtxrWF0Jj0KcKZzBr2Vj8Ipt+qMhDgnIc5J/AF2kdILpPNa4YlcQv' +
    'oAAAAASUVORK5CYII=" /></td>' +
		'	<td style="width: 100%;">Алярм про новий документ по консульству.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAEGSURBVFhH7Zg9DsIwDIVTJM7FxDUYOBgD12AJ52JoZdSHTHBo' +
    '7BCIij/JauLE+XluU7VDjHEMjpq7cKfdfq46JRyvl7CZy44SF86IC2fkRbjzcHsyTlrXUhvfE+Iddxi3D+ObpXoNtfEasO5WyVrto4qkt0qWSjiePSr' +
    'DAC9z4E+vIB0DBnL9l/wQLe33CUThaCKYlDH4c22ctP4OPi6ZJvbbqM64EngMhJCgNhhH6wdafy1NzjiIlxONoDYYh/t5m+QDubmW1lBD1y+HkrvlF6' +
    'IR6jOOfLjycopl0RSDcclKxsj1scyvQf2RL22odJNrwfSRLwn0T6KBrs+4nnHhjPgfYBMhTFFXv1FKAn8dAAAAAElFTkSuQmCC" /></td>' +
		'	<td style="width: 100%;">Алярм про відмінений документ по консульству.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAEKSURBVFhH7ZgBDoIwDEU3r+A5PANXH2fwHJ4BU8PXpqxjLUIi' +
    '9iWLWykt/XQhM5dSphSYeQk35Nu8DHoYp3u6zPPASAjnJIRzogqXh+tiBB+aHTeNj/c4E2iCLc3wl1uVGoFE29IQbuGwfeVb67XztbQDPiekL8Ft0s7' +
    'BGr8QTfr14hKOkmEL4+1Ju0T6cz8+B/ABWk5Cs+/JYVuVCsJYg3xIhF547Np9Wk7N3sMhwqEgjDXIx1IUjy3vQ26JZu+lKtzWoN+gJoKVvUQjFmfVtY' +
    'dFQu7XKrLmT3A7L6K15jG8cTW7BTqrVoXTAlmveR7qF6ge8luFWq+dUTRw2Ff1bIRwTuIfYBcpPQE9D9Xgw8tE5wAAAABJRU5ErkJggg==" /></td>' +
		'	<td style="width: 100%;">Алярм про додатковий документ, який вимагається від туриста.</td>' +
		'</tr>' +
		'<tr>' +
		'	<td style="vertical-align: top;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE4AAAATCAYAAAA+ujs0AAAAA' +
    'XNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAADXSURBVFhH7Zg9CsMwDEbdHiF7h54kQ88dcE7SoXuv0KASF1dg' +
    'IsmyyPA9MMQ/SPGzTXAuOedPAmq+4ub5vleBhHV9puv+DJRAnBGIM+Im7n17/JVC/Uzwei91zjp2K0+rXYuLOHqZ6bX8Sosyzgtp3hGEHVWNNK9dweN' +
    '4xSVCxGmkETTWc5IjOO3HwUNeHUO7eEeEiJNIoH4+5sw7L2zHHUmgfr4jaDxv01Ly9sbhhB7VMgkJIybrSbc47QQl8iQxNXlHLAAu+QZwye8A4oxAnB' +
    'H8ATaR0gYXknLdQT9fQwAAAABJRU5ErkJggg==" /></td>' +
		'<td style="width: 100%;">Алярм про наявність хоча б одного документу в процесі переміщення між офісами.</td>' +
		'</tr>' +
	  '</tbody>' +
    '</table>';   
  sSellerOrderMessage = 
    '<HTML><HEAD><TITLE></TITLE> ' +
    '<META name=GENERATOR content="MSHTML 11.00.9600.19400"></HEAD> ' +
    '<BODY> ' +
    '%s ' +
    '</BODY></HTML>';
  sSellerOrderTable = 
    '<DIV><h>%s</h> ' +
    '<BR> ' +
    '<TABLE style="HEIGHT: 70px; WIDTH: 400px" height=70 cellSpacing=1 cellPadding=1 width=400 border=1> ' +
    '<TBODY> ' +
    '<TR> ' +
    '<TD width=110> ' +
    '<P align=center>№ замовлення</P></TD> ' +
    '<TD width=220> ' +
    '<P align=center>Замовник</P></TD> ' +
    '<TD> ' +
    '<P align=center>Туристів</P></TD></TR> ' +
    '%s ' +
    '</TBODY></TABLE></DIV>';
  sSellerOrderTableRow =     
    '<TR> ' +
    '<TD width=110> ' +
    '<P align=center>%s</P></TD> ' +
    '<TD width=220>%s<STD> ' +
    '<TD> ' +
    '<P align=center>%s</P></TD></TR> ';
implementation
   
end.
 