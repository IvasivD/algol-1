unit SrvMailUn;

interface

const
  sSendHost = 'ns.algol.local';
  sSendPort = 25;
  sSendBodyHead = '<HTML><HEAD>' +
    '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">' +
    '<style type="text/css"><!-- body {' +
    '  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #264D9B} ' +
    '--></style></HEAD><BODY>';
  sSendBodyFoot = '</BODY></HTML>';
  sSendCharSet = 'windows-1251';
  sSendContentType = 'multipart/report';
  sSendContentTfrEnc = 'quoted-printable';
  sSendFromAddress = 'info@algol.com.ua';
  sSendFromName = 'Algol info';
  sSendWarnAddress = 'root@algol.com.ua';
  sSendWarnName = 'Algol system administrator';
  sSendRecipCount = 2;
  sSendRecipAddresses: array[0..sSendRecipCount - 1] of String = (
    'algol@algol.com.ua',
    'demidar@turyzm.info');
  sSendRecipNames: array[0..sSendRecipCount - 1] of String = (
    'Algol ltd.',
    'Demidar Co.');
  sSendRecipEnables: array[0..sSendRecipCount - 1] of Boolean = (
    True, True);
  sSendPartPlain = 'text/plain';
  sSendPartHtml = 'text/html';

implementation

end.
