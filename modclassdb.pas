unit modclassdb;

interface
uses
  SysUtils,
  ADODB,
  controls,
  windows,
  ADOX_TLB,
  Classes;

type	FTNAdr=record
	Adr: string;
	Zone,
	Region,
     Node,
	Point: word;
end;



type TModerator = class(TObject)
private
     filename:string;
     curpos:integer;
protected
	function Get_Zone(Adr: string; Def: word): word;
	function Get_Net(Adr: string; Def: word): word;
	function Get_Node(Adr: string): word;
	function Get_Point(Adr: string): word;

public
	function AdrCorrect(Adr: string): boolean;
	function StrToFTN(Adr: string): FTNAdr;

published
	constructor create(filename_:string);
	destructor free;
//������� ��������� ������

	function getallmod(AParam:String): word;
     function getmodfilename:string;
     function getpos:integer;
	function getcount:integer;
     function getarea:string;
     function getzone:word;
     function getnet:word;
     function getnode:word;
     function getpoint:word;
     function getName:string; //��� � ������� ��p�������
     function getcomment:string;
     function getmoderatorial:string;
	function getmoderatorialword:word;
     function getdateofbegin:tdatetime;
     function getdateofend:tdatetime;
     function getreason:string;
     function getCategory: integer; // ������p�� ��p�������...
     function getstringaddress:string;
	function getversion: integer; // ������ ����� ��������������
	function getvalid:boolean; //��������� �� �������
	function getoffset:integer;
     function gettextlength:integer;
	procedure gettext(var AParam:TStringlist);
	function getnodeaddress:string;
     //��������� ���������
	procedure setoffset(AParam:integer);
	procedure settextlength(AParam:integer);
	procedure setpos(AParam:integer);
//	procedure setmod(AParam:TModeratorial);
	procedure setarea(AParam:string); // ��� � ��p�������...
       	procedure setzone(AParam:word); //���� ��p�������
	procedure setnet(AParam:word); //���� ��p�������
	procedure setnode(AParam:word); //���� ��p�������
	procedure setpoint(AParam:word); //����� ��p�������
	procedure setName(AParam:string); //��� � ������� ��p�������
	procedure setcomment(AParam:string); //��������p��
//	procedure setmoderatorial(AParam:string); //������ ��������� *,+,!
	procedure setmoderatorialword(AParam:word); //������ ��������� *,+,!
	procedure setdateofbegin(AParam:tdatetime); //���� ��������� ����p���p����
	procedure setdateofend(AParam:tdatetime); //���� ��������� ��������
	procedure setreason(AParam:string); //��������� (����� p������)
	procedure setCategory(AParam: integer); // ������p�� ��p�������...
	procedure setstringaddress(AParam:string);
//	procedure setvalid(AParam:boolean); //���������� ���������� ��������� True - ���������
	procedure addtext(AParam:TStringList);
     procedure addmod;
     procedure deletemod(AParam:integer);
	procedure renume;

end;




var	modCon	:TADOConnection;
	modtab  :TADOTable;
  modcom:TADOCommand;

implementation

constructor tmoderator.create();
Begin
	filename:=filename_;
	curpos:=0;
     if fileexists(filename) then
        modfile:=tfilestream.create(filename,fmopenreadwrite+fmShareDenyWrite)
                    else
        modfile:=tfilestream.create(filename,fmcreate);
     msgfilename:=changefileext(filename_,'.mst');
     if fileexists(msgfilename) then
        msgfile:=tfilestream.create(msgfilename,fmopenreadwrite+fmShareDenyWrite)
                    else
        msgfile:=tfilestream.create(msgfilename,fmcreate);

End;

destructor tmoderator.free;
Begin
	modfile.free;
     msgfile.free;
End;



function createmdb(filename:string):boolean;
var 	Catalog   : _Catalog;
	ds:string;
begin
	result:=true;
	DS:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+filename;
	Catalog	:=CoCatalog.Create;   					// ������� ��������� ������� ADOX Catalog
    //	If FileExists(filename) Then DeleteFile(pchar(filename));   // ���� ���� ������ ����������, ������ ��
	try
		Catalog.Create(DS);   							// �������� ����� MDB-����
	except
    		on E: Exception do
          begin
          	messagebox(0,pchar('������ �������� ������ ���� ��������������. '#13+E.Message),pchar('������ �������� ���� �������������� ���� '+e.classname),mb_ok+MB_ICONERROR);
            result:=false;
          end;
	end;
	catalog:=nil;
end;

//�������� �������

function createarea(name:pchar):boolean;
Begin
//�������� ������� - ���� ������� name
	result:=true;
	try
		modcom.connection:=modcon;
		modcom.Commandtext:='CREATE TABLE '+name+'('+
		'ID AUTOINCREMENT,'+
		'Disturber_Name char(72) not null,'+
		'Comment char(250),'+
		'zone integer,'+
		'net integer,'+
		'node integer,'+
		'point integer,'+
		'moderatorial integer,'+
		'status integer,'+
		'dateofbegin date,'+
		'dateofend date,'+
		'category integer,'+
		'Reason char(250) ,'+
		'Reserve1 integer,'+
		'Reserve2 integer,'+
		'msgtext LONGCHAR,'+
		'Primary Key(ID));';

		modcom.Execute;
	except
    		on E: Exception do
          begin
          	messagebox(0,pchar('������ �������� ���� �������������� ������� '+string(name)+#13+E.Message),pchar('������ �������� ������� ���� '+e.classname),mb_ok+MB_ICONERROR);
            result:=false;
          end;
     end;
End;


function getaddresswopoint(Addr:string):string;
Begin
	result:=addr;
     if pos('.',addr)<1 then exit;
     result:=copy(addr,1,pos('.',addr)-1);
End;


function tmoderator.Get_Zone(Adr: string; Def: word): word;
begin
if Pos(':',Adr)>0 then result:=StrToInt(Copy(Adr,1,Pos(':',Adr)-1))
  else result:=Def;
end;

function tmoderator.Get_Net(Adr: string; Def: word): word;
begin
if Pos(':',Adr)>0 then Delete(Adr,1,Pos(':',Adr));
if Pos('/',Adr)>0 then result:=StrToInt(Copy(Adr,1,Pos('/',Adr)-1))
  else result:=Def;
end;

function tmoderator.Get_Node(Adr: string): word;
begin
if Pos('/',Adr)>0 then Delete(Adr,1,Pos('/',Adr));
if Pos('.',Adr)>0 then result:=StrToInt(Copy(Adr,1,Pos('.',Adr)-1))
  else result:=StrToInt(Adr);
end;

function tmoderator.Get_Point(Adr: string): word;
begin
if Pos('.',Adr)>0 then result:=StrToInt(Copy(Adr,Pos('.',Adr)+1,Length(Adr)
-Pos('.',Adr)))
  else result:=0;
end;

function tmoderator.AdrCorrect(Adr: string): boolean;
  var k: byte;
begin
 result:=True;
 if Adr='' then result:=False;
 if copy(adr,1,1)='0' then exit;
 if Pos(':',Adr)>1 then
	begin
    for k:=1 to (Pos(':',Adr)-1) do
     if not (Adr[k] in ['0'..'9']) then result:=False;
    Delete(Adr,1,Pos(':',Adr));
   end;
 if Pos('/',Adr)>1 then
   begin
	 for k:=1 to (Pos('/',Adr)-1) do
     if not (Adr[k] in ['0'..'9']) then result:=False;
    Delete(Adr,1,Pos('/',Adr));
   end
             else
   Result:=false;
 if Pos('.',Adr)>1 then
   begin
    for k:=1 to (Pos('.',Adr)-1) do
     if not (Adr[k] in ['0'..'9']) then result:=False;
    Delete(Adr,1,Pos('.',Adr));
   end;
 if Length(Adr)>0 then
 for k:=1 to Length(Adr) do
 if not (Adr[k] in ['0'..'9']) then result:=False;

 If Length(adr)=0 then Result:=False;
end;

function tmoderator.StrToFTN(Adr: string): FTNAdr;
var myadr:ftnadr;
begin
  Result.Zone:=Get_Zone(Adr,MyAdr.Zone);
  Result.Region:=Get_Net(Adr,MyAdr.Region);
  Result.Node:=Get_Node(Adr);
  Result.Point:=Get_Point(Adr);
  Result.Adr:=IntToStr(Result.Zone)+':'+IntToStr(Result.Region)+'/'+IntToStr(Result.Node);
	if Result.Point>0 then Result.Adr:=Result.Adr+'.'+IntToStr(Result.Point);
end;




function modword2str(aparam:word):string;
begin
	case aparam of
	     0:result:='[ ]';
	     1:result:='[*]';
     	2:result:='[*][*]';
	     3:result:='[+]';
     	4:result:='[+][*]';
	     5:result:='[+][*][*]';
     	6:result:='[+][+]';
	     7:result:='[+][+][*]';
     	8:result:='[+][+][*][*]';
	     9:result:='[!]';
          else result:='������ [!]';
     end;
end;

function fmodword2str(aparam:word):string;
begin
	case aparam of
	     0:result:='[ ]      ';
	     1:result:='[*]      ';
     	2:result:='[*][*]      ';
	     3:result:='[+]      ';
     	4:result:='[+][*]      ';
	     5:result:='[+][*][*]   ';
     	6:result:='[+][+]      ';
	     7:result:='[+][+][*]   ';
     	8:result:='[+][+][*][*]';
	     9:result:='[!]      ';
       else result:='������[!]   ';
     end;
end;



function OemToAnsiStr(const OemStr: string): string;
begin
	SetLength(Result, Length(OemStr));
	if Length(Result) > 0 then
	 OemToCharBuff(PChar(OemStr), PChar(Result), Length(Result));
end;


function StrToOem(const AnsiStr: string): string;
begin
	SetLength(Result, Length(AnsiStr));
	if Length(Result) > 0 then
      CharToOemBuff(PChar(AnsiStr), PChar(Result), Length(Result));
end;



end.
